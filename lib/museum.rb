class Museum

attr_reader :name, :exhibits
    def initialize(name)
        @name = name
        @exhibits = []
    end

    def add_exhibit(exhibit)
        @exhibits << exhibit
    end

    def recommend_exhibits(patron)
        # require 'pry'; binding.pry
        patron.interests.map do |interest|
            exhibits.find_all do |exhibit|
                exhibit.name == interest
            end
        end.flatten
    end
end