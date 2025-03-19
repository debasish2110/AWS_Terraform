resource "aws_instance" "dev_import_instance" {
  ami = "ami-05c179eced2eb9b5b"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraform-EC2-imported"
  }
}

# commands to execute terraform import successfully
# 1. terraform init
# 2. terraform import aws_instance.dev_import_instance i-08fae3c3526b3b198
# 3. we will get the state file containing imported instance data
# 4. keep on execute terraform plan and map the parameters from state file untill u get no errors and "0 changes to apply"
#    like the below given output format
        # debas@LAPTOP-KPDI6U9M MINGW64 /d/Study/AWS_DEVOPS/terraform/Day-4_tf_imports (master)
        # $ terraform plan
        # aws_instance.dev_import_instance: Refreshing state... [id=i-08fae3c3526b3b198]

        # No changes. Your infrastructure matches the configuration.

        # Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.
# 5. once you get "0 changes" and no errors, we can run "terraform apply" and check the existing instance is refreshing, 
#    no new instance will be created, like the below mentioned output
        # $ terraform apply --auto-approve
        # aws_instance.dev_import_instance: Refreshing state... [id=i-08fae3c3526b3b198]

        # No changes. Your infrastructure matches the configuration.

        # Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.

        # Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
# 6. now if we want to update anything in the instance we can edit it and execute "terraform apply"
        # ex: make instance_type = "t2.micro" to instance_type = "t3.micro"
        # and run terrform apply
        # below output will be seen
        # ---------------------------------------------------------------------------------------
        # $ terraform apply --auto-approve
        # aws_instance.dev_import_instance: Refreshing state... [id=i-08fae3c3526b3b198]

        # Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
        # ~ update in-place

        # Terraform will perform the following actions:

        # # aws_instance.dev_import_instance will be updated in-place
        # ~ resource "aws_instance" "dev_import_instance" {
        #         id                                   = "i-08fae3c3526b3b198"
        #     ~ instance_type                        = "t2.micro" -> "t3.micro"
        #     ~ public_dns                           = "ec2-3-110-168-110.ap-south-1.compute.amazonaws.com" -> (known after apply)
        #     ~ public_ip                            = "3.110.168.110" -> (known after apply)
        #         tags                                 = {
        #             "Name" = "Terraform-EC2"
        #         }
        #     + user_data_replace_on_change          = false
        #         # (35 unchanged attributes hidden)

        #         # (8 unchanged blocks hidden)
        #     }

        # Plan: 0 to add, 1 to change, 0 to destroy.
        # aws_instance.dev_import_instance: Modifying... [id=i-08fae3c3526b3b198]
        # aws_instance.dev_import_instance: Still modifying... [id=i-08fae3c3526b3b198, 10s elapsed]
        # aws_instance.dev_import_instance: Still modifying... [id=i-08fae3c3526b3b198, 20s elapsed]
        # aws_instance.dev_import_instance: Still modifying... [id=i-08fae3c3526b3b198, 30s elapsed]
        # aws_instance.dev_import_instance: Still modifying... [id=i-08fae3c3526b3b198, 40s elapsed]
        # aws_instance.dev_import_instance: Still modifying... [id=i-08fae3c3526b3b198, 50s elapsed]
        # aws_instance.dev_import_instance: Still modifying... [id=i-08fae3c3526b3b198, 1m0s elapsed]
        # aws_instance.dev_import_instance: Still modifying... [id=i-08fae3c3526b3b198, 1m10s elapsed]
        # aws_instance.dev_import_instance: Modifications complete after 1m12s [id=i-08fae3c3526b3b198]

