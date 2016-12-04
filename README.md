# Playing Port Authority

A presentation about **T**est **D**riven **D**evelopment for containers using [ServerSpec](http://serverspec.org/).

The presentation is written in [RemarkJS](http://remarkjs.com), needs a webserver to run and includes all perks like presenter notes etc. e.g. press `p` to show my notes for each slide, clone the display with `c`. It's an amazing tool and I love using it for presentations.

## Prerequisites

### Building the presentation

The presentation is using [embedmd](https://github.com/campoy/embedmd) for making use of the existing code samples. You will need to install it first.
To "compile" the code samples and add them to the presentation run:

```sh
$ ./go build
```

### Running the code

- Docker >=1.12.x (all the tests are written for it)
- Ruby >=2.x (for ServerSpec)
- Bundler >=1.12.4 (to install the necessary Ruby packages)


## Run a local webserver

You can use the `go` convenience script:

```sh
$ ./go serve
```
It uses Python to spawn a small webserver. Any webserver serving `index.html` and the images will do though.

You can then use [http://localhost:8000/](http://localhost:8000/) to gain access.

## Run tests

The run the invididual tests simple use:

```
$ ./go test1 # Runs first test
$ ./go test2 # Runs second test
$ ./go test3 # Runs third test
```
