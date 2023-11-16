module Seeds
  class Clients
    JSON_FILE_NAME = "clients.json"

    class << self
      def create_list
        clients = JSON.load_file(File.expand_path(JSON_FILE_NAME, __dir__))
        return if clients.blank?

        clients.map do |client|
          Client.create(
            id: client.fetch("id"),
            full_name: client.fetch("full_name"),
            email: client.fetch("email"),
          )
        end
      end
    end
  end
end
