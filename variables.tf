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
  default     = "philipssoftware/logproxy:v1.7.0"
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

variable "cf_space_id" {
  description = "The space ID to deploy components to"
  type        = string
}

variable "name_postfix" {
  type        = string
  description = "The postfix string to append to the space, hostname, etc. Prevents namespace clashes"
  default     = ""
}

variable "queue_type" {
  type        = string
  description = "The queue type to use. Supported are 'channel' or 'rabbitmq'"
  default     = "channel"
}

variable "product_key" {
  type        = string
  description = "The HSDP logging product key"
}

variable "shared_key" {
  type        = string
  description = "The shared key for API signing based authentication. When using signing authentication, the service base variables should not be provided."
  default     = ""
}

variable "secret_key" {
  type        = string
  description = "The secret key API signing based authentication. When using signing authentication, the service base variables should not be provided."
  default     = ""
}

variable "logingestor_url" {
  type        = string
  description = "The HSDP Log ingestor endpoint. When empty auto-detect via hsdp_config"
  default     = ""
}

variable "service_id" {
  type        = string
  description = "The IAM service identity id for service based authentication (recommended). When using service authentication, the signing base variables should not be provided"
  default     = ""
}

variable "service_private_key" {
  type        = string
  description = "The IAM service identity private key for service based authentication (recommended). When using service authentication, the signing base variables should not be provided"
  default     = ""
}

variable "hsdp_region" {
  type        = string
  description = "The hsdp region that the service identity belongs for service based authentication (recommended). When using service authentication, the signing base variables should not be provided"
  default     = "us-east"
}

variable "hsdp_environment" {
  type        = string
  description = "The hsdp environment that the service identity belongs for service based authentication (recommended). When using service authentication, the signing base variables should not be provided"
  default     = "client-test"
}

variable "enable_syslog" {
  type        = bool
  description = "Enable syslog drain endpoint"
  default     = true
}

variable "enable_ironio" {
  type        = bool
  description = "Enable iron logdrain endpoint"
  default     = false
}

variable "environment" {
  type        = map(any)
  description = "Optional additional environment variables for Logproxy"
  default     = {}
}
