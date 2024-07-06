resource "aws_cloudwatch_event_rule" "source_change_event" {
  name        = "source-change-event"
  description = "Triggers the pipeline on source code changes"

  event_pattern = jsonencode({
    source      = ["aws.codecommit"],
    detail-type = ["CodeCommit Repository State Change"],
    detail = {
      event         = ["referenceCreated", "referenceUpdated", "referenceDeleted"],
      referenceType = ["branch"],
      referenceName = ["main"]
    }
  })
}


resource "aws_cloudwatch_event_target" "pipeline" {
  rule      = aws_cloudwatch_event_rule.source_change_event.name
  target_id = "CodePipeline"
  arn       = aws_codepipeline.my_pipeline.arn
  role_arn  = aws_iam_role.event_rule_role.arn
}
