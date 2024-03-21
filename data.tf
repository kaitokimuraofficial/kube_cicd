data "google_container_engine_versions" "asia_northeast1_a" {
  provider       = google
  location       = "asia-northeast1-a"
  version_prefix = "1.20."
}
