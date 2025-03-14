# Cloud Security Gap Analysis Worksheet

## Introduction

This worksheet helps you assess your cloud security posture by documenting current controls, comparing them to best practices, and identifying gaps. It’s a great starting point for improving security and compliance.

**Examples and Resources**:  
- Include specific controls like *“IAM: MFA enabled for all users”* or *“Network Security: VPC with NACLs configured”*.  
- Refer to [NIST CSF](https://www.nist.gov/cyberframework), [CIS Benchmarks](https://www.cisecurity.org/cis-benchmarks/), and [CSA Security Guidance](https://cloudsecurityalliance.org/research/guidance/) for standards and benchmarks.  

**Customization**:  
Feel free to fork this worksheet and adapt it to your cloud provider (e.g., AWS, Azure, GCP) or organization. Add domains like “Serverless Security” or tweak priorities to suit your needs.

---

## Current Security Posture

List your existing security measures across key domains.

### Table: Current Controls

| Security Domain          | Current Controls                  | Notes                     |
|--------------------------|-----------------------------------|---------------------------|
| Identity and Access Management (IAM) | *MFA enabled for admin users* | *Regular users lack MFA* |
| Network Security         | *VPC with Security Groups*       | *Some rules too permissive* |
| Data Protection          | *S3 buckets encrypted at rest*   | *RDS lacks encryption*   |
| Logging and Monitoring   | *CloudTrail enabled*             | *No centralized analysis* |

**Tip**: Be detailed—e.g., specify tools like “AWS KMS for encryption.”

---

## Desired Security State

Define your target controls using a framework like [NIST CSF](https://www.nist.gov/cyberframework) or [CIS Benchmarks](https://www.cisecurity.org/cis-benchmarks/).

### Table: Desired Controls

| Security Domain          | Desired Controls                | Reference             |
|--------------------------|---------------------------------|-----------------------|
| IAM                      | *MFA for all users*            | *CIS 1.1*            |
| Network Security         | *Least privilege access*       | *NIST PR.AC-3*       |
| Data Protection          | *Encrypt all data at rest*     | *CIS 4.1*            |
| Logging and Monitoring   | *Centralized logs with alerts* | *NIST DE.CM-1*       |

---

## Gap Analysis

Identify discrepancies between current and desired states.

### Table: Gaps

| Security Domain | Current Controls          | Desired Controls         | Gap                     |
|-----------------|---------------------------|--------------------------|-------------------------|
| IAM             | *MFA for admins only*     | *MFA for all users*      | *No MFA for users*      |
| Data Protection | *S3 encrypted*            | *Encrypt all data*       | *RDS unencrypted*       |

---

## Prioritization

Rank gaps by risk: High, Medium, Low.

### Table: Prioritization

| Gap                  | Risk Level | Priority | Remediation          |
|----------------------|------------|----------|----------------------|
| *No MFA for users*   | High       | 1        | *Enable MFA by [date]* |
| *RDS unencrypted*    | High       | 1        | *Encrypt RDS by [date]* |

**Next Steps**: Focus on High-priority gaps first, using resources like [CSA Guidance](https://cloudsecurityalliance.org/research/guidance/).

---
