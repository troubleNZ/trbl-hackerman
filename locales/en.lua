local Translations = {
    error = {
        something_went_wrong    = 'Something went wrong',
        missing_item            = "You're missing an item..",
    },
    success = {
        exit                    = "Exited",
        logs_date               =   "Data",
        logs_hour               =   "Time",
        logs_trade_made         =   "```HackerMan:\n[Trade]: %s\n[ITEM]: %s [AMOUNT]: %s \n[ID]: %s \r```",
    },
    info = {
        trade                   = "Trade for 1 Cryptostick",
        vendor                  = "Hackerman Sam",
        ZeroDay1                = QBCore.Shared.Items["format_software"].label,
        ZeroDay2                = QBCore.Shared.Items["hacking_software"].label,
        ZeroDay3                = QBCore.Shared.Items["vpn_software"].label,
        ZeroDay4                = QBCore.Shared.Items["boosting_software"].label,
    },
    text = {
        close_menu              =   '⬅ Close Menu',
        chat                    =   "Lets trade? 1 Crypto stick for your choice of zero day software",
        yes                     =   "Yes",
        no                      =   "No",
        
        
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
