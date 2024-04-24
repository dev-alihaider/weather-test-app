# Weather forecast

## Description
The application is a weather forecast application that retrieves current temperature and extended forecast data for a given address. 

## Prerequisites
- Ruby 3.0.1
- Rails 6.1.7 or higher (currently '>= 6.1.7.6')

## Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/dev-alihaider/weather-test-app.git
    ```
2. Install dependencies:
    ```bash
    bundle install
    ```
3. Set up the database:
    ```bash
    rails db:create
    rails db:migrate
    ```

## Usage
- To start the Rails server:
    ```bash
    rails server
    ```
- Open a web browser and navigate to `http://localhost:3000` to view the application.

## Testing
To run tests, use the following command:
```bash
rspec
