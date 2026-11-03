#include <iostream>
#include <array>
#include <random>
#include <string>

/**
 * @brief Setup the game before it starts
 * prefills doors*
 * 
 * @param doors an array for the 3 entities to git in
 * 
 */
void setup(std::array<std::string, 3>& doors);

int randomInt();

int main() {
    std::array<std::string, 3> doors;
    setup(doors);
    std::cout << "Hello! Welcome to the gameshow!" << std::endl;
    std::cout << "You have made it to the final round!" << std::endl;
    std::cout << "Select one of 3 doors and see if you get the grandprize!" << std::endl;

    std::cout << "Your choice: ";
    int choice = 0;
    std::cin >> choice;

    if (choice < 1 || choice > 3) {
        std::cout << "Please choose door 1, 2, or 3." << std::endl;
        return 1;
    }

    int chosenDoor = choice - 1;
    int revealedDoor = randomInt();
    while (revealedDoor == chosenDoor || doors[revealedDoor] == "car") {
        revealedDoor = randomInt();
    }

    std::cout << "The host opens door " << revealedDoor + 1
              << ": goat" << std::endl;


    int remainingDoor = 3 - chosenDoor - revealedDoor;

    std::cout << "Your remaining door is "
          << remainingDoor + 1 << std::endl;

    std::cout << "Do you want to stay or switch?" << std::endl;
    std::string finalAns;

    std::cin >> finalAns;

    if(finalAns == "stay"){
        if(doors[chosenDoor] == "car"){
            std::cout << "YOU WIN WOOOOOOOOOOOO" << std::endl;
        }else{
            std::cout << "sorry bub, you lost  tsk tsk tsk" << std::endl;
        }
    }

    if(finalAns == "switch"){
        if(doors[remainingDoor] == "car"){
            std::cout << "YOU WIN WOOOOOOOOOOOO" << std::endl;
        }else{
            std::cout << "sorry bub, you lost  tsk tsk tsk" << std::endl;
        }
    }


}


void setup(std::array<std::string, 3>& doors){

    int rand = randomInt();

    doors.fill("goat");
    doors[rand] = "car";
}

int randomInt(){
    static std::mt19937 gen(std::random_device{}());
    static std::uniform_int_distribution<int> distribution(0, 2);

    return distribution(gen);
}
