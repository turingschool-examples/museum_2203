require './lib/patron'

describe Patron do
  let(:patron){Patron.new("Bob", 20)}

  it "exists" do
    expect(patron).to be_a(Patron)
  end

  it "has readable attributes" do
    expect(patron.name).to eq("Bob")
    expect(patron.spending_money).to eq(20)
  end

  it "has interests" do
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    expect(patron.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end
end
