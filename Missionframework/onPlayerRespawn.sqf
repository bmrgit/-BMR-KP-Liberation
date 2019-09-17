if ( isNil "GRLIB_respawn_loadout" ) then {
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;
	player linkItem "ItemMap";
	player linkItem "ItemCompass";
	player linkItem "ItemWatch";
	player linkItem "ItemRadio";
} else {
	sleep 4;
	[ player, GRLIB_respawn_loadout ] call F_setLoadout;
};

	player enableFatigue false;
	player enablestamina false;
	player setCustomAimCoef 0.3; 
	player setUnitRecoilCoefficient 0.30;
	player setUnitTrait ["camouflageCoef",0.8];
	player setUnitTrait ["audibleCoef",0.8];
	player setUnitTrait ['loadCoef',0.2];

