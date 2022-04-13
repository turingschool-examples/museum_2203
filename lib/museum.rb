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

    def ticket_lottery_contestants(exhibit)
        lottery_participants = []
         exhibits.each do |exhibit|
            patrons.each do |patron|
        # require 'pry'; binding.pry
                if patron.interests.include?(exhibit.name) && patron.spending_money < exhibit.cost
                    lottery_participants << patron
                end 
            end
        end
        lottery_participants
    end
    
    def draw_lottery_winner(exhibit)
        # require 'pry'; binding.pry
        winner = ticket_lottery_contestants(exhibit).map do |ticket_lottery_contestant|
            ticket_lottery_contestant.name
        end
        winner.sample
    end
end