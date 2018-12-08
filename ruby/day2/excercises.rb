# first
array = Array.new(16) { rand(100) }
array[0...4].each { |vals| p vals }
array[4...8].each { |vals| p vals }
array[8...12].each { |vals| p vals }
array[12...16].each { |vals| p vals }
array.each_slice(4) { |vals| p vals }


#second 
def to_tree(hash, children = [])
  hash.each {|key, value| children.push Tree.new("key", to_tree(value, [])) }
end

class Tree 
  attr_accessor :node_name, :children

  def initialize(name, children = [])
    @node_name = name

    if children.is_a? Hash do
      to_tree(children)
    end
    @children = children
  end

  def visit(&block)
    block.call self
  end

  def visit_all(&block)
    visit &block
    @children.each {|c| c.visit_all &block }
  end
end

family_tree = Tree.new("Family", [
  Tree.new("Matuszewscy", [
    Tree.new("Maciej"),
    Tree.new("Miłosz")
  ]),
  Tree.new("Wyczółkowscy")
]);

other_tree = Tree.new("Other", {
  'grandpa' => {
    'dad' => {
      'child 1' => {},
      'child 2' => {},
    },
    'uncle' => {
      'child 3' => {},
      'child 4' => {}
    }
  }
})

family_tree.visit {|node| puts node.node_name}
family_tree.visit_all {|node| puts node.node_name}

other_tree.visit {|node| puts node.node_name}
other_tree.visit_all {|node| puts node.node_name}
