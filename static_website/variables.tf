variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket to create."
  default     = "my-terraform-bucket009090"
}

variable "index_document" {
  type        = string
  description = "The index document for the S3 static website."
  default     = "index.html"
}   

variable "styles_css" {
  type        = string
  description = "The style sheet for the S3 static website."
  default     = "styles.css"
}

variable "region" {
  type        = string
  description = "The AWS region to deploy the S3 bucket."
  default     = "eu-west-1"
}
