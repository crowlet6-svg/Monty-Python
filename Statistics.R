# Set your desired number of simulations here
N <- 100000
D <- 100

# Create vectors to store the results (TRUE for win, FALSE for lose)
stay_results <- logical(N)
switch_results <- logical(N)

for (i in 1:N) {
  # 1. Hide the car behind door 1, 2, or 3
  car_door <- sample(1:3, 1)
  
  # 2. Player picks a random door
  player_choice <- sample(1:3, 1)
  
  # 3. Strategy: Always Stay
  stay_results[i] <- (player_choice == car_door)
  
  # 4. Strategy: Always Switch
  # If you picked the car initially, switching guarantees a loss.
  # If you picked a goat initially, Monty reveals the other goat, forcing you to switch to the car!
  switch_results[i] <- (player_choice != car_door)
}

# Calculate the winning percentages
cat("Total Doors:", D, "\n")
cat("Stay Win Rate:   ", mean(stay_results))
cat("Switch Win Rate: ", mean(switch_results))

#--------------------------START BAR CHART-----------------------------------------

library(ggplot2)

# FIX: Wrapped variables in mean() to get the summarized percentages!
data <- data.frame(
  Strategy = c("Stay", "Switch"),
  Win_Rate = c(mean(stay_results), mean(switch_results)) 
)

# 2. Build the polished bar chart
ggplot(data, aes(x = Strategy, y = Win_Rate, fill = Strategy)) +
  # Draw the bars with a slightly adjusted width
  geom_bar(stat = "identity", width = 0.6, show.legend = FALSE) +
  # Add exact text labels on top of the bars formatted as percentages
  geom_text(aes(label = scales::label_percent(accuracy = 0.1)(Win_Rate)), 
            vjust = -0.5, fontface = "bold", size = 5) +
  # Format the Y-axis as percentages and give it a bit of head room for labels
  scale_y_continuous(labels = scales::percent, limits = c(0, 0.8)) +
  # Apply a modern, clean color palette (Soft Blue and Bright Teal)
  scale_fill_manual(values = c("Stay" = "#4A90E2", "Switch" = "#00B4D8")) +
  # Clean up the theme (removes ugly gray background)
  theme_minimal(base_size = 14) +
  # Add professional titles and clean up axis labels
  labs(
    title = "Monty Hall Problem: Win Strategy Comparison",
    subtitle = "Switching doors doubles your theoretical chances of winning",
    x = "Player Strategy",
    y = "Win Percentage"
  ) +
  # Polish axis text
  theme(
    plot.title = element_text(face = "bold", size = 16),
    panel.grid.major.x = element_blank() # Remove vertical grid lines
  )

