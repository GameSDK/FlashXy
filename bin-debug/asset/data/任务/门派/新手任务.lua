luaTask.ClearTaskInfo()
local r=luaTask.GetTaskLog("新手任务")

local i = as3.tolua(r)

if i==1 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：游历世界")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：10级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：游历世界各地图。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("欢迎来到这里，让我来带领你畅游世界吧。")
end
