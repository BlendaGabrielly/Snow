menu = {}


--primeira vez que entra no jogo
--quando esse arquivo é carregado
-- dead é false, pois o player nao foi morto ainda
local dead = false

--mas quando ele sair dessa tela
--vou dizer que ele esta morto, pois a proxima vez que entrar
--nessa tela ele vai estar morto de fato

--isso serve somente para mostrar que ele morreu no draw
function menu:leave()
    dead = true
end


function menu:draw()
    if dead then
        love.graphics.print("Voce morreu!")
    end
    love.graphics.print("\nPressione espaco para jogar")
end


function menu:keypressed(key)
    if key == 'space' then
       Gamestate.switch(jogo)
    end
end