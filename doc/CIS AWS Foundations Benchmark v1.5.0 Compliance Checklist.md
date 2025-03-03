# CIS AWS Foundations Benchmark v1.5.0 Compliance Checklist

![CIS AWS](https://img.shields.io/badge/CIS%20Benchmark-AWS-v1.5.0-blue)

Official reference: [CIS AWS Foundations Benchmark v1.5.0](https://d1.awsstatic.com/whitepapers/compliance/CIS_AWS_Foundations_Benchmark.pdf)

## Identity and Access Management
- [ ] **1.1** Maintain current contact details (Security Contact Information)
- [ ] **1.2** Ensure security questions are registered (AWS Account Settings)
- [ ] **1.3** Enable MFA for root account (IAM > Users)
- [ ] **1.4** Delete root access keys (IAM > Security Credentials)
- [ ] **1.5** Ensure MFA is enabled for IAM users with console access

## Logging
- [ ] **2.1** Enable CloudTrail in all regions
- [ ] **2.2** Ensure CloudTrail log file validation is enabled
- [ ] **2.3** Ensure CloudTrail logs are encrypted with KMS
- [ ] **2.4** Ensure S3 bucket for CloudTrail is not publicly accessible

## Monitoring
- [ ] **3.1** Enable AWS Config in all regions
- [ ] **3.2** Ensure CloudWatch alarm for unauthorized API calls
- [ ] **3.3** Ensure metric filter for Security Group changes

## Networking
- [ ] **4.1** Ensure no security groups allow ingress from 0.0.0.0/0 to port 22
- [ ] **4.2** Ensure default security group restricts all traffic
- [ ] **4.3** Ensure VPC flow logging is enabled in all VPCs

## Other Services
- [ ] **5.1** Ensure IAM Access Analyzer is enabled
- [ ] **5.2** Ensure rotation for customer-managed KMS keys is enabled

## How to Use
1. Review AWS Account against each item
2. Check completed items
3. Remediate unchecked items using:
   - AWS Management Console
   - AWS CLI
   - Terraform/AWS CloudFormation

## Related Resources
- [AWS Foundational Security Best Practices](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp.html)
- [AWS Security Reference Architecture](https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/welcome.html)
