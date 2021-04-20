data "cloudfoundry_org" "org" {
  name = var.cf_org_name
}
data "cloudfoundry_space" "space" {
  org  = data.cloudfoundry_org.org.id
  name = var.cf_space_name
}

data "cloudfoundry_service" "rabbitmq" {
  name = var.rabbitmq_broker_settings.service_broker
}

data "cloudfoundry_domain" "domain" {
  name = data.hsdp_config.cf.domain
}

data "cloudfoundry_domain" "internal" {
  name = "apps.internal"
}

data "hsdp_config" "logging" {
  service     = "logging"
}

data "hsdp_config" "cf" {
  service     = "cf"
}

resource "cloudfoundry_app" "logproxy" {
  name         = "logproxy"
  space        = data.cloudfoundry_space.space.id
  memory       = var.memory
  disk_quota   = var.disk
  docker_image = var.logproxy_image
  docker_credentials = {
    username = var.docker_username
    password = var.docker_password
  }
  environment = merge({
    HSDP_LOGINGESTOR_KEY         = var.shared_key
    HSDP_LOGINGESTOR_SECRET      = var.secret_key
    HSDP_LOGINGESTOR_URL         = data.hsdp_config.logging.url
    HSDP_LOGINGESTOR_PRODUCT_KEY = var.product_key
    LOGPROXY_SYSLOG              = "true"
    LOGPROXY_QUEUE               = "channel"
    TOKEN                        = random_password.token.result
  }, var.environment)

  routes {
    route = cloudfoundry_route.logproxy.id
  }
}

resource "random_password" "token" {
  length  = 32
  special = false
}

resource "cloudfoundry_route" "logproxy" {
  domain   = data.cloudfoundry_domain.domain.id
  space    = data.cloudfoundry_space.space.id
  hostname = var.name_postfix == "" ? "logproxy" : "logproxy-${var.name_postfix}"
}

resource "cloudfoundry_user_provided_service" "logdrain" {
  name             = "logproxy_logdrain"
  space            = data.cloudfoundry_space.space.id
  syslog_drain_url = "https://${cloudfoundry_route.logproxy.endpoint}/syslog/drain/${random_password.token.result}"
}
