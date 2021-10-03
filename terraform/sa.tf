# Create a service account
resource "google_service_account" "rowy_sa" {
  account_id   = "rowy-sa"
  display_name = "Rowy Service Account"
}

resource "google_project_iam_binding" "firebase_permmisions" {
  project = local.project
  role = "roles/firebase.admin"

    members    = [local.rowy_sa]
  depends_on = [google_service_account.rowy_sa]
}
resource "google_project_iam_binding" "serviceAccountUser_permmisions" {
  project = local.project
  role = "roles/iam.serviceAccountUser"

  members = [local.rowy_sa]
  depends_on = [google_service_account.firebase_permmisions]
}

