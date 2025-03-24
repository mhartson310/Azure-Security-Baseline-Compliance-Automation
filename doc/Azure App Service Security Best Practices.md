# 🌟 Azure App Service Security Best Practices  
*Web Apps That Wow Securely*  

---  

## 🎯 **Objective**  
Secure web/mobile apps on Azure App Service while balancing usability and compliance. Designed for developers, architects, and security teams building customer-facing applications.  

---  

## 🔑 **Core Security Practices**  

### 🔒 **1. Authentication & Authorization**  
**Why It Matters**: 42% of breaches involve stolen credentials (Verizon 2023).  

**Key Actions**:  
- **Azure AD Integration**  
  - Enable OAuth 2.0 for user and service-to-service auth.  
  ```bash
  az webapp auth update --resource-group <RG> --name <app> --enabled true --action LoginWithAzureActiveDirectory
  ```  
- **Role-Based Access**  
  - Assign `Website Contributor` for deployment, `Reader` for monitoring.  

**Where to Start**:  
1. Disable anonymous access in Authentication settings.  
2. Audit MSI permissions with `az webapp identity show`.  

**Real-World Scenario**:  
*A SaaS startup reduced account takeovers by 90% after enforcing Azure AD Conditional Access with MFA.*  

---  

### 🌐 **2. Network Protection**  
**Why It Matters**: Public-facing apps are prime targets for DDoS and injection attacks.  

**Key Tools**:  
| Tool                | Use Case                          |  
|---------------------|-----------------------------------|  
| **App Service Environment (ASE)** | Isolate apps in a dedicated VNet  |  
| **Access Restrictions** | Whitelist IPs/countries          |  
| **Private Endpoints** | Connect to backend DBs privately |  

**Where to Start**:  
1. Block non-production regions via `az webapp config access-restriction add`.  
2. Deploy ASE v3 for compliance-bound apps (HIPAA, PCI DSS).  

**Real-World Scenario**:  
*An e-commerce platform mitigated credential stuffing by restricting admin portal access to office IPs.*  

---  

### 🛡️ **3. Web Application Firewall (WAF)**  
**Why It Matters**: Block OWASP Top 10 threats like SQLi and XSS.  

**Key Actions**:  
- **Azure Front Door WAF**  
  - Deploy with managed rule sets (e.g., Microsoft_DefaultRuleSet_2.1):  
  ```bash
  az network front-door waf-policy create --name "WAF-Policy" --resource-group <RG> --sku Premium_AzureFrontDoor
  ```  
- **Custom Rules**  
  - Rate-limit login endpoints to 100 requests/minute.  
- **Log Integration**  
  ```kusto
  // KQL query for blocked attacks
  AzureDiagnostics
  | where Category == "FrontDoorWebApplicationFirewallLog"
  | where action_s == "Block"
  ```  

**Where to Start**:  
1. Link App Service to Front Door with WAF in "Prevention" mode.  
2. Enable bot protection rules.  

**Real-World Scenario**:  
*A fintech app blocked 1,200+ SQLi attempts monthly using WAF + geo-filtering to block high-risk regions.*  

---  

### 🛠️ **4. Secrets Management**  
**Why It Matters**: Hardcoded API keys in app settings are low-hanging fruit.  

**Key Strategies**:  
- **Key Vault References**  
  Replace app settings with Key Vault-linked references:  
  ```bash
  az webapp config appsettings set --name <app> --resource-group <RG> --settings "DbConn=$(kvSecretUri)"
  ```  
- **Managed Identities**  
  - Grant Key Vault access via AAD identities, not shared keys.  

**Where to Start**:  
1. Use `az keyvault secret list` to find exposed secrets.  
2. Migrate 2-3 non-critical settings to Key Vault.  

**Real-World Scenario**:  
*A healthcare app achieved HIPAA compliance by storing PHI encryption keys in Key Vault.*  

---  

### 🚀 **5. SSL/TLS Management**  
**Why It Matters**: TLS 1.2+ prevents MITM attacks and boosts SEO rankings.  

**Key Actions**:  
- **HTTPS Enforcement**  
  - Redirect HTTP traffic and use HSTS headers.  
- **Auto-Renewal**  
  ```bash
  az webapp update --https-only true --name <app> --resource-group <RG>
  ```  

**Where to Start**:  
1. Audit TLS versions in "SSL Settings".  
2. Replace expired/invalid certificates.  

**Real-World Scenario**:  
*A news portal improved Google ranking by 15% after enabling HTTPS-only traffic.*  

---  

### 📊 **6. Monitoring & Incident Response**  
**Why It Matters**: Detect brute-force attacks or data leaks in real-time.  

**Key Tools**:  
- **Azure Monitor Alerts**  
  - Trigger alerts for 401/403 spikes or abnormal outbound traffic.  
- **Sentinel Playbooks**  
  - Auto-block IPs after 5 failed login attempts.  

**Where to Start**:  
1. Stream App Service logs to Log Analytics.  
2. Create a "Suspicious Login" workbook.  

**Real-World Scenario**:  
*A bank detected credential-stuffing bots via alerts on 500+ failed logins/hour.*  

---  

## 🚀 **Implementation Roadmap**  
1. **Week 1**: Enable AAD auth + HTTPS enforcement.  
2. **Week 2**: Deploy WAF with Front Door.  
3. **Week 3-4**: Migrate secrets to Key Vault + configure Sentinel.  

---  

<details>  
<summary>📥 **Resources**</summary>  

- [App Service Security Checklist](https://aka.ms/AppService-Security)  
- [WAF Tuning Guide](https://aka.ms/WAF-Tuning)  
</details>  

---  

