#include <iostream>

void comparisonOperators() {
    // Comparison operators
    bool a = 10 > 5;
    bool b = 10 == 10;
    bool c = 10 != 5;
}

void logicalOperators() {
    bool a = true;
    bool b = true;

    // Logical operators
    bool d = a && b;
    bool e = a || b;
    bool c = 10 != 5;
}

void DecisionMaking() {
    int temperature = 70;

    // If else cases
    if (temperature < 60) {
        std::cout << "It's cold";
    } 
    else if (temperature > 90) {
        std::cout << "It's hot";
    }
    else {
        std::cout << "It's avg";
    }

    int sales = 1000;

    // Conditional operator
    double commission = (sales < 10000) ? 0.05 : 0.01;

    int menu_state = 1;

    // Switch case
    switch (menu_state) {
        case 1:
            // ...
            break;
        case 2:
            // ...
            break;
        default:
            //...
    }
}

int main() {
    return 0;
}