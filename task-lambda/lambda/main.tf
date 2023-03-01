resource "aws_s3_bucket" "lambda_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_object" "lambda_zip" {
  bucket = aws_s3_bucket.lambda_bucket.bucket
  key    = var.lambda_zip_file
  source = file("${path.module}/.dist/${var.lambda_zip_file}")
}

resource "aws_lambda_function" "lambda_function" {
  function_name = var.lambda_function_name
  s3_bucket     = aws_s3_bucket.lambda_bucket.bucket
  s3_key        = aws_s3_object.lambda_zip.key
  role          = var.lambda_execution_role_name
  handler       = var.lambda_handler_file
  runtime       = var.python_runtime
}

resource "aws_apigatewayv2_api" "api_gateway" {
  name          = var.api_gateway_name
  protocol_type = var.api_gateway_protocol_type
}

resource "aws_apigatewayv2_integration" "api_gateway_integration" {
  api_id             = aws_apigatewayv2_api.api_gateway.id
  integration_uri    = aws_lambda_function.lambda_function.invoke_arn
  integration_type   = var.api_gateway_integration_type
  integration_method = var.api_gateway_integration_method
}

resource "aws_apigatewayv2_stage" "api_gateway_stage" {
  api_id = aws_apigatewayv2_api.api_gateway.id
  name        = var.api_gateway_stage_name
  auto_deploy = true
}

resource "aws_apigatewayv2_route" "api_gateway_route" {
  api_id = aws_apigatewayv2_api.api_gateway.id
  route_key = var.api_gateway_route_key
  target = "integrations/${aws_apigatewayv2_integration.api_gateway_integration.id}"
}

resource "aws_lambda_permission" "api_gateway_permissions" {
  statement_id  = var.api_gateway_permissions_statement_id
  action        = var.api_gateway_permissions_action
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = var.api_gateway_permissions_principal
  source_arn = "${aws_apigatewayv2_api.api_gateway.execution_arn}/*/*"
}
