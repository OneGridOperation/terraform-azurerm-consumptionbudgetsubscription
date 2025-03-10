locals {
  name = var.override_name == null ? "${lower(var.system_short_name)}-${lower(var.app_name)}-${lower(var.environment)}-consumption-budget-subscription" : var.override_name
}

data "azurerm_subscription" "current" {}

resource "azurerm_consumption_budget_subscription" "consumption_budget_subscription" {
  name            = local.name
  subscription_id = data.azurerm_subscription.current.id

  amount     = var.amount
  time_grain = var.time_grain

  time_period {
    start_date = try(var.configuration.time_period.start_date, join("", [formatdate("YYYY-MM", timestamp()), "-01T00:00:00Z"]))
    end_date   = try(var.configuration.time_period.end_date, null)
  }

  dynamic "notification" {
    for_each = var.configuration.notifications

    content {
      operator       = notification.value.operator
      threshold      = notification.value.threshold
      threshold_type = try(notification.value.threshold_type, null)
      contact_emails = try(notification.value.contact_emails, [])
      contact_groups = try(notification.value.contact_groups, [])
      contact_roles  = try(notification.value.contact_roles, [])
      enabled        = try(notification.value.enabled, true)
    }
  }
}
