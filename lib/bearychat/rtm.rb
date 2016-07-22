require 'bearychat/http_client'
require 'json'

module Bearychat
  class RTM
    MESSAGE_URL = "https://rtm.bearychat.com/message"

    attr_accessor :token, :http_client

    def initialize(token)
      self.http_client = HttpClient.new(MESSAGE_URL)
      self.token = token
    end

    def send(message)
      http_client.post_json({ token: token }.merge(message).to_json)
    end

  end
end
