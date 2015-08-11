require "bearychat/version"
require "bearychat/incoming"


module Bearychat
  def self.incoming(hook)
    Incoming.new(hook)
  end
end
