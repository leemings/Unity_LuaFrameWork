require "Common/LXClass"
BasePanel = LXClass("BasePanel",nil);

local this = BasePanel;

function BasePanel:InitChild(obj)
	this = self;
	self.transform = obj.transform;
	self.gameObject = obj;	
end
