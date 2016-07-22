require "bearychat/version"

module Bearychat
  def self.incoming(hook)
    require 'bearychat/incoming'
    Incoming.new(hook)
  end

  def self.rtm(token)
    require 'bearychat/rtm'
    RTM.new(token)
  end
end
