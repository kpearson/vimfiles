// Go LSP Test File
// Should trigger gopls language server

package main

// Missing import for fmt
// import "fmt"

// Function with incorrect signature
func main() {
    // Undefined function - should trigger error
    fmt.Println("Hello, World!")
    
    // Unused variable
    unusedVar := 42
    
    // Incorrect type assignment
    var name string = 123
}

// Function with incorrect return type
func greet(name string) int {
    return "Hello, " + name  // returning string instead of int
}

// Struct with methods for testing
type Person struct {
    Name string
    Age  int
}

// Method with receiver
func (p Person) SayHello() {
    fmt.Printf("Hello, I'm %s\n", p.Name)
}

// Test completion - type 'person.' and see method suggestions
func testCompletion() {
    person := Person{Name: "John", Age: 30}
    // person.
    
    // Test hover - hover over 'Person' with 'K'
    // Test go-to-definition - use 'gd' on 'Person'
}