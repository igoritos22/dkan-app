variable "az_group" {
    type =  string
    description = "Nome do grupo de Recursos da Azure"
}

variable "az_location" {
    type = string
    description = "Localização/região Azure"
}

variable "az_svcplan" {
    type = string
    description = "Nome Plano de Serviços da Azure"
}

variable "tier" {
    type = string
    description = "Familia do plano de Serviço"
}

variable "size" {
    type = string
    description = "Familia do plano de Serviço"
}

variable "docker_image" {
    type = string
    description = "nome da imagem docker"
}

variable "acr_user" {
    type = string
    description = "usuario do ACR"
}

variable "acr_pass" {
    type = string
    description = "password do ACR"
}

variable "acr_url" {
    type = string
    description = "URL do ACR"
}

variable "ftps_state" {
    type = string
    description = "Conifiguração do FTP no Webapp"
}

variable "webapp_name" {
    type = string
    description = "nome do webapp"
  
}
