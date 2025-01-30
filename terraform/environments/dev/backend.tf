terraform {
  backend "gcs" {
    bucket = "planar-cell-449407-v2-tfstate"
    prefix = "env/dev"
  }
}
