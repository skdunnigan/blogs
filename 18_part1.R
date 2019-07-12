# --------------------------------------------
# Set working directory. This is where your files will be saved.
# Be sure to change this if you have moved the file locations.
# --------------------------------------------
setwd("C:/Users/skd09/Desktop/SWMPrats")

# --------------------------------------------
## Read in data file
# --------------------------------------------
library(readxl)
dat <- read_excel("C:/Users/skd09/Desktop/SWMPrats/2016.17-gtmpcnut1.1samples.xlsx")

# change the timestamp to POSIXct format (this works better with ggplot)
dat$TimeStamp <- as.POSIXct(dat$DateTimeStamp, format = "%m/%d/%Y %H:%M", tz = 'America/Regina')

# --------------------------------------------
# create plot for sucralose and acetaminophen
# --------------------------------------------
library(ggplot2)

# create axis title
plot1_y_title <- expression(paste(mu*"g/L"))

# create your plot
plot1 <-ggplot(data = dat, aes(x = TimeStamp))+
  geom_point(aes(y = SUCRA, colour='Sucralose'), size=3)+
  geom_line(aes(y = SUCRA, colour='Sucralose'), size=1)+
  geom_point(aes(y = ACETA, colour='Acetaminophen'), size=3)+
  geom_line(aes(y = ACETA, colour='Acetaminophen'), size=1)+
  geom_hline(aes(yintercept = 0.01), linetype='dashed', size=1)+
  geom_hline(aes(yintercept = 0.008), linetype='solid', size=1)+
  theme_bw()+
  theme(legend.title = element_blank(),
        legend.position = "bottom",
        legend.text = element_text(size=12),
        axis.title.x = element_blank(), 
        axis.title.y=element_text(size=13),
        axis.ticks = element_line(),
        plot.caption = element_text(size=6, face='italic'),
        axis.text.x = element_text(angle = 90, vjust=0.3, size=10),
        axis.text.y = element_text(size=10),
        axis.ticks.x=element_line(color='black'),
        panel.grid.minor = element_blank())+
  scale_y_continuous(expand = c(0,0)) + # this is to make the O of y-axis start ON the x-axis
  labs(x='', y=plot1_y_title,
       caption = 'Created by Shannon Dunnigan',
       title='Pellicer Creek',
       subtitle='GTM Research Reserve SWMP station')+
  scale_colour_manual(name='', values=c('Sucralose'='#47A49D', 'Acetaminophen'='#D9582E')) +
  scale_x_datetime(date_breaks = '1 month', date_minor_breaks = '2 weeks', date_labels='%y-%b')
ggsave("plot1.png", dpi = 300, width = 7, height = 6) # this is how the figure will be named

# --------------------------------------------
# create plot for fecal coliforms
# --------------------------------------------
# create axis title
plot2_y_title <- expression(paste("(CFU/100mL)"))

# create your plot
plot2<-ggplot(data = dat, aes(x = TimeStamp))+
  geom_point(aes(y = FECCOL, colour='Fecal coliforms'), size=3)+
  geom_line(aes(y = FECCOL, colour='Fecal coliforms'), size=1)+
  geom_point(aes(y = ECOLI, colour='Escherichia coli'), size=3)+
  geom_line(aes(y = ECOLI, colour='Escherichia coli'), size=1)+
  theme_bw()+
  theme(legend.title = element_blank(),
        legend.position = "bottom",
        legend.text = element_text(size=12),
        axis.title.x = element_blank(), 
        axis.title.y=element_text(size=13),
        axis.ticks = element_line(),
        plot.caption = element_text(size=6, face='italic'),
        axis.text.x = element_text(angle = 90, vjust=0.3, size=10),
        axis.text.y = element_text(size=10),
        axis.ticks.x=element_line(color='black'),
        panel.grid.minor = element_blank())+
  scale_y_continuous(expand = c(0,0)) + # this is to make the O of y-axis start ON the x-axis
  labs(x='', y=plot2_y_title,
       caption = 'Created by Shannon Dunnigan',
       title='Pellicer Creek',
       subtitle='GTM Research Reserve SWMP station')+
  scale_colour_manual(name='', values=c('Fecal coliforms'='#B0BC40', 'Escherichia coli'='#D9582E')) +
  scale_x_datetime(date_breaks = '1 month', date_minor_breaks = '2 weeks', date_labels='%y-%b')
ggsave("plot2.png", dpi = 300, width = 7, height = 6) # this is how the figure will be named



