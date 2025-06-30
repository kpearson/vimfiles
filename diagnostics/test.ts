// TypeScript LSP Test File
// Should trigger ts_ls language server (formerly tsserver)

// Type error - assigning string to number
const myNumber: number = "this should be a number";

// Unused variable warning
const unusedVariable = 42;

// Function with missing return type
function greet(name) {
    return `Hello, ${name}!`;
}

// Object with missing properties
interface User {
    id: number;
    name: string;
    email: string;
}

const user: User = {
    id: 1,
    name: "John"
    // missing email property
};

// Test completion - type 'user.' and see if you get LSP suggestions
// user.

// Test hover - hover over 'greet' function with 'K'
greet("World");