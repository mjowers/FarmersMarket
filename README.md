A simple web app to find nearby farmers markets using the [USDA National Farmers Market Directory API](http://search.ams.usda.gov/farmersmarkets/v1/svcdesc.html).

### to run

Make sure you have [bundler](bundler.io) installed, and install dependencies with:

`bundle install`

You can then run the app using:

`ruby app.rb`

To see embedded Google maps, set up an API key using [this guide](https://developers.google.com/maps/documentation/embed/guide), then use that key as an environment variable called `GOOGLE_MAPS_API_KEY`:

`GOOGLE_MAPS_API_KEY=YOUR_API_KEY ruby app.rb`

### tests

Execute the tests using rspec:

`bundle exec rspec`
