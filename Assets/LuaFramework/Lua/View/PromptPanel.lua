require "View/BasePanel"

PromptPanel = LXClass("PromptPanel",BasePanel);
local this = PromptPanel;


function PromptPanel.Awake(obj)	
	this.Super:InitChild(obj);
	this:InitPanel();
end

function PromptPanel:InitPanel()
	self.btnOpen = self.Super.transform:Find("Open").gameObject;
	self.gridParent = self.Super.transform:Find('ScrollView/Grid');
end