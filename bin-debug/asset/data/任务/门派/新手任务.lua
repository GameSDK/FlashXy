luaTask.ClearTaskInfo()
local r=luaTask.GetTaskLog("��������")

local i = as3.tolua(r)

if i==1 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>����������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��10��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>�������������ͼ��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("��ӭ������������������㳩������ɡ�")
end
