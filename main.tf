variable "rest_api_id" {
  type = string
}

module "response_default_5xx" {
  source = "./response_5xx"

  response_type = "DEFAULT_5XX"

  rest_api_id = rest_api_id
}

module "response_default_4xx" {
  source = "./response_4xx"

  response_type = "DEFAULT_4XX"
  label         = "Client Error"

  rest_api_id = rest_api_id
}

module "response_access_denied" {
  source = "./response_4xx"

  response_type = "ACCESS_DENIED"
  label         = "Access Denied"
  status_code   = 401

  rest_api_id = rest_api_id
}

module "response_bad_request_parameters" {
  source = "./response_4xx"

  response_type = "BAD_REQUEST_PARAMETERS"
  label         = "Bad Request Parameters"

  rest_api_id = rest_api_id
}

module "response_bad_request_body" {
  source = "./response_4xx"

  response_type = "BAD_REQUEST_BODY"
  label         = "Bad Request Body"
  status_code   = 401

  rest_api_id = rest_api_id
}

module "response_expired_token" {
  source = "./response_4xx"

  response_type = "EXPIRED_TOKEN"
  label         = "Expired Token"
  status_code   = 401

  rest_api_id = rest_api_id
}

module "response_invalid_api_key" {
  source = "./response_4xx"

  response_type = "INVALID_API_KEY"
  label         = "Invalid API key"
  status_code   = 403

  rest_api_id = rest_api_id
}

module "response_invalid_signature" {
  source = "./response_4xx"

  response_type = "INVALID_SIGNATURE"
  label         = "Invalid Signature"
  status_code   = 403

  rest_api_id = rest_api_id
}

module "response_missing_authentication_token" {
  source = "./response_4xx"

  response_type = "MISSING_AUTHENTICATION_TOKEN"
  label         = "Missing Authentication Token"
  status_code   = 403

  rest_api_id = rest_api_id
}

module "response_quota_exceeded" {
  source = "./response_4xx"

  response_type = "QUOTA_EXCEEDED"
  label         = "Quota Exceeded"
  status_code   = 429

  rest_api_id = rest_api_id
}

module "response_request_too_large" {
  source = "./response_4xx"

  response_type = "REQUEST_TOO_LARGE"
  label         = "Request Too Large"
  status_code   = 413

  rest_api_id = rest_api_id
}

module "response_not_found" {
  source = "./response_4xx"

  response_type = "RESOURCE_NOT_FOUND"
  label         = "Not Found"
  status_code   = 404

  rest_api_id = rest_api_id
}

module "response_throttled" {
  source = "./response_4xx"

  response_type = "THROTTLED"
  label         = "Throttled"
  status_code   = 429

  rest_api_id = rest_api_id
}

module "response_unauthorized" {
  source = "./response_4xx"

  response_type = "UNAUTHORIZED"
  label         = "Unauthorized"
  status_code   = 401

  rest_api_id = rest_api_id
}

module "response_unsupported_media_type" {
  source = "./response_4xx"

  response_type = "UNSUPPORTED_MEDIA_TYPE"
  label         = "Unsupported Media Type"
  status_code   = 415

  rest_api_id = rest_api_id
}

locals {
  gateway_responses_resource_fingerprint = sha1(jsonencode([
    module.response_default_5xx.api_deployment_component_fingerprint,
    module.response_default_4xx.api_deployment_component_fingerprint,
    module.response_access_denied.api_deployment_component_fingerprint,
    module.response_bad_request_parameters.api_deployment_component_fingerprint,
    module.response_bad_request_body.api_deployment_component_fingerprint,
    module.response_expired_token.api_deployment_component_fingerprint,
    module.response_invalid_api_key.api_deployment_component_fingerprint,
    module.response_invalid_signature.api_deployment_component_fingerprint,
    module.response_missing_authentication_token.api_deployment_component_fingerprint,
    module.response_quota_exceeded.api_deployment_component_fingerprint,
    module.response_request_too_large.api_deployment_component_fingerprint,
    module.response_unauthorized.api_deployment_component_fingerprint,
    module.response_unsupported_media_type.api_deployment_component_fingerprint,
  ]))
}

output "fingerprint" {
  value = local.gateway_responses_resource_fingerprint
}
