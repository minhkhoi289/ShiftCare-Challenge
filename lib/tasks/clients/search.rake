PERMIT_ATTRIBUTES = %w[NAME]

namespace :clients do
  task search: :environment do
    has_params = PERMIT_ATTRIBUTES.any? { |attr| ENV["#{attr}"].present? }

    if has_params
      filter_params = {
        search_by_name: ENV["NAME"]
      }

      result_clients = Queries::Clients::Search.perform(filter_params: filter_params)

      if result_clients.present?
        result_clients.each { |client| puts client.full_name }
      else
        puts "No clients were found."
      end
    else
      puts "Please check your command and then try again."
    end
  end
end
