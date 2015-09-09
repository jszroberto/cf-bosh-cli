# cf-bosh-cli
A container to work with CF and Bosh CLIs. It is a already configured container with many packages, programs or tools used to work with CF and Bosh. This image is intended to be used by DevOps engineers to operate, debug and develop automatic solutions. 


## Instructions to run Bosh CLI image

## Instructions to run CF CLI Image 

## Instructions to run Diego CLI Image

## Instructions to run CATs

To run the tests againts a bosh lite installation with the default configuration: 

```
$ docker run -i -t diegoteam/cats 

```

To run the tests using a personalized configuration: 

```
$ docker run -i -t -v $(pwd):/workspace -e "CONFIG=/workspace/integration_config.yml" diegoteam/cats 

```

This will run the latest version of the tests against your environment. In case you want a specific versions of the tests, just set up the following environmental variable: 

```
-e "COMMIT=f98149cdsjfl9814198149"
```

Alternatively, you can have a file named "env.conf" in the mounted volume which would be loaded when the container is launched. 


## Instructions to run DATs 

To run the tests againts a bosh lite installation with the default configuration: 

```
$ docker run -i -t diegoteam/dats 

```

To run the tests using a personalized configuration or for other external environments: 

```
$ docker run -i -t -v $(pwd):/workspace -e "CONFIG=/workspace/integration_config.yml" diegoteam/dats 

``` 


This will run the latest version of the tests against your environment. In case you want a specific versions of the tests, just set up the following environmental variable: 

```
-e "COMMIT=f98149cdsjfl9814198149"

```

Alternatively, you can have a file named "env.conf" in the mounted volume which would be loaded when the container is launched. 

