function PLUGIN:Available(ctx)
    local http = require("http")
    local json = require("json")

    local resp, err = http.get({
        url = "https://api.github.com/repos/jbadeau/gcb/releases",
        headers = {
            ["Accept"] = "application/vnd.github+json"
        }
    })

    if err ~= nil then
        error("Failed to fetch releases: " .. err)
    end

    local releases = json.decode(resp.body)
    local result = {}

    for _, release in ipairs(releases) do
        if not release.draft and not release.prerelease then
            local version = release.tag_name:gsub("^v", "")
            table.insert(result, {
                version = version,
                note = release.name or ""
            })
        end
    end

    return result
end
