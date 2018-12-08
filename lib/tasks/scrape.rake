namespace :scrape do
  desc 'Scrape yelp'
  task yelp: :environment do
    api_auth_header = { 'Authorization' => 'Bearer ' + ENV.fetch('YELP_API_KEY') }
    base_url = 'https://api.yelp.com/v3/businesses/search'
    query_string = '?location=710 Quail Run Ct 30005'

    api_response = HTTParty.get(base_url + query_string, headers: api_auth_header)
    parsed_data = JSON.parse(api_response.body)
    @test = parsed_data.dig("businesses", 1, "alias")

    ap parsed_data
  end
end

# namespace :scrape do
#   desc 'Scrape yelp'
#   task yelp: :environment do
#     api_auth_header = { 'Authorization' => 'Bearer ' + ENV.fetch('YELP_API_KEY') }
#     base_url = 'https://api.yelp.com/v3/businesses/search'
#     query_string = '?location=5807 S Woodlawn Ave, 60637'

#     api_response = HTTParty.get(base_url + query_string, headers: api_auth_header)
#     parsed_data = JSON.parse(api_response.body)

#     ap parsed_data
#   end
# end
