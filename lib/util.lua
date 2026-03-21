local M = {}

function M.get_arch()
    local arch = RUNTIME.archType
    if arch == "amd64" or arch == "x86_64" then
        return "amd64"
    elseif arch == "arm64" or arch == "aarch64" then
        return "arm64"
    else
        return arch
    end
end

function M.get_os()
    local os_type = RUNTIME.osType
    if os_type == "Darwin" then
        return "darwin"
    elseif os_type == "Windows" then
        return "windows"
    else
        return "linux"
    end
end

function M.get_extension()
    if RUNTIME.osType == "Windows" then
        return "zip"
    else
        return "tar.gz"
    end
end

return M
