resource          "google_storage_bucket"      "messy_bucket" { 
name     = "lab25-totalny-chaos-bucket"
  location      = "EU"

    storage_class = "STANDARD"
uniform_bucket_level_access =            true 

  versioning {
enabled = false
  }
            labels = { 
env = "test"
owner = "mariusz"
}
}

resource "google_compute_firewall" "bad_firewall" {
name    = "allow-http"
network = "default"

allow {
protocol = "tcp"
ports    = ["80"]
}

source_ranges = ["0.0.0.0/0"]
} 
