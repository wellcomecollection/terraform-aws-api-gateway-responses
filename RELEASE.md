RELEASE_TYPE: minor

`MISSING_AUTHENTICATION_TOKEN` and `RESOURCE_NOT_FOUND` now return 404 "Page not found for URL $context.path", and `RESOURCE_NOT_FOUND` is included in the fingerprint so changes to it trigger a redeploy.
