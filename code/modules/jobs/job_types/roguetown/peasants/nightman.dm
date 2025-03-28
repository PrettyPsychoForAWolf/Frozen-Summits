/datum/job/roguetown/nightman
	title = "Nightmaster"
	f_title = "Nightmatron"
	flag = NIGHTMASTER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 0
	spawn_positions = 0

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_TOLERATED_UP
	allowed_ages = ALL_AGES_LIST

	tutorial = "Fallen noble and owner of the Whitevein Lounge, you run a decaying bathhouse converted into a den of low-lifes, home to a troublemaking racket that the others hate to tolerate."

	allowed_ages = ALL_AGES_LIST
	outfit = /datum/outfit/job/roguetown/nightman
	display_order = JDO_NIGHTMASTER
	give_bank_account = TRUE
	min_pq = 5
	max_pq = null

/datum/outfit/job/roguetown/nightman/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	pants = /obj/item/clothing/under/roguetown/trou/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor/nightman
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	beltr = /obj/item/storage/keyring/nightman
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/ammo_holder/quiver/bolts
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger = 1)
	if(H.mind)
		H.mind.AddSpell(new SPELL_CONVERT_ROLE_PROSTITUTE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("intelligence", -1)
	if(H.dna?.species)
		if(H.gender == MALE)
			H.dna.species.soundpack_m = new /datum/voicepack/male/zeth()
		if(iself(H) || ishalfelf(H))
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
		else if(isdwarf(H))
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor

/obj/effect/proc_holder/spell/self/convertrole/prostitute
	name = "Hire Prostitute"
	new_role = "Prostitute"
	overlay_state = "recruit_servant"
	recruitment_faction = "Prostitute"
	recruitment_message = "Work for me, %RECRUIT."
	accept_message = "I will."
	refuse_message = "I refuse."
