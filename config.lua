
Config = {}

Config.UseTarget = true -- use one method only or risk your sanity
Config.UseZones = true
Config.UseMojitoDialogue = true

Config.TargetResourceName = 'third-eye' -- qb-target etc / remember to update the fxmanifest too
Config.Locale = "en"
Config.Debug    = false

Config.PedModel = `u_m_m_markfost`          -- why not change to Lester model and put him in his house?
Config.PedLoadRange = 20     --meters
Config.Locations = {
    {   
        label       = "hackerman",      --unique
        coords      = vector4(-572.49, 228.43, 74.89, 358.54),
        length = 1.5,   --boxzone-- qb-target options 
        width = 1.5,    --boxzone-- qb-target options 
        polyzone = {   -- polyzone and showui
            vector2(Config.Locations[k]coords.x+2, Config.Locations[k]coords.y+2),
            vector2(Config.Locations[k]coords.x-2, Config.Locations[k]coords.y+2),
            vector2(Config.Locations[k]coords.x-2, Config.Locations[k]coords.y-2),
            vector2(Config.Locations[k]coords.x+2, Config.Locations[k]coords.y-2),
        },
        minZ = Config.Locations[k]coords.z-1,       -- mandatory - used for both zone type
        maxZ = Config.Locations[k]coords.z+1,       -- mandatory - used for both zone type
    },
}

Config.Software = {
    tradeable_item  = "cryptostick",
    zeroday1 = "format_software",
    zeroday2 = "hacking_software",
    zeroday3 = "vpn_software",
    zeroday4 = "boosting_software",
}
    