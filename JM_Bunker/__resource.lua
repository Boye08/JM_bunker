resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

author 'JUST ME / justme1108 / philip'
description 'Lavet til NikeRP fordi jeg kedet mig'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
}

lua54 'yes'

client_scripts {
    "lib/Proxy.lua",
    "config.lua",
    "client/*.lua"
}

server_scripts {
    '@vrp/lib/utils.lua',
    "config.lua",
    "server/*.lua"
}