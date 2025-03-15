# Cloud Architecture Design Review Checklist

## Introduction

This checklist guides you through reviewing and validating a cloud architecture design to ensure it meets best practices for security, scalability, performance, cost-effectiveness, and resilience. Use it to assess new designs before deployment or evaluate existing setups for optimization.

**Examples and Resources**:  
- Examples include *“Verify all S3 buckets require MFA delete”* or *“Ensure auto-scaling triggers at 70% CPU”*.  
- Leverage frameworks like [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/), [Azure Well-Architected Framework](https://docs.microsoft.com/en-us/azure/architecture/framework/), [GCP Architecture Framework](https://cloud.google.com/architecture/framework), [NIST SP 800-53](https://csrc.nist.gov/publications/detail/sp/800-53/rev-5/final), and [CSA Cloud Controls Matrix](https://cloudsecurityalliance.org/research/cloud-controls-matrix/).  

**Customization**:  
Fork this checklist on GitHub to tailor it to your cloud provider (e.g., AWS, Azure, GCP), workload type (e.g., web apps, big data), or organizational needs. Add checks for emerging tech like serverless or AI—contributions are encouraged!

---

## Design Review Categories and Checks

Evaluate your cloud architecture across key categories. Below are 25 critical checks, each with a specific focus to ensure a robust design. Status options: *Compliant*, *Partially Compliant*, *Non-Compliant*, *N/A*.

### Checklist: Architecture Design Review (Expanded)

| Design Category                | Specific Check                                      | Status             | Notes/Observations                     |
|--------------------------------|----------------------------------------------------|--------------------|----------------------------------------|
| IAM Security                   | All users have MFA enabled                         | Compliant          | Admin MFA enforced, user MFA pending   |
| Network Security               | Network segmentation with VPCs/Subnets             | Partially Compliant| Basic VPC, no micro-segmentation       |
| Data Encryption                | Encryption at rest and in transit for all data     | Compliant          | AES-256 at rest, TLS 1.2 in transit    |
| Access Control                 | Principle of least privilege applied               | Partially Compliant| Some roles overly permissive           |
| Logging and Monitoring         | Centralized logging with real-time alerts          | Non-Compliant      | Basic logs, no SIEM integration        |
| Scalability                    | Auto-scaling enabled for dynamic workloads         | Compliant          | Triggers at 70% CPU                    |
| Load Balancing                 | Load balancer deployed for high availability       | Compliant          | ALB in use, multi-AZ                   |
| Performance Optimization       | Caching implemented for frequent queries           | Partially Compliant| Redis for web, no DB caching           |
| Cost Efficiency                | Spot Instances used for non-critical workloads     | Non-Compliant      | All pay-as-you-go VMs                  |
| High Availability              | Multi-region or multi-AZ deployment                | Compliant          | Two AZs in primary region              |
| Disaster Recovery              | Automated backups with defined RTO/RPO             | Partially Compliant| Daily backups, no RTO/RPO defined      |
| Application Resilience         | Circuit breakers for service failures              | Non-Compliant      | No fault tolerance mechanisms          |
| Dependency Management          | Dependencies mapped and validated                  | Compliant          | All dependencies documented            |
| Secure Configuration           | Hardened configurations per CIS benchmarks         | Partially Compliant| Some VMs hardened, no drift detection  |
| API Security                   | APIs secured with OAuth2 and rate limiting         | Non-Compliant      | Basic auth, no throttling              |
| Serverless Security            | Least privilege roles for serverless functions     | Compliant          | Lambda roles restricted                |
| Container Security             | Runtime protection for containers                  | Non-Compliant      | Image scanning only, no runtime        |
| Network Performance            | Low-latency design with CDN or edge locations      | Partially Compliant| CDN for static content, no edge compute|
| Storage Optimization           | Tiered storage (e.g., Hot/Cool/Archive)            | Compliant          | Archive tier for old backups           |
| Compliance Alignment           | Design meets regulatory requirements (e.g., GDPR)  | Partially Compliant| Encryption compliant, logs inadequate  |
| Monitoring and Alerts          | Proactive alerts for performance thresholds        | Non-Compliant      | Basic monitoring, no custom alerts     |
| Cost Monitoring                | Cost allocation tags applied to all resources      | Partially Compliant| Tags on VMs, not storage               |
| Secure Ingress/Egress          | Traffic filtered by WAF and firewall rules         | Compliant          | WAF and NSGs in place                  |
| Infrastructure as Code (IaC)   | All resources deployed via IaC (e.g., Terraform)   | Compliant          | Terraform for all deployments          |
| Third-Party Integration        | Secure third-party connections (e.g., VPN, OAuth)  | Partially Compliant| VPN secure, no OAuth for APIs          |

**Tip**: Use tools like AWS Trusted Advisor, Azure Advisor, or GCP Recommendations to automate some checks—e.g., cost optimization suggestions.

---

## Compliance and Best Practice Alignment

Verify alignment with cloud provider frameworks and standards. Below is an example table.

### Table: Compliance and Best Practice Status

| Framework/Standard          | Requirement                        | Status (Compliant/Non-Compliant) | Notes                     |
|-----------------------------|------------------------------------|----------------------------------|---------------------------|
| AWS Well-Architected        | Multi-AZ deployment                | Compliant                        | Two AZs in use            |
| NIST SP 800-53              | Centralized logging                | Non-Compliant                    | No SIEM integration       |
| CSA CCM                     | Encryption of sensitive data       | Compliant                        | AES-256 enforced          |

**Resource**: Refer to [AWS Well-Architected](https://aws.amazon.com/architecture/well-architected/) or [Azure Well-Architected](https://docs.microsoft.com/en-us/azure/architecture/framework/) for provider-specific guidance.

---

## Identified Issues and Gaps

List design weaknesses or gaps based on the checklist. Below are examples, expanded with 25 common issues in cloud architectures.

### Table: Identified Issues/Gaps (Expanded)

| Issue/Gap Description               | Category                  | Severity (High/Medium/Low) | Impact                        |
|-------------------------------------|---------------------------|----------------------------|-------------------------------|
| No MFA for regular users            | IAM Security              | High                       | Unauthorized access risk      |
| Lack of micro-segmentation          | Network Security          | High                       | Lateral movement risk         |
| Unencrypted backups                 | Data Encryption           | High                       | Data exposure risk            |
| Overly permissive roles             | Access Control            | Medium                     | Privilege escalation risk     |
| No centralized logging              | Logging and Monitoring    | High                       | Delayed incident detection    |
| No auto-scaling for batch jobs      | Scalability               | Medium                     | Cost/performance inefficiency |
| Single AZ deployment                | High Availability         | High                       | Single point of failure       |
| No caching for DB queries           | Performance Optimization  | Medium                     | Slow query response           |
| No Spot Instances used              | Cost Efficiency           | Medium                     | Higher compute costs          |
| Undefined RTO/RPO                   | Disaster Recovery         | High                       | Recovery uncertainty          |
| No circuit breakers                 | Application Resilience    | Medium                     | Service failure cascade       |
| Missing API rate limiting           | API Security              | Medium                     | DoS vulnerability             |
| No runtime container protection     | Container Security        | High                       | Runtime exploit risk          |
| No CDN for dynamic content          | Network Performance       | Medium                     | Higher latency                |
| No tiered storage for logs          | Storage Optimization      | Medium                     | Increased storage costs       |
| Inadequate compliance logging       | Compliance Alignment      | High                       | Regulatory violation risk     |
| No custom performance alerts        | Monitoring and Alerts     | Medium                     | Missed performance issues     |
| Untagged resources                  | Cost Monitoring           | Medium                     | Cost allocation gaps          |
| No WAF for internal APIs            | Secure Ingress/Egress     | Medium                     | Injection risk                |
| Manual resource provisioning        | Infrastructure as Code    | High                       | Configuration inconsistency   |
| No OAuth for third-party APIs       | Third-Party Integration   | Medium                     | Weak authentication           |
| No dependency validation            | Dependency Management     | Medium                     | Migration failure risk        |
| Unhardened VM configurations        | Secure Configuration      | High                       | Exploit vulnerability         |
| No serverless runtime monitoring    | Serverless Security       | Medium                     | Runtime attack risk           |
| No proactive cost forecasting       | Cost Efficiency           | Medium                     | Budget overrun risk           |

**Tip**: Cross-reference with [OWASP Top 10](https://owasp.org/www-project-top-ten/) for app-specific gaps (e.g., injection risks in APIs).

---

## Recommendations and Action Plan

Prioritize and assign fixes for identified issues. Below are examples, expanded with 25 action items.

### Table: Action Plan (Expanded)

| Issue/Gap                        | Priority (1-3) | Remediation Action                  | Target Date | Owner          |
|----------------------------------|----------------|-------------------------------------|-------------|----------------|
| No MFA for regular users         | 1              | Enable MFA for all users            | [MM/DD/YYYY]| Security Team  |
| Lack of micro-segmentation       | 1              | Implement Zero Trust segmentation   | [MM/DD/YYYY]| Network Team   |
| Unencrypted backups              | 1              | Encrypt all backups                 | [MM/DD/YYYY]| DevOps         |
| Overly permissive roles          | 2              | Restrict IAM roles                  | [MM/DD/YYYY]| Security Team  |
| No centralized logging           | 1              | Deploy SIEM (e.g., Splunk)          | [MM/DD/YYYY]| DevOps         |
| No auto-scaling for batch jobs   | 2              | Configure auto-scaling              | [MM/DD/YYYY]| Dev Team       |
| Single AZ deployment             | 1              | Expand to multi-AZ                  | [MM/DD/YYYY]| Infra Team     |
| No caching for DB queries        | 2              | Add Redis for DB caching            | [MM/DD/YYYY]| DB Team        |
| No Spot Instances used           | 2              | Shift testing to Spot Instances     | [MM/DD/YYYY]| DevOps         |
| Undefined RTO/RPO                | 1              | Define RTO/RPO targets              | [MM/DD/YYYY]| DR Team        |
| No circuit breakers              | 2              | Implement circuit breakers          | [MM/DD/YYYY]| Dev Team       |
| Missing API rate limiting        | 2              | Add rate limiting to API Gateway    | [MM/DD/YYYY]| API Team       |
| No runtime container protection  | 1              | Deploy runtime security             | [MM/DD/YYYY]| Security Team  |
| No CDN for dynamic content       | 2              | Enable CDN for dynamic assets       | [MM/DD/YYYY]| Network Team   |
| No tiered storage for logs       | 2              | Move logs to Cool tier              | [MM/DD/YYYY]| DevOps         |
| Inadequate compliance logging    | 1              | Enhance logging for compliance      | [MM/DD/YYYY]| Compliance Team|
| No custom performance alerts     | 2              | Set performance threshold alerts    | [MM/DD/YYYY]| Monitoring Team|
| Untagged resources               | 2              | Apply cost allocation tags          | [MM/DD/YYYY]| DevOps         |
| No WAF for internal APIs         | 2              | Extend WAF to internal APIs         | [MM/DD/YYYY]| Security Team  |
| Manual resource provisioning     | 1              | Convert to IaC (e.g., Terraform)    | [MM/DD/YYYY]| Infra Team     |
| No OAuth for third-party APIs    | 2              | Implement OAuth2 authentication     | [MM/DD/YYYY]| API Team       |
| No dependency validation         | 2              | Validate all dependencies           | [MM/DD/YYYY]| Dev Team       |
| Unhardened VM configurations     | 1              | Apply CIS benchmarks                | [MM/DD/YYYY]| Security Team  |
| No serverless runtime monitoring | 2              | Add runtime monitoring              | [MM/DD/YYYY]| DevOps         |
| No proactive cost forecasting    | 2              | Set up cost forecasting             | [MM/DD/YYYY]| Finance Team   |

**Tip**: Priority 1 = urgent (e.g., security or availability risks); Priority 2 = important but less immediate.

---

## Additional Guidance for Maximizing This Checklist

- **Engage Stakeholders**: Involve architects, security, DevOps, and business teams to ensure all perspectives (e.g., cost vs. performance) are addressed.  
- **Automate Validation**: Use tools like AWS Trusted Advisor, Azure Advisor, or Terraform validators to streamline checks—e.g., flag untagged resources automatically.  
- **Prioritize Critical Gaps**: Focus on High-severity issues first (e.g., single AZ, unencrypted data) to mitigate risks to availability or security.  
- **Leverage Frameworks**: Align with provider-specific best practices (e.g., [Azure Well-Architected](https://docs.microsoft.com/en-us/azure/architecture/framework/)) for actionable insights.  
- **Iterate Regularly**: Review designs before deployment, post-migration, or after major changes—treat this as a living document.  
- **Document Thoroughly**: Record observations and decisions in the tables for audits, handoffs, or future optimizations.  
- **Customize for Context**: Add checks for your specific use case—e.g., serverless cost optimization or IoT security—based on your workload.  
- **Track Remediation**: Update the Action Plan with completion dates and status to monitor progress and demonstrate improvements.  

**Next Steps**:  
Share this checklist on GitHub and encourage your team or community to fork it. Customize it for your cloud provider, workload, or compliance needs—e.g., add Kubernetes-specific checks or GDPR requirements. Contributions are welcome to enhance this resource!

---
