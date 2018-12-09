require ("objeto")
require ("ground")
require("player")
    local char = newChar(4,99,97,"imagens/player_run1.png","imagens/player_run.png", love.graphics.getWidth(), love.graphics.getHeight() )
function love.load()
    love.physics.setMeter(64)
    world = love.physics.newWorld(0, 9.81 * 64)--dimensões do shap, (9.81*64) é a gravidade
    ball1 = newBall(world,320,1)
    ball2 = newBall(world,500,1)
    ground = newGround(world, 800/2, 600-50/2, 800, 50)
    ground2 = newGround(world,0 ,600/2 , 50, 600)
end

function love.keypressed(key, scancode, isrepeat)
    char:keypressed(key, scancode, isrepeat)
end
function love.keypressed(key)
    char:keypressed(key)
end


function love.update(dt)
    world:update(dt)
    char:update(dt)
    --ball1:update()
    --ball2:update()
end

function love.draw()
    char:draw()
    ground:draw()
    ground2:draw()
    ball1:draw()
    ball2:draw()
end