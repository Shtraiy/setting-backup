#include <iostream>
#include <iterator>
#include <string>

class Entity{
    public:
        std::string GetName() {
            return "Entity";
        }
};

class Player : public Entity{
    private:
        std::string m_Name;
    public:
        Player(const std::string& name) : m_Name(name) {

            }
        std::string GetName() {
            return m_Name;
        }

};
int main(){
    Entity* e = new Entity();
    std::cout << e->GetName() << std::endl;
    Player* player1 = new Player("Resalia");
    std::cout <<  player1->GetName() << std::endl;
    return 0;
}
