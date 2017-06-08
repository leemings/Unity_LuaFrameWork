require "View/BasePanel"

MessagePanel = LXClass("MessagePanel",BasePanel);
local this = MessagePanel;

--启动事件--
function MessagePanel.Awake(obj)
	this.Super:InitChild(obj);
	this:InitPanel();
end

--初始化面板--
function MessagePanel:InitPanel()
end


