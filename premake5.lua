project "NFD"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"

    targetdir ( "%{wks.location}/build/" .. outputdir .. "/%{prj.name}")
    objdir ( "%{wks.location}/build-int/" .. outputdir .. "/%{prj.name}")

    files {
        "src/include/*.h",
        "src/include/*.hpp"
    }

    includedirs {
        "src",
        "src/include"
    }

    filter "system:macosx"
        cppdialect "C++17"
        staticruntime "On"

        files {
            "src/nfd_cocoa.m"
        }

    filter "system:windows"
        systemversion "latest"
        cppdialect "C++17"
        staticruntime "On"

        files {
            "src/nfd_win.cpp"
        }

    filter "system:linux"
        pic "On"
        systemversion "latest"
        cppdialect "C++17"
        staticruntime "On"

        files {
            "src/nfd_gtk.cpp"
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"
