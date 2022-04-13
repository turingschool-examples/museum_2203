class Museum

attr_reader :name, :exhibits, :patrons
    def initialize(name)
        @name = name
        @exhibits = []
        @patrons = []
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

    def admit(patron)
        @patrons << patron
    end

    def patrons_by_exhibit_interest
        exhibit_interests = {}
        # require 'pry'; binding.pry
        exhibits.map do |exhibit|
            exhibit_interests[exhibit] = patrons.find_all do |patron|
                patron.interests.include?(exhibit.name)
            end
        end
        exhibit_interests
    end
end