output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}


 output "eks_cluster_id" {
   value = module.eks.eks_cluster_id
 }


 output "aurora_cluster_endpoint" {
   value = module.rds.aurora_cluster_endpoint
 }

 output "cloudfront_url" {
   value = module.cloudfront.cloudfront_url
 }
