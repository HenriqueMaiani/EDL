function love.load()
    timer = 0
    timer2 = 0.6
    timer3 = 0.3
    jogador1_largura=100
    jogador1_altura=20
    jogador1_x = 0
	
	-- Nome: variável "jogador1_x"
	-- Propriedade: endereço
	-- Binding time: execução
	-- Explicação: é uma variável local logo seu endereço só é determinado em tempo de execução.
	
    jogador1_y = 500
    jogador2_largura=100
    jogador2_altura=20
    jogador2_x = 700
    jogador2_y = 500
    listaDeCirculos = {}
    teveColisao = false
    pontos1 = 0
    pontos2 = 0
    i=0
    paused = false;
    menu = true;
    players = 0;
	
	-- Nome: variável "players"
	-- Propriedade: endereço
	-- Binding time: compilação
	-- Explicação: "players" é uma variável global, logo o endereço é pré determinado em tempo de compilação.
	
    gameOver = false;
end
 
function love.focus(b)
    if not b then
        paused = true
    end
end
 	-- Nome: palavra reservada "end"
	-- Propriedade: estrutura de decisão
	-- Binding time: design da linguagem
	-- Explicação: no desenvolvimento do design da linguagem ficou decidido que a palavra reservada 'end' definiria o fim do bloco de decisão.
 
function love.update(dt)

	-- Nome: "love.update(dt)"
	-- Propriedade: endereço
	-- Binding time: execução
	-- Explicação: "love.update(dt)"  é uma variável local logo seu endereço é definido em tempo de execução.
	
    if not paused then
        if players == 0 and menu == true then
            if love.keyboard.isDown("1") then
                players = 1
                menu = false
            elseif love.keyboard.isDown("2") then
			
				-- Nome: palavra reservada 'elseif'
				-- Propriedade: estrutura de decisão
				-- Binding time: design da linguagem
				-- Explicação: no desenvolvimento do design da linguagem ficou decidido que a palavra reservada 'elseif' iria para para esse bloco de decisão caso não fosse satisfeira a codição do "if"
	
                players = 2
                menu = false
            end
        end
        if players == 1 and menu == false then -- JOGANDO COM UM JOGADOR !!
            timer = timer + dt
            timer2 = timer2 - dt
            if love.keyboard.isDown("d") then -- pega a entrada do teclado e faz os movimentos do jogador 1
                if jogador1_x < (love.graphics.getWidth() -100 ) then
                    jogador1_x = jogador1_x + 750 * dt
                end
            elseif love.keyboard.isDown("a") then
                if jogador1_x > 0 then
                    jogador1_x = jogador1_x  - 750 * dt
                end
           
            end
 
            for i,v in ipairs (listaDeCirculos) do
                v.y = v.y + v.velocidade*0.75 * dt 
       
                teveColisao= testaColisao (jogador1_x, jogador1_y, jogador1_largura, jogador1_altura, v.x, v.y,v.largura,v.altura)
                if teveColisao == true then
                    pontos1 = pontos1 +1
                    table.remove(listaDeCirculos,i)
                end
                if v.y >= 800 then
                    timer = timer + 0
					
					-- Nome: operador "+"
					-- Propriedade: semântica
					-- Binding time: compilação
					-- Explicação: a instrução de adição é definida em tempo de compilação (dependendo dos tipos de operandos)
					
                    players = 0
                    gameOver = true
                end
            end
            if timer2 <= 0 then
                table.insert (listaDeCirculos, criaCirculo())
                timer2 = 0.6
            end
           
            if timer3 <= 0 then
                table.insert (listaDeCirculos, criaCirculo())
                timer3 = 0.3
            end
        elseif players == 2 and menu == false then -- JOGANDO COM DOIS JOGADORES !!!
            timer = timer + dt
            timer2 = timer2 - dt
            if love.keyboard.isDown("d") then -- pega a entrada do teclado e faz os movimentos do jogador 1
                if jogador1_x < (love.graphics.getWidth() -100 ) and (jogador1_x+100)<jogador2_x then
                    jogador1_x = jogador1_x + 750 * dt
                end
            elseif love.keyboard.isDown("a") then
                if jogador1_x > 0 then
                    jogador1_x = jogador1_x  - 750 * dt
                end
           
            end
 
            if love.keyboard.isDown("right") then -- pega a entrada do teclado e faz os movimentos do jogador 2
                if jogador2_x < (love.graphics.getWidth() -100 ) then
                    jogador2_x = jogador2_x + 750 * dt
                end
            elseif love.keyboard.isDown("left") then
                if jogador2_x > 0 and (jogador2_x>(jogador1_x+100)) then
                    jogador2_x = jogador2_x  - 750 * dt
                end
            end
           
            for i,v in ipairs (listaDeCirculos) do
                v.y = v.y + v.velocidade*1.5 * dt  
           
                teveColisao= testaColisao (jogador1_x, jogador1_y, jogador1_largura, jogador1_altura, v.x, v.y,v.largura,v.altura)
                if teveColisao == true then
                    table.remove(listaDeCirculos,i)
                end
               
                teveColisao= testaColisao (jogador2_x, jogador2_y, jogador2_largura, jogador2_altura, v.x, v.y,v.largura,v.altura)
                if teveColisao == true then
                    table.remove(listaDeCirculos,i)
                end
 
                if v.y >= 800 then
                    timer = timer + 0
                    players = 0
                    gameOver = true
                end
            end
            if timer2 <= 0 then
                table.insert (listaDeCirculos, criaCirculo())
                timer2 = 0.6
            end
           
            if timer3 <= 0 then
                table.insert (listaDeCirculos, criaCirculo())
                timer3 = 0.3
            end
        end
    end
end
 
function love.draw()
    if  menu == true then
        love.graphics.print('1 Jogador     - Pressione 1', 200, 150,0,2.5)
        love.graphics.print('2 Jogadores - Pressione 2', 200, 200,0,2.5)
        love.graphics.print('Controles :', 50,350,0,1)
        love.graphics.print('Jogador 1 - A e D', 50,400,0,1)
        love.graphics.print('Jogador 2 - Esquerda e Direita', 50, 425,0,1)
        love.graphics.print('Pause - ESC', 50, 450,0,1)
        love.graphics.print('Gerar nova pedra - ESPAÇO', 50, 475,0,1)
 
       
    elseif gameOver == false then
        if paused then
            love.graphics.print('Jogo Pausado', 200, 200,0,5)
        else
            if players == 1 then
                love.graphics.print("Tempo:".. timer,300,10,0,1.5)
                for i,v in ipairs (listaDeCirculos) do
                    love.graphics.circle ("fill",v.x,v.y,v.largura,v.altura)
                end
 
                love.graphics.rectangle ("fill",jogador1_x,jogador1_y,jogador1_largura,jogador1_altura)
               
            elseif players == 2 then
                love.graphics.print("Tempo:".. timer,300,10,0,1.5)
 
                for i,v in ipairs (listaDeCirculos) do
                    love.graphics.circle ("fill",v.x,v.y,v.largura,v.altura)
                end
                love.graphics.rectangle ("fill",jogador1_x,jogador1_y,jogador1_largura,jogador1_altura) --  (posição jogador1_x, posição jogador1_y, largura,altura)
                love.graphics.rectangle ("fill",jogador2_x,jogador2_y,jogador2_largura,jogador2_altura) --  (posição jogador2_x, posição jogador2_y, largura,altura)
            end
        end
    elseif gameOver == true and players == 0 then
        love.graphics.print('Fim de jogo', 200, 200,0,5)
        love.graphics.print('Seu record:'.. timer, 100, 300,0,3)
    end
end
function love.keypressed(key)  
 
    if key == "escape" then
        paused = not paused
    end
 
    if key == "space" then
        table.insert (listaDeCirculos, criaCirculo())
    end
 
end
 
 
function testaColisao (x1, y1, largura1, altura1, x2, y2,largura2, altura2)
 
     if x2+ largura2 < x1 then
       return false
     end
     
     if  x2 > x1 + largura1 then
       return false
     end
 
    if y2 + altura2 < y1 then
     return false
    end
 
    if y2 > y1 + altura1 then
     return false
    end
 
    return true
   
end
 
function criaCirculo() --a função retorna os parametros do circulo
    circulo = {}
    circulo.x = math.random (0,800)
    circulo.y = 10
    circulo.largura = 5
    circulo.altura = 5
    circulo.velocidade = 350
    return circulo
   
end
