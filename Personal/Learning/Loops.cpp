#include <iostream>

void loops() {
    // For loop
    for (int i = 0; i < 5; i++) {
        std::cout << i << std::endl;
    }

    // While loop
    int i = 0;
    while (i < 5) {
        std::cout << i << std::endl;
        i++;
    }

    // Do while loop
    i = 0;
    do {
        std::cout << i << std::endl;
        i++;
    } while (i < 5);

    // Range based for loop
    int numbers[] = {1, 2, 3};
    for (int number: numbers)
        std::cout << number << std::endl;
}

int main() {
    return 0;
}