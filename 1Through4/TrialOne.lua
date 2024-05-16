-- Releases storage for selected character
local function releaseStorage(player)
    player:setStorageValue(1000, -1)
end

-- For when the player logs out
function onLogout(player)
    if player:getStorageValue(1000) == 1 then
        -- Decided to add some error handling here in case the function fails
        local success = addEvent(releaseStorage, 1000, player)
        if not success then
            print ("Could not release storage for player - ", player:GetName())
        end
    end
    return true
end