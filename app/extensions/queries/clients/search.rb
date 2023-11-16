module Queries
  module Clients
    class Search
      include HasScope

      has_scope :search_by_name

      class << self
        def perform(filter_params:, clients: Client.all)
          new(filter_params: filter_params, clients: clients).query
        end
      end

      def initialize(filter_params:, clients:)
        @filter_params = filter_params
        @clients = clients
      end

      def query
        return [] if @filter_params.blank?
        apply_scopes(@clients, @filter_params)
      end
    end
  end
end
