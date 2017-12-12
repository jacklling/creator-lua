
cc.FileUtils:getInstance():setPopupNotify(false)

require "config"
require "cocos.init"

local function main()
    require("app.MyApp"):create():run()
	--    --添加测试代码
	local creatorReader = creator.CreatorReader:createWithFilename('creator/scenes/sprites/CreatorSprites.ccreator')
	creatorReader:setup()
	local scene = creatorReader:getSceneGraph()
	cc.Director:getInstance():replaceScene(scene)

end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
