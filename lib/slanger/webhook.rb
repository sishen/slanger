require 'fiber'
require 'em-http-request'

module Slanger
  module Webhook
    def post payload
      return unless Slanger::Config.webhook_url

      payload = {
        time_ms: Time.now.strftime('%s%L'), events: [payload]
      }.to_json

      digest   = OpenSSL::Digest::SHA256.new
      hmac     = OpenSSL::HMAC.hexdigest(digest, Slanger::Config.secret, payload)

      EM::HttpRequest.new(Slanger::Config.webhook_url).
        post(body: payload, head: { "X-Pusher-Key" => Slanger::Config.app_key, "X-Pusher-Signature" => hmac, "Content-Type" => "application/json" })
        # TODO: Exponentially backed off retries for errors
    end

    extend self
  end
end
