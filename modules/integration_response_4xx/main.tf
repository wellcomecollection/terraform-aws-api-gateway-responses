variable "rest_api_id" {
  type = string
}

variable "resource_id" {
  type = string
}

variable "http_method" {
  type = string
}

variable "status_code" {
  default = 400
}

variable "label" {
}

locals {
  error_template = <<EOF
{
"errorType":"http",
"httpStatus":${var.status_code},
"label":"${var.label}",
"description":$context.error.messageString,
"type":"Error"
}
EOF
}

resource "aws_api_gateway_integration_response" "response" {
  rest_api_id = var.rest_api_id
  resource_id = var.resource_id
  http_method = var.http_method
  status_code = var.status_code

  response_templates = {
    "application/json" = replace(local.error_template, "\n", "")
  }
}

output "api_deployment_component_fingerprint" {
  description = "An opaque value which changes if the module's API Gateway resources change."
  value       = sha1(jsonencode(aws_api_gateway_integration_response.response))
}
