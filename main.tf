resource "google_compute_region_health_aggregation_policy" "compute_region_health_aggregation_policies" {
  for_each = var.compute_region_health_aggregation_policies

  name                      = each.value.name
  region                    = each.value.region
  deletion_policy           = each.value.deletion_policy
  description               = each.value.description
  healthy_percent_threshold = each.value.healthy_percent_threshold
  min_healthy_threshold     = each.value.min_healthy_threshold
  policy_type               = each.value.policy_type
  project                   = each.value.project

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

