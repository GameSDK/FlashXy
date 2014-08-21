luaTask.ClearTaskInfo()
i=luaTask.GetTaskLog("昆仑新手任务")
as3.trace(as3.tolua(i))
if as3.tolua(i)==0 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访紫光")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：领取<HL=1,1,1,0,0,0,0,0,0>新手礼包</HL>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("欢迎来到昆仑，昆仑七紫之一，漂亮的<HL=0>紫光</HL>师姐正在等着你去报到呢，点击<HL=0>紫光</HL>的名字即可自动走到她身边。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>紫光</HL>：<CL=255,0,0>未对话</FONT>")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>5</FONT>")
luaTask.AddTaskInfo("物品奖励：<HL=1,1,1,0,0,0,0,0,0>新手礼包</HL>")
do return end
end

if as3.tolua(i)==1 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访紫光")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：领取<HL=1,1,1,0,0,0,0,0,0>新手礼包</HL>，学习自动寻路。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("欢迎来到昆仑，昆仑七紫之一，漂亮的<HL=0>紫光</HL>师姐正在等着你去报到呢，点击<HL=0>紫光</HL>的名字即可自动走到她身边。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>紫光</HL>：<CL=255,0,0>未对话</FONT>","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>5</FONT>")
luaTask.AddTaskInfo("物品奖励：<HL=1,1,1,0,0,0,0,0,0>新手礼包</HL>")
do return end
end

if as3.tolua(i)==2 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访紫星")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：领取<CL=255,0,0>新手装备</FONT>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("昆仑七紫之一<HL=0>紫星</HL>有个见面礼要送给你，点击<HL=0>紫星</HL>的名字即可自动走到他身边。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>紫星</HL>：<CL=255,0,0>未对话</FONT>","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>10</FONT>")
if GetSex()==0 then
luaTask.AddTaskInfo("物品奖励：<HL=1,1,1,1,1,0,1,4194305,0>虎影刀</HL>，<HL=1,1,1,1,1,0,1,4194305,0>天罡战铠</HL>")
else
luaTask.AddTaskInfo("物品奖励：<HL=1,1,1,1,1,0,1,4194305,0>雷鸣刀</HL>，<HL=1,1,1,1,1,0,1,4194305,0>灰铁软甲</HL>")
end
do return end
end

if as3.tolua(i)==3 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：装备紫星赠送的礼物")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习<CL=255,0,0>使用装备</FONT>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("把<HL=0>紫星</HL>赠送给你的礼物装备上，按E键打开包裹，使用鼠标右键点击物品使用即可自动装备，按A键即可查看属性装备，然后再点击<HL=0>紫星</HL>对话。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>紫星</HL>：<CL=255,0,0>未对话</FONT>","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>30</FONT>")
do return end
end

if as3.tolua(i)==4 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访紫明")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习<CL=255,0,0>潜能加点</FONT>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("找到<HL=0>紫明</HL>学习潜能加点方法，按A键查看角色属性，然后再点击<HL=0>紫明</HL>对话。")
luaTask.AddTaskInfo("1点<FONT COLOR=\"#ffff00\">力量</FONT>可以增加<FONT COLOR=\"#ffff00\">普击、普防、金攻、金防</FONT>各1点。")
luaTask.AddTaskInfo("1点<FONT COLOR=\"#ffff00\">敏捷</FONT>可以增加<FONT COLOR=\"#ffff00\">命中、闪避、木攻、木防</FONT>各1点。")
luaTask.AddTaskInfo("1点<FONT COLOR=\"#ffff00\">智力</FONT>可以增加<FONT COLOR=\"#ffff00\">命中、普攻、土攻、土防</FONT>各1点。")
luaTask.AddTaskInfo("1点<FONT COLOR=\"#ffff00\">精神</FONT>可以增加10点<FONT COLOR=\"#ffff00\">法力</FONT>及<FONT COLOR=\"#ffff00\">闪避、普防、火攻、火防</FONT>各1点。")
luaTask.AddTaskInfo("1点<FONT COLOR=\"#ffff00\">体质</FONT>可以增加10点<FONT COLOR=\"#ffff00\">生命</FONT>及<FONT COLOR=\"#ffff00\">闪避、普防、水攻、水防</FONT>各1点。")
luaTask.AddTaskInfo("洗点可以去找<HL=0>昆仑</HL>的<HL=0>太上老君</HL>，或者使用物品<HL=1,1,1,0,0,0,0,0,0>洗心经</HL>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>紫明</HL>：<CL=255,0,0>未对话</FONT>","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>40</FONT>")
end

if as3.tolua(i)==5 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访紫明")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习<CL=255,0,0>潜能加点</FONT>方法。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("按A键打开角色属性界面，把潜能点分配完毕后，然后再点击<HL=0>紫明</HL>对话。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>紫明</HL>：<CL=255,0,0>未对话</FONT>","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>60</FONT>")
do return end
end

if as3.tolua(i)==6 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访紫云")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习<CL=255,0,0>门派技能</FONT>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("去找师兄<HL=0>紫云</HL>对话，学习昆仑派技能。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>紫云</HL>：<CL=255,0,0>未对话</FONT>","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>80</FONT>")
do return end
end

if as3.tolua(i)==7 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访紫云")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习<CL=255,0,0>使用技能</FONT>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("使用<HL=0>紫云</HL>教给你的技能，熟悉昆仑派技能。学完后再找<HL=0>紫云</HL>对话。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>紫云</HL>：<CL=255,0,0>未对话</FONT>","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>120</FONT>")
do return end
end

if as3.tolua(i)==8 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访紫云")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习<CL=255,0,0>技能加点</FONT>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("按照<HL=0>紫云</HL>说的，给学会的技能加点。学完后再找<HL=0>紫云</HL>对话。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>紫云</HL>：<CL=255,0,0>未对话</FONT>","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>160</FONT>")
do return end
end

if as3.tolua(i)==9 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访紫云")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习<CL=255,0,0>技能使用</FONT>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("按照<HL=0>紫云</HL>说的，把学会的技能放到快捷栏。学完后再找<HL=0>紫云</HL>对话。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>紫云</HL>：<CL=255,0,0>未对话</FONT>","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>200</FONT>")
do return end
end

if as3.tolua(i)==10 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访紫云")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习<CL=255,0,0>技能使用</FONT>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("找山上的<HL=0>雪貂</HL>练习一下新学的技能，完后再找<HL=0>紫云</HL>对话。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
num=as3.tolua(luaTask.GetKillNpc("昆仑新手任务","雪貂"))
if num<10 then
luaTask.AddTaskInfo("<HL=0>雪貂</HL>：<CL=255,0,0>"..num.."/10","昆仑新手任务")
else
luaTask.AddTaskInfo("<HL=0>雪貂</HL>：<CL=0,255,0>"..num.."/10","昆仑新手任务")
end
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>220</FONT>")
do return end
end

if as3.tolua(i)==11 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访紫微")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习<CL=255,0,0>轻功</FONT>跳跃。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("找到<HL=0>紫微</HL>向她请教轻功跳跃的技巧。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>紫微</HL>：<CL=255,0,0>未对话</FONT>","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>240</FONT>")
do return end
end

if as3.tolua(i)==12 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访紫微")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习<CL=255,0,0>轻功</FONT>跳跃。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("按<HL=0>紫微</HL>要求练习一下轻功（鼠标右键点击空地），再向她请教采集，挖矿的技巧。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>紫微</HL>：<CL=255,0,0>未对话</FONT>","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>260</FONT>")
do return end
end

if as3.tolua(i)==13 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访紫微")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习<CL=255,0,0>采集</FONT>技巧。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("按照<HL=0>紫微</HL>要求去山上采集一颗<HL=0>灵芝</HL>回来给她。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
if GetItem("灵芝")>0 then
luaTask.AddTaskInfo("<HL=0>灵芝</HL>：<CL=0,255,0>1/1</FONT>","昆仑新手任务")
else
luaTask.AddTaskInfo("<HL=0>灵芝</HL>：<CL=255,0,0>0/1</FONT>","昆仑新手任务")
end
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>280</FONT>")
do return end
end

if as3.tolua(i)==14 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访紫微")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习<CL=255,0,0>挖矿</FONT>技巧。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("按照<HL=0>紫微</HL>要求去山上<HL=0>铁矿</HL>采一块铁矿回来给她。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
if GetItem("铁矿")>0 then
luaTask.AddTaskInfo("<HL=0>铁矿</HL>：<CL=0,255,0>1/1</FONT>","昆仑新手任务")
else
luaTask.AddTaskInfo("<HL=0>铁矿</HL>：<CL=255,0,0>0/1</FONT>","昆仑新手任务")
end
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>300</FONT>")
do return end
end

if as3.tolua(i)==15 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访紫霞")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习<CL=255,0,0>打坐</FONT>恢复。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("去<HL=0>紫霞</HL>师姐处学习打坐恢复生命和法力。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>紫霞</HL>：<CL=255,0,0>未对话</FONT>","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>320</FONT>")
do return end
end

if as3.tolua(i)==16 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访紫霞")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习<CL=255,0,0>打坐</FONT>恢复。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("按照<HL=0>紫霞</HL>的引导<CL=255,0,0>[按Z键]</FONT>进行打坐，恢复满生命和法力。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>紫霞</HL>：打坐恢复生命法力","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("物品奖励：<HL=1,10,1,0,0,0,0,0,0,0>续命水</HL>,<HL=1,10,1,0,0,0,0,0,0,0>聚气水</HL>")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>340</FONT>")
do return end
end

if as3.tolua(i)==17 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访紫霞")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习<CL=255,0,0>药物</FONT>恢复。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("使用<HL=0>紫霞</HL>赠送的药物<HL=1,10,1,0,0,0,0,0,0,0>续命水</HL>和<HL=1,10,1,0,0,0,0,0,0,0>聚气水</HL>，恢复满生命和法力。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>紫霞</HL>：药物恢复生命法力","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>360</FONT>")
do return end
end

if as3.tolua(i)==18 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访紫阳")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习使用<CL=255,0,0>传送符</FONT>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("拜访<HL=0>紫阳</HL>师兄，学习使用传送符。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>紫阳</HL>：<CL=255,0,0>未对话</FONT>","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("物品奖励：<HL=1,1,1,0,0,0,0,0,0,0>昆仑传送符</HL>")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>380</FONT>")
do return end
end

if as3.tolua(i)==19 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访紫阳")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习使用<CL=255,0,0>传送符</FONT>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("按照<HL=0>紫阳</HL>师兄的要求，使用<HL=1,1,1,0,0,0,0,0,0,0>昆仑传送符</HL>去<HL=0>玉珠峰</HL>采集一颗<HL=0>冬虫夏草</HL>回来。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
if GetItem("冬虫夏草")==0 then
luaTask.AddTaskInfo("<HL=0>冬虫夏草</HL>：<CL=255,0,0>0/1</FONT>","昆仑新手任务")
else
luaTask.AddTaskInfo("<HL=0>冬虫夏草</HL>：<CL=0,255,0>1/1</FONT>","昆仑新手任务")
end
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>400</FONT>")
do return end
end

if as3.tolua(i)==20 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访风圣")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习如何<CL=255,0,0>组队</FONT>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("拜访昆仑三圣之一的<HL=0>风圣</HL>，他会教你如何组队。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>风圣</HL>：<CL=255,0,0>未对话</FONT>","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>420</FONT>")
do return end
end

if as3.tolua(i)==21 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访风圣")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习如何<CL=255,0,0>组队</FONT>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("按照<HL=0>风圣</HL>的要求，去组建一个队伍,然后回来告诉<HL=0>风圣</HL>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>风圣</HL>：组建队伍","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>440</FONT>")
do return end
end

if as3.tolua(i)==22 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访云圣")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习如何<CL=255,0,0>交友</FONT>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("拜访昆仑三圣之一的<HL=0>云圣</HL>，学习如何交友。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>云圣</HL>：<CL=255,0,0>未对话</FONT>","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>520</FONT>")
do return end
end

if as3.tolua(i)==23 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访云圣")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习如何<CL=255,0,0>交友</FONT>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("按照<HL=0>云圣</HL>所说，右键点击其他人，选择交一个或更多的好友,然后回来告诉<HL=0>云圣</HL>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>云圣</HL>：加1个好友","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>540</FONT>")
do return end
end

if as3.tolua(i)==24 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访雷圣")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习使用<CL=255,0,0>邮件</FONT>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("拜访<HL=0>雷圣</HL>，向他学习如何使用邮件。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>雷圣</HL>：<CL=255,0,0>未对话</FONT>","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>560</FONT>")
do return end
end

if as3.tolua(i)==25 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访雷圣")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习使用<CL=255,0,0>邮件</FONT>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("接收<HL=0>雷圣</HL>发给你的邮件，提取里面的<HL=1,1,1,0,0,0,0,0,0,0>藏宝图</HL>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
if GetItem("藏宝图")>0 then
luaTask.AddTaskInfo("藏宝图：<CL=0,255,0>1/1</FONT>","昆仑新手任务")
else
luaTask.AddTaskInfo("藏宝图：<CL=255,0,0>0/1</FONT>","昆仑新手任务")
end
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>580</FONT>")
do return end
end

if as3.tolua(i)==26 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访燃灯道人")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：学习使用<CL=255,0,0>仙丹</FONT>。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("拜见昆仑掌门<HL=0>燃灯道人</HL>，他会赐给你仙丹，帮助你修行。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("<HL=0>燃灯道人</HL>：<CL=255,0,0>未对话</FONT>","昆仑新手任务")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务奖励</FONT>：")
luaTask.AddTaskInfo("物品奖励：<HL=1,3,1,0,0,0,0,0,0,0>仙丹</HL>、<CL=0,255,0>绿色3星坐骑</FONT>、<CL=0,255,0>绿色3星宠物</FONT>")
luaTask.AddTaskInfo("经验奖励：<CL=0,255,0>1000</FONT>")
luaTask.AddTaskInfo("声望奖励：<FONT COLOR=\"#ffff00\">10</FONT>")
do return end
end

if as3.tolua(i)==27 then
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">步骤名称</FONT>：拜访燃灯道人")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">可接等级</FONT>：1级")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务目的</FONT>：已经完成")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">任务描述</FONT>：")
luaTask.AddTaskInfo("服下昆仑掌门<HL=0>燃灯道人</HL>赐给你仙丹可以帮助你修行，找<HL=0>百花仙子</HL>可以了解自己的前世花神。找<HL=0>紫光</HL>继续下一步门派任务。")
luaTask.AddTaskInfo("有很多活动或任务你可以选择参加，你可以找<HL=0>观音菩萨</HL>了解布施天下活动和飞升任务，找<HL=0>多宝道人</HL>了解藏宝地图、个人比武和阴罗洞探秘活动，找<HL=0>文曲星</HL>参加知识问答活动，找<HL=0>武曲星</HL>参加封魔迷宫活动，找<HL=0>鬼谷子</HL>选择加入或自己创建家族，找<HL=0>申公豹</HL>参加家族比武、家族除魔和家族声望任务，找<HL=0>镇元大仙</HL>了解拜师收徒和探险盘魔洞活动。")
luaTask.AddTaskInfo("如果你要外出历练，可以去找<HL=0>紫星</HL>和<HL=0>紫微</HL>领取除门派魔任务及采集任务，完成后可以获得一份不错的酬劳。")
luaTask.AddTaskInfo("<FONT COLOR=\"#ffff00\">完成情况</FONT>：")
luaTask.AddTaskInfo("新手任务已经全部完成")
do return end
end
