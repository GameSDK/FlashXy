
local talk={
{"小虎","看我法术......"},
{"小虎","你只有一次暂时提升修为的机会，要好好把握！错过这次，洪荒战兽就难对付了！"},
{"小虎","接受任务！"}
}

local i = 1;
luaTalk.Talk(talk[i][1],talk[i][2])

function onevent(e)
	i = i+1;
	as3.trace(i)
	if talk[i] ~= nil then
		luaTalk.Talk(talk[i][1],talk[i][2])

	elseif talk[i] == nil then
		j=as3.tolua(luaTask.GetTaskLog("测试脚本"))
		as3.trace(j)
		--if j==0 then
			luaTask.RunTask("测试脚本")
		--end
		luaTalk.Hide(nil)
	end
end

luaTalk.OnTalk(onevent)

