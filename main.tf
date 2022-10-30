data "aws_instance" "instance" {

  filter {
    name   = "tag:Name"
    values = ["RNE-UAT"]
  }
}
data "aws_alb" "alb_prod"{
    name = var.alb-prod
}

/* data "aws_elasticache_cluster" "redis_cluster" {
    cluster_id = "${var.redis-cluster}"
} */

data "aws_db_instance" "database" {

  db_instance_identifier = ["${var.rds01-cluster}","${var.rds02-cluster}" ]
  
}


module "prod-ms-ecs-cw-dashboard" {
  count          = length(local.cluster.bbe-prod)
  source         = "./cw-ecs-module"
  region         = var.region
  dashboard-name = "${local.cluster.bbe-prod[count.index]}-ms-cw-ecs-dashboard"
  ec2-id         = data.aws_instance.instance.id
  servicename    = local.cluster.bbe-prod[count.index]
  clustername    = "bbe-prod"
  alb-prod  = data.aws_alb.alb_prod.arn_suffix
 rds01-cluster = data.aws_db_instance.database.db_instance_identifier
}

