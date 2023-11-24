sti = require "sti"
Camera = require "lib.Libs.camera"
Gamestate = require 'lib.lib.gamestate'


require 'jogo'
require 'menu'

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(menu)
end

