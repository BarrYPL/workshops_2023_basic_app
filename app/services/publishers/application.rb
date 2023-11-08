module Publishers
    class Application
        require 'bunny'

        attr_accessor :message
        attr_accessor :routing_key
        attr_accessor :exchange_name

        def initialize(routing_key:, exchange_name:, message:)
            @message = message
            @routing_key = routing_key
            @exchange_name = exchange_name
        end

        def connection_options
            return {
                host: "localhost",
                port: "5672",
                vhost: "/",
                username: "guest",
                password: "guest"
            }
        end

        def connection
            @connection ||= Bunny.new(connection_options)
        end

        def perform
            connection.start
            channel = connection.create_channel
            place_to_publish = channel.direct(@exchange_name)
            place_to_publish.publish(message.to_json, routing_key: routing_key)
            channel.close
        end
    end
end