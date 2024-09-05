tflint {
  required_version = ">= 0.50"
}

plugin "google" {
    enabled = true
    version = "0.30.0"
    source  = "github.com/terraform-linters/tflint-ruleset-google"
}

plugin "terraform" {
    enabled = true
    version = "0.9.0"
    source  = "github.com/terraform-linters/tflint-ruleset-terraform"
}
