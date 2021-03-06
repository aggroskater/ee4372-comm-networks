# pngcairo is pretty. Graph needs to be big, so 1600x800 will work.
set terminal pngcairo size 1600,800 font "ariel,10"

# we're gonna set the output file with the '>' operator on the command line.
# set output "cell.png"

# Data files are CSV. So comma-delimited
set datafile sep ','

# Put the key/legend below the graph, rather than inside the graph.
set key below

# gotta set the timfmt right. In our data, it's like this:
# 21 Mar 2014 14:29:00
set timefmt '%d %B %Y %H:%M:%S'

# Tell gnuplot that xdata is time
set xdata time

# Tell gnuplot to only use minutes and seconds for labels.
# We don't want the full timestamp polluting the axis.
set format x "%M:%S"

# Our data might have different ranges depending on what we plot. 
# We want all of our plots to line up though. So be sure to manually 
# specify the xrange. We would normally use multiplot for this purpose, 
# but there's just too much data and the resulting plot would be entirely
# too unwieldy. Well, more unwieldy that it already is.
set xrange [ "21 March 2014 14:28:00":"21 March 2014 14:44:00" ]

# set the plot title
#set title "RSSI of Cell Phone Network Over Time"
set title "Mobile Data Transfer Over Time"

# x-axis label
set xlabel "Time"

# y-axis label
#set ylabel "RSSI (dBm)"
set ylabel "Transfer in Bytes"

# turn on the grid so that it's easier to read the plot
set grid

# increase point size so it's easier to see which signal type is which.
set pointsize 2

# "pt 7" means Point Type 7, which is a filled circle.

# RSSI
#plot "umts-points.csv" using 5:4 with points pt 7 title "UMTS  Signal",\
#     "hspa-points.csv" using 5:4 with points pt 7 title "HSPA+ Signal",\
#     "export_datefix_140321144244.csv" using 5:4 with lines lw 3 title "Cell Strength"

# data rx/tx
plot "export_datefix_140321144244.csv" using 5:20 with linespoints title "Mobile Data Reception (bytes)",\
     "export_datefix_140321144244.csv" using 5:21 with linespoints title "Mobile Data Transmission (bytes)"
