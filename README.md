# hab-policy-example

This example show how to create Habitat Package with Chef Policyfile bundled.

## Building

1. `hab pkg build .`

## Verifying

1. `hab pkg export docker results/jsirex-*.hart`
1. `docker run --rm -i -t jsirex/hab-policy-example:latest`
