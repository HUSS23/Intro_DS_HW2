set.seed(1992)

# Initial position

initial_x = runif(20, -9, 9)
initial_y = runif(20, -9, 9)
plot(initial_x, initial_y)

# Number of steps

steps = 150

# Preliminaries

St = c(runif(20, 0, 2))
angle = c(runif(20, 0, 2*pi))
cos_x = cos(angle)
sin_y = sin(angle)

# Start
for (j in 1:150){
  for (i in 1:20){
    initial_x[i] = initial_x[i]+ St[i]*cos_x[i]
  }
  for (i in 1:20){
    initial_y[i] = initial_y[i]+ St[i]*sin_y[i]
    points(initial_x[i], initial_y[i])
  }
Sys.sleep(.7)
}

