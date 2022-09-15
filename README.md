# terraform-cloudfoundry-logproxy

Module to deploy Logproxy

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name                                                                              | Version   |
| --------------------------------------------------------------------------------- | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform)          | >= 0.13.0 |
| <a name="requirement_cloudfoundry"></a> [cloudfoundry](#requirement_cloudfoundry) | >= 0.14.2 |
| <a name="requirement_hsdp"></a> [hsdp](#requirement_hsdp)                         | >= 0.17.0 |
| <a name="requirement_random"></a> [random](#requirement_random)                   | >= 2.2.1  |

## Providers

| Name                                                                        | Version   |
| --------------------------------------------------------------------------- | --------- |
| <a name="provider_cloudfoundry"></a> [cloudfoundry](#provider_cloudfoundry) | >= 0.14.2 |
| <a name="provider_hsdp"></a> [hsdp](#provider_hsdp)                         | >= 0.17.0 |
| <a name="provider_random"></a> [random](#provider_random)                   | >= 2.2.1  |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                   | Type        |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [cloudfoundry_app.logproxy](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/resources/app)                                     | resource    |
| [cloudfoundry_route.logproxy](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/resources/route)                                 | resource    |
| [cloudfoundry_user_provided_service.logdrain](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/resources/user_provided_service) | resource    |
| [random_id.id](https://registry.terraform.io/providers/random/latest/docs/resources/id)                                                                                | resource    |
| [random_password.token](https://registry.terraform.io/providers/random/latest/docs/resources/password)                                                                 | resource    |
| [cloudfoundry_domain.domain](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/data-sources/domain)                              | data source |
| [cloudfoundry_domain.internal](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/data-sources/domain)                            | data source |
| [hsdp_config.cf](https://registry.terraform.io/providers/philips-software/hsdp/latest/docs/data-sources/config)                                                        | data source |
| [hsdp_config.logging](https://registry.terraform.io/providers/philips-software/hsdp/latest/docs/data-sources/config)                                                   | data source |

## Inputs

| Name                                                                                       | Description                                                                                                                                                                                 | Type       | Default                             | Required |
| ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- | ----------------------------------- | :------: |
| <a name="input_cf_space_id"></a> [cf_space_id](#input_cf_space_id)                         | The space ID to deploy components to                                                                                                                                                        | `string`   | n/a                                 |   yes    |
| <a name="input_disk"></a> [disk](#input_disk)                                              | Amount of disk to allocate                                                                                                                                                                  | `number`   | `512`                               |    no    |
| <a name="input_docker_password"></a> [docker_password](#input_docker_password)             | Docker registry password                                                                                                                                                                    | `string`   | `""`                                |    no    |
| <a name="input_docker_username"></a> [docker_username](#input_docker_username)             | Docker registry username                                                                                                                                                                    | `string`   | `""`                                |    no    |
| <a name="input_enable_ironio"></a> [enable_ironio](#input_enable_ironio)                   | Enable iron logdrain endpoint                                                                                                                                                               | `bool`     | `false`                             |    no    |
| <a name="input_enable_syslog"></a> [enable_syslog](#input_enable_syslog)                   | Enable syslog drain endpoint                                                                                                                                                                | `bool`     | `true`                              |    no    |
| <a name="input_environment"></a> [environment](#input_environment)                         | Optional additional environment variables for Logproxy                                                                                                                                      | `map(any)` | `{}`                                |    no    |
| <a name="input_hsdp_environment"></a> [hsdp_environment](#input_hsdp_environment)          | The hsdp environment that the service identity belongs for service based authentication (recommended). When using service authentication, the signing base variables should not be provided | `string`   | `"client-test"`                     |    no    |
| <a name="input_hsdp_region"></a> [hsdp_region](#input_hsdp_region)                         | The hsdp region that the service identity belongs for service based authentication (recommended). When using service authentication, the signing base variables should not be provided      | `string`   | `"us-east"`                         |    no    |
| <a name="input_logingestor_url"></a> [logingestor_url](#input_logingestor_url)             | The HSDP Log ingestor endpoint. When empty auto-detect via hsdp_config                                                                                                                      | `string`   | `""`                                |    no    |
| <a name="input_logproxy_image"></a> [logproxy_image](#input_logproxy_image)                | Docker image to use                                                                                                                                                                         | `string`   | `"philipssoftware/logproxy:v1.7.4"` |    no    |
| <a name="input_memory"></a> [memory](#input_memory)                                        | Amount of memory to use                                                                                                                                                                     | `number`   | `64`                                |    no    |
| <a name="input_name_postfix"></a> [name_postfix](#input_name_postfix)                      | The postfix string to append to the space, hostname, etc. Prevents namespace clashes                                                                                                        | `string`   | `""`                                |    no    |
| <a name="input_product_key"></a> [product_key](#input_product_key)                         | The HSDP logging product key                                                                                                                                                                | `string`   | n/a                                 |   yes    |
| <a name="input_queue_type"></a> [queue_type](#input_queue_type)                            | The queue type to use. Supported are 'channel' or 'rabbitmq'                                                                                                                                | `string`   | `"channel"`                         |    no    |
| <a name="input_secret_key"></a> [secret_key](#input_secret_key)                            | The secret key API signing based authentication. When using signing authentication, the service base variables should not be provided.                                                      | `string`   | `""`                                |    no    |
| <a name="input_service_id"></a> [service_id](#input_service_id)                            | The IAM service identity id for service based authentication (recommended). When using service authentication, the signing base variables should not be provided                            | `string`   | `""`                                |    no    |
| <a name="input_service_private_key"></a> [service_private_key](#input_service_private_key) | The IAM service identity private key for service based authentication (recommended). When using service authentication, the signing base variables should not be provided                   | `string`   | `""`                                |    no    |
| <a name="input_shared_key"></a> [shared_key](#input_shared_key)                            | The shared key for API signing based authentication. When using signing authentication, the service base variables should not be provided.                                                  | `string`   | `""`                                |    no    |

## Outputs

| Name                                                                                         | Description                                                                           |
| -------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| <a name="output_logdrain_endpoint"></a> [logdrain_endpoint](#output_logdrain_endpoint)       | The logproxy logdrain endpoint                                                        |
| <a name="output_logdrain_service_id"></a> [logdrain_service_id](#output_logdrain_service_id) | The uuid of the logdrain service. You can bind this to your app to enable logdraining |
| <a name="output_logproxy_app_id"></a> [logproxy_app_id](#output_logproxy_app_id)             | The logproxy app GUID                                                                 |

<!--- END_TF_DOCS --->

# Contact / Getting help

Please post your questions on the HSDP Slack `#terraform` channel

# License

[License](./LICENSE.md) is MIT
