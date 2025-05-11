data "aws_caller_identity" "current" {}

resource "aws_kms_key" "this" {
  description             = var.description
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  policy                  = data.aws_iam_policy_document.kms_policy.json
  rotation_period_in_days = var.rotation_period_in_days
  tags                    = var.tags
}

resource "aws_kms_alias" "this" {
  name          = "alias/${var.alias_name}"
  target_key_id = aws_kms_key.this.key_id
}

data "aws_iam_policy_document" "kms_policy" {
  # Default policy allowing root account full access
  statement {
    sid       = "EnableRootPermissions"
    actions   = ["kms:*"]
    resources = ["*"]

    principals {
      type        = "AWS"
      identifiers = concat(["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"], var.additional_key_owners)
    }
  }

  # Key administration permissions
  statement {
    sid = "AllowKeyAdministration"
    actions = [
      "kms:Create*",
      "kms:Describe*",
      "kms:Enable*",
      "kms:List*",
      "kms:Put*",
      "kms:Update*",
      "kms:Revoke*",
      "kms:Disable*",
      "kms:Get*",
      "kms:Delete*",
      "kms:TagResource",
      "kms:UntagResource",
      "kms:ScheduleKeyDeletion",
      "kms:CancelKeyDeletion"
    ]
    resources = ["*"]

    principals {
      type        = "AWS"
      identifiers = var.additional_key_admins
    }
  }

  # Key usage permissions
  statement {
    sid = "AllowKeyUsage"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources = ["*"]

    principals {
      type        = "AWS"
      identifiers = var.key_users
    }
  }
}
