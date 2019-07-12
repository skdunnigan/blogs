library(ggplot2)
library(magick)
library(magrittr) # For piping the logo

# ----------------------------------------------
# This script is to add GTM logos into figures
# ----------------------------------------------
# first we need to load the image we want to use
# logo_raw <- image_read(
#   "Z:/GTM shared pictures/Logos/GTM Logo Dix.Hite All Files/PNG/GTM - General Google Logo.png")

logo_raw <- image_read(
  "Z:/GTM shared pictures/Logos/GTM Logo Dix.Hite All Files/PNG/GTM - General.png")

# ----------------------------------------------
# Next, run the script to make the plots  ------
# ----------------------------------------------
source('18_part1.R')

# ----------------------------------------------
# add images onto the first plot       ---------
# ----------------------------------------------

# Call back the first plot
plot1.1 <- image_read("plot1.png")


# Scale down the logo and give it a border and annotation
# This is the cool part because you can do a lot to the image/logo before adding it
logo <- logo_raw %>% 
  image_scale("100") 
# Combine
out <- image_composite(plot1.1, logo, offset = "+10+1680")
# And overwrite the plot without a logo
image_write(out, "plot1.1.png")

# ----------------------------------------------
# add images to the second plot        ---------
# ----------------------------------------------
# Call back the first plot
plot2.2 <- image_read("plot2.png")

# Scale down the logo and give it a border and annotation
logo <- logo_raw %>%
  image_scale("100")  
  # Combine
  out <- image_composite(plot2.2, logo, offset = "+10+1680")
# And overwrite the plot without a logo
image_write(out, "plot2.2.png")

