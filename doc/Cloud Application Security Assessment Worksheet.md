# Cloud Application Security Assessment Worksheet

## Introduction

This worksheet helps you evaluate the security of your cloud-hosted applications, ensuring protection against threats and compliance with standards. It covers controls, vulnerabilities, compliance, and remediation planning.

**Examples and Resources**:  
- Examples include *“Authentication: OAuth2 with MFA implemented”* or *“Vulnerability: SQL Injection in API endpoint”*.  
- Refer to [OWASP Top 10](https://owasp.org/www-project-top-ten/), [NIST SP 800-53](https://csrc.nist.gov/publications/detail/sp/800-53/rev-5/final), and [CSA Security Guidance](https://cloudsecurityalliance.org/research/guidance/) for standards and best practices.  

**Customization**:  
Fork this worksheet on GitHub to focus on specific app types (e.g., web apps, APIs, serverless) or your cloud provider (e.g., AWS, Azure, GCP). Add controls or vulnerabilities unique to your stack—contributions are welcome!

---

## Application Overview

- **Application Name**: ____________________ (e.g., "Customer Portal")  
- **Purpose**: ____________________ (e.g., "User account management")  
- **Architecture**:  
  - [ ] Monolithic  
  - [ ] Microservices  
  - [ ] Serverless  
  - [ ] Other: ________________ (e.g., "Hybrid")  
- **Data Flows**: (e.g., "User → API → DB")  
- **Sensitive Data**: (e.g., "Credit card numbers, PII")  

**Tip**: Attach an architecture diagram in your GitHub repo for clarity—e.g., a flowchart of data flows.

---

## Security Controls Assessment

Evaluate your app’s security measures with this checklist. Status options: *Implemented*, *Partially Implemented*, *Not Implemented*, *N/A*. Below are examples, expanded with 20 additional controls.

### Checklist: Security Controls (Expanded)

| Security Control                    | Status             | Notes                          |
|-------------------------------------|--------------------|--------------------------------|
| Authentication (e.g., MFA)          | Implemented        | OAuth2 with MFA for admins     |
| Authorization (e.g., RBAC)          | Partially Implemented | RBAC in place, some roles broad |
| Data Encryption (at rest/in transit)| Implemented        | AES-256 at rest, TLS in transit|
| Input Validation                    | Not Implemented    | No sanitization on forms       |
| Error Handling (no leaks)           | Partially Implemented | Some errors expose stack traces|
| Logging and Monitoring              | Implemented        | Basic logs to CloudWatch       |
| Secure API Management               | Partially Implemented | API keys, no rate limiting     |
| Session Management                  | Implemented        | Secure cookies, short timeouts |
| Patch Management                    | Partially Implemented | Monthly updates, manual process|
| Backup and Recovery                 | Implemented        | Daily DB backups, untested     |
| Cross-Site Scripting (XSS) Prevention | Not Implemented  | No output encoding             |
| SQL Injection Prevention            | Partially Implemented | Some parameterized queries     |
| Secure File Uploads                 | Not Implemented    | No file type validation        |
| Rate Limiting                       | Not Implemented    | No API throttling              |
| Dependency Management               | Partially Implemented | Outdated libraries in use      |
| Secure Headers (e.g., CSP)          | Not Implemented    | No Content Security Policy     |
| Token Validation                    | Implemented        | JWTs validated server-side     |
| Secure Secrets Storage              | Partially Implemented | Hardcoded keys in some code    |
| Runtime Application Self-Protection (RASP) | Not Implemented | No runtime monitoring          |
| Denial of Service (DoS) Protection  | Implemented        | WAF enabled, basic rules       |
| Secure Communication (e.g., HTTPS)  | Implemented        | HTTPS enforced                 |
| Audit Logging                       | Partially Implemented | Limited event coverage         |
| Secure Configuration Management     | Not Implemented    | No automated config checks     |
| Access Control Reviews              | Partially Implemented | Annual reviews, inconsistent   |
| Vulnerability Scanning              | Implemented        | Weekly scans with Snyk         |

**Tip**: Use tools like OWASP ZAP or Snyk to verify controls—e.g., test XSS prevention.

---

## Compliance Checks

Verify alignment with relevant standards. Below is an example with common requirements.

### Table: Compliance Status

| Standard (e.g., GDPR) | Requirement                  | Status (Compliant/Non-Compliant) | Notes                     |
|-----------------------|------------------------------|----------------------------------|---------------------------|
| GDPR                  | Data encryption              | Compliant                        | AES-256 used              |
| PCI DSS               | Secure payment processing    | Non-Compliant                    | No tokenization           |
| HIPAA                 | Audit logging for PHI access | Partially Compliant              | Limited log retention     |

**Resource**: Check [NIST SP 800-53](https://csrc.nist.gov/publications/detail/sp/800-53/rev-5/final) for compliance controls.

---

## Vulnerability Assessment

Identify weaknesses in your app. Below are examples, expanded with 20 additional vulnerabilities commonly found in cloud apps.

### Table: Identified Vulnerabilities (Expanded)

| Vulnerability Description         | Severity (High/Medium/Low) | Affected Component     | Remediation Steps               |
|-----------------------------------|----------------------------|------------------------|---------------------------------|
| SQL Injection                     | High                       | API Endpoint           | Parameterize queries            |
| XSS in User Input                 | High                       | Web Form               | Implement output encoding       |
| Unencrypted Data in Transit       | High                       | API Calls              | Enforce TLS                     |
| Hardcoded Credentials             | High                       | Source Code            | Use secrets management          |
| Missing Rate Limiting             | Medium                     | API Gateway            | Add throttling                  |
| Outdated Dependencies             | Medium                     | Backend Libraries      | Update to latest versions       |
| Insecure File Uploads             | High                       | File Upload Feature    | Validate file types             |
| Exposed Stack Traces              | Medium                     | Error Pages            | Hide error details              |
| Weak Session Tokens               | High                       | Login System           | Strengthen token generation     |
| No CSP Headers                    | Medium                     | Web Frontend           | Add Content Security Policy     |
| Broken Access Controls            | High                       | User Roles             | Restrict permissions            |
| Insecure Direct Object References | Medium                     | API                    | Use indirect references         |
| Unvalidated Redirects             | Medium                     | Login Redirect         | Validate redirect URLs          |
| Insufficient Logging              | Medium                     | Application Logs       | Log all security events         |
| CSRF Vulnerability                | High                       | Form Submissions       | Add CSRF tokens                 |
| Misconfigured CORS                | Medium                     | API                    | Restrict origins                |
| No Runtime Protection             | Medium                     | App Runtime            | Implement RASP                  |
| Weak Encryption Keys              | High                       | Data Storage           | Use stronger keys               |
| Lack of Input Sanitization        | High                       | User Inputs            | Sanitize all inputs             |
| Unpatched Known Vulnerabilities   | High                       | Web Framework          | Apply latest patches            |

**Tip**: Use [OWASP Top 10](https://owasp.org/www-project-top-ten/) to prioritize vulnerabilities like XSS and SQL Injection.

---

## Recommendations and Action Plan

Prioritize and assign fixes. Below are examples, expanded with 20 additional action items.

### Table: Action Plan (Expanded)

| Vulnerability/Gap                | Priority (1-3) | Remediation Action             | Target Date | Owner          |
|----------------------------------|----------------|--------------------------------|-------------|----------------|
| SQL Injection                    | 1              | Parameterize all queries       | [MM/DD/YYYY]| Dev Team       |
| XSS in User Input                | 1              | Add output encoding            | [MM/DD/YYYY]| Frontend Team  |
| Hardcoded Credentials            | 1              | Move to vault (e.g., AWS SSM)  | [MM/DD/YYYY]| DevOps         |
| Missing Rate Limiting            | 2              | Configure API throttling       | [MM/DD/YYYY]| API Team       |
| Outdated Dependencies            | 2              | Update libraries               | [MM/DD/YYYY]| Dev Team       |
| Insecure File Uploads            | 1              | Validate file types/sizes      | [MM/DD/YYYY]| Backend Team   |
| Exposed Stack Traces             | 2              | Mask error details             | [MM/DD/YYYY]| Dev Team       |
| Weak Session Tokens              | 1              | Use secure token generation    | [MM/DD/YYYY]| Security Team  |
| No CSP Headers                   | 2              | Implement CSP                  | [MM/DD/YYYY]| Frontend Team  |
| Broken Access Controls           | 1              | Restrict role permissions      | [MM/DD/YYYY]| Dev Team       |
| Insecure Direct Object References| 2              | Use indirect references        | [MM/DD/YYYY]| API Team       |
| Unvalidated Redirects            | 2              | Validate redirect URLs         | [MM/DD/YYYY]| Dev Team       |
| Insufficient Logging             | 2              | Log all security events        | [MM/DD/YYYY]| DevOps         |
| CSRF Vulnerability               | 1              | Add CSRF tokens                | [MM/DD/YYYY]| Frontend Team  |
| Misconfigured CORS               | 2              | Restrict allowed origins       | [MM/DD/YYYY]| API Team       |
| No Runtime Protection            | 2              | Deploy RASP solution           | [MM/DD/YYYY]| Security Team  |
| Weak Encryption Keys             | 1              | Generate stronger keys         | [MM/DD/YYYY]| DevOps         |
| Lack of Input Sanitization       | 1              | Sanitize all inputs            | [MM/DD/YYYY]| Dev Team       |
| Unpatched Vulnerabilities        | 1              | Apply latest patches           | [MM/DD/YYYY]| Dev Team       |
| No Secure Config Management      | 2              | Automate config checks         | [MM/DD/YYYY]| DevOps         |

**Tip**: Priority 1 = urgent (e.g., high-severity vulnerabilities); Priority 2 = important but less critical.

---

## Additional Guidance for Maximizing This Worksheet

- **Collaborate Across Teams**: Engage developers, security, and DevOps to ensure all controls and vulnerabilities are covered comprehensively.  
- **Automate Testing**: Use tools like OWASP ZAP, Snyk, or cloud-native scanners (e.g., AWS Inspector) to identify vulnerabilities efficiently.  
- **Prioritize High Risks**: Focus on High-severity issues (e.g., SQL Injection) first, especially those impacting sensitive data or compliance.  
- **Leverage Standards**: Align controls with [OWASP Top 10](https://owasp.org/www-project-top-ten/) or [NIST SP 800-53](https://csrc.nist.gov/publications/detail/sp/800-53/rev-5/final) for a robust baseline.  
- **Test Regularly**: Conduct assessments after major updates or deployments—don’t treat this as a one-time task.  
- **Document Findings**: Keep detailed notes in the tables for audits, compliance reports, or team handoffs.  
- **Customize for Your App**: Add controls specific to your app type—e.g., serverless runtime monitoring or API-specific rate limiting.  
- **Track Progress**: Update the Action Plan with completion dates and status to monitor remediation efforts effectively.  

**Next Steps**:  
Share this worksheet on GitHub and encourage your team or community to fork it. Customize it for your app’s architecture or vulnerabilities—e.g., add serverless-specific controls or new compliance standards. Contributions are encouraged to keep this resource evolving!

---
