#include <iostream>
#include <string>
#include <limits>

void basics () {
    // Using insertion stream
    std::cout << "Meow Test\n";

    // Defining vars
    int natural_number = 1;
    double decimal_number = 1.5;

    // Expression
    int x = 10 + 3;

    // Writing to console
    std::cout << "x = " << x << "\n";

    // Reading from console
    std::cin >> natural_number;
}

void dataTypes() {
    // Datatypes
    double price = 9.99;
    float pi = 3.14F;
    long fileSize = 90000000L;
    char letter = 'a';
    std::string name = "Meowski";
    bool isValid = true;
    auto years = 5;
}

void numberSystems() {
    // Number Systems
    int x = 255;
    int y = 0b111111;
    int z = 0xFF;
}

void dataSizeAndLimits() {
    int byte = sizeof(int);
    int min = std::numeric_limits<int>::min();
    int max = std::numeric_limits<int>::max();

    std::cout << "Size of int: " << byte << "bytes , Min: "
             << min << ", Max: " << max << "\n";
}

void casting() {
    // C-style casting
    double a = 2.0;
    int b = (int) a;

    // C++ casting
    int c = static_cast<int>(a);
}

int main () {
    return 0;
}
