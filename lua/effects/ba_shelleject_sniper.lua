AddCSLuaFile()

EFFECT.Model = Model("models/kyo/weapons/bullet/sniper_ba_spend.mdl")
EFFECT.Scale = 1.05
EFFECT.Force = 100
EFFECT.Offset = Vector()
EFFECT.Sounds = {
    Default = Sound("MW_Casings.9mm.cement"),
    Water = Sound("MW_Casings.9mm.water"),
    [MAT_DIRT] = Sound("MW_Casings.9mm.dirt"),
    [MAT_GLASS] = Sound("MW_Casings.9mm.glass"),
    [MAT_TILE] = Sound("MW_Casings.9mm.glass"),
    [MAT_GRASS] = Sound("MW_Casings.9mm.grass"),
    [MAT_FOLIAGE] = Sound("MW_Casings.9mm.grass"),
    [MAT_SLOSH] = Sound("MW_Casings.9mm.mud"),
    [MAT_FLESH] = Sound("MW_Casings.9mm.mud"),
    [MAT_BLOODYFLESH] = Sound("MW_Casings.9mm.mud"),
    [MAT_ALIENFLESH] = Sound("MW_Casings.9mm.mud"),
    [MAT_EGGSHELL] = Sound("MW_Casings.9mm.mud"),
    [MAT_METAL] = Sound("MW_Casings.9mm.metal"),
    [MAT_COMPUTER] = Sound("MW_Casings.9mm.metal"),
    [MAT_GRATE] = Sound("MW_Casings.9mm.metal"),
    [MAT_SAND] = Sound("MW_Casings.9mm.sand"),
    [MAT_SNOW] = Sound("MW_Casings.9mm.sand"),
    [MAT_VENT] = Sound("MW_Casings.9mm.metal"),
    [MAT_WOOD] = Sound("MW_Casings.9mm.wood_hollow")
}

include("mwb_shelleject.lua") 