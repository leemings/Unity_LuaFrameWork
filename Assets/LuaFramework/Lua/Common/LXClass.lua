function CloneClass(fromClass,toClass)
  local nk,nv;
  for k,v in pairs(fromClass) do
    if(string.sub(k,1,2) ~= "__" and k ~= "Super") then
      if(type(k) == "table") then
        nk = {};
        CloneClass(k,nk);
      else
        nk = k;
      end;
      if(type(v) == "table") then
        nv = {};
        CloneClass(v,nv);
      else
        nv = v;
      end;
      toClass[nk] = nv;
    end;
  end;
end;

function LXClass(className,superClass)
	local class = {};
	if(superClass) then
		CloneClass(superClass,class);
		class.Super = superClass;
	end;

	class.__name = className;
	class.__index = class;
	class.__flagname = className..className;
	class[class.__flagname] = true;

	function class:IsClass(classDef)
		return (self[classDef.__flagname] == true);
	end;

	function class:NewWithCInstance(cInstance,...)
		local instance = setmetatable({},self);

		if(self.CNew) then
		  if(cInstance == nil) then
			cInstance = self.CNew();
		  end;
		  instance.CInstance = cInstance;
		end;

		local curClass = self;
		local nameTable = {};
		local i = 0;
		while curClass ~= nil do
		  nameTable[i] = curClass.__name;
		  curClass = curClass.Super;
		  i = i + 1;
		end;

		i = i - 1;
		local ctorFun;
		while i >= 0 do
		  ctorFun = instance[nameTable[i]];
		  if ctorFun ~= nil then
			ctorFun(instance,...);
		  end;
		  i = i - 1;
		end;

		return instance;

	end;

	function class:New(...)
	 return class:NewWithCInstance(nil,...);
	end

	function class:IsDerivedFrom(superClass)
	local classThis = self;
	while(classThis) do
	  if(classThis == superClass) then
		return true;
	  end;
	  
	  classThis = classThis.Super;
	end;
	return false;
	end;

	return class;
end;

