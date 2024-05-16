-- This method is supposed to print names of all guilds that have less than memberCount max members
function printSmallGuildNames(memberCount)
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))

    -- Since it's possible to print out multiple guild names we have to change the way that guildName is printed out
    if resultId ~= false then
        repeat
            local guildName = result.getString("name")
            print(guildName)
        until not result.next()
        result.free()
        else
            -- In case we weren't able to execute the query
            print("Couldn't execute query")
    end
end