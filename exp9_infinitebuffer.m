%Infinet Buffer Space: % M/M/1 Queue Simulation

% Parameters
lambda = 0.5; % Arrival rate
mu = 1; % Service rate
num_iterations = 1000; % Number of iterations

% Initialize variables
delay = zeros(1, num_iterations);
rho_values = linspace(0.1, 0.9, num_iterations); % Different values of lambda/mu

% Simulation
for i = 1:num_iterations
    rho = lambda / (mu * rho_values(i));
    
    % Calculate average delay using Little's Law
    delay(i) = rho / (mu - lambda * rho);
end

% Plot
plot(rho_values, delay, 'LineWidth', 2);
xlabel('\lambda / \mu');
ylabel('Average Delay per Packet');
title('M/M/1 Queue with Infinite Buffer Space');
grid on;