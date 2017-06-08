
function class(classname, super)  
     local cls = {}  
     if super then --复制基类方法  
        cls = {}  
        for k,v in pairs(super) do cls[k] = v end  
        cls.super = super  
    else  
        cls = {ctor = function() end}  
    end  
  
    cls.__cname = classname  
    cls.__index = cls  
  
    function cls.new(...) --实例化  
        local instance = setmetatable({}, cls)  
        instance.class = cls  
        instance:ctor(...)  
        return instance  
    end  
    return cls  
end  

--输出日志--
function log(str)
    Util.Log(str);
end

--错误日志--
function logError(str) 
	Util.LogError(str);
end

--警告日志--
function logWarn(str) 
	Util.LogWarning(str);
end

--查找对象--
function find(str)
	return GameObject.Find(str);
end

function destroy(obj)
	GameObject.Destroy(obj);
end

function newObject(prefab)
	return GameObject.Instantiate(prefab);
end

--创建面板--
function createPanel(name)
	PanelManager:CreatePanel(name);
end

function child(str)
	return transform:Find(str);
end

function subGet(childNode, typeName)		
	return child(childNode):GetComponent(typeName);
end

function findPanel(str) 
	local obj = find(str);
	if obj == nil then
		error(str.." is null");
		return nil;
	end
	return obj:GetComponent("BaseLua");
end