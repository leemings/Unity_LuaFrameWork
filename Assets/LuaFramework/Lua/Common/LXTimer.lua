LXClassDefine("LXTimer",nil);
LXTimer.m_IsStop = false;
LXTimer.m_EndTime = 0.0;
LXTimer.m_Second = 0.0;
LXTimer.m_Callback = nil;
LXTimer.m_CallbackInstacne = nil;
LXTimer.m_CallbackParam = nil;

function  LXTimer:LXTimer()
end;

function  LXTimer:Reset(nowTime,sec,callback,instance,param)
  self.m_Second = sec;
  self.m_IsStop = false;
  self.m_EndTime = nowTime + sec;
  local selfCallback = self.m_Callback;
  if(selfCallback == nil) then
    selfCallback = LXCallback:New();
    self.m_Callback = selfCallback;
  end;
  selfCallback:Reset(callback,instance,param);
end;

function  LXTimer:Stop()
  self.m_IsStop = true;
  self.m_Callback = nil;
end;

function  LXTimer:IsStop()
  return self.m_IsStop;
end;

function  LXTimer:OnRun(nowTime)
  local escapeTime = nowTime - self.m_EndTime;
  if(escapeTime < 0) then
    return ;
  end;
  self.m_Callback:Call(nowTime,escapeTime);
  self.m_EndTime = nowTime + self.m_Second;
end;

return LXTimer;
