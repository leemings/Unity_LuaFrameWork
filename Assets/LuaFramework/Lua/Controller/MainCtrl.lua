require "Controller/BaseCtrl"

MainCtrl = LXClass("MainCtrl",BaseCtrl);

local this;
function MainCtrl:CreateFinish(obj)
	this = self;
	self.behaviour:AddClick(MainPanel.PromptBtn, self.OnPromptClick);
	self.behaviour:AddClick(MainPanel.MessageBtn, self.OnMessageClick);
end

function MainCtrl.OnPromptClick()
	this:SetShow(false);
	local ctrl = CtrlManager.GetCtrl(CtrlNames.Prompt);
    if ctrl ~= nil then
        ctrl:Awake();
    end
end

function MainCtrl.OnMessageClick()
	this:SetShow(false);
	local ctrl = CtrlManager.GetCtrl(CtrlNames.Message);
    if ctrl ~= nil then
        ctrl:Awake();
    end
end