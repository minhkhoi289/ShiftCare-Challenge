require "rails_helper"
require "rake"

RSpec.describe "clients:search" do
  let!(:task_name) { "clients:search" }
  let!(:client) { create(:client, full_name: "Bob") }

  after do
    Rake::Task["clients:search"].reenable
  end

  context "when search parameters are provided" do
    before do
      allow(ENV).to receive(:[]).with("NAME").and_return("Bob")
    end

    it "prints client names " do
      expect { Rake::Task[task_name].invoke }.to output("Bob\n").to_stdout
    end
  end

  context "when no matching clients are found" do
    before do
      allow(ENV).to receive(:[]).with("NAME").and_return("Charlie")
    end

    it "prints no clients found" do
      expect { Rake::Task[task_name].invoke }.to output("No clients were found.\n").to_stdout
    end
  end

  context "when no search parameters are provided" do
    before do
      allow(ENV).to receive(:[]).with("NAME").and_return(nil)
    end

    it "prints a message" do
      expect { Rake::Task[task_name].invoke }.to output("Please check your command and then try again.\n").to_stdout
    end
  end
end
