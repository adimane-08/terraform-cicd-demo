terraform {
  backend "s3" {
    bucket         = "aditya-terraform-backend-ewe"
    key            = "terraform/state.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
