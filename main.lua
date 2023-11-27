sti = require "sti"
Camera = require "lib.Libs.camera"
Gamestate = require 'lib.lib.gamestate'

musica=love.audio.newSource('/music/Make It Happen.mp3',"stream")
vity=love.audio.newSource('/music/victory.mp3',"stream")
derrota=love.audio.newSource('/music/perdeu.mp3',"stream")



require 'jogo'
require 'menu'


function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(menu)
end

