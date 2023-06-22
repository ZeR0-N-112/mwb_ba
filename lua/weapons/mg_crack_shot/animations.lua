AddCSLuaFile()

SWEP.Animations = {
    ["Idle"] = {--idle is a special animation index, movement animations are played when this is on
        Sequences = {"idle"},
        Fps = 30,
        Events = {
            {Time = 0, Callback = function(self) self:EnableGrip() end},
        }
        --does not need NextSequence to loop, it's an exception to the rule
    },

    ["Draw"] = {
        Sequences = {"draw"},
        Length = 0.85,
        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:LeaveSling() end},
            {Time = 0.067, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_raise_01")) end},
            {Time = 0.6, Callback = function(self) self:TouchSling() end},
        }
    },

    ["Holster"] = {
        Sequences = {"holster"},
        Length = 0.8,
        Fps = 30,
        Events = {
            {Time = 0.067, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_drop_01")) end},
            {Time = 0.133, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_drop_02")) end},
        }
    },

    ["Equip"] = {
        Sequences = {"draw_First"},
        Length = 1.25,
        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:TouchSling() end},
            {Time = 0.867, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_raise_first_03")) end},
            {Time = 0.767, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_raise_first_02")) end},
            {Time = 0.067, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_raise_first_01")) end},
        }
    },

    ["Reload"] = {
        Sequences = {"reload"},
        Length = 3.5,
        MagLength = 2,
        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:TouchSling() end},
            {Time = 0.8, Callback = function(self) self:LeaveSling() end},
            {Time = 2.7, Callback = function(self) self:TouchSling() end},
            {Time = 2.8, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_06")) end},
            {Time = 2.233, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_05")) end},
            {Time = 1.0, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_03")) end},
            {Time = 0.033, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_01")) end},
            {Time = 3.067, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_07")) end},
            {Time = 1.233, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_04")) end},
            {Time = 1.767, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_045")) end},
            {Time = 3.4, Callback = function(self) self:LeaveSling() end},
            {Time = 3.5, Callback = function(self) self:TouchSling() end},
        }
    },

    ["Reload_Empty"] = {
        Sequences = {"reload_empty"},
        Length = 3.75,
        MagLength = 2,
        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:TouchSling() end},
            {
                Time = 0.35, 
                Callback = function(self) 
                    self:DoEjection("shell_eject")
                    self:DoParticle("Ejection", "shell_eject")
                end
            },
            {Time = 0.8, Callback = function(self) self:LeaveSling() end},
            {Time = 2.7, Callback = function(self) self:TouchSling() end},
            {Time = 2.833, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_empty_06")) end},
            {Time = 1.367, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_empty_04")) end},
            {Time = 1.9, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_empty_045")) end},
            {Time = 0.0, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_empty_01")) end},
            {Time = 3.433, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_empty_07")) end},
            {Time = 2.5, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_empty_05")) end},
            {Time = 0.933, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_empty_03")) end},
            {Time = 3.4, Callback = function(self) self:LeaveSling() end},
            {Time = 3.5, Callback = function(self) self:TouchSling() end},
        }
    },

    ["reload_fast"] = {
        Sequences = {"reload_fast"},
        Length = 2.5,
        MagLength = 1.5,
        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:TouchSling() end},
            {Time = 0, Callback = function(self)  end},
            {Time = 0, Callback = function(self)  end},
            {Time = 0.367, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_fast_02")) end},
            {Time = 0.9, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_fast_03")) end},
            {Time = 0.167, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_fast_01")) end},
            {Time = 2.4, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_fast_06")) end},
            {Time = 2.1, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_fast_04")) end},
            {Time = 2.167, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_fast_05")) end},
            {Time = 1.333, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_fast_035")) end},
            {Time = 2.3, Callback = function(self) self:LeaveSling() end},
            {Time = 2.35, Callback = function(self) self:TouchSling() end},
        }
    },

    ["reload_empty_fast"] = {
        Sequences = {"reload_empty_fast"},
        Length = 2.7,
        MagLength = 1.5,
        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:TouchSling() end},
            {Time = 0, Callback = function(self) end},
            {
                Time = 0.35, 
                Callback = function(self) 
                    self:DoEjection("shell_eject")
                    self:DoParticle("Ejection", "shell_eject")
                end
            },
            {Time = 0.8, Callback = function(self) self:LeaveSling() end},
            {Time = 2.7, Callback = function(self) self:TouchSling() end},
            {Time = 0.0, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_empty_fast_02")) end},
            {Time = 1.567, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_empty_fast_035")) end},
            {Time = 0.0, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_empty_fast_01")) end},
            {Time = 1.167, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_empty_fast_03")) end},
            {Time = 1.833, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_empty_fast_04")) end},
            {Time = 1.967, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_empty_fast_05")) end},
            {Time = 2.3, Callback = function(self) self:LeaveSling() end},
            {Time = 2.35, Callback = function(self) self:TouchSling() end},
        }
    },

    ["reload_start_scope"] = {
        Sequences = {"reload_start"},
        Length = 1.56,
        Fps = 30,
        MagLength = 1.56,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:TouchSling() end},
            {Time = 0.3, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_scope_start_02")) end},
            {Time = 0.867, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_scope_start_03")) end},
            {Time = 0.067, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_scope_start_01")) end},
            {Time = 0.9, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_scope_start_04")) end},        
        }
    },

    ["reload_loop_scope"] = {
        Sequences = {"reload_loop"},
        Length = 0.55,
        Fps = 30,
        MagLength = 0.33,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:LeaveSling() end},
            {Time = 0.04, Callback = function(self) self:TouchSling() end},
            {Time = 0.033, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_scope_loop_01")) end},  
        }
    },

    ["reload_end_scope"] = {
        Sequences = {"reload_end"},
        Length = 1.13,
        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:TouchSling() end},
            {Time = 0.75, Callback = function(self) self:LeaveSling() end},
            {Time = 0.9, Callback = function(self) self:TouchSling() end},
            {Time = 0.2, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_scope_end_01")) end},
            {Time = 0.833, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_scope_end_03")) end},
            {Time = 0.267, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_scope_end_02")) end},
        }
    },

    ["reload_start_fast_scope"] = {
        Sequences = {"reload_start_fast"},
        Length = 1.2,
        Fps = 30,
        MagLength = 1.1,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:TouchSling() end},
            {Time = 0.133, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_scope_start_02")) end},
            {Time = 0.767, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_scope_start_03")) end},
            {Time = 0.033, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_scope_start_01")) end},
            {Time = 0.8, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_scope_start_04")) end},    
        }
    },

    ["reload_loop_fast_scope"] = {
        Sequences = {"reload_loop_fast"},
        Length = 0.45,
        Fps = 30,
        MagLength = 0.25,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:TouchSling() end},
            {Time = 0.033, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_scope_loop_fast_01")) end},  
        }
    },

    ["reload_end_fast_scope"] = {
        Sequences = {"reload_end_fast"},
        Length = 0.86,
        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:TouchSling() end},
            {Time = 0.45, Callback = function(self) self:LeaveSling() end},
            {Time = 0.5, Callback = function(self) self:TouchSling() end},
            {Time = 0.2, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_scope_end_01")) end},
            {Time = 0.633, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_scope_end_03")) end},
            {Time = 0.267, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_reload_scope_end_02")) end},
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
                end
            },
            {Time = 0, Callback = function(self) self:EnableGrip() self:TouchSling() end},
        }
    },

    ["Rechamber"] = {
        Sequences = {"rechamber"},
        Length = 1,
        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:TouchSling() end},
            {
                Time = 0.25, 
                Callback = function(self) 
                    self:DoEjection("shell_eject")
                    self:DoParticle("Ejection", "shell_eject")
                end
            },
            {Time = 1, Callback = function(self) self:LeaveSling() end},
            {Time = 1.1, Callback = function(self) self:TouchSling() end},
            {Time = 0.767, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_rechamber_04")) end},
            {Time = 0.067, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_rechamber_01")) end},
            {Time = 0.7, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_rechamber_03")) end},
            {Time = 0.3, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_rechamber_02")) end},
            {Time = 1.033, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_rechamber_scope_05")) end},
        }
    },

    ["rechamber_scope"] = {
        Sequences = {"rechamber_scope"},
        Length = 1,
        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:TouchSling() end},
            {
                Time = 0.25, 
                Callback = function(self) 
                    self:DoEjection("shell_eject")
                    self:DoParticle("Ejection", "shell_eject")
                end
            },
            {Time = 1, Callback = function(self) self:LeaveSling() end},
            {Time = 1.1, Callback = function(self) self:TouchSling() end},
            {Time = 0.767, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_rechamber_04")) end},
            {Time = 0.067, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_rechamber_01")) end},
            {Time = 0.7, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_rechamber_03")) end},
            {Time = 0.3, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_rechamber_02")) end},
            {Time = 1.033, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_kilo98_rechamber_scope_05")) end},
        }
    },

    ["Fire_Last"] = {
        Sequences = {"fire"},
        Fps = 60,
        NextSequence = "Idle",
        Events = {
            {
                Time = 0, 
                Callback = function(self) 
                    self:DoParticle("MuzzleFlash", "muzzle")
                end
            },
            {Time = 0, Callback = function(self) self:EnableGrip() self:TouchSling() end},
        }
    },

    ["Ads_In"] = {
        Sequences = {"ads_in"},
        Length = 0.25,
        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:EnableGrip() self:TouchSling() end}, 
            {Time = 0, Callback = function(self) self:DoSound(Sound("mw19.sbeta.ads.up")) end},
        }
    },

    ["Ads_Out"] = {
        Sequences = {"ads_out"},
        Length = 0.25,
        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:EnableGrip() self:TouchSling() end}, 
            {Time = 0, Callback = function(self) self:DoSound(Sound("mw19.sbeta.ads.down")) end},
        }
    },

    ["Sprint_In"] = {
        Sequences = {"sprint_in"},
        Fps = 24,
        Events = {
            {Time = 0, Callback = function(self) self:EnableGrip() self:TouchSling() end},
        }
        --NextSequence = "Sprint_Loop",
    },

    ["Sprint_Loop"] = {
        Sequences = {"sprint_loop"},
        Fps = 30,
        NextSequence = "Sprint_Loop", --make our state loop
        --while sprinting, the playback rate of the viewmodel is scaled with velocity (cod-like behaviour)
        Events = {
        {Time = 0, Callback = function(self) self:EnableGrip() self:TouchSling() end},
        }
    },

    ["Sprint_Out"] = {
        Sequences = {"sprint_out"},
        Length = 0.3,
        Fps = 24,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:EnableGrip() self:TouchSling() end},
        }
    },

    ["Inspect"] = {
        Sequences = {"inspect"},
        Length = 5,
        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:LeaveSling() end},
            {Time = 1.4, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_sbeta_inspect_02")) end},
            {Time = 0.0, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_sbeta_inspect_01")) end},
            {Time = 4.2, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_sbeta_inspect_04")) end},
            {Time = 2.4, Callback = function(self) self:DoSound(Sound("ps_wfoly_plr_sn_sbeta_inspect_03")) end},
            {Time = 4, Callback = function(self) self:TouchSling() end},
        }
    },

    ["Jog_Out"] = {
        Sequences = {"jog_out"},
        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:EnableGrip() end},
        }
    },

    ["Jump"] = {
        Sequences = {"jump"},
        Fps = 15,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:EnableGrip() end},
        }
    },

    ["Land"] = {
        Sequences = {"jump_land"},
        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:EnableGrip() end},
        }
    },

    ["HybridOn"] = {
        Sequences = {"hybrid_toggle_off"},
        Fps = 30,
        Length = 0.9,
        NextSequence = "Idle",
        Events = {
            {Time = 0.15, Callback = function(self) self:DoSound(Sound("Flipsight.Up")) end}
        }
    },

    ["HybridOff"] = {
        Sequences = {"hybrid_toggle_on"},
        Fps = 30,
        Length = 0.9,
        NextSequence = "Idle",
        Events = {
            {Time = 0.1, Callback = function(self) self:DoSound(Sound("Flipsight.Down")) end}
        }
    },

    ["Melee"] = {
        Sequences = {"melee_miss_01", "melee_miss_02", "melee_miss_03"},
        Length = 0.6, --if melee misses

        Size = 15,
        Range = 40,

        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:DisableGrip() end},
            {Time = 0, Callback = function(self) self:DoSound(Sound("MW_Melee.Miss_Medium")) end},
            {Time = 0.8, Callback = function(self) self:EnableGrip() end},
        }
    },

    ["Melee_Hit"] = {
        Sequences = {"melee_hit_01", "melee_hit_02", "melee_hit_03"},
        Length = 0.3, --if melee hits

        Damage = 45,

        Fps = 30,
        NextSequence = "Idle",
        Events = {
            {Time = 0, Callback = function(self) self:DisableGrip() end},
            {Time = 0, Callback = function(self) self:DoSound(Sound("MW_Melee.Flesh_Medium")) end},
            {Time = 0.8, Callback = function(self) self:EnableGrip() end},
        }
    },
}