--- Returns download information for a specific version of gib
--- @param ctx PreInstallCtx
--- @return PreInstallResult
function PLUGIN:PreInstall(ctx)
    local http = require("http")
    local version = ctx.version

    local os_type = RUNTIME.osType:lower()
    local arch = RUNTIME.archType

    local ext = "tar.gz"
    if RUNTIME.osType == "Windows" then
        ext = "zip"
    end

    local filename = "gib_" .. version .. "_" .. os_type .. "_" .. arch .. "." .. ext
    local url = "https://github.com/jbadeau/gib/releases/download/v" .. version .. "/" .. filename

    -- Fetch checksum
    local sha256 = nil
    local checksum_url = "https://github.com/jbadeau/gib/releases/download/v" .. version .. "/checksums.txt"
    local resp, err = http.get({ url = checksum_url })

    if err == nil and resp.status_code == 200 then
        for line in resp.body:gmatch("[^\n]+") do
            if line:match(filename) then
                sha256 = line:match("^(%w+)")
                break
            end
        end
    end

    return {
        version = version,
        url = url,
        sha256 = sha256,
    }
end
