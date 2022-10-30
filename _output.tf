output "prod-cw-dasboard-name" {
  value = module.prod-ms-ecs-cw-dashboard.*.name
}

/* output "redis-nodes"{
  value = data.aws_elasticache_cluster.redis_cluster.cache_nodes.0.id
} */

output "prod-db-name" {
  value = data.aws_db_instance.database.db_instance_identifier
}