require "rails_helper"

RSpec.describe Queries::Clients::FindDuplicates do
  describe ".perform" do
    let!(:client1) { create(:client, email: "test1@example.com") }
    let!(:client2) { create(:client, email: "test2@example.com") }
    let!(:client3) { create(:client, email: "test1@example.com") }

    it "return duplicate records" do
      duplicates = Queries::Clients::FindDuplicates.perform
      expect(duplicates).to contain_exactly(client1, client3)
    end

    context "not have duplicate record" do
      let!(:client3) { create(:client, email: "test3@example.com") }

      it "finds duplicate clients" do
        duplicates = Queries::Clients::FindDuplicates.perform
        expect(duplicates).to match_array([])
      end
    end
  end
end
