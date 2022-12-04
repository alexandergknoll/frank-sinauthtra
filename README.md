# Frank Sinauthtra

## Description

This is a web application skeleton with a minimal user authentication scheme built on [Sinatra](https://sinatrarb.com/).  It uses the [bcrypt](https://github.com/bcrypt-ruby/bcrypt-ruby) password hashing algorithm to avoid storing passwords in plaintext and includes the ability for a user to register, log in, edit profile information, and log out.  No frontend styles are included to make it frontend framework agnostic.

### ⚠ WARNING ⚠ Do not use this in production!

This was built as a learning exercise to help understand the basics of user authentication and is **not intended to be used in production**.  For production-grade applications, please consider using one of the following popular Ruby solutions instead:

- [devise](https://github.com/heartcombo/devise)
- [omniauth](https://github.com/omniauth/omniauth)
- [doorkeeper](https://github.com/doorkeeper-gem/doorkeeper)

## Getting Started

1. Fetch gems using bundler: `bundle install`
2. Create database: `bundle exec rake db:create`
3. Run migrations: `bundle exec rake db:migrate`
4. Start Shotgun server: `bundle exec shotgun config.ru`

Using a web browser, navigate to [http://localhost:9393](http://localhost:9393)

## Contributing

1. Fork this repo
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a pull request
