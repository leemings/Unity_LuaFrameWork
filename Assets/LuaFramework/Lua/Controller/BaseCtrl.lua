require "Common/LXClass"

BaseCtrl = LXClass("BaseCtrl",nil);

local this = nil;

function BaseCtrl:BaseCtrl()
	self.behaviour = nil;
	self.transform = nil;
	self.gameObject = nil;
	self.ctrlName = nil;
	self.realName = nil;
end

function BaseCtrl:Awake()
	this = self;
    self:SetPanelMame();
    
    panelMgr:CreatePanel(self.realName, self.OnCreate);
end

--启动事件--
function BaseCtrl.OnCreate(obj)
    this.gameObject = obj;
    this.transform = obj.transform;
    this.behaviour = this.gameObject:GetComponent('LuaBehaviour');
	this:CreateFinish(obj);
	
	local CloseBtn = this.transform:Find("CloseBtn");
	if CloseBtn ~= nil then
		this.behaviour:AddClick(CloseBtn.gameObject, this.Close);
	end

end

function BaseCtrl:CreateFinish(obj)
	
end

--关闭事件--
function BaseCtrl.Close(obj)
	panelMgr:ClosePanel(this.realName);
	Event.Brocast(EventType.PanelClose,this.ctrlName);
	
	--CtrlManager.ClosePanel(this.realName);
end

function BaseCtrl:SetPanelMame()
    local nameCtrl = string.split(self.ctrlName,"Ctrl");
    if table.getn(nameCtrl) >= 1 then
        self.realName = nameCtrl[1];
    end
end 

function BaseCtrl:SetShow(isShow) 
	if self.gameObject == nil then
		return;
	end
	self.gameObject:SetActive(isShow);
end