# Io is a purely prototype-based language. We will deal ONLY with objects
# cloning them if necessary (clones are the prototypes)

"Hello, io!" print # we send a message `print` to a newly created string object.

# Below we send the `clone` message, that returns a new object,
# which we assign to `Vehicle`, where `Vehicle` is also an object
Vehicle := Object clone
# we can add description to a `slot` in an object. We can think of it as a hash
# if a slot wasn't defined, io will create it for us. If we used `=` without `:` 
# io would throw an exception instead of creating a new slot.
Vehicle description := "Some vehicle"
Vehicle description println # => "Some vehicle"

# we can get a list of all slotNames
Vehicle slotNames
Vehicle type # returns type of vehicle => "Vehicle"

# By far we know:
# - we make objects by cloning existing ones
# - objects are collections of slots
# - we get a slot value by sending a message

### Objects, Prototypes & Inheritance

Car := Vehicle clone
Car description println
# there is no description on a car, so io will forward 
# the `description` message to `Vehicle` object
# => "Some vehicle"
Car description = "Vroom Vroom"

ferrari := Car clone # lowercase object doesn't set `type` slot.
ferrari slotNames println # => empty list, which means there is no type slot, so it will be forwarded to a parent object
ferrari description println # => this is forwarded to Car, which returns "Vroom Vroom"
ferrari type println # => "Car"

# Uppercase objects, set the type slot by default as a convenience
# we could give the lowercase ferrari a `type` (but don't do it, because it doesn't follow the conventions)
ferrari type = "Ferrari"
ferrari type println # => "Ferrari"

### Methods 

# methods are also objects
method("What is the purpose of life?" println)

method type # => Block
Block proto # Returns a prototype of Block, which is `Object`. As everything in io!
pontiac := Car clone
Car drive := method("WRrrRrrRRRrrrr" println)
pontiac drive # => "WRrrRrrRRRrrrr"

# There are some other methods 
ferrari getSlot("drive") # returns a slot of a parent if current object doesn't have it defined.
Car proto println # we can easily access prototype object

# There is also a `Lobby` object, that contains all global scope elemets, 
# like the objects we created.
Lobby println

# ==> Next topic: collections (go to other file)