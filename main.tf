locals {
  postfix         = var.name_postfix != "" ? var.name_postfix : random_id.id.hex
  logingestor_url = var.logingestor_url != "" ? var.logingestor_url : data.hsdp_config.logging.url
  app_name        = var.app_name != "" ? var.app_name : "tf-logproxy-${local.postfix}"
}

resource "random_id" "id" {
  byte_length = 8
}

data "cloudfoundry_domain" "domain" {
  //noinspection HILUnresolvedReference
  name = data.hsdp_config.cf.domain
}

data "cloudfoundry_domain" "internal" {
  name = "apps.internal"
}

data "hsdp_config" "logging" {
  service = "logging"
}

data "hsdp_config" "cf" {
  service = "cf"
}

resource "cloudfoundry_app" "logproxy" {
  name         = local.app_name
  space        = var.cf_space_id
  memory       = var.memory
  disk_quota   = var.disk
  strategy     = "blue-green"
  docker_image = var.logproxy_image
  docker_credentials = {
    username = var.docker_username
    password = var.docker_password
  }
  environment = merge({
    HSDP_LOGINGESTOR_KEY         = var.shared_key
    HSDP_LOGINGESTOR_SECRET      = var.secret_key
    HSDP_LOGINGESTOR_URL         = local.logingestor_url
    HSDP_LOGINGESTOR_PRODUCT_KEY = var.product_key
    LOGPROXY_SYSLOG              = var.enable_syslog
    LOGPROXY_IRONIO              = var.enable_ironio
    LOGPROXY_QUEUE               = var.queue_type
    LOGPROXY_SERVICE_ID          = var.service_id
    LOGPROXY_SERVICE_PRIVATE_KEY = var.service_private_key
    LOGPROXY_REGION              = var.hsdp_region
    LOGPROXY_ENV                 = var.hsdp_environment
    TOKEN                        = random_password.token.result
  }, var.environment)

  //noinspection HCLUnknownBlockType
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
  space    = var.cf_space_id
  hostname = "tf-logproxy-${local.postfix}"
}

resource "cloudfoundry_user_provided_service" "logdrain" {
  name  = "tf-logproxy-${local.postfix}"
  space = var.cf_space_id
  //noinspection HILUnresolvedReference
  syslog_drain_url = "https://${cloudfoundry_route.logproxy.endpoint}/syslog/drain/${random_password.token.result}"
}
