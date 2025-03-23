module "dev" {

source = "../Day-8_module_template_custom-nw"
ami_id =   var.ami
instance_type = var.instance_type
key_name = var.key_name
  
}
