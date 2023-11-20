# terraform-cloudfoundry-logproxy

Module to deploy Logproxy

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_cloudfoundry"></a> [cloudfoundry](#requirement\_cloudfoundry) | >= 0.14.2 |
| <a name="requirement_hsdp"></a> [hsdp](#requirement\_hsdp) | >= 0.17.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudfoundry"></a> [cloudfoundry](#provider\_cloudfoundry) | 0.15.3 |
| <a name="provider_hsdp"></a> [hsdp](#provider\_hsdp) | 0.36.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.3.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudfoundry_app.logproxy](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/resources/app) | resource |
| [cloudfoundry_route.logproxy](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/resources/route) | resource |
| [cloudfoundry_user_provided_service.logdrain](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/resources/user_provided_service) | resource |
| [random_id.id](https://registry.terraform.io/providers/random/latest/docs/resources/id) | resource |
| [random_password.token](https://registry.terraform.io/providers/random/latest/docs/resources/password) | resource |
| [cloudfoundry_domain.domain](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/data-sources/domain) | data source |
| [cloudfoundry_domain.internal](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/data-sources/domain) | data source |
| [hsdp_config.cf](https://registry.terraform.io/providers/philips-software/hsdp/latest/docs/data-sources/config) | data source |
| [hsdp_config.logging](https://registry.terraform.io/providers/philips-software/hsdp/latest/docs/data-sources/config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | override the application name | `string` | `""` | no |
| <a name="input_cf_space_id"></a> [cf\_space\_id](#input\_cf\_space\_id) | The space ID to deploy components to | `string` | n/a | yes |
| <a name="input_disk"></a> [disk](#input\_disk) | Amount of disk to allocate | `number` | `512` | no |
| <a name="input_docker_password"></a> [docker\_password](#input\_docker\_password) | Docker registry password | `string` | `""` | no |
| <a name="input_docker_username"></a> [docker\_username](#input\_docker\_username) | Docker registry username | `string` | `""` | no |
| <a name="input_enable_debug"></a> [enable\_debug](#input\_enable\_debug) | Enable debugging. | `bool` | `false` | no |
| <a name="input_enable_ironio"></a> [enable\_ironio](#input\_enable\_ironio) | Enable iron logdrain endpoint | `bool` | `false` | no |
| <a name="input_enable_syslog"></a> [enable\_syslog](#input\_enable\_syslog) | Enable syslog drain endpoint | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Optional additional environment variables for Logproxy | `map(any)` | `{}` | no |
| <a name="input_hsdp_environment"></a> [hsdp\_environment](#input\_hsdp\_environment) | The hsdp environment that the service identity belongs for service based authentication (recommended). When using service authentication, the signing base variables should not be provided | `string` | `"client-test"` | no |
| <a name="input_hsdp_region"></a> [hsdp\_region](#input\_hsdp\_region) | The hsdp region that the service identity belongs for service based authentication (recommended). When using service authentication, the signing base variables should not be provided | `string` | `"us-east"` | no |
| <a name="input_logingestor_url"></a> [logingestor\_url](#input\_logingestor\_url) | The HSDP Log ingestor endpoint. When empty auto-detect via hsdp\_config | `string` | `""` | no |
| <a name="input_logproxy_image"></a> [logproxy\_image](#input\_logproxy\_image) | Docker image to use | `string` | `"philipssoftware/logproxy:v1.7.9"` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Amount of memory to use | `number` | `64` | no |
| <a name="input_name_postfix"></a> [name\_postfix](#input\_name\_postfix) | The postfix string to append to the space, hostname, etc. Prevents namespace clashes | `string` | `""` | no |
| <a name="input_product_key"></a> [product\_key](#input\_product\_key) | The HSDP logging product key | `string` | n/a | yes |
| <a name="input_queue_type"></a> [queue\_type](#input\_queue\_type) | The queue type to use. Supported are 'channel' or 'rabbitmq' | `string` | `"channel"` | no |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | The secret key API signing based authentication. When using signing authentication, the service base variables should not be provided. | `string` | `""` | no |
| <a name="input_service_id"></a> [service\_id](#input\_service\_id) | The IAM service identity id for service based authentication (recommended). When using service authentication, the signing base variables should not be provided | `string` | `""` | no |
| <a name="input_service_private_key"></a> [service\_private\_key](#input\_service\_private\_key) | The IAM service identity private key for service based authentication (recommended). When using service authentication, the signing base variables should not be provided | `string` | `""` | no |
| <a name="input_shared_key"></a> [shared\_key](#input\_shared\_key) | The shared key for API signing based authentication. When using signing authentication, the service base variables should not be provided. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_logdrain_endpoint"></a> [logdrain\_endpoint](#output\_logdrain\_endpoint) | The logproxy logdrain endpoint |
| <a name="output_logdrain_service_id"></a> [logdrain\_service\_id](#output\_logdrain\_service\_id) | The uuid of the logdrain service. You can bind this to your app to enable logdraining |
| <a name="output_logproxy_app_id"></a> [logproxy\_app\_id](#output\_logproxy\_app\_id) | The logproxy app GUID |
<!-- END_TF_DOCS -->

# Contact / Getting help

Please post your questions on the HSDP Slack `#terraform` channel

# License

[License](./LICENSE.md) is MIT
