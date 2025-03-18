output "public_ip_pub_ec2" {
  value = aws_instance.pub_ec2.public_ip
}
output "private_ip_pub_ec2" {
  value = aws_instance.pub_ec2.private_ip
}
output "private_ip_pvt_ec2" {
  value = aws_instance.pvt_ec2.private_ip
}