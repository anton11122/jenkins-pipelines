output "api_gateway_url" {
  value = "${aws_apigatewayv2_stage.api_gateway_stage.invoke_url}/"
}
