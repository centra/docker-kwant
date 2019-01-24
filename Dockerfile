FROM continuumio/miniconda3:latest

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
        # all the hard non-Python dependencies with mumps support
        git make patch build-essential gfortran libopenblas-dev liblapack-dev libmumps-scotch-dev \
        # Additional tools for running CI
        file rsync openssh-client \
        # Documentation building
        inkscape zip \
        # Image viewing
        feh gnuplot \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY kwant-latest.yml kwant-stable.yml kwant-stable-no-extras.yml /

RUN conda env create -f kwant-latest.yml
