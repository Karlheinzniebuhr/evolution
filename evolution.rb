class Live
	@@population = 0

	def initialize(genes=0)
		@@population += 1
		@genes = genes
		@alive = true
	end
	def reproduce(genes)
		Live.new(genes)
	end
	def die()
		@@population -= 1
		@alive = false
	end
	def number_of_lives_alive()
		@@population
	end
	def genes(gen=0)
		@genes += gen
	end
	def is_alive
		@alive
	end
	def mutate()
		@genes += rand(-1..1)
	end
end

class World
	@@iterations = 0
	@@population = []
	def initialize
	end
	def run(live, years, max_pop_length)
		@@population << live
		for year in 1..years
			for cell in @@population
				
				if cell.genes == 5
					new_cell = cell.reproduce(cell.genes)
					new_cell.mutate
					@@population << new_cell
				else
					cell.die
					@@population.delete(cell)
				end

				if @@population.length > max_pop_length
					puts "population too large"
					return @@population
				end
			end
		end
		return @@population
	end
end



seed = Live.new(rand(0..10))
live = seed

world = World.new
pop = []
pop = world.run(live, 100, 1000)

puts "end"
unless pop.empty?
	puts "They survived! Number of population is #{pop.length}"
else
	puts "the population didn't make it"
end
puts "alive = #{live.number_of_lives_alive}"


frequency = Hash.new(0)
pop.each {|x| frequency[x.genes] += 1}
frequency.sort
frequency.each {|x,y| puts "#{x}: #{y}"}