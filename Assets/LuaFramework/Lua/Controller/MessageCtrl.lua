require "Controller/BaseCtrl"

MessageCtrl = LXClass("MessageCtrl",BaseCtrl);

local this;
--启动事件--
function MessageCtrl:OnCreateFinish(obj)
	this = self;
end
