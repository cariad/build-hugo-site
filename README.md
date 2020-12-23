# cariad/hugo-ci-action

A GitHub Action for building, validating and deploying Hugo sites.

`cariad/hugo-ci-action` wraps my [cariad/hugo-ci](https://github.com/cariad/hugo-ci) Docker image to:

1. **Build** your Hugo site from source.
1. **Validate** your site with [github.com/gjtorikian/html-proofer](https://github.com/gjtorikian/html-proofer).
1. (Optional) **Deploy** to your S3 bucket.
1. Fix your files’ **HTTP headers** with [github.com/cariad/s3headersetter](https://github.com/cariad/s3headersetter).

**Deploying static sites to Amazon Web Services? Check out my infrastructure: [sitestack.cloud](https://sitestack.cloud)**

## Usage

### Parameters

| Parameter   | Description            | Default value  |
|-------------|------------------------|----------------|
| `path`      | Path to site source    | _Project root_ |
| `s3-bucket` | S3 bucket to upload to | _No upload_    |
| `s3-prefix` | S3 prefix to upload to | _No prefix_    |
| `s3-region` | S3 region              | `us-east-1`    |

### Environment variables

`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` and (if required) `AWS_SESSION_TOKEN` environment variables must be set on the job to authenticate with AWS for the upload to S3.

## Examples

### Build and validate a Hugo site

To build your site into the `public` directory:

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: cariad/hugo-ci-action@v1
```

### Build and validate a Hugo site in a subdirectory

To build the `microsite` directory into `microsite/public`:

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: cariad/hugo-ci-action@v1
        with:
          path: microsite
```

### Build, validate and upload a Hugo site

To build the site and upload to `mybucket`:

```yaml
env:
  AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
  AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: cariad/hugo-ci-action@v1
        with:
          s3-bucket: mybucket
```

## Development notes

### Releasing

1. Pull changes into the `main` branch. This is the bleeding edge.
1. Tag the full semantic version in `main`. This is for tracking changes.
1. Pull changes into the `v1` branch. This is served to folks pulling the action.

## Acknowledgements

- ❤️ [github.com/gohugoio/hugo](https://github.com/gohugoio/hugo)
- ❤️ [github.com/gjtorikian/html-proofer)](https://github.com/gjtorikian/html-proofer)
- 👩🏼‍💻 [github.com/cariad/hugo-ci](https://github.com/cariad/hugo-ci)
- 👩🏼‍💻 [github.com/cariad/s3headersetter](https://github.com/cariad/s3headersetter)
