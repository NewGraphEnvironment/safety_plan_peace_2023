require(RCurl)
library(XML)
library(magrittr)

##we are going to do this a bit sloppy and set a working directory
# setwd("C:/Users/allan/OneDrive/New_Graph/Current/2019-023_Bulkley_fish_passage/field_maps/moe_2018")

##increase your timeout limit to allow download of bigger files
options(timeout=180)

copy_to_base <- 'C:/Users/al/Dropbox/current'
copy_to_file <- '2021-041-nupqu-elk-fish-passage'
copy_to_complete <- paste0(copy_to_base, '/', copy_to_file)


dir.create(copy_to_complete)

url = "https://www.hillcrestgeo.ca/outgoing/fishpassage/projects/elk/"

filenames <- getURL(url,verbose=TRUE,ftp.use.epsv=TRUE, dirlistonly = TRUE)
filenames <- getHTMLLinks(filenames, xpQuery = "//a/@href[contains(., '.pdf')]") #https://stackoverflow.com/questions/32213591/list-files-on-http-ftp-server-in-r

# ##or more precisely
# getHTMLLinks(
#   filenames,
#   xpQuery = "//a/@href['.pdf'=substring(., string-length(.) - 3)]"
# )

for (filename in filenames) {
  download.file(paste(url, filename, sep = ""), paste(copy_to_complete, "/", filename,
                                                      sep = ""), mode = "wb")
}## download the maps to the dropbox


# We've got ourselves a little glitch here so lets add the old maps to the dropbox renamed
url = "https://hillcrestgeo.ca/outgoing/fishpassage/projects/elk/archive/2020-09-09/"

copy_to_base <- 'C:/Users/al/Dropbox/current'
copy_to_file <- '2021-041-nupqu-elk-fish-passage/2020-09-09'
copy_to_complete <- paste0(copy_to_base, '/', copy_to_file)


dir.create(copy_to_complete)


filenames <- getURL(url,verbose=TRUE,ftp.use.epsv=TRUE, dirlistonly = TRUE)
filenames <- getHTMLLinks(filenames, xpQuery = "//a/@href[contains(., '.pdf')]") #https://stackoverflow.com/questions/32213591/list-files-on-http-ftp-server-in-r

# ##or more precisely
# getHTMLLinks(
#   filenames,
#   xpQuery = "//a/@href['.pdf'=substring(., string-length(.) - 3)]"
# )

for (filename in filenames) {
  download.file(paste(url, filename, sep = ""), paste(copy_to_complete, "/", filename,
                                                      sep = ""), mode = "wb")
}## download the maps to the dropbox
