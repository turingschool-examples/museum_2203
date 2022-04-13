class Exhibit

attr_reader :name, :cost
    def initialize(exhibit_attributes)
        @name = exhibit_attributes[:name]
        @cost = exhibit_attributes[:cost]
    end
end