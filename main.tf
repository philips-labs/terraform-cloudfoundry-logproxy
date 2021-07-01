locals {
  postfix = var.name_postfix != "" ? var.name_postfix : random_id.id.hex
  logdrain_endpoint = var.logdrain_endpoint != "" ? var.logdrain_endpoint : data.hsdp_config.logging.url
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
  name         = "tf-logproxy-${local.postfix}"
  space        = var.cf_space_id
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
    HSDP_LOGINGESTOR_URL         = local.logdrain_endpoint
    HSDP_LOGINGESTOR_PRODUCT_KEY = var.product_key
    LOGPROXY_SYSLOG              = "true"
    LOGPROXY_QUEUE               = "channel"
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
  hostname = "tf-logproxy-${var.name_postfix}"
}

resource "cloudfoundry_user_provided_service" "logdrain" {
  name             = "tf-logproxy-${local.postfix}"
  space            = var.cf_space_id
  //noinspection HILUnresolvedReference
  syslog_drain_url = "https://${cloudfoundry_route.logproxy.endpoint}/syslog/drain/${random_password.token.result}"
}
