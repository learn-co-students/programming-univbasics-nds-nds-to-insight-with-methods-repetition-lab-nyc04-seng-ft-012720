$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

# Takes director NDS as argument
# Returns a hash with director names (strings) as keys, and respective gross totals as values
def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

# Takes director NDS (H -> A -> H) as argument
# Returns total gross earned as an integer
def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end
  total
end

# Takes director NDS as argument
# Returns an array of strings containing all directors' names
def list_of_directors(source)
  director_index = 0
  director_list = Array.new
  
  while director_index < source.size do
    director_list.push(source[director_index][:name])
    director_index += 1
  end
  director_list
end

def total_gross(source)
  total_gross_of_earnings = 0
  director_index = 0
  
  while director_index < source.size do
    total_gross_of_earnings += gross_for_director( source[director_index] )
    director_index += 1
  end
total_gross_of_earnings
end