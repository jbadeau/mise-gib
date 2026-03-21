--- Returns a list of available versions for gib
--- @param ctx AvailableCtx
--- @return AvailableVersion[]
function PLUGIN:Available(ctx)
    local http = require("http")
    local json = require("json")

    local resp, err = http.get({
        url = "https://api.github.com/repos/jbadeau/gib/releases",
    })

    if err ~= nil then
        error("Failed to fetch versions: " .. err)
    end
    if resp.status_code ~= 200 then
        error("GitHub API returned status " .. resp.status_code .. ": " .. resp.body)
    end

    local releases = json.decode(resp.body)
    local result = {}

    for _, release in ipairs(releases) do
        if not release.draft and not release.prerelease then
            local version = release.tag_name:gsub("^v", "")
            table.insert(result, {
                version = version,
            })
        end
    end

    return result
end
