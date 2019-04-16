-- scaffold geniefile for icu

icu_script = path.getabsolute(path.getdirectory(_SCRIPT))
icu_root = path.join(icu_script, "icu")

icu_includedirs = {
	path.join(icu_script, "config"),
	icu_root,
}

icu_libdirs = {}
icu_links = {}
icu_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { icu_includedirs }
	end,

	_add_defines = function()
		defines { icu_defines }
	end,

	_add_libdirs = function()
		libdirs { icu_libdirs }
	end,

	_add_external_links = function()
		links { icu_links }
	end,

	_add_self_links = function()
		links { "icu" }
	end,

	_create_projects = function()

project "icu"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		icu_includedirs,
	}

	defines {}

	files {
		path.join(icu_script, "config", "**.h"),
		path.join(icu_root, "**.h"),
		path.join(icu_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
