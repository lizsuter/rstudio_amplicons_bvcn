FROM cyversevice/rstudio-verse:latest

LABEL project="dada2 + DECIPHER"

# Instal cutadapt using python- 
RUN apt-get -y update && apt-get -yy install python-pip && \
    pip install --upgrade cutadapt && \
    export PATH="$PATH:$HOME/.local/bin"

# Execute dependency installation script for build
COPY install.R /tmp/
RUN R -f /tmp/install.R
RUN R -e "packageVersion('dada2')"
RUN R -e "packageVersion('DECIPHER')"


CMD ["R"]
