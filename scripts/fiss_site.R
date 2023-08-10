library(magrittr)
# grab the latest version of the fiss_site and transfer it to our mergin project along with the qml so it can be styled

# get the forms from where
mergin_project_from <- 'bcfishpass_skeena_20220823'

# list the tables in the mergin project
list.files(paste0(
  '../../gis/mergin/',
  mergin_project_from
),
pattern = glob2rx('form_*.gpkg'))

# read in the old form and burn to the new

mergin_name <- 'bcfishpass_elkr_20220904'

crs <- 26911

sf::st_read(paste0(
  '../../gis/mergin/',
  mergin_project_from,
  '/form_fiss_site_202209100809.gpkg'
)) %>%
  # convert crs
  sf::st_transform(crs = crs) %>%
  # burn to the new project
  sf::st_write(paste0(
    '../../gis/mergin/',
    mergin_name,
    '/form_fiss_site_',
    format(lubridate::now(), "%Y%m%d"),
    '.gpkg'
  ),
  delete_dsn = T)

# move the latest version of the qml for the form_fiss_site from dff-2022 where we now keep it.
qml <- 'form_fiss_site.qml'

file.copy(from = paste0('../dff-2022/data/', qml),
          to = paste0(
            '../../gis/mergin/',
            mergin_name,
            '/',
            qml),
          overwrite = T)

# also copy the form_fiss_site_values so that they can be pointed at by the form_fiss layer
file_to_move <- 'form_fiss_site_values.gpkg'

file.copy(from = paste0('../dff-2022/data/', file_to_move),
          to = paste0(
            '../../gis/mergin/',
            mergin_name,
            '/',
            file_to_move),
          overwrite = T)
