luaTask.ClearTaskInfo()
i=luaTask.GetTaskLog("师徒系统")

if as3.tolua(i)==0 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>:拜师收徒")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">等级要求</FONT>:徒弟小于20级，师傅大于30级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>:")
luaTask.AddTaskInfo("小于20级的玩家如果还没有拜师，则玩家可以和一位大于30级的玩家组队找<a href=\"event:goto\"><u><FONT COLOR=\"#0000ff\">镇元大仙</FONT></u></a>进行拜师收徒，当徒弟等级大于等于30级时，可以和师傅组队找<a href=\"event:goto\"><u><FONT COLOR=\"#0000ff\">镇元大仙</FONT></u></a>进行出师，也可以单独选择出师。")
do return end
end


