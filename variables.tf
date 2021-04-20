variable "memory" {
  description = "Amount of memory to use"
  type        = number
  default     = 64
}

variable "disk" {
  description = "Amount of disk to allocate"
  type        = number
  default     = 512
}

variable "logproxy_image" {
  description = "Docker image to use"
  type        = string
  default     = "philipssoftware/logproxy:v1.4.1"
}

variable "docker_username" {
  type        = string
  description = "Docker registry username"
  default     = ""
}

variable "docker_password" {
  type        = string
  description = "Docker registry password"
  default     = ""
}

variable "cf_org_name" {
  description = "Cloudfoundry ORG name to use for reverse proxy"
  type        = string
}

variable "cf_space_name" {
  description = "The space where to deploy components to. If not specified a new space will be created"
  type        = string
  default     = ""
}

variable "cf_username" {
  description = "The Cloudfoundry user to assign rights to the app to"
  type        = string
}

variable "name_postfix" {
  type        = string
  description = "The postfix string to append to the space, hostname, etc. Prevents namespace clashes"
  default     = ""
}

variable "queue_type" {
  type        = string
  description = "The queue type to use. Supported are 'chnanel' or 'rabbitmq'"
  default     = "channel"
}

variable "product_key" {
  type        = string
  description = "The HSDP logging product key"
}

variable "shared_key" {
  type        = string
  description = "The shared key for signing requests"
}

variable "secret_key" {
  type        = string
  description = "The secret key for signing requests"
}

variable "rabbitmq_broker_settings" {
  type = object({
    service_broker = string
    service_plan   = string
  })
  default = {
    service_broker = "hsdp-rabbitmq-server"
    service_plan   = "rabbitmq-dev-standalone"
  }
  description = "The RabbitMQ service broker settings. Only used when queue_type is set to 'rabbitmq'"
}

variable "environment" {
  type        = map(any)
  description = "Optional additional environment variables for Logproxy"
  default     = {}
}
