# 🌍 Terraform Associate Certification Guide

## 📌 1. Infrastructure as Code (IaC)
- 🤔 **What is Infrastructure as Code?**
- ✅ **Benefits of IaC over manual provisioning**
- 🔄 **Immutable vs. Mutable infrastructure**

## 🛠️ 2. Terraform Basics
- 🌱 **What is Terraform and why use it?**
- 🔄 **How Terraform works (execution flow)**
- ⚡ **Terraform Workflow:** `Write → Plan → Apply`
- 🔌 **Terraform Providers:** (AWS, Azure, GCP, Kubernetes, etc.)
- 🗂️ **Terraform State & Backend Storage**

## 🖥️ 3. Terraform CLI Commands
- 🏗️ `terraform init`
- 📋 `terraform plan`
- 🚀 `terraform apply`
- ❌ `terraform destroy`
- 🛠️ `terraform validate`
- 🎨 `terraform fmt`
- 🔎 `terraform output`
- 📂 `terraform state (move, rm, list, show)`
- 🚫 `terraform taint` (deprecating soon)
- 🔄 `terraform import`
- ♻️ `terraform refresh`
- 🌍 `terraform workspace` (for multi-environment setups)

## 📝 4. Terraform Configuration Language (HCL)
- ⚙️ **Resources and how to define them**
- 🔌 **Providers (declaring and using)**
- 🎛️ **Variables:** (`variable`, `default`, `type`, `description`, `sensitive`)
- 📌 **Output values (`output`)**
- 🔢 **Locals (`locals` block for computed values)**
- 🔍 **Data sources (`data`)**
- 📦 **Modules (creating and using)**
- 🔣 **Terraform expressions (`count`, `for_each`, conditional expressions, etc.)**

## 📂 5. Managing State
- 📌 **Purpose of Terraform state**
- ☁️ **Local state vs. Remote state (S3, Terraform Cloud, etc.)**
- 🔒 **State Locking and preventing conflicts**
- ⚙️ **Terraform State Commands**
- 🔄 **Handling drift in state**

## 🛠️ 6. Terraform Variables & Expressions
- 📥 **Input Variables (`variables.tf`)**
- 📤 **Output Variables (`output.tf`)**
- 🏗️ **Variable Types:** (`string`, `number`, `bool`, `list`, `map`, `object`)
- 🔐 **Sensitive Variables**
- 🔄 **Using Environment Variables for Terraform (`TF_VAR_name`)**
- ⚖️ **Variable Precedence:** (`terraform.tfvars`, CLI, environment variables)

## ⚙️ 7. Terraform Provisioners
- 🔍 **Purpose of provisioners**
- 🏗️ **Types: `local-exec` & `remote-exec`**
- 🚫 **When to use provisioners (and when to avoid them)**

## 📦 8. Terraform Modules
- 🤔 **What are Terraform Modules?**
- 🏗️ **Creating and using modules**
- 📌 **Module sources (local, Git, Terraform Registry, S3)**
- 🔗 **`module` block and module inputs/outputs**

## ☁️ 9. Terraform Backends
- 💻 **Local Backend (default)**
- 🌎 **Remote Backend (S3, Azure Blob, Google Cloud Storage, etc.)**
- 🚀 **Terraform Cloud & Enterprise Backends**

## 🌍 10. Terraform Workspaces
- 🏗️ **What are workspaces?**
- 📜 `terraform workspace list`
- 📌 `terraform workspace select`
- 🆕 `terraform workspace new`

## 🔄 11. Terraform Import
- 🤔 **What is Terraform Import?**
- ⚙️ **How to use `terraform import`**
- 🚫 **Limitations of `terraform import`**

## 🔍 12. Terraform Debugging & Troubleshooting
- 📝 **Terraform logs (`TF_LOG` environment variable)**
- 🔄 **Debugging `plan` and `apply` failures**
- ⚠️ **Common Terraform errors and resolutions**

## ☁️ 13. Terraform Cloud & Enterprise (Basic Concepts)
- 🌍 **What is Terraform Cloud?**
- 🚀 **Features:** Workspaces, Remote State, Cost Estimation
- 🔄 **Remote execution & collaboration**

## 🔒 14. Security Best Practices
- 🚫 **Avoid hardcoding credentials** (Use AWS IAM roles, Azure Managed Identities, etc.)
- 🔐 **State file security** (Encrypt remote state, use limited access)
- 🤫 **Restrict sensitive outputs (`sensitive = true`)**
- 👥 **Role-based Access Control (RBAC) in Terraform Cloud**

## 🔄 15. Understanding `count` vs `for_each`
- 🔢 **`count` (used for simple replication)**
- 📌 **`for_each` (used for maps and sets)**
- ⚠️ **How they impact Terraform state and resource lifecycle**

## 📦 16. Terraform Registry
- 🔍 **Using official and community modules**
- 📌 **Finding Providers & Modules on the registry**
- 📖 **Best practices for module reuse**

## 🔒 17. Terraform Policies with Sentinel (Basic Overview)
- 🤔 **What is Sentinel?**
- 📝 **Writing basic Sentinel policies**
- 🛡️ **Enforcing guardrails for Terraform Cloud/Enterprise**

## ✅ 18. Terraform Best Practices
- ☁️ **Use remote state for team collaboration**
- 📦 **Use modules for better organization**
- 🚫 **Avoid using `terraform apply` manually in production**
- ⚡ **Always run `terraform plan` before `apply`**
- 🔠 **Follow a naming convention**
- 📌 **Use version constraints (`>=`, `~>`, etc.) for providers and modules**

---

## 💡 Exam Tips
✅ **Focus on Terraform workflow, state management, modules, and workspaces**  
✅ **Practice with Terraform CLI commands**  
✅ **Understand the impact of `count` and `for_each` on Terraform state**  
✅ **Know how to debug common Terraform errors**  
✅ **Get hands-on experience by deploying Terraform resources on AWS, Azure, or GCP**  

---

## 🚀 Resources for Study
📚 **Terraform Documentation**  
🔗 [Terraform Docs](https://developer.hashicorp.com/terraform/docs)  

📚 **Terraform Associate Exam Guide**  
🔗 [Terraform Associate Certification Guide](https://developer.hashicorp.com/terraform/tutorials/certifications/associate)  

📚 **Terraform Registry**  
🔗 [Terraform Registry](https://registry.terraform.io/)  

📚 **Terraform Cloud**  
🔗 [Terraform Cloud](https://developer.hashicorp.com/terraform/cloud)  

--- 
