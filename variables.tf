variable "compute_region_health_aggregation_policies" {
  description = <<EOT
Map of compute_region_health_aggregation_policies, attributes below
Required:
    - name
    - region
Optional:
    - deletion_policy
    - description
    - healthy_percent_threshold
    - min_healthy_threshold
    - policy_type
    - project
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    name                      = string
    region                    = string
    deletion_policy           = optional(string)
    description               = optional(string)
    healthy_percent_threshold = optional(number)
    min_healthy_threshold     = optional(number)
    policy_type               = optional(string)
    project                   = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

