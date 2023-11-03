//Red Tribe
/datum/job/indians/trib/rchief
	title = "Red Tribe Chieftain"
	en_meaning = FALSE
	rank_abbreviation = "Chieftain"
	is_officer = TRUE
	
	spawn_location = "JoinLateRChief"
	can_be_female = TRUE
	
	min_positions = 1
	max_positions = 1
	
/datum/job/indians/trib/rchief/equip(var/mob/living/human/H)
	H.equip_to_slot_or_del(new /obj/item/weapon/material/hatchet/bone_battleaxe(H), slot_r_hand)
	H.equip_to_slot_or_del(new /obj/item/weapon/shield/nguni_shield(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/loinleather(H), slot_w_uniform)
	var/obj/item/clothing/accessory/armband/british = new /obj/item/clothing/accessory/custom/armband(null)
	uniform.attackby(white, H)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/gatorpelt(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal(H), slot_shoes)
	H.setStat("strength", STAT_VERY_HIGH)
	H.setStat("crafting", STAT_VERY_HIGH)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_VERY_HIGH)
	H.setStat("swords", STAT_VERY_HIGH)
	H.setStat("pistol", STAT_MEDIUM_HIGH)
	H.setStat("bows", STAT_VERY_HIGH)
	H.setStat("medical", STAT_MEDIUM_LOW)
	
	
/datum/job/indians/trib/rshaman
	title = "Red Tribe Shaman"
	en_meaning = FALSE
	rank_abbreviation = "Shaman"
	
	spawn_location = "JoinLateRShaman"
	can_be_female = TRUE
	
	min_positions = 1
	max_positions = 3
	
/datum/job/indians/trib/rshaman/equip(var/mob/living/human/H)
	H.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack/bint/leather(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/stack/medical/advanced/herbs(H), slot_r_hand)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/loinleather(H), slot_w_uniform)
	var/obj/item/clothing/accessory/armband/british = new /obj/item/clothing/accessory/custom/armband(null)
	uniform.attackby(white, H)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/goatpelt(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal(H), slot_shoes)
	
	H.setStat("strength", STAT_MEDIUM_LOW)
	H.setStat("crafting", STAT_MEDIUM_LOW)
	H.setStat("rifle", STAT_LOW)
	H.setStat("dexterity", STAT_VERY_HIGH)
	H.setStat("swords", STAT_MEDIUM_LOW)
	H.setStat("pistol", STAT_LOW)
	H.setStat("bows", STAT_MEDIUM_LOW)
	H.setStat("medical", STAT_VERY_HIGH)
	
/datum/job/indians/trib/rtribesperson
	title = "Red Tribe Tribesperson"
	en_meaning = FALSE
	rank_abbreviation = ""
	
	spawn_location = "JoinLateRTribesperson"
	can_be_female = TRUE
	
	min_positions = 1
	max_positions = 200
	
/datum/job/indians/trib/rtribesperson/equip(var/mob/living/human/H)
	H.setStat("strength", STAT_HIGH)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_MEDIUM_HIGH)
	H.setStat("swords", STAT_HIGH)
	H.setStat("pistol", STAT_MEDIUM_HIGH)
	H.setStat("bows", STAT_MEDIUM_LOW)
	H.setStat("medical", STAT_MEDIUM_LOW)
	
//Blue Tribe
/datum/job/indians/trib/BChief
	title = "Blue Tribe Chieftain"
	en_meaning = FALSE
	rank_abbreviation = "Chieftain"
	is_officer = TRUE
	
	spawn_location = "JoinLateBChief"
	can_be_female = TRUE
	
	min_positions = 1
	max_positions = 1
	
/datum/job/indians/trib/bchief/equip(var/mob/living/human/H)
	H.equip_to_slot_or_del(new /obj/item/weapon/material/hatchet/bone_battleaxe(H), slot_r_hand)
	H.equip_to_slot_or_del(new /obj/item/weapon/shield/nguni_shield(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/loinleather(H), slot_w_uniform)
	var/obj/item/clothing/accessory/armband/french = new /obj/item/clothing/accessory/custom/armband(null)
	uniform.attackby(white, H)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/gatorpelt(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal(H), slot_shoes)
	
	H.setStat("strength", STAT_VERY_HIGH)
	H.setStat("crafting", STAT_VERY_HIGH)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_VERY_HIGH)
	H.setStat("swords", STAT_VERY_HIGH)
	H.setStat("pistol", STAT_MEDIUM_HIGH)
	H.setStat("bows", STAT_VERY_HIGH)
	H.setStat("medical", STAT_MEDIUM_LOW)
	
	
/datum/job/indians/trib/bshaman
	title = "Blue Tribe Shaman"
	en_meaning = FALSE
	rank_abbreviation = "Shaman"
	
	spawn_location = "JoinLateBShaman"
	can_be_female = TRUE
	
	min_positions = 1
	max_positions = 3
	
/datum/job/indians/trib/bshaman/equip(var/mob/living/human/H)
	H.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack/bint/leather(H), slot_l_hand)
	H.equip_to_slot_or_del(new /obj/item/stack/medical/advanced/herbs(H), slot_r_hand)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/loinleather(H), slot_w_uniform)
	var/obj/item/clothing/accessory/armband/french = new /obj/item/clothing/accessory/custom/armband(null)
	uniform.attackby(white, H)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/goatpelt(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal(H), slot_shoes)
	
	H.setStat("strength", STAT_MEDIUM_LOW)
	H.setStat("crafting", STAT_MEDIUM_LOW)
	H.setStat("rifle", STAT_LOW)
	H.setStat("dexterity", STAT_VERY_HIGH)
	H.setStat("swords", STAT_MEDIUM_LOW)
	H.setStat("pistol", STAT_LOW)
	H.setStat("bows", STAT_MEDIUM_LOW)
	H.setStat("medical", STAT_VERY_HIGH)
	
/datum/job/indians/trib/btribesperson
	title = "Blue Tribe Tribesperson"
	en_meaning = FALSE
	rank_abbreviation = ""
	
	spawn_location = "JoinLateBTribesperson"
	can_be_female = TRUE
	
	min_positions = 1
	max_positions = 200
	
/datum/job/indians/trib/btribesperson/equip(var/mob/living/human/H)
	H.setStat("strength", STAT_HIGH)
	H.setStat("crafting", STAT_NORMAL)
	H.setStat("rifle", STAT_NORMAL)
	H.setStat("dexterity", STAT_MEDIUM_HIGH)
	H.setStat("swords", STAT_HIGH)
	H.setStat("pistol", STAT_MEDIUM_HIGH)
	H.setStat("bows", STAT_MEDIUM_LOW)
	H.setStat("medical", STAT_MEDIUM_LOW)