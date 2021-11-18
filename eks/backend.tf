terraform {
  backend "s3" {
    bucket = "tutorial-automation-with-jenkins"
    key = "eks/eks"
    region = "us-east-1"
  }
}
