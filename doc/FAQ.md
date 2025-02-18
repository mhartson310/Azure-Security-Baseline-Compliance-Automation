# FAQ: Azure Security Baseline & Compliance Automation

This FAQ covers common questions and best practices for establishing a robust security baseline and automating compliance in your Azure environment. These Q&A are designed to help you achieve and maintain a secure, Zero Trust posture.

**Q1: What is the purpose of establishing a security baseline in Azure?**  
**A:** A security baseline defines a set of fundamental controls and configurations that ensure your Azure environment is secure, compliant, and aligned with Zero Trust principles. It serves as a benchmark for ongoing security audits and improvements.

**Q2: How do I enforce encryption at rest and in transit in Azure?**  
**A:** For encryption at rest, enable Azure Storage encryption using managed or customer-managed keys. For encryption in transit, ensure that all communications use TLS/SSL protocols. Many Azure services have built-in support that can be configured via the portal or ARM templates.

**Q3: What are Azure Policy and Blueprints, and how do they aid compliance?**  
**A:** Azure Policy allows you to enforce specific rules and effects across your resources, ensuring consistent compliance. Azure Blueprints help you deploy a set of resources, including policies and role assignments, in a repeatable manner to achieve regulatory compliance.

**Q4: How can I automate remediation for non-compliant resources?**  
**A:** Automate remediation by combining Azure Policy with Logic Apps playbooks. When a resource is flagged as non-compliant, an automated workflow can trigger remediation scripts (e.g., enforcing encryption or adjusting access controls) to bring it back into compliance.

**Q5: What role do Log Analytics and Azure Sentinel play in maintaining compliance?**  
**A:** Log Analytics aggregates logs from various Azure services for monitoring and analysis, while Azure Sentinel provides advanced threat detection, security analytics, and automated incident response. They are key components for real-time compliance monitoring and threat mitigation.

**Q6: How can I secure my virtual networks within Azure?**  
**A:** Secure your VNets by using subnets, Network Security Groups (NSGs), and Azure Firewall. Configure NSGs to restrict inbound and outbound traffic based on the principle of least privilege, and use VNet peering with strict controls to minimize lateral movement.

**Q7: What are best practices for vulnerability management in Azure?**  
**A:** Regularly conduct vulnerability scans using tools like Azure Security Center, apply patches promptly via Azure Update Management, and perform periodic penetration testing to identify and remediate security weaknesses.

**Q8: How do I ensure effective backup and disaster recovery?**  
**A:** Implement Azure Backup to automate regular backups of critical data and use Recovery Services vaults to store backup data. Regularly test restore procedures to ensure that your disaster recovery plan is effective.

**Q9: How can I monitor and manage configuration changes in my Azure environment?**  
**A:** Use Azure Monitor in combination with Azure Policy to track configuration changes. Set up alerts for unauthorized changes and use change management processes to review and approve modifications.

**Q10: What steps should I take if a compliance issue is detected?**  
**A:** When a compliance issue is detected, trigger an automated remediation playbook, review the incident details in Azure Sentinel or Log Analytics, adjust the relevant policies, and perform a root cause analysis to prevent future occurrences.
