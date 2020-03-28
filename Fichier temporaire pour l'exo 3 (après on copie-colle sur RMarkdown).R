# Initial position
x0 <- runif(20, min = -9, max = 9)

# Number of steps
B = 150

#Number of bacteria
N = 20

# Initialisation
Xt = matrix(NA, nrow = B+1, ncol = N)
Xt[1,] = x0

# Preliminary notation
St <- runif(1, min = 0, max = 2)
angle <- runif(1, min = 0, max = 2*pi)
angles_matrix = matrix(angle, B+1, N)

#Start for loop
for (j in 1:N){
  for (i in 1:B){
    Xt[(i+1),j] = Xt[i,j] + St*angles_matrix[i,j]
  }
  
}

# Plot 
plot(NA, xlim = c(-11, 11), ylim = range(Xt))
for (i in 1:N){
  lines(Xt[,i], col = i)
  Sys.sleep(1)
}

