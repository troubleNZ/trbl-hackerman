fx_version 'cerulean'
game 'gta5'

description 'trbl-Hackerman'
version '1.0.1'
author 'TroubleshooterNZ'
repository 'https://github.com/troubleNZ/trbl-hackerman'

client_script'client.lua'

server_script 'server.lua'

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua', -- Change to the language you want
}

dependencies {
	'qb-core',
	'third-eye',	-- your qb-target resource name
	'qb-menu',
    'mojito_dialogue',  -- comment out if not used
}