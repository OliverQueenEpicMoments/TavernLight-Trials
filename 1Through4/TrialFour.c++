void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId) {
    Player* player = g_game.getPlayerByName(recipient);
    if (!player) {
        player = new Player(nullptr);
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            // Deleting player to prevent memory leak and printing error to console
            delete player;
            std::cout << "Couldn't load player data" << std::endl;
            return;
        }
    }

    Item* item = Item::CreateItem(itemId);
    if (!item) {
        std::cout << "Couldn't create item" << std::endl;
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
        delete player;
    }
}