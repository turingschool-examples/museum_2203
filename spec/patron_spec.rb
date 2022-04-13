require "pry"
require "rspec"
require "./lib/exhibit"
require "./lib/patron"
require "./lib/museum"

RSpec.describe Patron do
  let(:patron_1) { Patron.new("Bob", 20) }

  it "exists" do
    expect(patron_1).to be_a Patron
  end
end
