# Cloud Security Gap Analysis Worksheet

## Introduction

This worksheet helps you evaluate your cloud security posture by documenting existing controls, comparing them to best practices, and identifying gaps for improvement. It’s a practical tool to enhance security and compliance in your cloud setup.

**Examples and Resources**:  
- Use specific controls like *“IAM: MFA enabled for all users”* or *“Network Security: VPC with NACLs configured”*.  
- Refer to frameworks like [NIST CSF](https://www.nist.gov/cyberframework), [CIS Benchmarks](https://www.cisecurity.org/cis-benchmarks/), and [CSA Security Guidance](https://cloudsecurityalliance.org/research/guidance/).  

**Customization**:  
Tailor this to your cloud provider (e.g., AWS, Azure, GCP) or organization by adding domains like “Serverless Security” or adjusting priorities.

---

## Current Security Posture Assessment

List your existing security controls across key domains. Below is a table with examples, including common cloud security measures.

### Table: Current Security Controls

| Security Domain          | Current Controls (e.g., Tools, Policies)                     | Notes (e.g., Limitations, Coverage)           |
|--------------------------|--------------------------------------------------------------|-----------------------------------------------|
| Identity and Access Management (IAM) | MFA enabled for admin users, Role-based access control (RBAC) | Regular users lack MFA, roles overly permissive |
| Network Security         | VPC with Security Groups, DDoS protection enabled            | Some Security Group rules too permissive      |
| Data Protection          | S3 buckets encrypted at rest, TLS for data in transit         | RDS databases unencrypted, no key rotation    |
| Logging and Monitoring   | CloudTrail enabled, basic alerts for failed logins           | No centralized log analysis, limited retention|
| Incident Response        | Basic runbook for common incidents, email alerts             | No formal IR team, limited automation         |
| Compliance and Governance| Manual audits every 6 months, basic tagging policy           | No automated compliance checks, inconsistent tags |
| Application Security     | WAF enabled, static code analysis for some apps              | No dynamic testing, limited coverage          |
| Endpoint Security        | Antivirus on VMs, EDR for critical servers                   | No endpoint protection for containers         |
| Backup and Recovery      | Daily backups for databases, weekly for VMs                  | No automated restore testing, limited geo-redundancy |
| Serverless Security      | Lambda functions with least privilege roles                  | No runtime monitoring, limited logging        |
| Container Security       | Docker images scanned for vulnerabilities                    | No runtime protection, limited network isolation |
| Encryption Key Management| KMS used for encryption keys, basic access controls          | No key usage auditing, limited rotation       |
| Threat Detection         | Basic anomaly detection for login attempts                   | No ML-based detection, limited scope          |
| Vulnerability Management | Monthly vulnerability scans for public-facing apps           | No automated patching, limited scope          |
| Secure Configuration     | CIS benchmark applied to some VMs                            | No config drift monitoring, partial coverage  |
| API Security             | API Gateway with authentication                              | No rate limiting, limited logging             |
| Cloud Workload Protection| Basic firewall rules for VMs                                 | No workload-specific policies, limited visibility |
| Secure DevOps            | Code repo access controls, basic CI/CD pipeline security     | No secrets management, limited testing        |
| Third-Party Risk Management | Vendor assessments for critical suppliers                  | No continuous monitoring, limited scope        |
| Cloud Security Posture Management | Basic CSPM tool for misconfiguration detection             | Limited coverage, no auto-remediation         |

**Tip**: Be specific—include tools, policies, and limitations—to ensure this assessment is actionable.

---

## Desired Security State

Define your target security controls based on industry standards. Below are examples aligned with frameworks like NIST CSF and CIS Benchmarks.

### Table: Desired Security Controls

| Security Domain          | Desired Controls (Based on Framework)                        | Reference (e.g., NIST ID, CIS Control) |
|--------------------------|--------------------------------------------------------------|----------------------------------------|
| IAM                      | MFA for all users, least privilege access                    | CIS 1.1, NIST PR.AC-1                  |
| Network Security         | Zero Trust architecture, micro-segmentation                  | NIST PR.AC-5, CIS 12.2                 |
| Data Protection          | Encryption at rest and in transit for all data               | CIS 4.1, NIST SC-28                    |
| Logging and Monitoring   | Centralized logging with SIEM, real-time alerts              | NIST DE.CM-1, CIS 6.2                  |
| Incident Response        | Automated IR playbooks, dedicated IR team                    | NIST RS.RP-1, CIS 19.1                 |
| Compliance and Governance| Continuous compliance monitoring, automated reporting        | NIST CA-7, CIS 17.1                    |
| Application Security     | SAST, DAST, and RASP for all apps                            | NIST SI-7, CIS 18.1                    |
| Endpoint Security        | EDR for all endpoints, including containers                  | NIST DE.CM-4, CIS 8.1                  |
| Backup and Recovery      | Automated backups with geo-redundancy, regular restore tests | NIST CP-9, CIS 10.1                    |
| Serverless Security      | Runtime protection, least privilege for functions            | NIST PR.AC-4, CIS 14.1                 |
| Container Security       | Runtime protection, image signing, network policies          | NIST SI-3, CIS 5.1                     |
| Encryption Key Management| Centralized key management with rotation and auditing        | NIST SC-12, CIS 3.5                    |
| Threat Detection         | ML-based anomaly detection, threat intelligence integration  | NIST DE.CM-7, CIS 12.1                 |
| Vulnerability Management | Continuous scanning, automated patching                      | NIST RA-5, CIS 3.1                     |
| Secure Configuration     | Automated config management, drift detection                 | NIST CM-2, CIS 5.2                     |
| API Security             | Rate limiting, OAuth2, comprehensive logging                 | NIST SC-7, CIS 12.3                    |
| Cloud Workload Protection| Workload-specific firewalls, behavior monitoring             | NIST SI-4, CIS 12.5                    |
| Secure DevOps            | Secrets management, automated security testing in CI/CD      | NIST SA-15, CIS 18.2                   |
| Third-Party Risk Management | Continuous vendor monitoring, risk-based assessments       | NIST SR-6, CIS 15.1                    |
| Cloud Security Posture Management | Comprehensive CSPM with auto-remediation                   | NIST CM-8, CIS 2.1                     |

---

## Gap Identification

Compare current and desired controls to identify gaps. Below are examples of common cloud security gaps.

### Table: Security Gaps

| Security Domain          | Current Controls                             | Desired Controls                             | Identified Gaps                             |
|--------------------------|----------------------------------------------|----------------------------------------------|---------------------------------------------|
| IAM                      | MFA for admins only                          | MFA for all users                            | No MFA for regular users                    |
| Network Security         | Basic VPC setup                              | Zero Trust architecture                      | Lack of micro-segmentation                  |
| Data Protection          | Partial encryption                           | Full encryption for all data                 | Unencrypted databases and backups           |
| Logging and Monitoring   | Basic logging                                | Centralized SIEM with real-time alerts       | No centralized analysis or alerting         |
| Incident Response        | Manual runbooks                              | Automated playbooks and dedicated team       | Limited automation and expertise            |
| Compliance and Governance| Manual audits                                | Continuous compliance monitoring             | No automated checks or reporting            |
| Application Security     | Static code analysis only                    | SAST, DAST, and RASP                         | Missing dynamic and runtime protection      |
| Endpoint Security        | Antivirus on VMs                             | EDR for all endpoints                        | No protection for containers or serverless  |
| Backup and Recovery      | Manual backups                               | Automated, geo-redundant backups             | No automation or geo-redundancy             |
| Serverless Security      | Basic role assignments                       | Runtime protection and monitoring            | No runtime security or detailed logging     |
| Container Security       | Image scanning only                          | Runtime protection and network policies      | No runtime security or network isolation    |
| Encryption Key Management| Basic KMS usage                              | Centralized management with auditing         | No key rotation or usage auditing           |
| Threat Detection         | Simple anomaly detection                     | ML-based detection and threat intel          | Limited detection capabilities              |
| Vulnerability Management | Monthly scans                                | Continuous scanning and auto-patching        | Infrequent scans, manual patching           |
| Secure Configuration     | Partial CIS benchmark application            | Automated config management and drift detection | No automation or drift monitoring         |
| API Security             | Basic authentication                         | Rate limiting and comprehensive logging      | No rate limiting or detailed logging        |
| Cloud Workload Protection| Basic firewall rules                         | Workload-specific policies and monitoring    | Limited visibility and protection           |
| Secure DevOps            | Basic access controls                        | Secrets management and automated testing     | No secrets management or security testing   |
| Third-Party Risk Management | Initial vendor assessments                 | Continuous monitoring and risk assessments   | No ongoing monitoring                       |
| Cloud Security Posture Management | Basic CSPM tool                           | Comprehensive CSPM with auto-remediation     | Limited coverage and no auto-remediation    |

---

## Gap Prioritization

Assess each gap’s risk and set priorities. Below is a table with examples to guide remediation planning.

### Table: Gap Prioritization

| Identified Gap                             | Security Domain          | Risk Level | Priority | Remediation Plan                        |
|--------------------------------------------|--------------------------|------------|----------|-----------------------------------------|
| No MFA for regular users                   | IAM                      | High       | 1        | Enable MFA for all users by [date]      |
| Unencrypted databases                      | Data Protection          | High       | 1        | Encrypt all databases by [date]         |
| No centralized log analysis                | Logging and Monitoring   | High       | 1        | Implement SIEM solution by [date]       |
| Missing dynamic app security testing       | Application Security     | Medium     | 2        | Integrate DAST tools by [date]          |
| No endpoint protection for containers      | Endpoint Security        | High       | 1        | Deploy EDR for containers by [date]     |
| No automated backups                       | Backup and Recovery      | Medium     | 2        | Automate backups with geo-redundancy    |
| No runtime protection for serverless       | Serverless Security      | Medium     | 2        | Enable runtime monitoring by [date]     |
| No key rotation policy                     | Encryption Key Management| High       | 1        | Implement key rotation by [date]        |
| Infrequent vulnerability scans             | Vulnerability Management | Medium     | 2        | Set up continuous scanning by [date]    |
| No secrets management in CI/CD             | Secure DevOps            | High       | 1        | Integrate secrets management by [date]  |
| Lack of micro-segmentation                 | Network Security         | High       | 1        | Implement Zero Trust by [date]          |
| No runtime container security              | Container Security       | Medium     | 2        | Add runtime protection by [date]        |
| No rate limiting for APIs                  | API Security             | Medium     | 2        | Configure rate limiting by [date]       |
| Limited CSPM coverage                      | Cloud Security Posture Management | Medium    | 2        | Expand CSPM scope by [date]            |

**Tip**: Use a risk matrix (likelihood vs. impact) to assign risk levels consistently.

---

## Additional Guidance

- **Collaborate**: Involve security, DevOps, and compliance teams for a complete assessment.  
- **Automate**: Use tools like CSPM platforms or cloud-native services (e.g., AWS Config) to streamline gap detection.  
- **Prioritize**: Focus on gaps tied to regulations (e.g., GDPR, HIPAA) or critical assets.  
- **Document**: Track decisions and progress for audits and future updates.  
- **Review**: Revisit quarterly or after major changes to your cloud setup.  
- **Customize**: Adjust controls for your provider—e.g., AWS GuardDuty for threat detection.  

**Next Steps**:  
Share this on GitHub for team collaboration. Customize and update it to fit your cloud environment.
