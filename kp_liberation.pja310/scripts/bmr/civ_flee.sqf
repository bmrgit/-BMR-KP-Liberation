//Event Handler to make Civs Flee: Credit to Phronk, Edited by Rory
{if(side _x==civilian)then{
_x addEventHandler["FiredNear",{
_civ=_this select 0;

	switch(round(random 2))do{
		case 0:{_civ switchMove "ApanPercMstpSnonWnonDnon_G01";_civ setSpeedMode "FULL";};
		case 1:{_civ playMoveNow "ApanPknlMstpSnonWnonDnon_G01";_civ setSpeedMode "FULL";};
		case 2:{_civ playMoveNow "ApanPpneMstpSnonWnonDnon_G01";_civ setSpeedMode "FULL";};
		default{_civ playMoveNow "ApanPknlMstpSnonWnonDnon_G01";_civ setSpeedMode "FULL";};};

_excludedbuildings = ["Land_TTowerSmall_1_F", "Land_Dome_Big_F", "Cargo_Patrol_base_F", "Cargo_House_base_F", "Cargo_Tower_base_F", "Cargo_HQ_base_F","Piers_base_F", "PowerLines_base_F", "PowerLines_Wires_base_F", "PowerLines_Small_base_F", "Land_PowerPoleWooden_L_F","Land_Research_HQ_F", "Land_Research_house_V1_F", "Land_MilOffices_V1_F", "Land_TBox_F", "Land_Chapel_V1_F","Land_Chapel_Small_V2_F",  "Land_Chapel_Small_V1_F", "Land_BellTower_01_V1_F", "Land_BellTower_02_V1_F", "Land_fs_roof_F","Land_fs_feed_F", "Land_Windmill01_ruins_F", "Land_d_Windmill01_F", "Land_i_Windmill01_F","Land_i_Barracks_V2_F", "Land_spp_Transformer_F", "Land_dp_smallFactory_F", "Land_Shed_Big_F", "Land_Metal_Shed_F","Land_i_Shed_Ind_F","Land_Communication_anchor_F", "Land_TTowerSmall_2_F", "Land_Communication_F","Land_cmp_Shed_F", "Land_cmp_Tower_F", "Land_u_Shed_Ind_F", "Land_TBox_F"];

_buildings = {nearestObjects [_civ, ["house"], 100] select {
		[_x, 3] call BIS_fnc_isBuildingEnterable and {not (typeof _x in _excludedbuildings)}}
};

//nearestObjects[ PositionOrTarget, ["List","Of","Classnames","To","Look","For"], MaxDistanceToSearchAroundTarget ];
_nH=nearestObjects[_civ,_buildings,100];

_H=selectRandom _nH;//Pick an object found in the above nearestObjects array

_HP=_H buildingPos -1;//Finds list of all available building positions in the selected building

_HP=selectRandom _HP;//Picks a building position from the list of building positions

_civ doMove _HP;//Orders the civilian to move to the building position

//Remove the eventHandler to prevent spamming
_civ removeAllEventHandlers "FiredNear";}];};
}forEach allUnits-switchableUnits-playableUnits