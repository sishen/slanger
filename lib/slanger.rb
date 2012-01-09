require 'bundler/setup'

require 'eventmachine'
require 'em-hiredis'
require 'rack'
require 'active_support/core_ext/string'

module Slanger
  autoload :ApiServer, 'slanger/api_server'
  autoload :Channel, 'slanger/channel'
  autoload :Config, 'slanger/config'
  autoload :Connection, 'slanger/connection'
  autoload :Handler, 'slanger/handler'
  autoload :Logger, 'slanger/logger'
  autoload :PresenceChannel, 'slanger/presence_channel'
  autoload :PresenceSubscription, 'slanger/presence_subscription'
  autoload :PrivateSubscription, 'slanger/private_subscription'
  autoload :Redis, 'slanger/redis'
  autoload :Service, 'slanger/service'
  autoload :Subscription, 'slanger/subscription'
  autoload :WebSocketServer, 'slanger/web_socket_server'
  autoload :Webhook, 'slanger/webhook'
end
