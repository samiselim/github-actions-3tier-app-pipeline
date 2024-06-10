resource "aws_iam_openid_connect_provider" "default" {
  url = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"] 
  thumbprint_list = ["959CB2B52B4AD201A593847ABCA32FF48F838C2E"]
  # this can be got using this command 
  # echo | openssl s_client -connect token.actions.githubusercontent.com:443 | openssl x509 -fingerprint -noout
  # after that remove all : from the output 
} 
resource "aws_iam_role" "github-actions-role" {
  name               = "github-actions-role"
  description        = "role for Github workflow to clean up "
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::${var.oidc_cfg["AccountNumber"][0]}:oidc-provider/token.actions.githubusercontent.com"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "token.actions.githubusercontent.com:sub": "repo:${var.oidc_cfg["RepoName"][0]}:ref:refs/heads/main"
                }
            }
        }
    ]
})
}

resource "aws_iam_role_policy_attachment" "policies_attachment" {
  count = var.oidc_cfg["attachment_count"][0]
  policy_arn = var.oidc_cfg["policies_arn"][count.index]
  role       = aws_iam_role.github-actions-role.name
}

output "github-actions-role-arn" {
  value = aws_iam_role.github-actions-role.arn
}