
local talk={
{"С��","���ҷ���......"},
{"С��","��ֻ��һ����ʱ������Ϊ�Ļ��ᣬҪ�úð��գ������Σ����ս�޾��ѶԸ��ˣ�"},
{"С��","��������"}
}

local i = 1;
luaTalk.Talk(talk[i][1],talk[i][2])

function onevent(e)
	i = i+1;
	as3.trace(i)
	if talk[i] ~= nil then
		luaTalk.Talk(talk[i][1],talk[i][2])

	elseif talk[i] == nil then
		j=as3.tolua(luaTask.GetTaskLog("���Խű�"))
		as3.trace(j)
		--if j==0 then
			luaTask.RunTask("���Խű�")
		--end
		luaTalk.Hide(nil)
	end
end

luaTalk.OnTalk(onevent)

