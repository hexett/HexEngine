#pragma once

#include "Core.h"

namespace Hex {
	class HEX_API App
	{
	public:
		App();
		virtual ~App();

		void Run();
	};

	App* CreateApp();
}

