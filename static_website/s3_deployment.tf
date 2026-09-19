terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
  }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "static_website_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_object" "index_document" {
  bucket = aws_s3_bucket.static_website_bucket.id
  key    = var.index_document
  source = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "styles_css" {
  bucket = aws_s3_bucket.static_website_bucket.id
  key    = var.styles_css
  source = "styles.css"
  content_type = "text/css"
}

resource "aws_s3_bucket_public_access_block" "static_website_bucket_public_access_block" {
  bucket = aws_s3_bucket.static_website_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "static_website_bucket_policy" {
  bucket = aws_s3_bucket.static_website_bucket.id

  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Sid       = "PublicReadGetObject",
          Effect    = "Allow",
          Principal = "*",
          Action    = "s3:GetObject",
          Resource  = "${aws_s3_bucket.static_website_bucket.arn}/*"
        }
      ]
}
)    
}

resource "aws_s3_bucket_website_configuration" "my_website" {
  bucket = aws_s3_bucket.static_website_bucket.id

  index_document {
    suffix = "index.html"
  }
}

output "aws_s3_bucket_website_url" {
  value = aws_s3_bucket_website_configuration.my_website.website_endpoint
}