
LXClassDefine("LXEvent",nil);

function  LXEvent:LXEvent(eventID,fun,instance)
  self.m_EventID = eventID;
  
  local callback = LXCallback:New();
  callback:Reset(fun,instance);
  self.m_Callback = callback;
end;

function  LXEvent:GetEventID()
  return self.m_EventID;
end;

function  LXEvent:OnEvent(...)
  self.m_Callback:Call(...);
end;

return LXEvent;

