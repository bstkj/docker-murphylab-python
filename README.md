# docker-murphylab-python

[![Build Status](https://travis-ci.org/icaoberg/docker-murphylab-python.svg?branch=master)](https://travis-ci.org/icaoberg/docker-murphylab-python)
[![GitHub issues](https://img.shields.io/github/issues/icaoberg/docker-murphylab-python.svg)](https://github.com/icaoberg/docker-murphylab-python/issues)
[![GitHub forks](https://img.shields.io/github/forks/icaoberg/docker-murphylab-python.svg)](https://github.com/icaoberg/docker-murphylab-python/network)
[![GitHub stars](https://img.shields.io/github/stars/icaoberg/docker-murphylab-python.svg)](https://github.com/icaoberg/docker-murphylab-python/stargazers)
[![GitHub license](https://img.shields.io/badge/license-GPLv3-blue.svg)](https://www.gnu.org/licenses/quick-guide-gplv3.en.html)

![vim as IDE](./images/screenshot.png)

This Dockerfile is used to build a [Singularity](http://singularity.lbl.gov/) container for members of the [Murphy Lab](http://murphylab.web.cmu.edu/) at the [Computational Biology Department](http://www.cbd.cmu.edu) at [Carnegie Mellon University](http://www.cmu.edu) for use in the department's HPC.

To build an image using the `Dockerfile` in this repository, run the command

```
➜ docker build -t "murphylab/python27" .
```

To run a container using the image above

```
➜  docker run -i -t "murphylab/python27"
```
