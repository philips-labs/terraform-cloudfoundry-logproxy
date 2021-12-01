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
  default     = "philipssoftware/logproxy:v1.4.4"
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
  description = "The shared key for signing requests"
}

variable "secret_key" {
  type        = string
  description = "The secret key for signing requests"
}

variable "logingestor_url" {
  type        = string
  description = "The HSDP Log ingestor endpoint. When empty auto-detect via hsdp_config"
  default     = ""
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
