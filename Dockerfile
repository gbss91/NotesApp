# Use an official Ruby runtime as a parent image
FROM ruby:2.7.2

# Set the working directory in the container to /app
WORKDIR /NotesApp

# Copy the Gemfile and Gemfile.lock from the host machine to the container
COPY Gemfile Gemfile.lock ./

# Install Ruby dependencies
RUN bundle install --binstubs

# Copy the rest of the application code to the container
COPY . .

# Set environment variables for the database connection
ENV DB_USERNAME=postgres
ENV DB_PASSWORD=postgres


# Start the Rails server
CMD ["bin/rails", "server", "-b", "0.0.0.0"]