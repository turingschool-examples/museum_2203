require './lib/exhibit'
require './lib/patron'
require 'rspec'

describe Exhibit do
	describe "Iteration 2" do
		let(:exhibit) { Exhibit.new({name: "Gems and Minerals", cost: 0}) }

		it "exists" do
			expect(exhibit).to be_a Exhibit
		end

		it "has attributes" do
			expect(exhibit.name).to eq "Gems and Minerals"
			expect(exhibit.cost).to eq 0
		end
	end
end
