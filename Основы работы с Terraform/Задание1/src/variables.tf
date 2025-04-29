###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.11.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

#variable "vms_ssh_root_key" {
#  type        = string
#  default     ="UJUtxLKw0quq7L5rxW1hGIkvT6GOxG4GOsSgsjPxUxQ h4rd@redhat"
#  description = "ssh-keygen -t ed25519"
#}


variable "image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "https://cloud.yandex.ru/marketplace?categories=os"
}

variable "vm_env" {
  type    = list(string)
  default = ["web", "db"]
}

variable "vm_name" {
  type        = string
  default     = "netology-develop-platform"
  description = "name for your instance"
}

