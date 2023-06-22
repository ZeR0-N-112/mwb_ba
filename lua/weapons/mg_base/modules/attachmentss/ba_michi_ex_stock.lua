ATTACHMENT.Base = "att_stock"
ATTACHMENT.Name = "Huehuehue"
ATTACHMENT.Model = Model("models/kyo/weapons/att_michiru_rec.mdl")

local BaseClass = GetAttachmentBaseClass(ATTACHMENT.Base)
function ATTACHMENT:Stats(weapon)
    BaseClass.Stats(self, weapon)
end

function ATTACHMENT:PostProcess(weapon)
    BaseClass.PostProcess(self, weapon)
    weapon:SetGripPoseParameter2("grip_stockh_offset")
end 