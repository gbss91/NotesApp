# Use an official Ruby runtime as a parent image
FROM ruby:2.7.2-alpine

# Set the working directory
WORKDIR /NotesApp

# Install dependencies
RUN apk update && \
    apk add --no-cache build-base postgresql-dev tzdata

# Copy the Gemfile and Gemfile.lock into the image
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the Rails app into the image
COPY . .

# Expose port 3000
EXPOSE 3000

# Set the entrypoint
CMD ["rails", "server", "-b", "0.0.0.0"]