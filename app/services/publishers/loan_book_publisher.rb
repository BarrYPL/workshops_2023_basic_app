module Publishers
    class LoanBookPublisher
        attr_accessor :message

        def initialize(message)
            @message = message
        end

        def publish
            ::Publishers::Application.new(
              routing_key: 'key_for_loaned_books',
              exchange_name: 'basic_app',
              message: @message
            ).perform
          end
    end
end