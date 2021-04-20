<img src="https://cdn.rawgit.com/hashicorp/terraform-website/master/content/source/assets/images/logo-hashicorp.svg" width="500px">

# terraform-cloudfoundry-logproxy

Module to deploy Logproxy

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| cloudfoundry | >= 0.1400.0 |
| hsdp | >= 0.14.0 |
| random | >= 2.2.1 |

## Providers

| Name | Version |
|------|---------|
| cloudfoundry | >= 0.1400.0 |
| hsdp | >= 0.14.0 |
| random | >= 2.2.1 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [cloudfoundry_app](https://registry.terraform.io/providers/philips-labs/cloudfoundry/latest/docs/resources/app) |
| [cloudfoundry_domain](https://registry.terraform.io/providers/philips-labs/cloudfoundry/latest/docs/data-sources/domain) |
| [cloudfoundry_org](https://registry.terraform.io/providers/philips-labs/cloudfoundry/latest/docs/data-sources/org) |
| [cloudfoundry_route](https://registry.terraform.io/providers/philips-labs/cloudfoundry/latest/docs/resources/route) |
| [cloudfoundry_service](https://registry.terraform.io/providers/philips-labs/cloudfoundry/latest/docs/data-sources/service) |
| [cloudfoundry_space](https://registry.terraform.io/providers/philips-labs/cloudfoundry/latest/docs/data-sources/space) |
| [hsdp_config](https://registry.terraform.io/providers/philips-software/hsdp/latest/docs/data-sources/config) |
| [random_password](https://registry.terraform.io/providers/random/latest/docs/resources/password) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cf\_org\_name | Cloudfoundry ORG name to use for reverse proxy | `string` | n/a | yes |
| cf\_space\_name | The space where to deploy components to. If not specified a new space will be created | `string` | `""` | no |
| cf\_username | The Cloudfoundry user to assign rights to the app to | `string` | n/a | yes |
| disk | Amount of disk to allocate | `number` | `512` | no |
| docker\_password | Docker registry password | `string` | `""` | no |
| docker\_username | Docker registry username | `string` | `""` | no |
| environment | Optional additional environment variables for Logproxy | `map(any)` | `{}` | no |
| hsdp\_environment | The HSDP environment in the region | `string` | n/a | yes |
| hsdp\_region | The HSDP region to deploy into | `string` | n/a | yes |
| logproxy\_image | Docker image to use | `string` | `"philipssoftware/logproxy:v1.4.1"` | no |
| memory | Amount of memory to use | `number` | `64` | no |
| name\_postfix | The postfix string to append to the space, hostname, etc. Prevents namespace clashes | `string` | `""` | no |
| product\_key | The HSDP logging product key | `string` | n/a | yes |
| queue\_type | The queue type to use. Supported are 'chnanel' or 'rabbitmq' | `string` | `"channel"` | no |
| rabbitmq\_broker\_settings | The RabbitMQ service broker settings. Only used when queue\_type is set to 'rabbitmq' | <pre>object({<br>    service_broker = string<br>    service_plan   = string<br>  })</pre> | <pre>{<br>  "service_broker": "hsdp-rabbitmq-server",<br>  "service_plan": "rabbitmq-dev-standalone"<br>}</pre> | no |
| secret\_key | The secret key for signing requests | `string` | n/a | yes |
| shared\_key | The shared key for signing requests | `string` | n/a | yes |

## Outputs

No output.

<!--- END_TF_DOCS --->

# Contact / Getting help

Please post your questions on the HSDP Slack `#terraform` channel

# License
[License](./LICENSE.md) is MIT
