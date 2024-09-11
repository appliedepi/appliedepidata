# has each of the arguments from lookup_data
# no need for complex read as the path is just filename with .rda on the end 
# loops over each returned to make available and post-process as below
# post-read processing 
  # if list (using base::list2env) put back as multiple objs in env 
  # if shapefile need to run sf::st_as_sf otherwise errors 
  # ? look at various filetypes in the epirhandbook to see what extras would need
