# [terraform-azurerm-consumptionbudgetsubscription][1]

Manages a Subscription Consumption Budget.

## Getting Started

- Format and validate Terraform code before commit.

```shell
terraform init -upgrade \
    && terraform init -reconfigure -upgrade \
    && terraform fmt -recursive . \
    && terraform fmt -check \
    && terraform validate .
```

- Always fetch latest changes from upstream and rebase from it. Terraform documentation will always be updated with GitHub Actions. See also [.github/workflows/terraform.yml](.github/workflows/terraform.yml) GitHub Actions workflow.

```shell
git fetch --all --tags --prune --prune-tags \
  && git pull --rebase --all --prune --tags
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version             |
|------|---------------------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.2            |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.14.0, < 5.0.0 |

## Providers

| Name | Version   |
|------|-----------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.14.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_consumption_budget_subscription.consumption_budget_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_subscription) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_amount"></a> [amount](#input\_amount) | (Required) The total amount of cost to track with the budget. | `number` | n/a | yes |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | (Required) Name of this resource within the system it belongs to (see naming convention guidelines).<br>Will be part of the final name of the deployed resource. | `string` | n/a | yes |
| <a name="input_configuration"></a> [configuration](#input\_configuration) | (Required) The configuration for block type arguments. | `any` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | (Required) The name of the environment. | `string` | n/a | yes |
| <a name="input_override_name"></a> [override\_name](#input\_override\_name) | (Optional) Override the name of the resource. Under normal circumstances, it should not be used. | `string` | `null` | no |
| <a name="input_system_short_name"></a> [system\_short\_name](#input\_system\_short\_name) | (Required) Short abbreviation (to-three letters) of the system name that this resource belongs to (see naming convention guidelines).<br>Will be part of the final name of the deployed resource. | `string` | n/a | yes |
| <a name="input_time_grain"></a> [time\_grain](#input\_time\_grain) | (Optional) The time covered by a budget. Tracking of the amount will be reset based on the time grain.<br>Must be one of `BillingAnnual`, `BillingMonth`, `BillingQuarter`, `Annually`, `Monthly` and `Quarterly`.<br>Defaults to `Monthly`. Changing this forces a new resource to be created." | `string` | `"Monthly"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azurerm_consumption_budget_subscription"></a> [azurerm\_consumption\_budget\_subscription](#output\_azurerm\_consumption\_budget\_subscription) | The Subscription Consumption Budget resource. |
<!-- END_TF_DOCS -->

[1]: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_subscription
