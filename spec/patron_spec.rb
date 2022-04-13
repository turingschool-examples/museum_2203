describe Patron do
  it "exists" do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1).to be_a(Patron)

  end
end
