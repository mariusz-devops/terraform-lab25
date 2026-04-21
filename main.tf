# main.tf - Wersja Profesjonalna

resource "google_storage_bucket" "messy_bucket" {
  name                        = "lab25-bezpieczny-bucket-2026"
  location                    = "EU"
  uniform_bucket_level_access = true

  # NAPRAWA: Dodajemy szyfrowanie kluczem klienta
  encryption {
    default_kms_key_name = "projects/my-project/locations/global/keyRings/my-ring/cryptoKeys/my-key"
  }
}

resource "google_compute_firewall" "bad_firewall" {
  name    = "allow-http-internal"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  # NAPRAWA: Zamiast 0.0.0.0/0 dajemy bezpieczny zakres (np. sieć firmowa)
  source_ranges = ["10.0.0.0/8"]
}