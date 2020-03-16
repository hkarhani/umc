FROM ubuntu:latest
MAINTAINER hkarhani@gmail.com

ADD install.sh /
RUN chmod u+x /install.sh
RUN /install.sh

# prepend the new path
ENV PATH /root/miniconda3/bin:$PATH
RUN mkdir -p /notebooks
WORKDIR /notebooks
ADD jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

EXPOSE 8888

CMD jupyter notebook --port=8888 --ip=0.0.0.0 --allow-root
