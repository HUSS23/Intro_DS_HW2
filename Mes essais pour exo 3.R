# Initial position

initial_x = runif(20, -9, 9)
initial_y = runif(20, -9, 9)
plot(initial_x, initial_y)

# Number of steps

steps = 150

# Preliminaries

new_initial_x = rep(NA, 20)
new_initial_y = rep(NA, 20)

# Start
for (j in 1:150){
  for (i in 1:20){
    St = c(runif(1, 0, 2))
    angle = c(runif(1, 0, 2*pi))
    cos_x = cos(angle)
    new_initial_x[i] = initial_x[i]+ St*cos_x
    plot(initial_x, initial_y, type="n")
    points(new_initial_x, new_initial_y)
  }
  for (i in 1:20){
    St = c(runif(1, 0, 2))
    angle = c(runif(1, 0, 2*pi))
    sin_y = sin(angle)
    new_initial_y[i] = initial_y[i]+ St*sin_y
    plot(initial_x, initial_y, type="n")
    points(new_initial_x, new_initial_y)
  }
Sys.sleep(.7)
}

