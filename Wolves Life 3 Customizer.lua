local Customizer = {}

local Keys = {
    GamepassAccessories = '\230\139\154\230\136\172i\235\156\146(\238\138\155\201\172XD'
}

local CustomizationSettings = {
    GamepassAccessoryNames = {'Wings', 'Dragon', 'Ocean'},
    FluffNames = {'ChestFluff', 'BackFluff', 'EarFluff', 'JawFluff', 'LegFluff', 'TailFluff', 'Fat', 'ChubbyCheeks'},
    Keys = {
        GamepassAccessories = '\230\139\154\230\136\172i\235\156\146(\238\138\155\201\172XD'
    },
    PrimaryObjects = {"DragonPrimary", "OceanPrimary", "BackFluff", "TailFluff", "LeftWingStart", "LeftWing2", "LeftWing3", "RightWingStart", "RightWing2", "RightWing3", "EyeLid", "Torso", "Tail1", "Tail2", "Tail3", "Tail5", "Tail6", "RightThigh", "RightEar", "EyeLid", "Head", "Hip", "LeftEar", "LeftThigh", "Muzzle", "Neck", "NeckReal"},
    SecondaryObjects = {"DragonSecondary", "OceanSecondary", "ChubbyCheeks", "Fat", "EarFluff", "JawFluff", "ChestFluff", "LegFluff", "Eyebrow1", "Eyebrow2", "Secondary", "Jaw", "RightShoulder", "RightLowerLeg", "RightLowerArm", "RightLeg", "RightFootPaw", "LeftArm", "LeftArmPaw", "LeftCarpal", "LeftFootPaw", "LeftLeg", "LeftLowerArm", "LeftLowerLeg", "LeftShoulder", "RightArm", "RightArmPaw", "RightCarpal"},
    MaterialObjects = {"BackFluff", "TailFluff", "LeftWingStart", "LeftWing2", "LeftWing3", "RightWingStart", "RightWing2", "RightWing3", "EyeLid", "Torso", "Tail1", "Tail2", "Tail3", "Tail5", "Tail6", "RightThigh", "RightEar", "EyeLid", "Head", "Hip", "LeftEar", "LeftThigh", "Muzzle", "Neck", "NeckReal"},
    Materials = {'Plastic', 'Wood', 'Slate', 'Concrete', 'CorrodedMetal', 'Foil', 'Grass', 'Ice', 'Marble', 'Granite', 'Brick', 'Pebble', 'Sand', 'Fabric', 'SmoothPlastic', 'Metal', 'WoodPlanks', 'Cobblestone', 'Neon', 'Glass', 'ForceField'}
}

function Customizer:SetEyeColor(r, g, b)
    local _, e = pcall(function()
        r = tonumber(r)
        g = tonumber(g)
        b = tonumber(b)
    end)
    if not e then
        game.ReplicatedStorage.MasterKey:FireServer(
            'customize',
            {
                'EyeColor'
            },
            Color3.fromRGB(
                r,
                g,
                b
            ),
            'Body'
        )

        return 'success'
    end

    return 'failed'
end

function Customizer:SetPrimaryColor(r, g, b)
    local _, e = pcall(function()
        r = tonumber(r)
        g = tonumber(g)
        b = tonumber(b)
    end)
    if not e then
        game.ReplicatedStorage.MasterKey:FireServer(
            'customize',
            CustomizationSettings.PrimaryObjects,
            Color3.fromRGB(
                r,
                g,
                b
            ),
            'Body'
        )

        return 'success'
    end

    return 'failed'
end

function Customizer:SetSecondaryColor(r, g, b)
    local _, e = pcall(function()
        r = tonumber(r)
        g = tonumber(g)
        b = tonumber(b)
    end)
    if not e then
        game.ReplicatedStorage.MasterKey:FireServer(
            'customize',
            CustomizationSettings.SecondaryObjects,
            Color3.fromRGB(
                r,
                g,
                b
            ),
            'Body'
        )

        return 'success'
    end

    return 'failed'
end

function Customizer:SetMaterial(material)
    if material ~= nil then
        if table.find(CustomizationSettings.Materials, material) then
            game.ReplicatedStorage.MasterKey:FireServer(
                'Material',
                material,
                CustomizationSettings.MaterialObjects
            )

            return 'success'
        end
    end

    return 'failed'
end

function Customizer:ToggleGamepassAccessory(accessoryName, toggle)
    if accessoryName ~= nil then
        if table.find(CustomizationSettings.GamepassAccessoryNames) then
            if not toggle then
                game.ReplicatedStorage.MasterKey:FireServer(
                    accessoryName,
                    1,
                    Keys.GamepassAccessories
                )
                
                return 'success'
            else
                game.ReplicatedStorage.MasterKey:FireServer(
                    accessoryName,
                    0,
                    Keys.GamepassAccessories
                )

                return 'success'
            end
        end
    end

    return 'failed'
end

function Customizer:ToggleFluff(fluffName, toggle)
    if fluffName ~= nil then
        if table.find(CustomizationSettings.FluffNames, fluffName) then
            if not toggle then
                game.ReplicatedStorage.MasterKey:FireServer(
                    'Fluff',
                    fluffName,
                    1
                )

                return 'success'
            else
                game.ReplicatedStorage.MasterKey:FireServer(
                    'Fluff',
                    fluffName,
                    0
                )

                return 'success'
            end
        end
    end

    return 'failed'
end

return Customizer
