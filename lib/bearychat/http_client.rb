require 'faraday'

module Bearychat
  class HttpClient
    attr_accessor :conn, :url

    def initialize(url)
      self.conn = build_conn(url)
    end

    def post_json(body)
      conn.post do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = body
      end
    end

    private
    def build_conn(url)
      Faraday.new(url, ssl: {}) do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
    end

  end
end
