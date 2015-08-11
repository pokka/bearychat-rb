require 'test_helper'

class BearychatTest < Minitest::Test
  MOCK_HOOK_URI = 'https://hook.bearychat.com/mock/incoming/hook'

  def test_that_it_has_a_version_number
    refute_nil ::Bearychat::VERSION
  end

  def test_incoming_build_by_module
    assert_equal true, ::Bearychat.incoming(MOCK_HOOK_URI).is_a?(::Bearychat::Incoming)
  end

  def test_incoming_send
    incoming_stub = stub_request(:post, MOCK_HOOK_URI).with(body: hash_including(:payload))
    ::Bearychat.incoming(MOCK_HOOK_URI).send
    assert_requested(incoming_stub)
  end
end
