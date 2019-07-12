library(ggplot2)
library(magick)
library(here) # For making the script run without a wd
library(magrittr) # For piping the logo

# ----------------------------------------------
# This script is to put Harry Potter onto sucralose plot
# ----------------------------------------------

logo_raw <- image_read(
  "https://az480170.vo.msecnd.net/debd7172-44dc-4681-b074-d940a93cc4e1/img/prd/88475466-2f12-477c-a660-3240c4f7e04e/l_harry56_caph_hpe4.png")

# ----------------------------------------------
# Next, run the script to make the plots  ------
# ----------------------------------------------
source('18_part1.R')

#Call back the first plot
plot1.1 <- image_read("plot1.png")


# Scale down the logo and give it a border and annotation
# This is the cool part because you can do a lot to the image/logo before adding it
logo <- logo_raw %>% 
  image_scale("400") 
# Combine
out <- image_composite(plot1.1, logo, offset = "+1080+820")
# And overwrite the plot without a logo
image_write(out, "plotHarryPotter.png")

# -----------------------------------------------
# we can also add a gif image
# -----------------------------------------------

logo_raw2 <- image_read(
  "https://7551bdfc54adf45425bb-e1819ba959867bdb3382b3652a5f5ff1.ssl.cf5.rackcdn.com/animations/923/1477087807-Young_animation_imagination102116_01.gif")

# Background image
background <- image_background(plot1.1, "white", flatten = TRUE)
# Combine and flatten frames
frames <- image_composite(background, logo_raw2, offset = "+1080+820")
# Turn frames into animation
animation <- image_animate(frames, fps = 5)
image_write(animation, "wand.gif")