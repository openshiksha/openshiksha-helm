This repository contains the helm chart definition for the openshiksha application

![](https://github.com/openshiksha/openshiksha/workflows/CI/CD%20Pipeline/badge.svg)

## Setup

To use any of the helm charts defined here, `cd` into the appropriate project directory, then run `helm dependency update` to fetch the dependency charts

## Testing

```
helm test <release-name>
```

## Updating Dependencies

```
cd <chart-name>
helm dependency update
```