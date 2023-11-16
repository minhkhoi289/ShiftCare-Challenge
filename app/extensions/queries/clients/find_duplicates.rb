module Queries
  module Clients
    class FindDuplicates
      class << self
        def perform(clients: Client.all)
          new(clients: clients).query
        end
      end

      def initialize(clients)
        @clients = clients
      end

      def query
        emails = Client.group(:email).having("COUNT(*) > 1").select("email")
        clients.where(email: emails)
      end
    end
  end
end
