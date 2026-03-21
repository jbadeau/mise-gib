local util = require("util")

function PLUGIN:PreInstall(ctx)
    local version = ctx.version
    local os_type = util.get_os()
    local arch = util.get_arch()
    local ext = util.get_extension()

    local filename = "gcb_" .. version .. "_" .. os_type .. "_" .. arch .. "." .. ext
    local url = "https://github.com/jbadeau/gcb/releases/download/v" .. version .. "/" .. filename

    -- Fetch checksum
    local sha256 = nil
    local http = require("http")
    local checksum_url = "https://github.com/jbadeau/gcb/releases/download/v" .. version .. "/checksums.txt"
    local resp, err = http.get({ url = checksum_url })

    if err == nil then
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
        note = "Installing gcb " .. version .. " (" .. os_type .. "/" .. arch .. ")"
    }
end
