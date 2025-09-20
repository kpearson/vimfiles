# Ruby LSP Test File  
# Should trigger solargraph language server

class User
  attr_accessor :name, :email
  
  def initialize(name, email)
    @name = name
    @email = email
  end
  
  # Method with syntax error
  def greet
    puts "Hello, #{@name}
    # missing closing quote
  end
  
  # Method with undefined variable
  def display_info
    puts "Name: #{@name}"
    puts "Email: #{@email}"
    puts "Age: #{@age}"  # @age is not defined
  end
end

# Test completion - type 'user.' and see method suggestions
user = User.new("John", "john@example.com")
# user.

# Undefined method call
user.undefined_method

# Test hover - hover over 'User' class with 'K'
# Test go-to-definition - use 'gd' on 'User' 

# Rails-style method (if you have Rails gems)
# user.update_attributes(name: "Jane")