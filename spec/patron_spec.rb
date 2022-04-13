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
end
