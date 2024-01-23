resource "aws_efs_file_system" "customefs" {
  creation_token = "storage"

  tags = {
    Name = "customefs"
  }
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["transfer.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "foo" {
  name               = "tf-test-transfer-user-iam-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "foo" {
  statement {
    sid       = "AllowFullAccesstoS3"
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "foo" {
  name   = "tf-test-transfer-user-iam-policy"
  role   = aws_iam_role.foo.id
  policy = data.aws_iam_role_policy.foo.json
}

resource "aws_transfer_user" "foo" {
  server_id = aws_transfer_server.foo.id
  user_name = "tftestuser"
  role      = aws_iam_role.foo.arn

  home_directory_type = "LOGICAL"
  home_directory_mappings {
    entry  = "/test.pdf"
    target = "/bucket3/test-path/tftestuser.pdf"
  }
}