sti = require "sti"
mapa = sti("mapa.lua")
-- Defina as variáveis iniciais
local player = {
    x = 100,
    y = 100,
    speed = 100 -- velocidade em pixels por segundo
  }
  -- Função chamada uma vez no início do jogo
function love.load()
    local mapa = sti("mapa.lua")
    -- Configure a posição inicial do jogador no meio da tela
    player.x = love.graphics.getWidth() / 2 - 10 -- 10 é a metade da largura do jogador (20/2)
    player.y = love.graphics.getHeight() / 2 - 10 -- 10 é a metade da altura do jogador (20/2)
  end
  
  -- Função de atualização
  function love.update(dt)
    mapa:update(dt)
    -- Atualiza a posição y do jogador automaticamente
    player.y = player.y + player.speed * dt
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed * dt
      elseif love.keyboard.isDown("right") then
        player.x = player.x + player.speed * dt
      end
  end
  
  -- Função de desenho
  function love.draw()
     -- love.graphics.draw(imagem)
     mapa:draw()
    -- Desenha o jogador na tela
    love.graphics.rectangle("fill", player.x, player.y, 20, 20)
  end
  
  -- Função chamada quando uma tecla é pressionada
  function love.keypressed(key)
    -- Exemplo: se a tecla "escape" for pressionada, encerre o jogo
    if key == "escape" then
      love.event.quit()
    end
  end
  