-- Past name was not helpful, so I renamed it
function removePlayerFromParty(playerId, membername)
    player = Player(playerId)
    -- In case this player doesn't exist (invalid Id)
    if not player then
        return
    end

    local party = player:getParty()
    -- In case party is null
    if not party then
        return
    end

    -- Check name of each party memeber and check to see if it should be deleted
    for k,v in pairs(party:getMembers()) do
        if v:GetName() == membername then
            party:removeMember(v)
            break
        end
    end
end