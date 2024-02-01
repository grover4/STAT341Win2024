
#generate a single draw from Poisson(lambda = 3) repeatedly
#then make a histogram

sim_df_single <- data.frame( 
     x= rpois(n = 10000, lambda = 3)
)

sim_df_single %>% summarise( mean(x),
                             var(x))

ggplot(data = sim_df_single, 
       mapping = aes(x = x) ) +
  geom_histogram(binwidth = 1)


#generate a sample of 30 draws from Poisson(lambda = 3) 
#repeatedly, calculate their average and make a histogram

sim_df_avg <- tibble( 
     xbar = replicate(n = 1000, 
                      expr = mean(rpois(n = 30, lambda = 3) ) ) 
)


ggplot(data = sim_df_avg, 
       mapping = aes(x = xbar)) + 
  geom_histogram(binwidth  = 0.25 ) 


sim_df_avg %>% summarise( mean(xbar), var(xbar) ) 
