#include <Hex.h>

class Sandbox : public Hex::App {

public:
	Sandbox() {
	
	}
	
	~Sandbox() {
	
	}
};

Hex::App* Hex::CreateApp() {
	return new Sandbox();
}