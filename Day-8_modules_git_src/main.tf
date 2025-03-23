module "ec2_instance" {
 source  = "github.com/debasish2110/AWS_Terraform/Day-8_module_template_custom-nw"
  ami_id = "ami-0f403e3180720dd7e"
  instance_type = "t2.micro"
  key_name = "test"  
}
# github.com/debasish2110/AWS_Terraform/Day-8_module_template_custom-nw