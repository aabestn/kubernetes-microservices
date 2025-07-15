output "cluster_endpoint" {
  description = "EKS control plane API endpoint"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_name" {
  description = "EKS Cluster Name"
  value       = aws_eks_cluster.main.name
}

output "cluster_security_group_id" {
  description = "Security group ID attached to control plane"
  value       = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}