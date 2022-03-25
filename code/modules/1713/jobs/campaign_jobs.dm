/datum/job/pirates/redfaction
	title = "Red Faction"
	rank_abbreviation = ""
	spawn_location = "JoinLateRed"
	is_event = TRUE
	uses_squads = TRUE

	min_positions = 999
	max_positions = 999

/datum/job/pirates/redfaction/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/russian(H), slot_w_uniform)
//helmet
	H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/pasgt(H), slot_head)
//armor
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/armor/coldwar/pasgt/pasgt_armor = new /obj/item/clothing/accessory/armor/coldwar/pasgt(null)
	uniform.attackby(pasgt_armor, H)
//equipment
	H.equip_to_slot_or_del(new /obj/item/flashlight/militarylight(H), slot_wear_id)
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_NORMAL)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_NORMAL)
	H.setStat("machinegun", STAT_NORMAL)
	return TRUE

/datum/job/civilian/bluefaction
	title = "Blue Faction"
	rank_abbreviation = ""
	spawn_location = "JoinLateBlue"
	is_event = TRUE
	uses_squads = TRUE

	min_positions = 999
	max_positions = 999

/datum/job/civilian/bluefaction/equip(var/mob/living/human/H)
	if (!H)	return FALSE
//shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
//clothes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/us_uni(H), slot_w_uniform)
//helmet
	H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/modern/ach/green(H), slot_head)
//armor
	var/obj/item/clothing/under/uniform = H.w_uniform
	var/obj/item/clothing/accessory/armor/coldwar/pasgt/green/pasgt_armor = new /obj/item/clothing/accessory/armor/coldwar/pasgt/green(null)
	uniform.attackby(pasgt_armor, H)
//equipment
	H.equip_to_slot_or_del(new /obj/item/flashlight/militarylight(H), slot_wear_id)
	H.setStat("strength", STAT_NORMAL)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_NORMAL)
	H.setStat("swords", STAT_NORMAL)
	H.setStat("pistol", STAT_NORMAL)
	H.setStat("bows", STAT_NORMAL)
	H.setStat("medical", STAT_NORMAL)
	H.setStat("machinegun", STAT_NORMAL)
	return TRUE
