## Overview

`medusa_server` is a simple web server written in elixir that uses [medusa](https://github.com/IcaliaLabs/medusa) command line interface to stack multiple images from URL's.

## Table of contents

- [Prerquisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

medusa_server is distributed and run as a Docker image. You don't need to install elixir or anything else but [Docker](https://docker.io).

## Installation

```console
% docker pull icalialabs/medusa_server:latest
```

## Usage

Before using medusa_server make sure you have the images url's and make sure the port `2604` is not being used by other process.

1: Standard (Non-development)

```console
docker run --rm \
	icalialabs/medusa_server:latest
	
16:35:14.255 [info]  Started application
```
  
Then you can call the service like:

```
curl -X POST "http://localhost:2604/process" \
	-d "urls[]=https://s3.amazonaws.com/bucketname/bg.png" 
	-d "urls[]=https://s3.amazonaws.com/bucketname/area-int.png"
```

You should see a base64 string representing the stacked image.

## Contributing

Please submit all pull requests against a separate branch.

Thanks!

## License

See [LICENSE](LICENSE.txt)

