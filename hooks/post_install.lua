function PLUGIN:PostInstall(ctx)
    local sdkInfo = ctx.sdkInfo["gcb"]
    local path = sdkInfo.path

    if RUNTIME.osType ~= "Windows" then
        os.execute("chmod +x " .. path .. "/bin/gcb")
    end
end
