FROM ubuntu:18.04
SHELL ["/bin/bash","-c"]
RUN apt-get -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false -y update
#RUN apt-get -y update
RUN apt-get -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false -y upgrade
#RUN apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
        gcc \
        g++ \
        zlibc \
        zlib1g-dev \
        libssl-dev \
        libbz2-dev \
        libsqlite3-dev \
        libncurses5-dev \
        libgdbm-dev \
        libgdbm-compat-dev \
        liblzma-dev \
        libreadline-dev \
        libffi-dev \
        git \
	ansible \
        bash-completion \
        python3.6 \
	python3-pip \
        libmysqlclient-dev \
        python3.6-dev \
	libpq-dev \
	python-psycopg2
RUN cd /usr/local/bin && ln -s /usr/bin/python3 python 
RUN pip3 install --upgrade pip
RUN pip3 install pandas numpy sqlalchemy python-dotenv psycopg2 PyMySQL pyarrow google-cloud-storage --use-feature=2020-resolver
RUN apt-get -y autoclean && apt-get -y autoremove && rm -rf /var/lib/apt-get/lists/*
CMD [ "/bin/bash" ]
