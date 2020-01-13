# Currency Converter

## Introduction

This App provides some basic services for converting currency and showing rates. Currency rates are fetched from currencylayer API (https://currencylayer.com).

---

# Install

## Dependencies
- Install [Ruby] >= 2.3.1
- Install [Rails] ~> 5.2.4
- Install [PostgreSQL]
- Install [Redis]

## Run

1. Clone repo:
    ```
    git clone https://github.com/ditjonberisha/currency_converter.git
    ```
2. Run bundle install inside the dir
    ```
    bundle install
    ```
3. Copy env_sample and change values
    ```
    cp .env_sample .env
    ```
4. Create the database and run migration
     ```
    rails db:setup
    rails db:migrate
    rails db:seed
    ```
5. Run the server:
    ```
    rails s
    ```
6. Run sidekiq (for background jobs):
    ```
    bundle exec sidekiq
    ```
7. For getting rates for the first time (inside the dir)
    ```
    rails c
    CurrencyRatesWorker.perform_async(DateTime.now)
    ```

## Rspec Test

Run rspec tests:
```
rspec
```
