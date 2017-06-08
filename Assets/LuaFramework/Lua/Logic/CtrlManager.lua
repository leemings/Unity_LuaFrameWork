require "Common/define"
require "Controller/PromptCtrl"
require "Controller/MessageCtrl"
require "Controller/MainCtrl"

CtrlManager = {};
local this = CtrlManager;
local ctrlList = {};	--控制器列表--

function CtrlManager.Init()
	logWarn("CtrlManager.Init----->>>");
	--ctrlList[CtrlNames.Prompt] = PromptCtrl.New();
	--ctrlList[CtrlNames.Message] = MessageCtrl.New();
	this.AddCtrl(CtrlNames.Main,MainCtrl);
	this.AddCtrl(CtrlNames.Prompt,PromptCtrl);
	this.AddCtrl(CtrlNames.Message,MessageCtrl);
	--this.AddCtrl(CtrlNames.Message,MessageCtrl.New());
	return this;
end

--添加控制器--
function CtrlManager.AddCtrl(ctrlName, ctrlObj)
	ctrlList[ctrlName] = ctrlObj;
	ctrlObj.ctrlName = ctrlName;
end

--获取控制器--
function CtrlManager.GetCtrl(ctrlName)
	return ctrlList[ctrlName];
end

--移除控制器--
function CtrlManager.RemoveCtrl(ctrlName)
	ctrlList[ctrlName] = nil;
end

--关闭控制器--
function CtrlManager.Close()
	logWarn('CtrlManager.Close---->>>');
end

function CtrlManager.ClosePanel(realName)
    panelMgr:ClosePanel(realName);
	local ctrlName = realName .. "Ctrl";
	if ctrlName ~= CtrlNames.Main then
		local ctrl = CtrlManager.GetCtrl(CtrlNames.Main);
		ctrl:SetShow(true);
	end
end