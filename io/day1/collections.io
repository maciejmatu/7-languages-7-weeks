### This is a second file for day1 (start in index.io);

# io has a few types of collections
# - List - prototype for ordered collection of objects
# - Map - prototype for key-value pairs collection
todos := list("Wash my car", "42")
todos size println # => 2
todos append("Wash the floor") # add an element

# Lists: io has some math helpers built in
list(1, 2, 3, 4) average # => 2.5
list(1, 2, 3, 4) sum # => 10
list(1, 2, 3, 4) append(5)
list(1, 2, 3, 4) pop # removes element
list() isEmpty # => false

# Maps:
car := Map clone
car atPut("location", "garage")
car at("location") println # => "garage"
car atPut("color", "Crimson red")
car slotNames println # => list()
car asObject slotNames println # => list(color, location)
car asList println # => list(list(color, Crimson red), list(location, garage))
car keys println # => list(color, location)
car size # => 2

## Go to conditions file!