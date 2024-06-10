resource "aws_ecr_repository" "fp_ECR" {
	  name = var.ECR_name
      image_tag_mutability = var.mutability
	  image_scanning_configuration {
	    scan_on_push = true
	  }
	  
}
