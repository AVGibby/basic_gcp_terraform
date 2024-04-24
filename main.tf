terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
  project     = "composed-garden-417100"
  region      = "us-east1"
  credentials = "composed-garden-417100-222f824cdc74.json"
}

resource "google_storage_bucket" "gibby-bucket-001" {
  name          = "this-is-gibbys-bucket-touch-it-you-die"
  location      = "us-east1"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}
