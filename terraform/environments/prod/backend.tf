terraform {
  backend "gcs" {
    bucket = "test-tp-447615-tfstate"
    prefix = "env/prod"
  }
}
