# Metarman API Ver. 0.1.0

## Introduction

This API is created for get airport information and weather of the airport.  
METAR will parsed to human readable style without option.

## Usage

```bash
bundle install --path=vendor/bundle
bundle exec ruby main.rb
# => Access localhost:4567
```

## Endpoint, Response

ToDo :: Create Swagger document.
```
# Get specific airport's information and current metar.
https://herokuapp.com/rjff

# Get specific airport's metar only. (METAR is not parsed)
https://herokuapp.com/metar/rjff

# Get list of airport in specific Country.
https://herokuapp.com/area/japan
```

## Contribute

Bug reports and pull requests are welcome on GitHub at  
https://github.com/moririn772/metarman-api.

This API uses 'metarman' for getting METAR etc.  
If you find any bugs which caused by metarman, please report the bug at  
https://github.com/moririn772/metarman.
