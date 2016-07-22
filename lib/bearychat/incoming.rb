require 'ostruct'
require 'bearychat/http_client'
require 'json'

module Bearychat
  class Incoming < OpenStruct

    DEFAULT_PARAMS = {
      text: "text, this field may accept markdown",
      markdown: true,
      channel: "",
      attachments: []
    }

    attr_reader :http_client

    def initialize(hook, info={})
      @http_client = HttpClient.new(hook)
      super(DEFAULT_PARAMS.merge(info))
    end

    def reset(info)
      info.each { |key, value| self[key] = value }
      self
    end

    def send(body = {})
      if block_given?
        yield self
        send()
      elsif !body.empty?
        http_client.post_json(body.to_json)
      else
        http_client.post_json(as_json)
      end
    end

    def switch(channel)
      self.channel = channel
      self
    end

    private
    def as_json
      to_h.to_json
    end

  end
end
