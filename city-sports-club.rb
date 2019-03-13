require "httparty"

class CitySportsClubApi
  class Error < StandardError; end

  include HTTParty
  base_uri "https://publicapi.lafitness.com"
  format :json
  headers "Content-Type" => "application/json",
          "DeviceID" => "59def9dc1adbc5ea"
  BASE_PATH = "/LAF_4.6.0/Services/Private.svc"
  basic_auth "shadabahmed", "cscZxdfrt3005"
  CLIENT_PARAMS = {DeviceID: "59def9dc1adbc5ea", OSName: "Android", TimezoneOffset: "-07:00"}
  REQUEST = {request: {Client: CLIENT_PARAMS, Value: {}}}

  class << self
    def get_reservations()
      response = request(:post, "/GetAmenityAppointmentsUpcoming", params(CLIENT_PARAMS))
      JSON.parse(response.body)
    end

    def params(body = {})
      REQUEST.merge(Value: body)
    end

    def request(method, path, params = {})
      path = File.join(BASE_PATH, path)
      req = if method == :get
              send(method, path)
            else
              send(method, path, body: params.to_json)
            end
      raise Error, "API Error" unless req.response.code == "200"
      req.response
    end
  end
end

p CitySportsClubApi.get_reservations
