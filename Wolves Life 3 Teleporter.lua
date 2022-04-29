local Teleportation = {}

local TeleportationSettings = {
    Biomes = {'Jail', 'Store', 'Camp', 'Restaurant', 'Medic Centre', 'Ice Bath', 'Volcano', 'Ice Lake', 'Adoption', 'Redwood Biome', 'Snow Biome', 'Forest Biome', 'Beach Biome', 'School', 'Caf\195\169'},
    Dens = {
        Vector3.new(1101.1522216796875, 23.020832061767578, -57.344512939453125),
        Vector3.new(1076.1494140625, 21.268117904663086, 20.682064056396484),
        Vector3.new(805.4125366210938, 84.67146301269531, 613.53515625),
        Vector3.new(648.0609130859375, 50.71876525878906, 94.8555679321289),
        Vector3.new(979.1843872070312, 37.155330657958984, -163.67703247070312),
        Vector3.new(953.6137084960938, 39.33784484863281, -159.82997131347656),
        Vector3.new(769.8460693359375, 53.140953063964844, -13.329414367675781),
        Vector3.new(793.7134399414062, 34.76268005371094, 53.82504653930664),
        Vector3.new(596.6594848632812, 50.14624786376953, -41.64828109741211),
        Vector3.new(612.3492431640625, 49.32644271850586, 139.6160430908203),
        Vector3.new(855.0327758789062, 53.14484405517578, 295.09649658203125),
        Vector3.new(854.089111328125, 83.87041473388672, 190.25839233398438),
        Vector3.new(1033.8450927734375, 76.59391021728516, 298.1518859863281),
        Vector3.new(1119.675048828125, 47.937442779541016, 283.6651916503906),
        Vector3.new(1115.3865966796875, 59.63021469116211, 181.1024169921875),
        Vector3.new(1014.3553466796875, 23.0693359375, 91.53346252441406),
        Vector3.new(1020.6426391601562, 82.99874114990234, 442.5740051269531),
        Vector3.new(520.3342895507812, 47.944488525390625, -47.15884017944336),
        Vector3.new(668.9491577148438, 47.62040328979492, 243.560546875),
        Vector3.new(949.0843505859375, 79.92561340332031, 579.275390625),
        Vector3.new(343.8707580566406, 49.54418182373047, 591.0939331054688),
        Vector3.new(365.4776916503906, 45.40765380859375, 748.5856323242188),
        Vector3.new(1007.96533203125, 43.15504455566406, 690.4176025390625),
        Vector3.new(266.012939453125, 45.078643798828125, 575.832763671875),
        Vector3.new(228.12490844726562, 50.21220397949219, 503.0064697265625),
        Vector3.new(355.0126953125, 50.763465881347656, 456.4290771484375),
        Vector3.new(305.2200622558594, 52.38206100463867, 449.6094970703125),
        Vector3.new(433.5769958496094, 77.34221649169922, 458.3670959472656),
        Vector3.new(557.0115966796875, 65.54166412353516, 617.9620361328125),
        Vector3.new(616.9324340820312, 62.89402770996094, 681.8825073242188),
        Vector3.new(448.8939208984375, 45.94902801513672, 613.653564453125),
        Vector3.new(1215.7816162109375, 52.74020004272461, 575.7843627929688),
        Vector3.new(1296.384033203125, 54.594940185546875, 618.01318359375),
        Vector3.new(766.541259765625, 77.6297836303711, 474.82806396484375),
        Vector3.new(531.8231201171875, 87.62120056152344, 477.59423828125),
        Vector3.new(762.24365234375, 52.994117736816406, 294.2559509277344),
        Vector3.new(309.087890625, 55.93675231933594, 291.1878662109375)
    },
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

function Teleportation:Bring(group, username, displayName)
    local players = {}
    local position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            if group:lower() == 'all' then
                if player:FindFirstChild('GameData') then
                    if player.GameData:FindFirstChild('Age') then
                        if player.GameData.Age.Value ~= 'Newborn' and player.GameData.Age.Value:len() > 1 then
                            if player.Character ~= nil and player.Character:FindFirstChildWhichIsA('Seat') then
                                table.insert(players, player)
                            end
                        end
                    end
                end
            elseif group:lower() == 'pups' then
                if player:FindFirstChild('GameData') then
                    if player.GameData:FindFirstChild('Age') then
                        if player.GameData.Age.Value == 'Pup' then
                            if player.Character ~= nil and player.Character:FindFirstChildWhichIsA('Seat') then
                                table.insert(players, player)
                            end
                        end
                    end
                end
            elseif group:lower() == 'adults' then
                if player:FindFirstChild('GameData') then
                    if player.GameData:FindFirstChild('Age') then
                        if player.GameData.Age.Value == 'Adult' then
                            if player.Character ~= nil and player.Character:FindFirstChildWhichIsA('Seat') then
                                table.insert(players, player)
                            end
                        end
                    end
                end
            elseif group:lower() == 'player' then
                if player:FindFirstChild('GameData') then
                    if player.GameData:FindFirstChild('Age') then
                        if player.GameData.Age.Value ~= 'Newborn' and player.GameData.Age.Value:len() > 1 then
                            if player.Character ~= nil and player.Character:FindFirstChildWhichIsA('Seat') then
                               if displayName then
                                if (username == player.DisplayName:lower():sub(1, #username)) then
                                    table.insert(players, player)
                                    break
                                   end
                               else
                                if (username == player.Name:lower():sub(1, #username)) then
                                    table.insert(players, player)
                                    break
                                   end
                               end
                            end
                        end
                    end
                end
            end
        end
    end
    print(unpack(players))
    for _, player in pairs(players) do
        if player.Character:FindFirstChildWhichIsA('Seat') then
            local seat = player.Character:FindFirstChildWhichIsA('Seat')
            if game.Players.LocalPlayer.Character ~= nil then
                print(1)
                if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid') then
                    if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                        seat:Sit(game.Players.LocalPlayer.Character.Humanoid)
                        repeat wait() until seat:FindFirstChild('SeatWeld')
                        seat.SeatWeld:Destroy()

                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
                            position
                        )

                        wait(0.1)
                    end
                end
            end
        end

        wait()
    end
end

function Teleportation:Player(username, displayName)
    if username ~= nil and displayName ~= nil then
        username = username:lower()

        local target = nil

        for _, player in ipairs(game.Players:GetPlayers()) do
            if displayName then
                if (username == player.DisplayName:lower():sub(1, #username)) then
                    target = player.Name
                end
            else
                if (username == player.Name:lower():sub(1, #username)) then
                    target = player.Name
                end
            end
        end

        if target ~= nil then
            if workspace:FindFirstChild(target) then
                if workspace[target]:IsA('Model') and workspace[target].PrimaryPart ~= nil then
                    game.Players.LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(
                        workspace[target].PrimaryPart.Position
                    )

                    return 'success'
                end
            end
        end
    end

    return 'failed'
end

function Teleportation:Spawn(biome)
    if biome ~= nil then
        if table.find(TeleportationSettings.Biomes, biome) then
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
