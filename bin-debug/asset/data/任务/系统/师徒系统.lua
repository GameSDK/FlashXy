luaTask.ClearTaskInfo()
i=luaTask.GetTaskLog("ʦͽϵͳ")

if as3.tolua(i)==0 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>:��ʦ��ͽ")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ȼ�Ҫ��</FONT>:ͽ��С��20����ʦ������30��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>:")
luaTask.AddTaskInfo("С��20������������û�а�ʦ������ҿ��Ժ�һλ����30������������<a href=\"event:goto\"><u><FONT COLOR=\"#0000ff\">��Ԫ����</FONT></u></a>���а�ʦ��ͽ����ͽ�ܵȼ����ڵ���30��ʱ�����Ժ�ʦ�������<a href=\"event:goto\"><u><FONT COLOR=\"#0000ff\">��Ԫ����</FONT></u></a>���г�ʦ��Ҳ���Ե���ѡ���ʦ��")
do return end
end


