require "httparty"

class SportsClubApi
  include HTTParty
  base_uri "publicapi.lafitness.com"
  format :json
  headers "Authorization" => "Basic c2hhZGFiYWhtZWQ6Y3NjWnhkZnJ0MzAwNQ==",
          "Content-Type" => "application/json",
          "DeviceID" => "59def9dc1adbc5ea",
          'User-Agent' => "Dalvik/2.1.0 (Linux; U; Android 6.0.1; ONE E1003 Build/MMB29M)"

  VERSION = "4.6.0"

  class << self
    def get_slots()
      data = <<-JSON
      {"request":{"Client":{"BrandID":2,"DeviceID":"59def9dc1adbc5ea","Model":"ONE E1003","OSName":"Android","OSVersion":"23","Platform":"Android","TimezoneOffset":"-07:00","VariantId":217,"Version":"CSC_1.1.146"},"Value":{"BrandID":2,"DeviceID":"59def9dc1adbc5ea","Model":"ONE E1003","OSName":"Android","OSVersion":"23","Platform":"Android","TimezoneOffset":"-07:00","VariantId":217,"Version":"CSC_1.1.146"}}}
      JSON
      p JSON.parse data
      post("/LAF_#{VERSION}/Services/Private.svc/GetAmenityAppointmentsUpcoming", JSON.parse(data))
    end
  end
end

SportsClubApi.get_slots