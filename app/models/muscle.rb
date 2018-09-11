class Muscle < ApplicationRecord
  has_many :exercise_muscles
  has_many :exercises, through: :exercise_muscles







  def self.populate_database
      uri = URI("http://wger.de/api/v2/muscle/")
      req = Net::HTTP::Get.new(uri)
      req['Token'] = "c0f9912bdcb90b81c198c2ed64cb0d782a52447d"
      res = Net::HTTP.start(uri.hostname, uri.port) {|http|http.request(req)}
      parsed_data = JSON.parse(res.body)

      parsed_data["results"].each do |part|

        byebug
      end

      # uri = URI('http://wger.de/api/v2/muscle/')
      # response = Net::HTTP.start(uri.host, uri.port) do |http|
      #   request = Net::HTTP::Get.new uri.request_uri
      #   http.request request # Net::HTTPResponse object
      # end
      # puts response.body


  end





end
