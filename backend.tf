terraform {
  backend "s3" {
    bucket         = "tsfilestate-jafar"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "interview-exercise"
    encrypt        = true

  }
}
