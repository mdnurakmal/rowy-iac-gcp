
# Create app engine application if it doesnt exists
resource "google_app_engine_application" "app" {
  project = local.project
  database_type = "CLOUD_FIRESTORE"
  location_id = var.region

    lifecycle {
    prevent_destroy = true
  }

}