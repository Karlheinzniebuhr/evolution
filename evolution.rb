class Live
	@@number = 0
	@@alive = false
	def initialize(genes)
		@@number += 1
		@@genes = genes
		@@alive = true
	end
	def reproduce()
		Live.new(rand(self.genes - 1..10))
	end
	def die()
		@@number -= 1
		@@alive = false
	end
	def number_of_lives_alive()
		@@number
	end
	def genes()
		@@genes
	end
	def is_alive
		@@alive
	end
end

seed = Live.new(rand(0..10))
live = seed
puts live

for i in 2..100
	if live.genes > 5
		puts live.genes
		live = live.reproduce
	else
		live.die
	end
end
puts live.number_of_lives_alive
puts live.is_alive
