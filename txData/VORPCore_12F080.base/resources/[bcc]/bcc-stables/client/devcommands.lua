-- RegisterCommand("loadCustomHorse", function(args)
-- 	print("Load custom horse called.")
-- 	local modelName = "a_c_horse_friesian_blackstar"
-- 	local model = joaat(modelName)
-- 	print(model)
-- 	LoadModel(model, modelName)

-- 	local player = PlayerId()
--     local playerPed = PlayerPedId()
-- 	local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(playerPed, 0.0, -10.0, 0.0))

-- 	local spawnPosition = nil
--     for height = 1, 1000 do
--         local groundCheck, ground = GetGroundZAndNormalFor_3dCoord(x, y, height + 0.0)
--         if groundCheck then
--             spawnPosition = vector3(x, y, ground)
--             break
--         end
--     end

--     local index = 0
--     while index < 25 do
--         local nodeCheck, node = GetNthClosestVehicleNode(x, y, z, index, 1, 1077936128, 0)
--         if nodeCheck then
--             spawnPosition = node
--             break
--         else
--             index = index + 3
--         end
--     end

--     if not spawnPosition then
--         return print('No spawn position found!')
--     end

--     local customHorse = CreatePed(model, spawnPosition.x, spawnPosition.y, spawnPosition.z, GetEntityHeading(playerPed), true, false, false, false)
-- end)

RegisterCommand('starBlackHorse', function(source, args)
    local model = `a_c_horse_friesian_blackstar`
    
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end

    local coords = GetEntityCoords(PlayerPedId())
    local currentMount = CreatePed(model, coords.x, coords.y, coords.z, 0, true, true, true, true)
    SetModelAsNoLongerNeeded(model)
    SetPedOutfitPreset(currentMount, 0, 0)
    SetPedAsSaddleHorseForPlayer(PlayerId(), currentMount)
    SetPedConfigFlag(currentMount, 297, true) -- Enable leading
    SetPedConfigFlag(currentMount, 312, true) -- Won't flee when shooting
    SetPedConfigFlag(currentMount, 442, true) -- Remove Flee prompt
    BlipAddForEntity(-1230993421, currentMount)

    while not IsPedReadyToRender(currentMount) do
        Wait(0)
    end

    -- head
    -- local tint0, tint1, tint2 = 70, 70, 70
    -- local drawable = `p_c_horse_01_head_000`
    -- local albedo = `p_c_horse_01_head_000_c0_895_ab`
    -- local normal = `p_c_horse_01_head_000_c0_000_nm`
    -- local material = `p_c_horse_01_head_000_c0_000_m`
    -- local palette = `metaped_tint_horse`
    -- SetMetaPedTag(currentMount, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
    -- UpdatePedVariation(currentMount)

    -- -- body
    -- local tint0, tint1, tint2 = 70, 70, 70
    -- local drawable = `p_c_horse_01_hand_000`
    -- local albedo = `mp_horse_01_hand_000_c0_835_ab`
    -- local normal = `p_c_horse_01_hand_000_c0_000_nm`
    -- local material = `p_c_horse_01_hand_000_c0_000_m`
    -- local palette = `metaped_tint_horse`
    -- SetMetaPedTag(currentMount, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
    -- UpdatePedVariation(currentMount)
end)