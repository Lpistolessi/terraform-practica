# main.tf
terraform {
  required_providers {
    random = { source = "hashicorp/random", version = "~> 3.6.0" }
    local  = { source = "hashicorp/local", version = "~> 2.5" }
  }
}

resource "random_pet" "name" {
  length = 8
}

resource "local_file" "saludo" {
  filename = "${path.module}/saludo-${random_pet.name.id}.txt"
  content  = "Hola desde Terraform, soy ${random_pet.name.id}"
}

output "archivo" {
  value = local_file.saludo.filename
}
