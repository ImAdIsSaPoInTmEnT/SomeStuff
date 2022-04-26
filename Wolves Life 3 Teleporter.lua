local Teleportation = {}

local TeleportationSettings = {
    Biomes = {'Jail', 'Store', 'Camp', 'Restaurant', 'Medic Centre', 'Ice Bath', 'Volcano', 'Ice Lake', 'Adoption', 'Redwood Biome', 'Snow Biome', 'Forest Biome', 'Beach Biome', 'School', 'Caf\195\169'},
    Dens = {},
    Shops = {
        Forest = Vector3.new(894.7352294921875, 41.269989013671875, 181.97915649414062),
        Redwood = Vector3.new(460.2687072753906, 45.26999282836914, 720.345703125)
    },
    EasterEggs = {
        Beach1 = Vector3.new(354.7777099609375, 76.86410522460938, -78.68669128417969),
        Beach2 = Vector3.new(238.8714141845703, 65.0355453491211, -79.79584503173828),
        Beach3 = Vector3.new(250.38885498046875, 41.269989013671875, 334.6274719238281),
        Snow1 = Vector3.new(1234.3565673828125, 149.18646240234375, 512.3543701171875)
    }
}

function Teleportation:Spawn(biome)
    if biome ~= nil then
        print(1)
        if table.find(TeleportationSettings.Biomes, biome) then
            print(2)
            game.ReplicatedStorage.MasterKey:FireServer(
                'Spawn',
                biome
            )

            return 'success'
        end
    end

    return 'failed'
end

function Teleportation:Den(number)
    local _, e = pcall(function()
        number = tonumber(number)
    end)
    if not e then
        if TeleportationSettings.Dens[number] ~= nil then
            game.Players.LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(
                TeleportationSettings.Dens[number]
            )

            return 'success'
        end
    end

    return 'failed'
end

function Teleportation:Shop(shop)
    if shop ~= nil then
        if TeleportationSettings.Shops[shop] ~= nil then
            game.Players.LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(
                TeleportationSettings.Shops[shop]
            )
            
            return 'success'
        end
    end

    return 'failed'
end

function Teleportation:EasterEgg(easteregg)
    if easteregg ~= nil then
        if TeleportationSettings.EasterEggs[easteregg] ~= nil then
            game.Players.LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(
                TeleportationSettings.EasterEggs[easteregg]
            )

            return 'success'
        end
    end

    return 'failed'
end

return Teleportation
