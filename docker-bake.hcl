include "compose" {
  path = "docker-compose.yml"
}

group "default" {
  targets = ["astarte-housekeeping", "astarte-realm-management", "astarte-pairing","astarte-appengine-api", "astarte-data-updater-plant", "astarte-trigger-engine" ]
}

target "astarte-housekeeping" {
  tags = ["astarte/astarte_housekeeping:1.3-snapshot"]
}

target "astarte-realm-management" {
  tags = ["astarte/astarte_realm_management:1.3-snapshot"]
}

target "astarte-pairing" {
  tags = ["astarte/astarte_pairing:1.3-snapshot"]
}

target "astarte-appengine-api" {
  tags = ["astarte/astarte_appengine_api:1.3-snapshot"]
}

target "astarte-data-updater-plant" {
  tags = ["astarte/astarte_data_updater_plant:1.3-snapshot"]
}

target "astarte-trigger-engine" {
  tags = ["astarte/astarte_trigger_engine:1.3-snapshot"]
}
