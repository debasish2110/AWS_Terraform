Terraform `locals` Block
-------------------------
The `locals` block in Terraform is used to define reusable expressions 
that can be referenced multiple times in a configuration. It helps 
avoid duplication, improve readability, and make complex expressions more manageable.

Syntax:
--------
locals {
  instance_type = "t2.micro"
  environment   = "dev"
  tags = {
    Name  = "MyInstance"
    Owner = "DevOps"
  }
}

Usage:
--------
Once defined, local variables can be used anywhere in the Terraform 
configuration by referencing `local.<name>`.

Example 1: Using `locals` in a Resource
----------------------------------------
resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = local.instance_type  # Using a local variable

  tags = local.tags  # Using a local map
}

Example 2: Using `locals` for Dynamic Values
--------------------------------------------
locals {
  envs = ["dev", "staging", "prod"]
}

output "first_env" {
  value = local.envs[0]  # Outputs "dev"
}

Example 3: Combining Multiple Locals
-------------------------------------
locals {
  environment = "staging"
  region      = "us-west-2"
  instance_name = "${local.environment}-server"
}

output "instance_name" {
  value = local.instance_name  # Outputs "staging-server"
}

Key Benefits of `locals`
-------------------------
- Reduces duplication – No need to repeat the same value everywhere.
- Improves readability – Easier to understand Terraform code.
- Simplifies maintenance – Change values in one place instead of multiple locations.


Difference Between `locals` and `variables`
-------------------------------------------
`locals` and `variables` serve different purposes in Terraform.

- `locals` are **fixed expressions** used for reusability within a module.
- `variables` allow **user-defined inputs** that can change dynamically.

Comparison:
------------
| Feature         | `locals` (local variables) | `variables` (input variables) |
|---------------|--------------------------|----------------------------|
| Scope        | Local to the module/file   | Passed between modules |
| Usage        | Constants, computed values, and transformations | User-defined inputs |
| Mutability   | Fixed after initialization | Can be overridden via CLI or `terraform.tfvars` |
| Best for     | Code simplification & reuse within a module | Dynamic configuration via user input |

***************************************************************************************************

Why Use `locals` Instead of Variables?
--------------------------------------
1️⃣ **For Readability & Reusability**
   - If the same value is used multiple times, define it once with `locals`.

   Example:
   locals {
     instance_type = "t2.micro"
   }

   resource "aws_instance" "example" {
     ami           = "ami-123456"
     instance_type = local.instance_type
   }

2️⃣ **For Computed Values**
   - `locals` allow dynamic expressions.

   Example:
   locals {
     environment = "dev"
     instance_name = "${local.environment}-server"
   }

   output "instance_name" {
     value = local.instance_name  # Outputs "dev-server"
   }

3️⃣ **For Transformation of Input Variables**
   - `locals` can modify input variables.

   Example:
   variable "region" {
     default = "us-east-1"
   }

   locals {
     formatted_region = upper(var.region)
   }

   output "formatted_region" {
     value = local.formatted_region  # Outputs "US-EAST-1"
   }

4️⃣ **For Static Configuration Values**
   - Use `locals` for values that do not change.

   Example:
   locals {
     project_name = "MyTerraformProject"
   }

When to Use `locals` vs `variables`?
------------------------------------
| Use Case                     | **Use `locals`?** | **Use `variables`?** |
|------------------------------|------------------|------------------|
| Avoid repetition             | ✅ Yes           | ❌ No            |
| Computation of values        | ✅ Yes           | ❌ No            |
| User-specified input         | ❌ No            | ✅ Yes           |
| Values that may change       | ❌ No            | ✅ Yes           |
| Static values/configs        | ✅ Yes           | ❌ No            |

Summary:
--------
- Use `locals` for **computed values, reusability, and simplifying code**.
- Use `variables` when **user input or external configuration is needed**.

