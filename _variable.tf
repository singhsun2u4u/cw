variable "region" {
  type = string
}

variable "access-key" {
  type = string
}

variable "secret-key" {
  type = string
}

variable "alb-prod" {
  type = string
  default = "bbe-trade-prod"
}

variable "redis-cluster" {
  type = string
  default = "trading-be-prod"
}

variable "rds01-cluster" {
  type = string
  default = "cloud-migration"
}

variable "rds02-cluster" {
  type = string
  default = "khelo-nifty"
}

locals {
  cluster = {
    bbe-prod = ["bbe-trade-prod", "bbe-discovery-prod", "bbe-profile-prod"]
  }
}