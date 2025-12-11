#pragma once

#include <memory>

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/sinks/stdout_color_sinks.h"
namespace Hex
{
	class HEX_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger> &GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger> &GetClientLogger() { return s_ClientLogger; }

	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

// Core Log Macros
#define HX_CORE_ERROR(...) ::Hex::Log::GetCoreLogger()->error(__VA_ARGS__)
#define HX_CORE_WARN(...) ::Hex::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define HX_CORE_INFO(...) ::Hex::Log::GetCoreLogger()->info(__VA_ARGS__)
#define HX_CORE_TRACE(...) ::Hex::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define HX_CORE_FATAL(...) ::Hex::Log::GetCoreLogger()->fatal(__VA_ARGS__)

// Client Log Macros
#define HX_ERROR(...) ::Hex::Log::GetClientLogger()->error(__VA_ARGS__)
#define HX_WARN(...) ::Hex::Log::GetClientLogger()->warn(__VA_ARGS__)
#define HX_INFO(...) ::Hex::Log::GetClientLogger()->info(__VA_ARGS__)
#define HX_TRACE(...) ::Hex::Log::GetClientLogger()->trace(__VA_ARGS__)
#define HX_FATAL(...) ::Hex::Log::GetClientLogger()->fatal(__VA_ARGS__)