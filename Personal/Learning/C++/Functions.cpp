#include <iostream>
#include <string>

// Defining functions
void greet(std::string name) {
    std::cout << "Hello " << name;
}

std::string fullname(std::string firstname, std::string lastname) {
    return firstname + " " + lastname;
}

// Params with default values
double calculateTax(double income, double taxRate = 0.3) {
    return income * taxRate;
}

// Overloading functions
void greet(std::string name) {
}

void greet(std::string title, std::string name) {
}

// Reference params -> Direct modification, Note: No Return
void increase(double& number) {
    number ++;
}

// Function Declaration
void greet(std::string name);

// Defining a namespace
namespace messageing {
    void greet(std::string name) {}
}

// Using a namespace
using namespace messageing;
// or
using messageing::greet;

int main() {
    return 0;
}