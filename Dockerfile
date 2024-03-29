FROM rocker/r-ver:4.2.1

ENV S6_VERSION=v2.1.0.2
ENV RSTUDIO_VERSION=latest
ENV DEFAULT_USER=rstudio
ENV PANDOC_VERSION=default
ENV PATH=/usr/lib/rstudio-server/bin:$PATH

RUN /rocker_scripts/install_rstudio.sh
#RUN /rocker_scripts/install_pandoc.sh

# HTSLIB
RUN apt -y update && \
	apt -y upgrade && \
	apt -y install samtools curl libbz2-dev liblzma-dev zlib1g-dev libxtst6 libxt6 && \
	arch=$(uname -m) && \
	ln -s /usr/local/lib/R/lib/libR.so /lib/$arch-linux-gnu/libR.so

#AlleleCounter
RUN wget https://github.com/cancerit/alleleCount/archive/refs/tags/v4.2.1.tar.gz && \
	tar -xzf v4.2.1.tar.gz && \
	rm v4.2.1.tar.gz && \
	cd alleleCount-4.2.1 && \
	./setup.sh /usr/local && \
	cd / && \
	rm -rf alleleCount-4.2.1

RUN R -e "install.packages(c('BiocManager', 'remotes', 'base64enc', 'digest', 'evaluate', 'glue', 'highr', 'htmltools', 'jsonlite', 'knitr', 'magrittr', 'markdown', 'mime', 'rmarkdown', 'stringi', 'stringr', 'xfun', 'yaml')); BiocManager::install(c('IRanges', 'GenomicRanges'))"

RUN R -e "remotes::install_github('Crick-CancerGenomics/ascat/ASCAT@v3.0.0')"

RUN R -e "install.packages(c('learnr', 'shiny'))"

COPY data/input/*.txt /home/rstudio/practical/data/input/
COPY data/allele_counts /home/rstudio/practical/data/input/allele_counts/
COPY data/reference_data /home/rstudio/practical/data/reference_data/
COPY data/docs /home/rstudio/practical/data/docs/
COPY images /home/rstudio/practical/images
COPY Copy-Number-Tutorial.Rmd /home/rstudio/practical
COPY Copy-Number-Tutorial.html /home/rstudio/practical

RUN chown -R rstudio:rstudio /home/rstudio/

RUN echo "setwd('/home/rstudio/practical')" >> /usr/local/lib/R/etc/Rprofile.site

EXPOSE 8787

CMD ["/init"]

