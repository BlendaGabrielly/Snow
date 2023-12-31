sti = require "sti"
Camera = require "lib.Libs.camera"
windfield = require 'lib.windfield'

jogando = {}
cam = Camera()
cam:zoom(2)

SCREEN_WIDTH, SCREEN_HEIGHT = love.window.getMode()
WALL_SIZE = 5

mundo = windfield.newWorld(0,0)
mundo:addCollisionClass('neve')
mundo:addCollisionClass('vencer')

x = 0
y =0

mapa = sti("mapa.lua")

-- Defina as variáveis iniciais
local player = {
    x = 200,
    y = 100,
    w = 20, -- largura do jogador
    h = 20, -- altura do jogador
    speed = 150 -- velocidade em pixels por segundo
}
-- Dimensões da imagem (presumo que 'imagem' seja a imagem do jogador)
local imagem = love.graphics.newImage("/imagens/Jogador.png")

player.collider = mundo:newCircleCollider(
    player.x, player.y, 10
)
player.collider:setFixedRotation(true)
player.collider:setFriction(0)

for idx, obj in ipairs(mapa.layers['colisores'].objects) do
   local pista = mundo:newBSGRectangleCollider(
       obj.x,
       obj.y,
       obj.width,
        obj.height, 5
    )
    pista:setType('static')
    pista:setFriction(0)
end

for idx, obj in ipairs(mapa.layers['obstaculos'].objects) do
    local obst = mundo:newBSGRectangleCollider(
        obj.x,
        obj.y,
        obj.width,
         obj.height, 5
     )
     obst:setType('static')
     obst:setFriction(0)
     obst:setCollisionClass('neve')
 end

 for idx, obj in ipairs(mapa.layers['chegada'].objects) do
    local chegada = mundo:newBSGRectangleCollider(
        obj.x,
        obj.y,
        obj.width,
         obj.height, 5
     )
     chegada:setType('static')
     chegada:setFriction(0)
     chegada:setCollisionClass('vencer')
 end

-- Dimensões do mapa
local larguraDoMapa = 1000
local alturaDoMapa = 600

-- Dimensões da tela
local SCREEN_WIDTH, SCREEN_HEIGHT = love.window.getMode()

-- Função chamada uma vez no início do jogo
function jogando:enter()
     
    -- Configure a posição inicial do jogador no meio da tela
    player.collider:setX(240)
    player.collider:setY (100)

    -- Configura as dimensões do mapa para a escala correta
    local escalaX = larguraDoMapa / SCREEN_WIDTH
    local escalaY = alturaDoMapa / SCREEN_HEIGHT

    musica:play()
end


-- Função de atualização
function jogando:update(dt)
    local vx, vy = 0, player.speed
    
    --if not love.audio.isPlaying(musica) then
       -- love.audio.play(musica)
   -- end
    player.x, player.y = player.collider:getPosition()
    if love.keyboard.isDown("left") then
        print("Tecla left pressionada")
        vx = -player.speed
    elseif love.keyboard.isDown("right") then
        print("Tecla right pressionada")
        vx = player.speed
    -- Ajusta a câmera para seguir o jogador
    end

    if player.collider:enter('neve') then
       --love.event.quit()
        dead=true
        --jogo.stop()
        musica:stop()
        derrota:play()
        Gamestate.switch(menu)

    elseif player.collider:enter('vencer') then
        dead = false
        vitoria=true
        musica:stop()
        Gamestate.switch(menu)
        vity:play()
    end
    player.collider:setLinearVelocity(vx, vy)
    mundo:update(dt)
   -- local x, y = player:getPosition()
    cam:lookAt(200, player.y)
  end

-- Função de desenho
function jogando:draw()
    cam:attach()
    mapa:drawLayer(mapa.layers['base'])
    mapa:drawLayer(mapa.layers['pista'])
    mapa:drawLayer(mapa.layers['enfeites'])
    mapa:drawLayer(mapa.layers['obstaculos desenho'])

   -- mundo:draw()

    -- Desenha o jogador na tela
    love.graphics.draw(imagem, player.x, player.y, 0, 1, 1, player.w/2, player.h/2)


    cam:detach()
end

