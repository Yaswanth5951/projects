terraform {
  backend "s3" {
    bucket = "terraformfiles-volume"
    key    = "jenkins/terraform.tfstate"
    region = "ap-northeast-3"
  }
}