require "pry"
require "rspec"
require "./lib/exhibit"
require "./lib/patron"
require "./lib/museum"

RSpec.describe Museum do
  let(:dmns) { Museum.new("Denver Museum of Nature and Science") }

  it "exists" do
    expect(dmns).to be_a Museum
  end
end
