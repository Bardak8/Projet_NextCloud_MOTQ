output "owncloud_ip" {
  description = "Adresse IP publique de l'instance OwnCloud"
  value       = aws_instance.owncloud.public_ip
}

output "onlyoffice_ip" {
  description = "Adresse IP publique de l'instance OnlyOffice"
  value       = aws_instance.onlyoffice.public_ip
}

