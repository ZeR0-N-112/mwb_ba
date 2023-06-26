AddCSLuaFile()

PrecacheParticleSystem("AC_muzzle_shotgun")
PrecacheParticleSystem("AC_muzzle_shotgun_db")
PrecacheParticleSystem("AC_muzzle_pistol_suppressed")
PrecacheParticleSystem("AC_muzzle_pistol_ejection")
PrecacheParticleSystem("AC_muzzle_pistol_smoke_barrel")
PrecacheParticleSystem("AC_muzzle_minigun_smoke_barrel")
include("animations.lua")
include("customization.lua")

if CLIENT then
    killicon.Add( "mg_kilo98", "VGUI/entities/mg_kilo98", Color(255, 0, 0, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/spawnicons/icon_cac_weapon_sn_kilo98")
end

SWEP.Base = "mg_base" 

SWEP.PrintName = "Crack Shot"
SWEP.Category = "Modern Warfare - Blue Archive"
SWEP.SubCategory = "Marksman Rifles"
SWEP.Spawnable = true
SWEP.VModel = Model("models/zeron/weapons/v_crackshot.mdl")
SWEP.WorldModel = Model("models/viper/mw/weapons/w_kilo98.mdl")

SWEP.Slot = 3 
SWEP.HoldType = "BoltAction"

SWEP.Primary.Sound = Sound("mw19.kilo98.fire")
SWEP.Primary.Ammo = "357"
SWEP.Primary.ClipSize = 5
SWEP.Primary.Automatic = true
SWEP.Primary.BurstRounds = 1
SWEP.Primary.BurstDelay = 0
SWEP.Primary.RPM = 200  
SWEP.CanChamberRound = false
SWEP.CanDisableAimReload = false
SWEP.ReloadRechambers = true
SWEP.Projectile = {
    Class = "mg_sniper_bullet", --bullet entity class
    Speed = 27000, 
    Gravity = 8,
    Penetrate = true
}

SWEP.ParticleEffects = {
    ["MuzzleFlash"] = "AC_muzzle_shotgun",
    ["MuzzleFlash_DB"] = "AC_muzzle_shotgun_db",
    ["MuzzleFlash_Suppressed"] = "AC_muzzle_pistol_suppressed",
    ["Ejection"] = "AC_muzzle_pistol_ejection", 
    ["Overheating"] = "AC_muzzle_pistol_smoke_barrel", 
}

SWEP.Reverb = { 
    RoomScale = 50000, --(cubic hu)
    --how big should an area be before it is categorized as 'outside'?

    Sounds = {
        Outside = {
            Layer = Sound("Atmo_DMR.Outside"),
            Reflection = Sound("Reflection_Shotgun.Outside")
        },

        Inside = { 
            Layer = Sound("Atmo_Shotgun.Inside"),
            Reflection = Sound("Reflection_Shotgun.Inside")
        }
    }
}

SWEP.Firemodes = {

    [1] = {
        Name = "Bolt Action",
        OnSet = function(self)
            self.Primary.Automatic = false
            return "Firemode_Semi"
        end
    },

}

SWEP.BarrelSmoke = {
    Particle = "AC_muzzle_minigun_smoke_barrel",
    Attachment = "muzzle",
    ShotTemperatureIncrease = 75,
    TemperatureThreshold = 100, --temperature that triggers smoke
    TemperatureCooldown = 65 --degrees per second
}

SWEP.Cone = {
    Hip = 1, --accuracy while hip
    Ads = 0.033, --accuracy while aiming
    Increase = 0.086, --increase cone size by this amount every time we shoot
    AdsMultiplier = 0.025, --multiply the increase value by this amount while aiming
    Max = 2.5, --the cone size will not go beyond this size
    Decrease = 1, -- amount (in seconds) for the cone to completely reset (from max)
    Seed = 6985 --just give this a random number
}

SWEP.Recoil = {
    Vertical = {7, 10}, --random value between the 2
    Horizontal = {-4.75, 4.75}, --random value between the 2
    Shake = 3, --camera shake
    AdsMultiplier = 0.05, --multiply the values by this amount while aiming
    Seed = 4253452354, --give this a random number until you like the current recoil pattern
}

SWEP.Bullet = {
    Damage = {120, 60}, --first value is damage at 0 meters from impact, second value is damage at furthest point in effective range
    EffectiveRange = 200, --in meters, damage scales within this distance
    DropOffStartRange = 30,
    Range = 300, --in meters, after this distance the bullet stops existing
    Tracer = false, --show tracer
    NumBullets = 1, --the amount of bullets to fire
    PhysicsMultiplier = 1.25, --damage is multiplied by this amount when pushing objects
    HeadshotMultiplier = 2,
    Penetration = {
        DamageMultiplier = 0.85, --how much damaged is multipled by when leaving a surface.
        MaxCount = 6, --how many times the bullet can penetrate.
        Thickness = 25, --in hu, how thick an obstacle has to be to stop the bullet.
    }
}

SWEP.Zoom = {
    FovMultiplier = 0.95,
    ViewModelFovMultiplier = 1,
    Blur = {
        EyeFocusDistance = 10
    }
}

SWEP.WorldModelOffsets = {
    Bone = "tag_sling",
    Angles = Angle(0,100,-90),
    Pos = Vector(-1,-1,4)
}

SWEP.ViewModelOffsets = {
    Aim = {
        Angles = Angle(0, 0, 0),
        Pos = Vector(0, 0, 0)
    },
    Idle = {
        Angles = Angle(0, 0, 0),
        Pos = Vector(0, 0, 0)
    },
    Inspection = {
        Bone = "tag_sling",
        X = {
            [0] = {Pos = Vector(0, 3, 3), Angles = Angle(40, 0, -30)},
            [1] = {Pos = Vector(0, 0, 0), Angles = Angle(-10, 0, 0)}
        },
        Y = {
            [0] = {Pos = Vector(0, 0, 0), Angles = Angle(-10, 20, 0)},
            [1] = {Pos = Vector(4, 0, 1.5), Angles = Angle(10, -20, 0)}
        }
    },
    
    RecoilMultiplier = 1.75,
    KickMultiplier = 1.3,
    AimKickMultiplier = 0
}

SWEP.Shell = "ba_shelleject_sniper"

DEFINE_BASECLASS(SWEP.Base)

local excludedAtts = {"weapon_vm_scope_kilo98", "att_vm_scope_vz_kilo98", "att_vm_scope_kilo98"}

function SWEP:PostAttachment(att)
    BaseClass.PostAttachment(self, att)

    if (!self:HasAttachment("attachment_vm_sn_kilo98_nostrip")) then
        if (att.Category == "Sights") then
            if (!table.HasValue(excludedAtts, att.ClassName)) then
                self.Animations.Reload_Loop = nil
                self.Animations.Reload_End = nil
                self.Animations.Reload_Start = nil
            end
        end
    end
end


--im a fucking psychopath
SWEP.m_slingTarget = 1
SWEP.m_slingLerp = 1
function SWEP:TouchSling()
    self.m_slingTarget = 1
end

function SWEP:LeaveSling()
    self.m_slingTarget = 0
end

function SWEP:PostDrawViewModel(viewmodel, player, weapon)
    BaseClass.PostDrawViewModel(self, viewmodel, player, weapon)

    if (self:HasAttachment("attachment_vm_sn_kilo98_sling")) then
        self.m_slingLerp = Lerp(FrameTime() * 15, self.m_slingLerp, self.m_slingTarget)

        local slingBone1 = self:LookupBoneCached(self:GetViewModel(), "j_sling_02")
        local slingBone2 = self:LookupBoneCached(self:GetViewModel(), "j_sling_03")

        local target = Vector(0, -0.4, 0)
        target:Mul(self.m_slingLerp)
        self:GetViewModel():ManipulateBonePosition(slingBone1, target)

        target:Mul(0.75)
        self:GetViewModel():ManipulateBonePosition(slingBone2, target)
    end
end