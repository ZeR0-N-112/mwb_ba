AddCSLuaFile()

function SWEP:doSuppressorStats()
    self.Primary.Sound = Sound("weap_mpapa5_sup_fire_plr_lfe")
    local bSup1 = self:HasAttachment("attachment_vm_silencer_east01")
    local bSup2 = self:HasAttachment("attachment_vm_silencer02")
    local bSup3 = self:HasAttachment("attachment_vm_silencer03")
    local bSup4 = self:HasAttachment("attachment_vm_silencer04")

    if (!bSup1 && !bSup2 && !bSup3 && !bSup4 && !bSup5 && !bSup6) then
    self.Primary.Sound = Sound("weap_mpapa5_sup_fire_plr_lfe")
    end
    self.Reverb = {
        RoomScale = 50000,
        Sounds = {
            Outside = {
                Layer = Sound("Atmo_SMG_Sup.Outside"),
                Reflection = Sound("Reflection_ARSUP.Outside")
            },
    
            Inside = { 
                Layer = Sound("Atmo_Pistol_Sup.Inside"),
                Reflection = Sound("Reflection_ARSUP.Inside")
            }
        }
    }
    self.ParticleEffects.MuzzleFlash = "AC_muzzle_pistol_suppressed"
end

function SWEP:doCalConversionStats()
    local bSup1 = self:HasAttachment("attachment_vm_silencer_east01")
    local bSup2 = self:HasAttachment("attachment_vm_silencer02")
    local bSup3 = self:HasAttachment("attachment_vm_silencer03")
    local bSup4 = self:HasAttachment("attachment_vm_silencer04")

    if (!bSup1 && !bSup2 && !bSup3 && !bSup4 && !bSup5 && !bSup6) then
    self.Primary.Sound = Sound("weap_mpapa5_sup_fire_plr_lfe")
    self.Reverb = {
        RoomScale = 50000,
        Sounds = {
            Outside = {
                Layer = Sound("Atmo_AR.Outside"),
                Reflection = Sound("Reflection_AR.Outside")
            },
    
            Inside = { 
                Layer = Sound("Atmo_AR.Inside"),
                Reflection = Sound("Reflection_AR.Inside")
            }
        }
    }
    self.Primary.Ammo = "AR2"
    end
end

SWEP.Customization = {
    {"att_perk", "attachment_vm_sm_mpapa5_perk_soh", "att_perk_fmj", "att_perk_ricochet", "att_perk_rof"}, 
	
    {"ba_chocomint_rec",}, 

    {"att_sight", "att_vm_2x_west02_holo", "att_vm_2x_west02", "att_vm_reflex_02", "att_vm_minireddot01_tall", "att_vm_minireddot02_tall", "att_vm_minireddot03_tall",
    "att_vm_holo_west01", "att_vm_holo_west02", "att_vm_holo_east01", "att_vm_reflex_east01",
    "att_vm_reflex_east02_tall", "att_vm_reflex_west02_tall", "att_vm_reflex_west03",
    "att_vm_hybrid_west01", "att_vm_hybrid_west03", "att_vm_4x_east01_tall", "att_vm_2x_west01",
    "att_vm_4x_west01_tall", "att_vm_4x_west02_tall", "att_vm_reflex_west04"},

    {"att_laser", "attachment_vm_sm_mpapa5_laser01", "attachment_vm_sm_mpapa5_laser02", 
    "attachment_vm_sm_mpapa5_laser03"},

    { "ba_grip",},
}

--NECESSARY: it loads custom attachments from other authors
require("mw_utils")
mw_utils.LoadInjectors(SWEP)   

-- SWEP.Customization = {
--     ["Barrel"] = {
--         Slot = 2,
--         {
--             Key = "attachment_vm_sm_mpapa5_barrel",
--             Bodygroups = {
--             },
--             Stats = function(self)
--             end
--         },
--         {
--             Key = "attachment_vm_sm_mpapa5_barrel_noflash",
--             AttachmentBodygroups = {
--                 ["frontend"] = 1
--             },
--             Stats = function(self)
--             end
--         },
--         {
--             Key = "attachment_vm_sm_mpapa5_barrel_suppressor",
--             Bodygroups = {
--             },
--             ExcludedAttachments = {
--                 ["Muzzle"] = {2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22}
--             },
--             Stats = function(self)
--                 doSuppressorStats(self)
--             end
--         },
--         {
--             Key = "attachment_vm_sm_mpapa5_barrel_suppshort",
--             Bodygroups = {
--             },
--             ExcludedAttachments = {
--                 ["Muzzle"] = {2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22}
--             },
--             Stats = function(self)
--                 doSuppressorStats(self)
--             end
--         },
--         {
--             Key = "attachment_vm_sm_mpapa5_barshort",
--             Bodygroups = {
--             },
--             ExcludedAttachments = {
--                 ["Muzzle"] = {14,15,16,17,18,19,20,21,22}
--             },
--             Stats = function(self)
--             end
--         },
--         {
--             Key = "attachment_vm_sm_mpapa5_railgrip",
--             Bodygroups = {
--             },
--             Stats = function(self)
--             end
--         }
--     },

--     ["Laser"] = {
--         Slot = 6,
--         {
--             Key = "no_laser"
--         },
--         {
--             Key = "attachment_vm_laser_cylinder01",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_laser"] = 1,
--             },
--             AttachmentBodygroups = {
--                 ["frontend"] = 1
--             },
--             VElement = {
--                 Bone = "tag_laser_attach",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {

--                     }
--                 }
--             },
--             Stats = function(self)
--                 self.LaserAimAngles = Angle(-0.3, 0.2, -45)
--                 self.LaserAimPos = Vector(-2, 0, 0)
--             end
--         },
--         {
--             Key = "attachment_vm_laser_cylinder02",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_laser"] = 1,
--             },
--             VElement = {
--                 Bone = "tag_laser_attach",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {

--                     }
--                 }
--             },
--             Stats = function(self)
--                 self.LaserAimAngles = Angle(-0.4, 0.265, -45)
--                 self.LaserAimPos = Vector(-2, 0, 0)
--             end
--         },       
--         {
--             Key = "attachment_vm_laser_cylinder03",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_laser"] = 1,
--             },
--             VElement = {
--                 Bone = "tag_laser_attach",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {

--                     }
--                 }
--             },
--             Stats = function(self)
--                 self.LaserAimAngles = Angle(-0.3, 0.2, -45)
--                 self.LaserAimPos = Vector(-2, 0, 0)
--             end
--         }
--     },

--     ["Optic"] = {
--         Slot = 4,
--         {
--             Key = "no_sight",
--         },
--         {
--             Key = "attachment_vm_minireddot_tall",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -0.7)
--                 self.ViewModelOffsets.Aim.Angles = self.ViewModelOffsets.Aim.Angles + Angle(-0.02, 0.02, 0)
--             end
--         },
--         {
--             Key = "attachment_vm_minireddot02_tall",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -0.65)
--                 self.ViewModelOffsets.Aim.Angles = self.ViewModelOffsets.Aim.Angles + Angle(0.01, 0.02, 0)
--             end
--         },      
--         {
--             Key = "attachment_vm_minireddot03_tall",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -0.65)
--                 self.ViewModelOffsets.Aim.Angles = self.ViewModelOffsets.Aim.Angles + Angle(0.035, 0.02, 0)
--             end
--         },  
--         {
--             Key = "attachment_vm_holo_west02",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -0.8)
--                 self.ViewModelOffsets.Aim.Angles = self.ViewModelOffsets.Aim.Angles + Angle(-0.034, 0.018, 0)
--             end
--         },  
--         {
--             Key = "attachment_vm_holo_east",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(-0.015, 0, -0.72)
--                 self.ViewModelOffsets.Aim.Angles = self.ViewModelOffsets.Aim.Angles + Angle(-0.034, 0.018, 0)
--             end
--         }, 
--         {
--             Key = "attachment_vm_reflex_east02_tall",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -0.95)
--                 self.ViewModelOffsets.Aim.Angles = self.ViewModelOffsets.Aim.Angles + Angle(-0.01, 0.05, 0)
--             end
--         },  
--         {
--             Key = "attachment_vm_reflex_west03",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -0.9)
--                 self.ViewModelOffsets.Aim.Angles = self.ViewModelOffsets.Aim.Angles + Angle(-0.015, 0.02, 0)
--             end
--         },  
--         {
--             Key = "attachment_vm_reflex_west04",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -0.84)
--                 self.ViewModelOffsets.Aim.Angles = self.ViewModelOffsets.Aim.Angles + Angle(-0.02, 0.013, 0)
--             end
--         },  
--         {
--             Key = "attachment_vm_holo_west_lod0",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -0.9)
--                 self.ViewModelOffsets.Aim.Angles = self.ViewModelOffsets.Aim.Angles + Angle(-0.01, 0.01, 0)
--             end
--         },  
--         {
--             Key = "attachment_vm_reflex_east",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0, 0, -0.75)
--                 self.ViewModelOffsets.Aim.Angles = self.ViewModelOffsets.Aim.Angles + Angle(-0.01, 0.017, 0)
--             end
--         }, 
--         {
--             Key = "attachment_vm_4x_east_tall",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0.11, 3, -1.04)
--             end
--         },        
--         {
--             Key = "attachment_vm_4x_west_tall",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(-0.007, 1.5, -1.15)
--             end
--         },        
--         {
--             Key = "attachment_vm_4x_west02_tall",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(-0.008, 1.5, -1.035)
--             end
--         },
--         {
--             Key = "attachment_vm_thermal_east_tall",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             VElement = {
--                 Bone = "tag_reflex",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [2] = {Vector(0, 0, 0), Angle()},
--                         [3] = {Vector(0, 0, 0), Angle()},
--                         [4] = {Vector(0, 0, 0), Angle()}
--                     }
--                 }
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(-0.002, 1.5, -0.975)
--             end
--         }, 
--         {
--             Key = "attachment_vm_thermal_hybrid",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             VElement = {
--                 Bone = "tag_reflex",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [2] = {Vector(0, 0, 0), Angle()},
--                         [3] = {Vector(0, 0, 0), Angle()},
--                         [4] = {Vector(0, 0, 0), Angle()}
--                     }
--                 }
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(-0.00, 1.5, -0.55)
--                 self.HybridAimAngles = Angle(-0.02, 0.02, -45)
--                 self.HybridAimPos = Vector(-1.75, 3, 0)
--             end
--         }, 
--         {
--             Key = "attachment_vm_thermal_west_01",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             VElement = {
--                 Bone = "tag_reflex",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [2] = {Vector(0, 0, 0), Angle()},
--                         [3] = {Vector(0, 0, 0), Angle()},
--                         [4] = {Vector(0, 0, 0), Angle()}
--                     }
--                 }
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(-0.003, 1.5, -0.53)
--             end
--         }, 
--         {
--             Key = "weapon_vm_scope_mike14_alt",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(-0.008, 3, -0.925)
--                 self.Zoom.Blur.EyeFocusDistance = 3.5
--             end
--         }, 
--         {
--             Key = "attachment_vm_scope_vz",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(-0.003, 3, -0.86)
--                 self.Zoom.Blur.EyeFocusDistance = 3.5
--             end
--         }, 
--         {
--             Key = "attachment_vm_hybrid_west",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             VElement = {
--                 Bone = "tag_reflex",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [2] = {Vector(0, 0, 0), Angle()},
--                         [3] = {Vector(0, 0, 0), Angle()},
--                         [4] = {Vector(0, 0, 0), Angle()}
--                     }
--                 }
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(0.005, 1.5, -0.685)
--                 self.HybridAimAngles = Angle(-0.02, 0.02, 0)
--                 self.HybridAimPos = Vector(0,3,-1.85)
--             end
--         }, 
--         {
--             Key = "attachment_vm_hybrid_west03",
--             Bodygroups = {
--                 ["tag_optic_rail"] = 1,
--                 ["tag_bsight"] = 1
--             },
--             AttachmentBodygroups = {
--                 ["frontsight"] = 1
--             },
--             VElement = {
--                 Bone = "tag_reflex",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [2] = {Vector(0, 0, 0), Angle()},
--                         [3] = {Vector(0, 0, 0), Angle()},
--                         [4] = {Vector(0, 0, 0), Angle()}
--                     }
--                 }
--             },
--             Stats = function(self)
--                 self.ViewModelOffsets.Aim.Pos = self.ViewModelOffsets.Aim.Pos + Vector(-0.005, 1.5, -0.615)
--                 self.Zoom.Blur.EyeFocusDistance = 3.5
--                 self.HybridAimAngles = Angle(0, 0.015, -45)
--                 self.HybridAimPos = Vector(-1.55, 3, 0.25)
--             end
--         }, 
--     },

--     ["Muzzle"] = {
--         Slot = 3,
--         {
--             Key = "no_muzzle"
--         },
--         {
--             Key = "attachment_vm_flashhider01",
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [4] = {Vector(0, -2.5, 0), Angle()},
--                     }
--                 }
--             },
--             Stats = function(self)
--                 self.ParticleEffects.MuzzleFlash = "AC_muzzle_pistol_suppressed"
--             end 
--         },               
--         {
--             Key = "attachment_vm_flashhider02",
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [4] = {Vector(0, -2.5, 0), Angle()},
--                     }
--                 }
--             },
--             Stats = function(self)
--                 self.ParticleEffects.MuzzleFlash = "AC_muzzle_pistol_suppressed"
--             end 
--         },               
--         {
--             Key = "attachment_vm_flashhider03",
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [4] = {Vector(0, -2.5, 0), Angle()},
--                     }
--                 }
--             },
--             Stats = function(self)
--                 self.ParticleEffects.MuzzleFlash = "AC_muzzle_pistol_suppressed"
--             end 
--         },               
--         {
--             Key = "attachment_vm_flashhider05",
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [4] = {Vector(0, -2.5, 0), Angle()},
--                     }
--                 }
--             },
--             Stats = function(self)
--                 self.ParticleEffects.MuzzleFlash = "AC_muzzle_pistol_suppressed"
--             end 
--         },                          
--         {
--             Key = "attachment_vm_muzzlebrake01",
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [4] = {Vector(0, -2.5, 0), Angle()},
--                     }
--                 }
--             },
--             Stats = function(self)
--             end 
--         },         
--         {
--             Key = "attachment_vm_muzzlebrake02",
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [4] = {Vector(0, -2.5, 0), Angle()},
--                     }
--                 }
--             },
--             Stats = function(self)
--             end 
--         },         
--         {
--             Key = "attachment_vm_muzzlebrake03",
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [4] = {Vector(0, -2.5, 0), Angle()},
--                     }
--                 }
--             },
--             Stats = function(self)
--             end 
--         },         
--         {
--             Key = "attachment_vm_muzzlebrake04",
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [4] = {Vector(0, -2.5, 0), Angle()},
--                     }
--                 }
--             },
--             Stats = function(self)
--             end 
--         },         
--         {
--             Key = "attachment_vm_compensator01",
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [4] = {Vector(0, -2.5, 0), Angle()},
--                     }
--                 }
--             },
--             Stats = function(self)
--             end 
--         },   
--         {
--             Key = "attachment_vm_compensator02",
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [4] = {Vector(0, -2.5, 0), Angle()},
--                     }
--                 }
--             },
--             Stats = function(self)
--             end 
--         },      
--         {
--             Key = "attachment_vm_muzzlemelee01",
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [4] = {Vector(0, -2.5, 0), Angle()},
--                     }
--                 }
--             }, 
--             Stats = function(self)
--             end 
--         },   
--         {
--             Key = "attachment_vm_muzzlemelee02",
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                         [4] = {Vector(0, -2.5, 0), Angle()},
--                     }
--                 }
--             },
--             Stats = function(self)
--             end 
--         },      
--         {
--             Key = "attachment_vm_silencer_east01",
--             AttachmentBodygroups = {
--                 ["frontend"] = 1
--             },
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle()
--             },
--             Stats = function(self)
--                 doSuppressorStats(self)
--             end 
--         },        
--         {
--             Key = "attachment_vm_silencer02",
--             AttachmentBodygroups = {
--                 ["frontend"] = 1
--             },
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle()
--             },
--             Stats = function(self)
--                 doSuppressorStats(self)
--             end 
--         },
--         {
--             Key = "attachment_vm_silencer03",
--             AttachmentBodygroups = {
--                 ["frontend"] = 1
--             },
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle()
--             },
--             Stats = function(self)
--                 doSuppressorStats(self)
--             end 
--         },
--         {
--             Key = "attachment_vm_silencer04",
--             AttachmentBodygroups = {
--                 ["frontend"] = 1
--             },
--             VElement = {
--                 Bone = "tag_silencer",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle()
--             },
--             Stats = function(self)
--                 doSuppressorStats(self)
--             end 
--         },
--     },

--     ["Perk"] = {
--         Slot = 1,
--         {
--             Key = "no_perk",
--         },
--         {
--             Key = "perk_soh",
--             Stats = function(self)
--                 self.Animations.Reload = self.Animations.Reload_Fast
--                 self.Animations.Reload_Empty = self.Animations.Reload_Empty_Fast                
--                 self.Animations.Reload_Xmag = self.Animations.Reload_Xmag_Fast
--                 self.Animations.Reload_Empty_Xmag = self.Animations.Reload_Empty_Xmag_Fast
--                 self.CanChamberRound = true
--             end
--         },
--         {
--             Key = "perk_fastmelee",
--             Stats = function(self)
--             end
--         },
--         {
--             Key = "perk_heavymelee",
--             Stats = function(self)
--             end
--         },
--         {
--             Key = "perk_fmj",
--             Stats = function(self)
--             end
--         }
--     },

--     ["Stock"] = {
--         Slot = 7,
--         {
--             Key = "attachment_vm_sm_mpapa5_stock",
--             Stats = function(self)
--             end
--         },
--         {
--             Key = "attachment_vm_sm_mpapa5_stock_fullstock",
--             Bodygroups = {
--                 -- ["tag_stock_attach"] = 1,
--             },
--             Stats = function(self)
--             end
--         },
--         {
--             Key = "attachment_vm_sm_mpapa5_stock_nostock",
--             Bodygroups = {
--                 -- ["tag_stock_attach"] = 1,
--             },
--             Stats = function(self)
--             end
--         },
--     },

--     ["Underbarrel"] = {
--         Slot = 8,
--         {
--             Key = "no_underbarrel",
--         },
--         {
--             Key = "attachment_vm_angledgrip_lod0",
--             VElement = {
--                 Bone = "tag_grip_attach",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                     }
--                 }
--             },
--             AttachmentBodygroups = {
--                 ["frontend"] = 1,
--                 ["grip_hide"] = 1
--             },
--             Stats = function(self)
--                 self:SetGripPoseParameter("grip_ang_offset")
--             end
--         },
--         {
--             Key = "attachment_vm_angledgrip04",
--             VElement = {
--                 Bone = "tag_grip_attach",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                     }
--                 }
--             },
--             AttachmentBodygroups = {
--                 ["frontend"] = 1,
--                 ["grip_hide"] = 1
--             },
--             Stats = function(self)
--                 self:SetGripPoseParameter("grip_ang_offset")
--             end
--         },
--         {
--             Key = "attachment_vm_vertgrip02_lod0",
--             Bodygroups = {
--             },
--             VElement = {
--                 Bone = "tag_folding_grip",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                     }
--                 }
--             },
--             AttachmentBodygroups = {
--                 ["frontend"] = 1,
--                 ["grip_hide"] = 1
--             },
--             Stats = function(self)
--                 self:SetGripPoseParameter("grip_vert_offset")
--             end
--         },
--         {
--             Key = "attachment_vm_vertgrip03",
--             Bodygroups = {
--                 -- ["tag_grip_attach"] = 1,
--                 -- ["tag_ub_rail"] = 1,
--             },
--             VElement = {
--                 Bone = "tag_folding_grip",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                     }
--                 }
--             },
--             AttachmentBodygroups = {
--                 ["frontend"] = 1,
--                 ["grip_hide"] = 1
--             },
--             Stats = function(self)
--                 self:SetGripPoseParameter("grip_vert_offset")
--             end
--         },
--         {
--             Key = "attachment_vm_vertgrip_stubby02",
--             Bodygroups = {
--                 -- ["tag_grip_attach"] = 1,
--                 -- ["tag_ub_rail"] = 1,
--             },
--             VElement = {
--                 Bone = "tag_folding_grip",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                     }
--                 }
--             },
--             AttachmentBodygroups = {
--                 ["frontend"] = 1,
--                 ["grip_hide"] = 1
--             },
--             Stats = function(self)
--                 self:SetGripPoseParameter("grip_vert_offset")
--             end
--         },
--         {
--             Key = "attachment_vm_vertgrip_stubby01",
--             Bodygroups = {
--                 -- ["tag_grip_attach"] = 1,
--                 -- ["tag_ub_rail"] = 1,
--             },
--             VElement = {
--                 Bone = "tag_folding_grip",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                     }
--                 }
--             },
--             AttachmentBodygroups = {
--                 ["frontend"] = 1,
--                 ["grip_hide"] = 1
--             },
--             Stats = function(self)
--                 self:SetGripPoseParameter("grip_vert_offset")
--             end
--         },
--         {
--             Key = "attachment_vm_vertgrip_stubby04",
--             Bodygroups = {
--                 -- ["tag_grip_attach"] = 1,
--                 -- ["tag_ub_rail"] = 1,
--             },
--             VElement = {
--                 Bone = "tag_folding_grip",
--                 Position = Vector(0, 0, 0),
--                 Angles = Angle(),
--                 Offsets = { 
--                     ["Barrel"] = {
--                     }
--                 }
--             },
--             AttachmentBodygroups = {
--                 ["frontend"] = 1,
--                 ["grip_hide"] = 1
--             },
--             Stats = function(self)
--                 self:SetGripPoseParameter("grip_vert_offset")
--             end
--         },
--     },
    
--     ["Magazine"] = {
--         Slot = 5,
--         {
--             Key = "attachment_vm_sm_mpapa5_mag",
--             Stats = function(self)
--             end
--         },
--         {
--             Key = "attachment_vm_sm_mpapa5_mag_xmag",
--             Stats = function(self)
--                 -- doCalConversionStats(self)
--             end
--         },
--         {
--             Key = "attachment_vm_sm_mpapa5_mag_xmag2",
--             Stats = function(self)
--             end
--         },
--     },
-- }