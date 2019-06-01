--[[
    USAGE:

    Element = {text = "text", image = "/ai/ai.png"} or "text name"

    LuaTable pieMenu(List<Element> list, String callbackScript, [Json parameters])
    
    local newPie = pieMenu(...)

        Json newPie.config
        List<Element> newPie.list
        String newPie.callbackScript
        Void newPie:open()



    callbackScript must have this: function callback(index, element, parameters) end
]]


function pieMenu(list, callbackScript, parameters)
    local new = {}
    new.config = root.assetJson("/pieMenu/ui/main.window")

    new.config.callbackScript = callbackScript
    new.config.list = list or jarray()
    new.config.parameters = list or jarray()

    function new:open()
        player.interact("ScriptPane", self.config)
    end

    return new
end