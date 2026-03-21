--- LuaCATS type definitions for mise vfox plugins
--- These annotations provide IDE support via lua-language-server.
--- See https://luals.github.io/wiki/annotations/

------------------------------------------------------------------------
-- Globals
------------------------------------------------------------------------

---@class Runtime
---@field osType string Operating system type (e.g. "linux", "darwin", "windows")
---@field archType string Architecture type (e.g. "amd64", "arm64")
---@field version string Runtime version
---@field pluginDirPath string Path to the plugin directory
RUNTIME = {}

------------------------------------------------------------------------
-- PLUGIN table & hook method signatures
------------------------------------------------------------------------

---@class AvailableVersion
---@field version string Version string
---@field note? string Optional note about the version
---@field rolling? boolean If true, this is a rolling release
---@field checksum? string Checksum for detecting changes in rolling releases

---@class AvailableCtx
---@field args string[] Command-line arguments

---@class PreInstallResult
---@field version string Version string
---@field url? string Download URL
---@field note? string Optional note
---@field sha256? string SHA-256 checksum
---@field md5? string MD5 checksum
---@field sha1? string SHA-1 checksum
---@field sha512? string SHA-512 checksum

---@class PreInstallCtx
---@field args string[] Command-line arguments
---@field version string Requested version

---@class PostInstallCtx
---@field rootPath string Installation root path
---@field runtimeVersion string Runtime version
---@field sdkInfo table<string, SdkInfo> SDK info for installed versions

---@class SdkInfo
---@field path string Installation path
---@field version string Installed version
---@field note? string Optional note

---@class EnvKey
---@field key string Environment variable name
---@field value string Environment variable value

---@class EnvKeysCtx
---@field version string Installed version
---@field path string Installation path
---@field sdkInfo table<string, SdkInfo> SDK info for installed versions
---@field main SdkInfo Main SDK info
---@field options table Plugin options from mise.toml

---@class Plugin
---@field name string Plugin name
---@field Available? fun(self: Plugin, ctx: AvailableCtx): AvailableVersion[]
---@field PreInstall? fun(self: Plugin, ctx: PreInstallCtx): PreInstallResult
---@field PostInstall? fun(self: Plugin, ctx: PostInstallCtx)
---@field EnvKeys? fun(self: Plugin, ctx: EnvKeysCtx): EnvKey[]
PLUGIN = {}

return nil
