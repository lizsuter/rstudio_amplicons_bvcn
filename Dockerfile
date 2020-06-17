FROM cyversevice/rstudio-verse:latest

LABEL project="dada2 + DECIPHER"


# Execute dependency installation script for build
COPY install.R /tmp/
RUN R -f /tmp/install.R
RUN R -e "packageVersion('dada2')"
RUN R -e "packageVersion('DECIPHER')"

CMD ["R"]
