require "rails_helper"
require "rake"

RSpec.describe "clients:find_duplicates" do
  let(:task_name) { "clients:find_duplicates" }

  after do
    Rake::Task["clients:find_duplicates"].reenable
  end

  context "when duplicates exist" do
    let!(:client1) { create(:client, email: "test@example.com") }
    let!(:client2) { create(:client, email: "test@example.com") }

    it "prints duplicate client emails" do
      expect { Rake::Task[task_name].invoke }.to output(/Duplicate email test@example.com:/).to_stdout
    end
  end


  context "when no duplicates exist" do
    let!(:client1) { create(:client, email: "unique1@example.com") }
    let!(:client2) { create(:client, email: "unique2@example.com") }

    it "prints no duplicates message" do
      expect { Rake::Task[task_name].invoke }.to output("No duplicate emails were found.\n").to_stdout
    end
  end
end
