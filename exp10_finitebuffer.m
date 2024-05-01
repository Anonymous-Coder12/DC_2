% M/M/1 Queue Simulation with Finite Buffer Space

% Parameters
lambda = 0.5; % Arrival rate
mu = 1; % Service rate
buffer_sizes = [5, 10, 15, 20, 25]; % Different buffer sizes
num_iterations = 1000; % Number of iterations

% Initialize variables
blocking_probabilities = zeros(1, length(buffer_sizes));

% Simulation
for b = 1:length(buffer_sizes)
    buffer_size = buffer_sizes(b);
    blocking_count = 0;
    
    for i = 1:num_iterations
        % Generate arrivals and departures
        arrivals = poissrnd(lambda);
        departures = poissrnd(mu);
        
        % Update buffer status
        buffer = 0;
        for j = 1:min(arrivals, buffer_size)
            if buffer < buffer_size
                buffer = buffer + 1;
            else
                blocking_count = blocking_count + 1;
            end
        end
        
        buffer = buffer - min(departures, buffer);
        
        % Account for blocking when buffer is full
        if arrivals > buffer_size
            blocking_count = blocking_count + (arrivals - buffer_size);
        end
    end
    
    % Calculate blocking probability
    blocking_probabilities(b) = blocking_count / (lambda * num_iterations);
end

% Plot
plot(buffer_sizes, blocking_probabilities, 'o-', 'LineWidth', 2);
xlabel('Buffer Size');
ylabel('Blocking Probability');
title('M/M/1 Queue with Finite Buffer Space');
grid on;