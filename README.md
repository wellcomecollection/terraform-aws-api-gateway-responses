# terraform-aws-api-gateway-responses

This module configures an API Gateway API to return errors that look like errors returned by our application.

If API Gateway fails to process a request, it returns an error response to the client.
By default, this response might look something like:

```
{"message": "Not Found"}
```

See [Gateway responses in API Gateway](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-gatewayResponse-definition.html) in the AWS documentation.

Our application code returns responses in our `Error` type, which look more like:

```
{
  "errorType": "http",
  "httpStatus": 404,
  "label": "Not Found",
  "description": "Work not found for identifier 1234",
  "type": "Error"
}
```

This module configures the gateway responses in API Gateway to look like the error responses from our application code.

