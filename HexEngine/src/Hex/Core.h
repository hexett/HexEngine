#pragma once

#ifdef HX_PLATFORM_WINDOWS
	#ifdef HX_BUILD_DLL
		#define HEX_API __declspec(dllexport)
	#else
		#define HEX_API __declspec(dllimport)
	#endif // HX_BUILD_DLL
#else
	#error Hex only supports Windows!
#endif HX_PLATFORM_WINDOWS
