#Bucket for website 

resource "google_storage_bucket" "website" {
    name = "mycloudresume-terraform"
    location = "ASIA"
}

#Make new objects public
resource "google_storage_object_access_control" "public_rule" {
  object = google_storage_bucket_object.static_site_src.name
  bucket = google_storage_bucket.website.name
  role = "READER"
  entity = "allUsers"
}

#Upload index.html to bucket
resource "google_storage_bucket_object" "static_site_src" {
  name = "index.html"
  source = "C:\\Users\\Kingshuk Debnath\\onedrive\\desktop\\cloud-resume\\frontend\\index.html"
  bucket = google_storage_bucket.website.name
}

#Reserve a static external IP address
resource "google_compute_global_address" "website_ip" {
  name = "website-lb-ip"
}

