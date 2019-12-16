FROM centos:centos7

RUN yum --enablerepo=extras install -y epel-release
RUN yum update -y
RUN yum install -y lynx make gcc wget python-pip python-devel rpm-build
RUN pip install --upgrade pip
RUN pip install awscli ansible boto3 botocore beautifulsoup4 requests
RUN python --version