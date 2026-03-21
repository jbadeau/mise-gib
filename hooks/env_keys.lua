--- Configures environment variables for the installed gib tool
--- @param ctx EnvKeysCtx
--- @return EnvKey[]
function PLUGIN:EnvKeys(ctx)
    local mainPath = ctx.path

    return {
        {
            key = "PATH",
            value = mainPath .. "/bin",
        },
    }
end
