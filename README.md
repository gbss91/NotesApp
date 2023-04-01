
<img src="app/assets/images/logo.png" alt="NotesApp Logo" style="margin: 0 auto; max-width: 300px">


NotesApp is a Ruby on Rails application that allows users to store notes. This application intends to show some of the OWASP Top 10 vulnerabilities and how to mitigate them. 

## Getting Started 

NotesApp is running on Ruby 3.1.2 and Rails 7.0.4.

1. Switch to insecure/secure branch as needed
2. To install all the dependencies run `bundle install`
3. The application uses a PostgreSQL database. Please follow instructions to install Postgres: https://www.postgresql.org/download/
4. Add database credentials:
  - **Insecure brach:** Add your Postgres server credentials to *database.yml*
  - **Secure brach:** Add the following enviroment variables with your server credentials: `DB_USERNAME & DB_PASSWORD`
5. To setup the database run `rails db:setup` 
6. Run the migrations with `rails db:migrate` 









