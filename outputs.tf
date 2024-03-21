output "stable_channel_default_version" {
  value = data.google_container_engine_versions.asia_northeast1_a.valid_node_versions
}