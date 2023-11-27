menu = {}


--primeira vez que entra no jogo
--quando esse arquivo é carregado
-- dead é false, pois o player nao foi morto ainda
dead = false
vitoria=false
menuSnow = love.graphics.newImage("/imagens/menu.png")
ganhouimg = love.graphics.newImage("/imagens/ganhou.png")
perdeu_img = love.graphics.newImage("/imagens/perdeu.png")
--mas quando ele sair dessa tela
--vou dizer que ele esta morto, pois a proxima vez que entrar
--nessa tela ele vai estar morto de fato

--isso serve somente para mostrar que ele morreu no draw
function menu:leave()
    dead = true
end


function menu:draw()
    if dead then
        love.graphics.draw(perdeu_img, 0, 0, 0, 1.17)
        return
    end 
    
    if vitoria then
        love.graphics.draw(ganhouimg, 0, 0, 0, 1.17)
        return
    end
     --love.graphics.print(SCREEN_WIDTH)
    love.graphics.draw(menuSnow, 0, 0, 0, 1.17)
    
end
function menu:keypressed(key)
    if key == 'space' then
       Gamestate.switch(jogando)
    end
end