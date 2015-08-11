require 'httparty'
require 'ostruct'

module Bearychat
  class Incoming < OpenStruct
    include HTTParty

    DEFAULT_PARAMS = {
      text: "text, this field may accept markdown",
      markdown: false,
      channel: "",
      attachments: []
    }

    attr_reader :hook

    def initialize(hook, info={})
      @hook = hook
      super(DEFAULT_PARAMS.merge(info))
    end

    def reset(info)
      info.each { |key, value| self[key] = value }
      self
    end

    def send
      if block_given?
        yield self
        send()
      else
        self.class.post(hook, body: { payload: as_json })
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