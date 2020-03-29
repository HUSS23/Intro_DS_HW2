# Number of steps
steps = 150

# Initial matrix, made of "zeros"
steps_steps <- matrix(NA, steps, 40)

# Setting position 1
steps_steps[1,] = runif(40, -9, 9)
St = c(0, runif(149, 0, 2))
St_matrix = matrix(St, steps, 2)
angle = runif(149, 0, 2*pi)
cos_and_sin = c(0, cos(angle), 0, sin(angle))
cos_sin = matrix(cos_and_sin, steps, 2, byrow=FALSE)
cos_sin_array = array(cos_sin, dim = c(steps, 2, 20))


# Plot
plot(bacteria, xlim = c(-30, 30), ylim = c(-30, 30))
for (i in 1:20){
    points(bacteria[,,j])
}

plot(steps_steps)



# Start for loop
for (j in 1:20){
    for (i in seq(1, steps-1)){
        bacteria[(i+1),1,j] = bacteria[i,1,j]+St_matrix[i+1,1]*cos_sin_array[i+1,1,j]
        bacteria[(i+1),2,j] = bacteria[i,2,j]+St_matrix[i+1,2]*cos_sin_array[i+1,2,j]
        points(bacteria)
    }
}



