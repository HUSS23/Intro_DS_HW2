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

# Control seed
set.seed(23)

# Number of steps
steps <- 150

# Direction probability (i.e. all direction are equally likely)
probs <- c(0.25, 0.5, 0.75)

# Initial matrix
step_direction <- matrix(0, steps+1, 2)

# Start random walk
for (i in seq(2, steps+1)){
  # Draw a random number from U(0,1)
  rn = runif(1)
  
  # Go right if rn \in [0,prob[1])
  if (rn < probs[1]) {step_direction[i,1] = 1}
  
  # Go left if rn \in [probs[1], probs[2])
  if (rn >= probs[1] && rn < probs[2]) {step_direction[i,1] = -1}
  
  # Go forward if rn \in [probs[2], probs[3])
  if (rn >= probs[2] && rn < probs[3]) {step_direction[i,2] = 1}
  
  # Go backward if rn \in [probs[3],1]
  if (rn >= probs[3]) {step_direction[i,2] = -1}
}

# Cumulative steps
position = data.frame(x = cumsum(step_direction[, 1]), 
                      y = cumsum(step_direction[, 2]))

# Let's make a nice graph...
# Graph parameters
color = "blue"
xlab = "X-position"
ylab = "Y-position"
pt_pch = 16
pt.cex = 2
hues = seq(15, 375, length = 3)
pt_col = hcl(h = hues, l = 65, c = 100)[1:2]
par(mar = c(5.1, 5.1, 1, 2.1))

# Main plot
plot(NA,xlim =c(-10,10), 
     ylim =c(-10,10), 
     xlab ="X Position", 
     ylab ="Y Position", main = "Bacteria Motility")


# Add grid
grid(NULL, NULL, lty = 1, col = "grey95")

