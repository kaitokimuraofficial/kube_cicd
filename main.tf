resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = "asia-northeast1-a"

  remove_default_node_pool = false
  initial_node_count       = 1


  release_channel {
    channel = "REGULAR"
  }

  addons_config {
    http_load_balancing {
      disabled = false
    }

    horizontal_pod_autoscaling {
      disabled = false
    }

    network_policy_config {
      disabled = false
    }
  }

  network_policy {
    provider = "PROVIDER_UNSPECIFIED"
    enabled  = true
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "asia-northeast1-a"
  cluster    = google_container_cluster.primary.name
  node_count = 3

  management {
    auto_repair = true
  }

  node_config {
    machine_type = "n1-standard-4"
    image_type   = "COS_CONTAINERD"
  }

  autoscaling {
    min_node_count = 3
    max_node_count = 5
  }
}