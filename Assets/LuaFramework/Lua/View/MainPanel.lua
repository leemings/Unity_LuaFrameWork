require "View/BasePanel"
MainPanel = LXClass("MainPanel",BasePanel);

local this = MainPanel;
--≥ı ºªØ√Ê∞Â--

function MainPanel.Awake(obj)	
	this.Super:InitChild(obj);
	this:InitPanel();
end

function MainPanel.InitPanel(this)
	this.PromptBtn = this.Super.transform:Find("PromptBtn").gameObject;
	this.MessageBtn = this.Super.transform:Find("MessageBtn").gameObject;
end

