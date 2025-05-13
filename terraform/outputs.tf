output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "rds_endpoint" {
  value = aws_db_instance.wordpress.endpoint
}

output "redis_endpoint" {
  value = aws_elasticache_cluster.wordpress.cache_nodes[0].address
}

output "readonly_iam_user_access_key_id" {
  value = aws_iam_access_key.readonly_key.id
}

output "readonly_iam_user_secret_access_key" {
  value = aws_iam_access_key.readonly_key.secret
  sensitive = true
}
