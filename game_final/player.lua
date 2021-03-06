require("AnAL")
local Char = {}
Char.__index = Char

function newChar(speed, charWidth, charHeight,rightImgFilename, leftImgFilename,winWidth, winHeight )
    local a={}
    a.speed = speed
    a.widthImg = charWidth
    a.heightImg = charHeight
    a.rightImg = love.graphics.newImage(rightImgFilename)
    a.leftImg = love.graphics.newImage(leftImgFilename)
    a.charAnimationRight = newAnimation(a.rightImg, a.widthImg, a.heightImg, 0.2, 0)
    a.charAnimationLeft = newAnimation(a.leftImg, a.widthImg, a.heightImg, 0.2, 0)
    a.charAnimation = a.charAnimationLeft
    a.charAnimation:seek(2)
    a.winWidth = winWidth
    a.WinHeight = winHeight
    a.lastdt = 0
    a.curX = 0
    a.curY = winHeight
    a.dir = nil
    a.move = false

    return setmetatable(a, Char)

end
function Char:keypressed(key, scancode, isrepeat)
    if key == "right" then
        self.dir = key
        self.move = true
        self.charAnimation:update(self.lastdt * dt)
        self.charAnimation = self.charAnimationRight
    end
    if key == "right" then
        self.dir = key
        self.move = true
        self.charAnimation:update(self.lastdt * dt)
        self.charAnimation = self.charAnimationRight
    end
end  
function Char:keyreleased(key)

end 
function Char:update(dt)
    self.last = dt
    if self.move == true then
        if self.dir =="right" then
            self.curX = self.curX + self.speed
        elseif self.dir =="left" then
            self.curX = self.curX - self.speed
        end
    end

end 
function Char:draw()
    self.charAnimation:draw(self.curX,self.curY - self.heightImg)
end