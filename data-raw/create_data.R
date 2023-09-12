library(tidyverse)
library(usethis)

expressionFiles <- list.files(path = "data-raw/analysis_ready_expression_data", full.names = FALSE)

print(expressionFiles)

for(i in 1:length(expressionFiles)) { # assign function within loop
  readFile <-  read_tsv(gzfile(paste0("data-raw/analysis_ready_expression_data/",expressionFiles[i])))
  df_name <-gsub(".tsv.gz","",expressionFiles[i])
  assign(df_name,readFile)
  do.call("use_data", list(as.name(df_name), overwrite = TRUE))

}


metaDataFiles <- list.files(path = "data-raw/analysis_ready_metadata", full.names = FALSE)

print(metaDataFiles)

for(i in 1:length(metaDataFiles)) { # assign function within loop
  readFile <-  read_tsv(gzfile(paste0("data-raw/analysis_ready_metadata/",metaDataFiles[i])))
  meta_data_name <-gsub(".tsv","_metadata",metaDataFiles[i])
  assign(meta_data_name,readFile)
  do.call("use_data", list(as.name(meta_data_name), overwrite = TRUE))
}
