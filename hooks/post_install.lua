--- Moves the gib binary into bin/ and makes it executable
--- @param ctx PostInstallCtx
function PLUGIN:PostInstall(ctx)
    local sdkInfo = ctx.sdkInfo[PLUGIN.name]
    local path = sdkInfo.path

    os.execute("mkdir -p " .. path .. "/bin")

    local srcFile = path .. "/gib"
    local destFile = path .. "/bin/gib"

    local result = os.execute("mv " .. srcFile .. " " .. destFile .. " && chmod +x " .. destFile)
    if result ~= 0 then
        error("Failed to install gib binary")
    end
end
