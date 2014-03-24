# Thanks David Reiman - https://github.com/elreimundo

NUMBER_OF_TESTS = 1_000_000

class Shelf
  # attr_reader :showing, :hidden

  def initialize(*sides)
    @sides = sides
    @showing, @hidden = nil
  end

  def randomize!
    @showing, @hidden = @sides.shuffle
    self
  end
end

class Game
  def initialize(*shelves)
    @shelves = shelves
  end

  def look_at_random_shelf_face
    @shelves.sample.randomize!
  end

  def look_at_other_side_of_shelf_with_bottom_of(color)
    until (shelf = look_at_random_shelf_face).showing == color; end
    shelf.hidden
  end
end

game = Game.new(Shelf.new('w', 'w'), Shelf.new('g', 'g'), Shelf.new('w', 'g'))

running_count = 0

NUMBER_OF_TESTS.times do
  running_count += 1 if game.look_at_other_side_of_shelf_with_bottom_of('g') == 'g'
end

puts "Ran #{NUMBER_OF_TESTS} simulations, got #{running_count} green/green shelves"
puts "Which represents #{(running_count.to_f / NUMBER_OF_TESTS * 100)}%"



