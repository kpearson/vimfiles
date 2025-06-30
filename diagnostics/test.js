// JavaScript LSP Test File
// Should trigger ts_ls language server (formerly tsserver)

// Unused variable
const unusedVariable = "I'm not used anywhere";

// Function with parameter issues
function greet(name) {
    console.log("Hello, " + name);
    // Missing return statement
}

// Undefined variable
console.log(undefinedVariable);

// Object with potential issues
const user = {
    name: "John",
    age: 30,
    email: "john@example.com"
};

// Property access that might not exist
console.log(user.phone); // phone property doesn't exist

// Function with missing semicolon
function add(a, b) {
    return a + b
}

// Arrow function for testing
const multiply = (a, b) => a * b;

// Test completion - type 'user.' and see property suggestions
// user.

// Test hover - hover over 'greet' function with 'K'
greet("World");

// Potential type issues for tsserver to catch
const result = add("5", 3); // mixing string and number