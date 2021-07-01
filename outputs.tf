output "logdrain_endpoint" {
  description = "The logproxy logdrain endpoint"
  value       = "https://${cloudfoundry_route.logproxy.endpoint}/syslog/drain/${random_password.token.result}"
  sensitive   = true
}

output "logdrain_service_id" {
  description = "The uuid of the logdrain service. You can bind this to your app to enable logdraining"
  value       = cloudfoundry_user_provided_service.logdrain.id
}

output "logproxy_app_id" {
  description = "The logproxy app GUID"
  value       = cloudfoundry_app.logproxy.id
}