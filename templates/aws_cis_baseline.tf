# CIS Remediation for Critical Findings
resource "aws_cloudtrail" "secure_trail" {
  name                          = "cis-multi-region-trail"
  s3_bucket_name                = aws_s3_bucket.cloudtrail_bucket.id
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
  kms_key_id                    = aws_kms_key.cloudtrail.arn
}

resource "aws_s3_bucket" "cloudtrail_bucket" {
  bucket        = "cloudtrail-logs-${random_id.suffix.hex}"
  force_destroy = false

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.cloudtrail.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

# Block public access to S3 bucket
resource "aws_s3_bucket_public_access_block" "cloudtrail" {
  bucket                  = aws_s3_bucket.cloudtrail_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
