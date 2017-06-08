require "Common/define"
require "Common/functions"
require "3rd/pblua/login_pb"
require "3rd/pbc/protobuf"
local sproto = require "3rd/sproto/sproto"
local core = require "sproto.core"
local print_r = require "3rd/sproto/print_r"

BaseCtrl = class("BaseCtrl",nil);
local this = BaseCtrl;

local behaviour;
local transform;
local gameObject;
local ctrlName;
local panelName;

--构建函数--
function BaseCtrl.New()
    return this; 
end

function BaseCtrl:Awake()
    
    self:SetPanelMame();
    logWarn(self.ctrlName .. ".Awake--->>");
    
    panelMgr:CreatePanel(self.panelName, self.OnCreate);
end

--启动事件--
function BaseCtrl.OnCreate(obj)
    gameObject = obj;
    transform = gameObject.transform;

    behaviour = gameObject:GetComponent('LuaBehaviour');

    local x = transform:Find("CloseBtn");

    --behaviour:AddClick(transform:Find("CloseBtn").gameObject, this.Close);

    logWarn("Start lua--->>"..gameObject.name);
end

--关闭事件--
function BaseCtrl.Close()
    panelMgr:ClosePanel(ctrlName);
end

function BaseCtrl:SetPanelMame()
    local nameCtrl = string.split(self.ctrlName,"Ctrl");
    if table.getn(nameCtrl) >= 1 then
        self.panelName = nameCtrl[1];
    end
end 

