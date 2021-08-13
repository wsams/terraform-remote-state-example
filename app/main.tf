terraform {
  required_version = "= 1.0.4"

  backend "s3" {
    bucket   = "terraform-snd"
    key      = "remotestatetest/app.tfstate"
    endpoint = "https://example.com"
    region                      = "us-east-1"
    workspace_key_prefix        = "testing/workspace"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}

data "terraform_remote_state" "teams" {
  backend = "s3"

  config = {
    bucket   = "terraform-snd"
    key      = "remotestatetest/teams.tfstate"
    endpoint = "https://example.com"
    # The S3 backend requires a valid AWS region even though our appliance ignores it
    region                      = "us-east-1"
    workspace_key_prefix        = "testing/workspace"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}

output "team_id" {
  value = data.terraform_remote_state.teams.outputs.team_id
}
