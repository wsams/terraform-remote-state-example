terraform {
  required_version = "= 1.0.4"

  backend "s3" {
    bucket   = "terraform-snd"
    key      = "remotestatetest/teams.tfstate"
    endpoint = "https://example.com"
    region                      = "us-east-1"
    workspace_key_prefix        = "testing/workspace"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}

module "myteam" {
  source = "./modules/teams"
}

output "team_id" {
  value = module.myteam.id
}
