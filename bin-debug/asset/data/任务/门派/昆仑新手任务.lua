luaTask.ClearTaskInfo()
i=luaTask.GetTaskLog("������������")
as3.trace(as3.tolua(i))
if as3.tolua(i)==0 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ��Ϲ�")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>����ȡ<HL=1,1,1,0,0,0,0,0,0>�������</HL>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("��ӭ�������أ���������֮һ��Ư����<HL=0>�Ϲ�</HL>ʦ�����ڵ�����ȥ�����أ����<HL=0>�Ϲ�</HL>�����ּ����Զ��ߵ�����ߡ�")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>�Ϲ�</HL>��<CL=255,0,0>δ�Ի�</FONT>")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>5</FONT>")
luaTask.AddTaskInfo("��Ʒ������<HL=1,1,1,0,0,0,0,0,0>�������</HL>")
do return end
end

if as3.tolua(i)==1 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ��Ϲ�")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>����ȡ<HL=1,1,1,0,0,0,0,0,0>�������</HL>��ѧϰ�Զ�Ѱ·��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("��ӭ�������أ���������֮һ��Ư����<HL=0>�Ϲ�</HL>ʦ�����ڵ�����ȥ�����أ����<HL=0>�Ϲ�</HL>�����ּ����Զ��ߵ�����ߡ�")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>�Ϲ�</HL>��<CL=255,0,0>δ�Ի�</FONT>","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>5</FONT>")
luaTask.AddTaskInfo("��Ʒ������<HL=1,1,1,0,0,0,0,0,0>�������</HL>")
do return end
end

if as3.tolua(i)==2 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ�����")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>����ȡ<CL=255,0,0>����װ��</FONT>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("��������֮һ<HL=0>����</HL>�и�������Ҫ�͸��㣬���<HL=0>����</HL>�����ּ����Զ��ߵ�����ߡ�")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>����</HL>��<CL=255,0,0>δ�Ի�</FONT>","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>10</FONT>")
if GetSex()==0 then
luaTask.AddTaskInfo("��Ʒ������<HL=1,1,1,1,1,0,1,4194305,0>��Ӱ��</HL>��<HL=1,1,1,1,1,0,1,4194305,0>���ս��</HL>")
else
luaTask.AddTaskInfo("��Ʒ������<HL=1,1,1,1,1,0,1,4194305,0>������</HL>��<HL=1,1,1,1,1,0,1,4194305,0>�������</HL>")
end
do return end
end

if as3.tolua(i)==3 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��װ���������͵�����")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰ<CL=255,0,0>ʹ��װ��</FONT>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("��<HL=0>����</HL>���͸��������װ���ϣ���E���򿪰�����ʹ������Ҽ������Ʒʹ�ü����Զ�װ������A�����ɲ鿴����װ����Ȼ���ٵ��<HL=0>����</HL>�Ի���")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>����</HL>��<CL=255,0,0>δ�Ի�</FONT>","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>30</FONT>")
do return end
end

if as3.tolua(i)==4 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ�����")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰ<CL=255,0,0>Ǳ�ܼӵ�</FONT>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("�ҵ�<HL=0>����</HL>ѧϰǱ�ܼӵ㷽������A���鿴��ɫ���ԣ�Ȼ���ٵ��<HL=0>����</HL>�Ի���")
luaTask.AddTaskInfo("1��<FONT COLOR=\"#ffff00\">����</FONT>��������<FONT COLOR=\"#ffff00\">�ջ����շ����𹥡����</FONT>��1�㡣")
luaTask.AddTaskInfo("1��<FONT COLOR=\"#ffff00\">����</FONT>��������<FONT COLOR=\"#ffff00\">���С����ܡ�ľ����ľ��</FONT>��1�㡣")
luaTask.AddTaskInfo("1��<FONT COLOR=\"#ffff00\">����</FONT>��������<FONT COLOR=\"#ffff00\">���С��չ�������������</FONT>��1�㡣")
luaTask.AddTaskInfo("1��<FONT COLOR=\"#ffff00\">����</FONT>��������10��<FONT COLOR=\"#ffff00\">����</FONT>��<FONT COLOR=\"#ffff00\">���ܡ��շ����𹥡����</FONT>��1�㡣")
luaTask.AddTaskInfo("1��<FONT COLOR=\"#ffff00\">����</FONT>��������10��<FONT COLOR=\"#ffff00\">����</FONT>��<FONT COLOR=\"#ffff00\">���ܡ��շ���ˮ����ˮ��</FONT>��1�㡣")
luaTask.AddTaskInfo("ϴ�����ȥ��<HL=0>����</HL>��<HL=0>̫���Ͼ�</HL>������ʹ����Ʒ<HL=1,1,1,0,0,0,0,0,0>ϴ�ľ�</HL>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>����</HL>��<CL=255,0,0>δ�Ի�</FONT>","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>40</FONT>")
end

if as3.tolua(i)==5 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ�����")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰ<CL=255,0,0>Ǳ�ܼӵ�</FONT>������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("��A���򿪽�ɫ���Խ��棬��Ǳ�ܵ������Ϻ�Ȼ���ٵ��<HL=0>����</HL>�Ի���")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>����</HL>��<CL=255,0,0>δ�Ի�</FONT>","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>60</FONT>")
do return end
end

if as3.tolua(i)==6 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ�����")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰ<CL=255,0,0>���ɼ���</FONT>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("ȥ��ʦ��<HL=0>����</HL>�Ի���ѧϰ�����ɼ��ܡ�")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>����</HL>��<CL=255,0,0>δ�Ի�</FONT>","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>80</FONT>")
do return end
end

if as3.tolua(i)==7 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ�����")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰ<CL=255,0,0>ʹ�ü���</FONT>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("ʹ��<HL=0>����</HL>�̸���ļ��ܣ���Ϥ�����ɼ��ܡ�ѧ�������<HL=0>����</HL>�Ի���")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>����</HL>��<CL=255,0,0>δ�Ի�</FONT>","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>120</FONT>")
do return end
end

if as3.tolua(i)==8 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ�����")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰ<CL=255,0,0>���ܼӵ�</FONT>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("����<HL=0>����</HL>˵�ģ���ѧ��ļ��ܼӵ㡣ѧ�������<HL=0>����</HL>�Ի���")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>����</HL>��<CL=255,0,0>δ�Ի�</FONT>","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>160</FONT>")
do return end
end

if as3.tolua(i)==9 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ�����")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰ<CL=255,0,0>����ʹ��</FONT>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("����<HL=0>����</HL>˵�ģ���ѧ��ļ��ܷŵ��������ѧ�������<HL=0>����</HL>�Ի���")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>����</HL>��<CL=255,0,0>δ�Ի�</FONT>","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>200</FONT>")
do return end
end

if as3.tolua(i)==10 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ�����")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰ<CL=255,0,0>����ʹ��</FONT>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("��ɽ�ϵ�<HL=0>ѩ��</HL>��ϰһ����ѧ�ļ��ܣ��������<HL=0>����</HL>�Ի���")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
num=as3.tolua(luaTask.GetKillNpc("������������","ѩ��"))
if num<10 then
luaTask.AddTaskInfo("<HL=0>ѩ��</HL>��<CL=255,0,0>"..num.."/10","������������")
else
luaTask.AddTaskInfo("<HL=0>ѩ��</HL>��<CL=0,255,0>"..num.."/10","������������")
end
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>220</FONT>")
do return end
end

if as3.tolua(i)==11 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ���΢")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰ<CL=255,0,0>�Ṧ</FONT>��Ծ��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("�ҵ�<HL=0>��΢</HL>��������Ṧ��Ծ�ļ��ɡ�")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>��΢</HL>��<CL=255,0,0>δ�Ի�</FONT>","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>240</FONT>")
do return end
end

if as3.tolua(i)==12 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ���΢")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰ<CL=255,0,0>�Ṧ</FONT>��Ծ��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("��<HL=0>��΢</HL>Ҫ����ϰһ���Ṧ������Ҽ�����յأ�����������̲ɼ����ڿ�ļ��ɡ�")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>��΢</HL>��<CL=255,0,0>δ�Ի�</FONT>","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>260</FONT>")
do return end
end

if as3.tolua(i)==13 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ���΢")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰ<CL=255,0,0>�ɼ�</FONT>���ɡ�")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("����<HL=0>��΢</HL>Ҫ��ȥɽ�ϲɼ�һ��<HL=0>��֥</HL>����������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
if GetItem("��֥")>0 then
luaTask.AddTaskInfo("<HL=0>��֥</HL>��<CL=0,255,0>1/1</FONT>","������������")
else
luaTask.AddTaskInfo("<HL=0>��֥</HL>��<CL=255,0,0>0/1</FONT>","������������")
end
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>280</FONT>")
do return end
end

if as3.tolua(i)==14 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ���΢")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰ<CL=255,0,0>�ڿ�</FONT>���ɡ�")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("����<HL=0>��΢</HL>Ҫ��ȥɽ��<HL=0>����</HL>��һ���������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
if GetItem("����")>0 then
luaTask.AddTaskInfo("<HL=0>����</HL>��<CL=0,255,0>1/1</FONT>","������������")
else
luaTask.AddTaskInfo("<HL=0>����</HL>��<CL=255,0,0>0/1</FONT>","������������")
end
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>300</FONT>")
do return end
end

if as3.tolua(i)==15 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ���ϼ")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰ<CL=255,0,0>����</FONT>�ָ���")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("ȥ<HL=0>��ϼ</HL>ʦ�㴦ѧϰ�����ָ������ͷ�����")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>��ϼ</HL>��<CL=255,0,0>δ�Ի�</FONT>","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>320</FONT>")
do return end
end

if as3.tolua(i)==16 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ���ϼ")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰ<CL=255,0,0>����</FONT>�ָ���")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("����<HL=0>��ϼ</HL>������<CL=255,0,0>[��Z��]</FONT>���д������ָ��������ͷ�����")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>��ϼ</HL>�������ָ���������","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("��Ʒ������<HL=1,10,1,0,0,0,0,0,0,0>����ˮ</HL>,<HL=1,10,1,0,0,0,0,0,0,0>����ˮ</HL>")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>340</FONT>")
do return end
end

if as3.tolua(i)==17 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ���ϼ")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰ<CL=255,0,0>ҩ��</FONT>�ָ���")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("ʹ��<HL=0>��ϼ</HL>���͵�ҩ��<HL=1,10,1,0,0,0,0,0,0,0>����ˮ</HL>��<HL=1,10,1,0,0,0,0,0,0,0>����ˮ</HL>���ָ��������ͷ�����")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>��ϼ</HL>��ҩ��ָ���������","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>360</FONT>")
do return end
end

if as3.tolua(i)==18 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ�����")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰʹ��<CL=255,0,0>���ͷ�</FONT>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("�ݷ�<HL=0>����</HL>ʦ�֣�ѧϰʹ�ô��ͷ���")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>����</HL>��<CL=255,0,0>δ�Ի�</FONT>","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("��Ʒ������<HL=1,1,1,0,0,0,0,0,0,0>���ش��ͷ�</HL>")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>380</FONT>")
do return end
end

if as3.tolua(i)==19 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ�����")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰʹ��<CL=255,0,0>���ͷ�</FONT>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("����<HL=0>����</HL>ʦ�ֵ�Ҫ��ʹ��<HL=1,1,1,0,0,0,0,0,0,0>���ش��ͷ�</HL>ȥ<HL=0>�����</HL>�ɼ�һ��<HL=0>�����Ĳ�</HL>������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
if GetItem("�����Ĳ�")==0 then
luaTask.AddTaskInfo("<HL=0>�����Ĳ�</HL>��<CL=255,0,0>0/1</FONT>","������������")
else
luaTask.AddTaskInfo("<HL=0>�����Ĳ�</HL>��<CL=0,255,0>1/1</FONT>","������������")
end
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>400</FONT>")
do return end
end

if as3.tolua(i)==20 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ÷�ʥ")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰ���<CL=255,0,0>���</FONT>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("�ݷ�������ʥ֮һ��<HL=0>��ʥ</HL>��������������ӡ�")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>��ʥ</HL>��<CL=255,0,0>δ�Ի�</FONT>","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>420</FONT>")
do return end
end

if as3.tolua(i)==21 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ÷�ʥ")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰ���<CL=255,0,0>���</FONT>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("����<HL=0>��ʥ</HL>��Ҫ��ȥ�齨һ������,Ȼ���������<HL=0>��ʥ</HL>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>��ʥ</HL>���齨����","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>440</FONT>")
do return end
end

if as3.tolua(i)==22 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ���ʥ")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰ���<CL=255,0,0>����</FONT>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("�ݷ�������ʥ֮һ��<HL=0>��ʥ</HL>��ѧϰ��ν��ѡ�")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>��ʥ</HL>��<CL=255,0,0>δ�Ի�</FONT>","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>520</FONT>")
do return end
end

if as3.tolua(i)==23 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ���ʥ")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰ���<CL=255,0,0>����</FONT>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("����<HL=0>��ʥ</HL>��˵���Ҽ���������ˣ�ѡ��һ�������ĺ���,Ȼ���������<HL=0>��ʥ</HL>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>��ʥ</HL>����1������","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>540</FONT>")
do return end
end

if as3.tolua(i)==24 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ���ʥ")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰʹ��<CL=255,0,0>�ʼ�</FONT>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("�ݷ�<HL=0>��ʥ</HL>������ѧϰ���ʹ���ʼ���")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>��ʥ</HL>��<CL=255,0,0>δ�Ի�</FONT>","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>560</FONT>")
do return end
end

if as3.tolua(i)==25 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ���ʥ")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰʹ��<CL=255,0,0>�ʼ�</FONT>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("����<HL=0>��ʥ</HL>��������ʼ�����ȡ�����<HL=1,1,1,0,0,0,0,0,0,0>�ر�ͼ</HL>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
if GetItem("�ر�ͼ")>0 then
luaTask.AddTaskInfo("�ر�ͼ��<CL=0,255,0>1/1</FONT>","������������")
else
luaTask.AddTaskInfo("�ر�ͼ��<CL=255,0,0>0/1</FONT>","������������")
end
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>580</FONT>")
do return end
end

if as3.tolua(i)==26 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ�ȼ�Ƶ���")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>��ѧϰʹ��<CL=255,0,0>�ɵ�</FONT>��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("�ݼ���������<HL=0>ȼ�Ƶ���</HL>������͸����ɵ������������С�")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("<HL=0>ȼ�Ƶ���</HL>��<CL=255,0,0>δ�Ի�</FONT>","������������")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("��Ʒ������<HL=1,3,1,0,0,0,0,0,0,0>�ɵ�</HL>��<CL=0,255,0>��ɫ3������</FONT>��<CL=0,255,0>��ɫ3�ǳ���</FONT>")
luaTask.AddTaskInfo("���齱����<CL=0,255,0>1000</FONT>")
luaTask.AddTaskInfo("����������<FONT COLOR=\"#ffff00\">10</FONT>")
do return end
end

if as3.tolua(i)==27 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>���ݷ�ȼ�Ƶ���")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">�ɽӵȼ�</FONT>��1��")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">����Ŀ��</FONT>���Ѿ����")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">��������</FONT>��")
luaTask.AddTaskInfo("������������<HL=0>ȼ�Ƶ���</HL>�͸����ɵ����԰��������У���<HL=0>�ٻ�����</HL>�����˽��Լ���ǰ��������<HL=0>�Ϲ�</HL>������һ����������")
luaTask.AddTaskInfo("�кܶ������������ѡ��μӣ��������<HL=0>��������</HL>�˽Ⲽʩ���»�ͷ���������<HL=0>�౦����</HL>�˽�ر���ͼ�����˱�������޶�̽�ػ����<HL=0>������</HL>�μ�֪ʶ�ʴ�����<HL=0>������</HL>�μӷ�ħ�Թ������<HL=0>�����</HL>ѡ�������Լ��������壬��<HL=0>�깫��</HL>�μӼ�����䡢�����ħ�ͼ�������������<HL=0>��Ԫ����</HL>�˽��ʦ��ͽ��̽����ħ�����")
luaTask.AddTaskInfo("�����Ҫ�������������ȥ��<HL=0>����</HL>��<HL=0>��΢</HL>��ȡ������ħ���񼰲ɼ�������ɺ���Ի��һ�ݲ���ĳ��͡�")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">������</FONT>��")
luaTask.AddTaskInfo("���������Ѿ�ȫ�����")
do return end
end
