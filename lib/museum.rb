class Museum
	attr_reader :name,
							:exhibits,
							:patrons

	def initialize(name)
		@name = name
		@exhibits = []
		@patrons = []
	end

	def add_exhibit(exhibit)
		@exhibits << exhibit
	end

	def recommend_exhibits(patron)
		@exhibits.each do |patron|
			patron.intersts
		end
		return exhibits
	end

	def admit(patron)
		@patrons.each do |patron|
			@patrons << patron
		end
	return @patrons
	end

	def patrons_by_exhibit_interest

	end
end
