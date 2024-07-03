# Postio API

## Overview

Postio API is a Ruby on Rails application designed to handle blog posting and comments. It serves as the backend for a blog application, providing a secure and efficient way to manage users posts and discussions.

## Features

- **User Authentication**: Secure user authentication using JWT (JSON Web Tokens).
- **Blog posting**: Create, read, update, and delete blog posts.
- **Users discussions**: Users can add comments to apost and comment other comments.
- **Email Notifications**: Sends emails for various events using Action Mailer. (TODO)
- **Testing**: Comprehensive testing setup with RSpec, FactoryBot, and Faker.
- **Documentation**: API documentation generated with Rswag.
- **Code Quality**: Ensures high code quality with RuboCop, Brakeman and RubyCritic.
- **CORS**: Handles Cross-Origin Resource Sharing with Rack CORS.

## Getting Started

### Prerequisites

Before you begin, make sure you have the following installed on your system:

- [PostgreSQL](https://www.postgresql.org/)
- [Rails 7.1.3.4](https://rubyonrails.org/)
- [Ruby 3.3.3](https://www.ruby-lang.org/)

### Installation

1. Clone the repository:

  ```bash
  git clone https://github.com/caroltorchia/postio-api.git
  ```

2. Navigate to the project directory:
```bash
cd postio-api
```

3. Install dependencies:

```bash
bundle install
```

4. Set up the database:
```bash
rails db:prepare
```
5. Config Environment Variables:
```bash
cp .env.example .env
```
6. Start the Rails server:
```bash
rails s
```

7. Testing/Swagger Docs

- To access Swagger Docs navigate to `http://localhost:3000/api/v1/docs`
- To run the spec tests run `rspec`

## Usage

Once the server is running, you can access the API endpoints at `http://localhost:3000/api/v1/`.

### Authentication

To authenticate, send a POST request to `/api/v1/auth/login` with the user's credentials. The response will include a JWT token.

### Post

To create a new post, send a POST request to `/api/v1/post` with the title and post text content.

## Contact

Elisson Guímel - elissong.silva2505@gmail.com
Ana Carolina - caroltorchia15@gmail.com


Project Link: [https://github.com/caroltorchia/postio-api](https://github.com/caroltorchia/postio-api)
