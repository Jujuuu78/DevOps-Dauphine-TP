locals {
  region = "us-central1"
  repo_name="website-tools"
  project_id="planar-cell-449407-v2"
  image_name="image-wordpress"
  tag="latest"
  db_instance="main-instance"
  db_name="wordpress"
  db_password="ilovedevops"
  run_service_name="run-wordpress-dev"
}

module "artifact_registry" {
  source     = "./../../modules/artifactory"
  project_id = local.project_id
  region     = local.region
  repo_name  = local.repo_name
}

module "activate_api"{
  source     = "./../../modules/api"
  project_id = local.project_id
}

module "wordpress"{
  source = "./../../modules/database"
  project_id = local.project_id
  db_instance_name = local.db_instance
  db_name          = local.db_name
  db_password      = local.db_password
}

module "cloud_run_service"{
  source     = "./../../modules/run"
  region = local.region
  project_id = local.project_id
  run_service_name=local.run_service_name
  image_name = local.image_name
  repo_name = local.repo_name
  tag = local.tag
}