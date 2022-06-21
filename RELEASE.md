RELEASE_TYPE: patch

This removes the deprecated `template` provider in favour of built-in functions.
It also returns the httpStatus in error responses as a number, not a string.