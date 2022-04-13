require './lib/exhibit'
require './lib/patron'
require './lib/museum'
require 'rspec'

describe Museum do
	let(:dmns) { Museum.new("Denver Museum of Nature and Science") }
	let(:gems_and_minerals) { Exhibit.new({name: "Gems and Minerals", cost: 0}) }
	let(:dead_sea_scrolls) { Exhibit.new({name: "Dead Sea Scrolls", cost: 10}) }
	let(:imax) { Exhibit.new({name: "IMAX",cost: 15}) }

	describe "Object" do
		it "exists" do
			expect(dmns).to be_a Museum
		end

		it "has a name" do
			expect(dmns.name).to eq "Denver Museum of Nature and Science"
		end

		it "starts with no exhibits" do
			expect(dmns.exhibits).to eq []
		end
	end

	describe "Iteration 2" do
		before :each do
			dmns.add_exhibit(gems_and_minerals)
			dmns.add_exhibit(dead_sea_scrolls)
			dmns.add_exhibit(imax)
		end

		it "can add exhibits" do
			expect(dmns.exhibits).to eq [gems_and_minerals, dead_sea_scrolls, imax]
		end

		xit "can recommend exhibits" do
			patron_1 = Patron.new("Bob", 20)
			patron_2 = Patron.new("Sally", 20)
			expected_1 = ["Dead Sea Scrolls", "Gems and Minerals"]
			expected_2 = ["IMAX"]

			patron_1.add_interest("Dead Sea Scrolls")
			patron_1.add_interest("Gems and Minerals")
			patron_2.add_interest("IMAX")

			expect(dmns.recommend_exhibits(patron_1)).to eq expected_1
			expect(dmns.recommend_exhibits(patron_2)).to eq expected_2
		end
	end

	describe "Iteration 3" do
		before :each do
			dmns.add_exhibit(gems_and_minerals)
			dmns.add_exhibit(dead_sea_scrolls)
			dmns.add_exhibit(imax)

			patron_1 = Patron.new("Bob", 0)
			patron_1.add_interest("Dead Sea Scrolls")
			patron_1.add_interest("Gems and Minerals")

			patron_2 = Patron.new("Sally", 20)
			patron_2.add_interest("Dead Sea Scrolls")

			patron_3 = Patron.new("Johnny", 5)
			patron_3.add_interest("Dead Sea Scrolls")
		end

		it "starts wtih no patrons" do
			expect(dmns.patrons).to eq []
		end

		it "can admit patrons" do
			dmns.admit(patron_1)
			dmns.admit(patron_2)
			dmns.admit(patron_3)

			expect(dmns.patrons).to eq [patron_1, patron_2, patron_3]
		end

		it "can show patrons by exhibit interest" do
			dmns.admit(patron_1)
			dmns.admit(patron_2)
			dmns.admit(patron_3)

			expected = {
				dead_sea_scrolls => [patron_1, patron_2, patron_3]
				gems_and_minerals => [patron_1]
			}

			expect(dmns.patrons_by_exhibit_interest).to eq expected
		end
	end
end
