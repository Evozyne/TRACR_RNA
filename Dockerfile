FROM ubuntu:18.04

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN apt-get install -y vim

ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh -O ~/miniconda.sh
RUN bash ~/miniconda.sh -b -u -p /opt/conda

ENV PATH=$CONDA_DIR/bin:$PATH

RUN conda create -n test python=3.6 
RUN conda init bash

RUN conda install biopython
RUN conda install matplotlib
RUN pip install viennarna
RUN pip install jupyter
RUN pip install pyexcel

CMD ["bash"]
