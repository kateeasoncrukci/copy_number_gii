# Copy number practical for Genomics II

## Setup

To run this practical yourself, you can choose one of the below options.

### Running the practical in a Docker container - recommended

A Docker container has been set up for you to use for this practical. Using this container is highly recommended, because it contains all the software dependencies and data you need to do the practical.

To run this practical, first [install and open Docker](https://docs.docker.com/get-docker/). Then on Linux or Mac run:
```{bash unix-run, eval=FALSE, echo=TRUE, highlight=TRUE}
docker run -p 8787:8787 ghcr.io/kateeasoncrukci/copy_number_practical:amd2024
```

Or on Windows `cmd`:
```{bash cmd-run, eval=FALSE, echo=TRUE, highlight=TRUE}
docker run -p 8787:8787 ghcr.io/kateeasoncrukci/copy_number_practical:amd2024
```

or PowerShell:
```{bash powershell-run, eval=FALSE, echo=TRUE, highlight=TRUE}
docker run -p 8787:8787 ghcr.io/kateeasoncrukci/copy_number_practical:amd2024
```

A password should be printed (after `The password is set to: ...`), which you should copy.

In your browser, navigate to [localhost:8787](localhost:8787), and use the username `rstudio` and the password you just copied to log in.

### Running the practical by manually installing R packages

If you have problems installing or running Docker, you can manually install the required packages and download the practical's data.

In your RStudio session, download and install BioConductor if you don't already have it, then install ASCAT's dependencies, and finally ASCAT itself. You can also install `learnr` if you want to run the R markdown document as an interactive tutorial.
```{r dependencies, eval=FALSE, echo=TRUE, highlight=TRUE}
install.packages('BiocManager')
BiocManager::install()

BiocManager::install(c('IRanges', 'GenomicRanges'))
remotes::install_url('https://github.com/VanLoo-lab/ascat/releases/download/v3.0.0/ASCAT_3.0.0.tar.gz')

BiocManager::install('learnr')
```

Then, download and unzip the correction reference data from [here](https://www.dropbox.com/s/v0tgr1esyoh1krw/GC_G1000_hg19.zip) and [here](https://www.dropbox.com/s/50n7xb06x318tgl/RT_G1000_hg19.zip), and the input data from the practical's [GitHub repository](https://github.com/kateeasoncrukci/copy_number_practical/tree/main/input). Put the correction reference data in a folder called `data/reference_data` and the input data in a folder called `data/input`.

## Running the tutorial as an interactive document

Open the file `Copy-Number-Tutorial.Rmd` and hit `Run Document` at the top of RStudio to open this tutorial as an interactive notebook. Otherwise, you can copy and paste the R code into the R terminal.
