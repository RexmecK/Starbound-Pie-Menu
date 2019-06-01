--[[
    USAGE:

    Element = {text = "text", image = "/ai/ai.png"} or "text name"

    LuaTable pie(List<Element> list, String callbackScript, [Json parameters])
    
    local newPie = pie(...)

        Json newPie.config
        List<Element> newPie.list
        String newPie.callbackScript
        Void newPie:open()



    callbackScript must have this: function callback(index, element, parameters) end
]]


function pie(list, callbackScript, parameters)
    local new = {}
    new.config = root.assetJson("/pie/ui/main.window")

    new.config.callbackScript = callbackScript
    new.config.list = list or jarray()
    new.config.parameters = list or jarray()

    function new:open()
        player.interact("ScriptPane", self.config)
    end

    return new
end