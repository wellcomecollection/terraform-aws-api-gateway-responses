variable "rest_api_id" {
}

variable "response_type" {
}

variable "status_code" {
  default = 500
}

locals {
  error_template = <<EOF
{
"errorType":"http",
"httpStatus":${var.status_code},
"label":"${var.label}",
"type":"Error"
}
EOF
}

resource "aws_api_gateway_gateway_response" "response" {
  rest_api_id   = var.rest_api_id
  response_type = var.response_type
  status_code   = var.status_code

  response_templates = {
    "application/json" = replace(local.error_template, "\n", "")
  }
}

output "api_deployment_component_fingerprint" {
  description = "An opaque value which changes if the module's API Gateway resources change."
  value       = sha1(jsonencode(aws_api_gateway_gateway_response.response))
}
