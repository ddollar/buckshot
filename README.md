# Buckshot

Helps to switch between shotgun and thin appropriately. Can be used inside
your Procfile to allow you to use shotgun easily for development.

## Usage

    # Gemfile
    gem "buckshot"

    # Procfile
    web bundle exec buckshot

## Details

Will use the appropriate webserver for your environment.

    $ RACK_ENV=development PORT=4000 buckshot
    # shotgun -p 4000 -E development

    $ RACK_ENV=production PORT=4000 buckshot
    # thin start -p 4000 -e production
