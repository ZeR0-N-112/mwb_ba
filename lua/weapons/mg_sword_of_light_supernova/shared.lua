AddCSLuaFile()

PrecacheParticleSystem("AC_muzzle_rifle")
PrecacheParticleSystem("AC_muzzle_pistol_suppressed")
PrecacheParticleSystem("AC_muzzle_pistol_ejection")
PrecacheParticleSystem("AC_muzzle_minigun_smoke_barrel")
include("animations.lua")

if CLIENT then
    killicon.Add( "mg_dblmg", "VGUI/entities/mg_dblmg", Color(255, 0, 0, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/spawnicons/icon_cac_lm_dblmg")
end

SWEP.Base = "mg_base"

SWEP.ParticleEffects = {
    ["MuzzleFlash"] = "AC_muzzle_rifle",
    ["MuzzleFlash_Suppressed"] = "AC_muzzle_pistol_suppressed",
    ["Ejection"] = "AC_muzzle_pistol_ejection", 
}

SWEP.BarrelSmoke = {
    Particle = "AC_muzzle_minigun_smoke_barrel",
    Attachment = "muzzle",
    ShotTemperatureIncrease = 15,
    TemperatureThreshold = 150, --temperature that triggers smoke
    TemperatureCooldown = 100 --degrees per second
}

SWEP.PrintName = "Sword of Light : Supernova"
SWEP.Category = "Modern Warfare - Blue Archive"
SWEP.SubCategory = "Specials"
SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.VModel = Model("models/kyo/weapons/v_sword_of_light_supernova.mdl")
SWEP.WorldModel = Model("models/zeron/weapons/w_little_machine_gun_v.mdl")

SWEP.Slot = 3
SWEP.HoldType = "Shotgun"

SWEP.Primary.Sound = Sound("mw19.dblmg.fire")
SWEP.Primary.TrailingSound = Sound("mw19.dblmg.spin.loop")
SWEP.Primary.Ammo = "357"
SWEP.Primary.ClipSize = 30
SWEP.Primary.Automatic = false
SWEP.Primary.BurstRounds = 1
SWEP.Primary.BurstDelay = 0
SWEP.Primary.RPM = 120
SWEP.CanDisableAimReload = true

SWEP.Trigger = {
    PressedSound = Sound("mw19.dblmg.spin.up"),
    ReleasedSound = Sound("mw19.dblmg.spin.down"),
    PlayReleasedSoundRegardless = true,
    PressedAnimation = "spin_up",
    Time = 1.45
}

SWEP.Reverb = {
    RoomScale = 50000, --(cubic hu)
    --how big should an area be before it is categorized as 'outside'?

    Sounds = {
        Outside = {
            Layer = Sound("Atmo_LMG.Outside"),
            Reflection = Sound("Reflection_AR.Outside")
        },

        Inside = { 
            Layer = Sound("Atmo_LMG.Inside"),
            Reflection = Sound("Reflection_AR.Inside")
        }
    }
}

SWEP.Customization = {}
SWEP.FreezeInspectDelta = 0.3

SWEP.Firemodes = {
    [1] = {
        Name = "Full Auto",
        OnSet = function()
            return "Firemode_Auto"
        end
    },
}
SWEP.Cone = {
    Hip = 0.5, --accuracy while hip
    Ads = 0, --accuracy while aiming
    Increase = 0.015, --increase cone size by this amount every time we shoot
    AdsMultiplier = 0.25, --multiply the increase value by this amount while aiming
    Max = 3.15, --the cone size will not go beyond this size
    Decrease = 0.75, -- amount (in seconds) for the cone to completely reset (from max)
    Seed = 32452 --just give this a random number
}

SWEP.Recoil = {
    Vertical = {0.1, 0.35}, --random value between the 2
    Horizontal = {-0.5, 0.5}, --random value between the 2
    Shake = 1.5, --camera shake
    AdsMultiplier = 0.5, --multiply the values by this amount while aiming
    Seed = 7355608 --give this a random number until you like the current recoil pattern
}

SWEP.Bullet = {
    Damage = {350, 265}, --first value is damage at 0 meters from impact, second value is damage at furthest point in effective range
    EffectiveRange = 30, --in meters, damage scales within this distance
    Range = 1220, --in meters, after this distance the bullet stops existing
    Tracer = false, --show tracer
    NumBullets = 2, --the amount of bullets to fire
    PhysicsMultiplier = 0.75 --damage is multiplied by this amount when pushing objects
}

SWEP.Zoom = {
    FovMultiplier = 0.7,
    ViewModelFovMultiplier = 1.1,
    Blur = {
        EyeFocusDistance = 10
    }
}

SWEP.WorldModelOffsets = {
    Bone = "j_dblmg_offset",
    Angles = Angle(0, 90, -90),
    Pos = Vector(15,-1,-11)
}

SWEP.ViewModelOffsets = {
    Sprint = {
        Angles = Angle(0, 0, 0),
        Pos = Vector(0, 0, 0)
    },
    Aim = {
        Angles = Angle(0, 0, 0),
        Pos = Vector(-2, 0, 1)
    },
    Idle = {
        Angles = Angle(0, 0, 0),
        Pos = Vector(0, 0, 0)
    },

    RecoilMultiplier = 1.2,
    KickMultiplier = 3,
    AimKickMultiplier = 3
}

SWEP.Shell = "ba_shelleject_556"

local base = weapons.Get("mg_base")

function SWEP:HasAttachment(att)
    if (att == "att_ammo_he") then
        return true
    end

    return base.HasAttachment(self, att)
end