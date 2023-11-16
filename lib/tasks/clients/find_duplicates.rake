namespace :clients do
  task find_duplicates: :environment do
    result_clients = Queries::Clients::FindDuplicates.perform

    if result_clients.present?
      result_clients = result_clients.group_by(&:email)
      result_clients.each do |email, clients|
        puts "----Duplicate email #{email}:"
        clients.each { |client| puts_client(client) }
      end
    else
      puts "No duplicate emails were found."
    end
  end
end

def puts_client(client)
  puts "ID: #{client.id}"
  puts "Full Name: #{client.full_name}"
  puts "Email: #{client.email}"
  puts
end
