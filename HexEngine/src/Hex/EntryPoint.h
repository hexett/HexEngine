#pragma once

#ifdef HX_PLATFORM_WINDOWS

extern Hex::App* Hex::CreateApp();

int main(int arc, char** argv) {
	 
	Hex::Log::Init();
	HX_CORE_WARN("Initialized Log!");
	HX_INFO("Hola!");

	auto app = Hex::CreateApp();
	app->Run();
	delete app;
}

#endif // HX_PLATFORM_WINDOWS
