# terraform-cloudfoundry-logproxy

Module to deploy Logproxy

<!--- BEGIN_TF_DOCS --->
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
| <a name="provider_cloudfoundry"></a> [cloudfoundry](#provider\_cloudfoundry) | >= 0.14.2 |
| <a name="provider_hsdp"></a> [hsdp](#provider\_hsdp) | >= 0.17.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 2.2.1 |

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
| <a name="input_cf_space_id"></a> [cf\_space\_id](#input\_cf\_space\_id) | The space ID to deploy components to | `string` | n/a | yes |
| <a name="input_disk"></a> [disk](#input\_disk) | Amount of disk to allocate | `number` | `512` | no |
| <a name="input_docker_password"></a> [docker\_password](#input\_docker\_password) | Docker registry password | `string` | `""` | no |
| <a name="input_docker_username"></a> [docker\_username](#input\_docker\_username) | Docker registry username | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Optional additional environment variables for Logproxy | `map(any)` | `{}` | no |
| <a name="input_logdrain_endpoint"></a> [logdrain\_endpoint](#input\_logdrain\_endpoint) | The HSDP Logging endpoint. When empty will be auto-detected based on region/environment | `string` | `""` | no |
| <a name="input_logproxy_image"></a> [logproxy\_image](#input\_logproxy\_image) | Docker image to use | `string` | `"philipssoftware/logproxy:v1.4.3"` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Amount of memory to use | `number` | `64` | no |
| <a name="input_name_postfix"></a> [name\_postfix](#input\_name\_postfix) | The postfix string to append to the space, hostname, etc. Prevents namespace clashes | `string` | `""` | no |
| <a name="input_product_key"></a> [product\_key](#input\_product\_key) | The HSDP logging product key | `string` | n/a | yes |
| <a name="input_queue_type"></a> [queue\_type](#input\_queue\_type) | The queue type to use. Supported are 'channel' or 'rabbitmq' | `string` | `"channel"` | no |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | The secret key for signing requests | `string` | n/a | yes |
| <a name="input_shared_key"></a> [shared\_key](#input\_shared\_key) | The shared key for signing requests | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_logdrain_endpoint"></a> [logdrain\_endpoint](#output\_logdrain\_endpoint) | The logproxy logdrain endpoint |
| <a name="output_logdrain_service_id"></a> [logdrain\_service\_id](#output\_logdrain\_service\_id) | The uuid of the logdrain service. You can bind this to your app to enable logdraining |
<!--- END_TF_DOCS --->

# Contact / Getting help

Please post your questions on the HSDP Slack `#terraform` channel

# License
[License](./LICENSE.md) is MIT
