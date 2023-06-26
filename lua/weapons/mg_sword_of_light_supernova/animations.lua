AddCSLuaFile()

SWEP.Animations = {
    ["Idle"] = {--idle is a special animation index, movement animations are played when this is on
        Sequences = {"idle"},
        Fps = 30
        --does not need NextSequence to loop, it's an exception to the rule
    },

    ["Draw"] = {
        Sequences = {"draw"},
        Length = 1.2,
        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:DoSound(Sound("mw19.dblmg.inspect.1")) end}
        }
    },

    ["Holster"] = {
        Sequences = {"holster"},
        Length = 0.8,
        Fps = 30,
        Events = {
            {Time = 0, Callback = function(self) self:DoSound(Sound("mw19.dblmg.inspect.3")) end}
        }
    },

    ["Reload"] = {
        Sequences = {"reload"},
        Length = 4,
        Fps = 30,
        MagLength = 2.3,
        NextSequence = "Idle",
        Events = {
            {Time = 0.13, Callback = function(self) self:DoSound(Sound("mw19.dblmg.reload.start")) end},
            {Time = 0.85, Callback = function(self) self:DoSound(Sound("mw19.dblmg.belt.out")) end},
            {Time = 2.5, Callback = function(self) self:DoSound(Sound("mw19.dblmg.belt.in")) end},
            {Time = 3, Callback = function(self) self:DoSound(Sound("mw19.dblmg.reload.end")) end},
        }
    },

    ["Reload_Empty"] = {
        Sequences = {"reload"},
        Length = 4,
        Fps = 30,
        MagLength = 2.3,
        NextSequence = "Idle",
        Events = {
            {Time = 0.13, Callback = function(self) self:DoSound(Sound("mw19.dblmg.reload.start")) end},
            {Time = 1.5, Callback = function(self) self:DoSound(Sound("mw19.dblmg.belt.out")) end},
            {Time = 3.5, Callback = function(self) self:DoSound(Sound("mw19.dblmg.belt.in")) end},
            {Time = 4.5, Callback = function(self) self:DoSound(Sound("mw19.dblmg.reload.end")) end},
        }
    },

    ["spin_up"] = {
        Sequences = {"spin_up"},
        Length = 1,
        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:DoSound(Sound("mw19.dblmg.inspect.3")) end}
        }
    },

    ["spin_loop"] = {
        Sequences = {"spin_loop"},
        Length = 1,
        Fps = 30,
        Events = {
            {Time = 0, Callback = function(self) self:DoSound(Sound("mw19.dblmg.inspect.3")) end}
        }
    },

    ["spin_end"] = {
        Sequences = {"spin_end"},
        Length = 1,
        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:DoSound(Sound("mw19.dblmg.inspect.3")) end}
        }
    },

    ["Fire"] = {
        Sequences = {"fire"},
        Fps = 60,
        NextSequence = "Idle",
        Events = {
            {
                Time = 0, 
                Callback = function(self) 
                    self:DoParticle("MuzzleFlash", "muzzle")
                    self:DoParticle("Ejection", "shell_eject")
                    self:DoEjection("shell_eject")
                end
            },
            {Time = 0.01, Callback = function(self) self:DoSound(Sound("mw19.dblmg.spin.loop")) end}
        }
    },

    ["fire_charge"] = {
        Sequences = {"fire_charge"},
        Fps = 60,
        NextSequence = "Idle",
        Events = {
        }
    },

    ["Ads_In"] = {
        Sequences = {"idle"},
        Length = 0.3,
        Fps = 20,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:DoSound(Sound("MW19_L86.ADS_Up")) end}
        }
    },

    ["Ads_Out"] = {
        Sequences = {"idle"},
        Length = 0.3,
        Fps = 20,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:DoSound(Sound("MW19_L86.ADS_Down")) end}
        }
    },

    ["Sprint_In"] = {
        Sequences = {"sprint_in"},
        Fps = 10,
        NextSequence = "Sprint_Loop",
    },

    ["Sprint_Out"] = {
        Sequences = {"sprint_out"},
        Length = 0.3,
        Fps = 10,
        NextSequence = "Idle",
    },

    ["Inspect"] = {
        Sequences = {"inspect"},
        Length = 5,
        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0.32, Callback = function(self) self:DoSound(Sound("mw19.dblmg.inspect.1")) end},
            {Time = 0.7, Callback = function(self) self:DoSound(Sound("mw19.dblmg.inspect.2")) end},
            {Time = 3, Callback = function(self) self:DoSound(Sound("mw19.dblmg.inspect.3")) end}
        }
    },

    ["Jog_Out"] = {
        Sequences = {"jog_out"},
        Fps = 30,
        NextSequence = "Idle"
    },

    ["Jump"] = {
        Sequences = {"jump"},
        Fps = 15,
        NextSequence = "Idle"
    },

    ["Land"] = {
        Sequences = {"jump_land"},
        Fps = 30,
        NextSequence = "Idle"
    },

    ["Melee"] = {
        Sequences = {"melee_hit_01"},
        Length = 1, --if melee misses

        Size = 15,
        Range = 75,

        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:DoSound(Sound("MW_Melee.Miss_Large")) end}
        }
    },

    ["Melee_Hit"] = {
        Sequences = {"melee_hit_01"},
        Length = 1, --if melee hits

        Damage = 75,

        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:DoSound(Sound("MW_Melee.Flesh_Large")) end}
        }
    },
}