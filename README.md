# Buckshot

Helps to switch between shotgun and thin appropriately. Can be used inside
your Procfile to allow you to use shotgun easily for development.

    $ RAILS_ENV=development PORT=4000 buckshot
    # shotgun -p 4000 -E development

    $ RAILS_ENV=production PORT=4000 buckshot
    # thin start -p 4000 -e production
