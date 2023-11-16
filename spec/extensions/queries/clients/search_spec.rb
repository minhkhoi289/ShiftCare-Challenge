require "rails_helper"

RSpec.describe Queries::Clients::Search do
  subject(:result) { described_class.perform(filter_params: filter_params) }

  let!(:client1) { create(:client, full_name: "Alice") }
  let!(:client2) { create(:client, full_name: "Bob") }
  let!(:client3) { create(:client, full_name: "Charlie") }

  describe ".perform" do
    let(:filter_params) { { search_by_name: "Bob" } }

    it "returns filtered clients by name" do
      expect(result).to contain_exactly(client2)
    end

    context "when filter params are blank" do
      let(:filter_params) { {} }

      it "returns all clients" do
        expect(result).to match_array([])
      end
    end

    context "when search include" do
      let(:filter_params) { { search_by_name: "e" } }

      it "returns all clients" do

        expect(result).to contain_exactly(client1, client3)
      end
    end

    context "when don't have a name in the database" do
      let(:filter_params) { { search_by_name: "Khoi" } }

      it "returns all clients" do
        expect(result).to match_array([])
      end
    end
  end
end
