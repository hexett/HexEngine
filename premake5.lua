workspace "Hex"
    architecture "x64"

    configureations {
        "Debug",
        "Release",
        "Dist"
    }

outputdir "%{cfg.buildcfg}-${cfg.system}-%{cfg.architecture}"

project "Hex"
    location "Hex"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int" .. outputdir .. "/%{prj.name}")

    files {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs {
        "%{prj.name}/vendor/spdlog/include"
    }

    filter "system:windows"

        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines {
            "HX_PLATFORM_WINDOWS;",
            "HX_BUILD_DLL;"
        }

        postbuildcommands {
            ("{COPYFILE} %{cfg.buildtarget.relpath} ../bin/" .. outputdir "/Sandbox")
        }

    filter "configurations:Debug"
        defines "HX_DEBUG"
        symbols "On"
    
    filter "configurations:Release"
        defines "HX_RELEASE"
        optimize "On"
    
    filter "configurations:Dist"
        defines "HX_DIST"
        optimize "On"
    
    filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int" .. outputdir .. "/%{prj.name}")

    files {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs {
        "%{prj.name}/vendor/spdlog/include",
        "Hex/src"
    }

    links {
        "Hex"
    }

    filter "system:windows"

        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines {
            "HX_PLATFORM_WINDOWS;"
        }

    filter "configurations:Debug"
        defines "HX_DEBUG"
        symbols "On"
    
    filter "configurations:Release"
        defines "HX_RELEASE"
        optimize "On"
    
    filter "configurations:Dist"
        defines "HX_DIST"
        optimize "On"
    
    filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"