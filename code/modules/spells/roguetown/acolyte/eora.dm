//Eora content from Stonekeep

/obj/effect/proc_holder/spell/invoked/bud
	name = "Sune Bloom"
	desc = ""
	clothes_req = FALSE
	range = 7
	overlay_state = "love"
	sound = list('sound/magic/magnet.ogg')
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	releasedrain = 40
	chargetime = 60
	warnie = "spellwarning"
	no_early_release = TRUE
	charging_slowdown = 1
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/holy
	charge_max = 60 SECONDS
	cost = 1

/obj/effect/proc_holder/spell/invoked/bud/cast(list/targets, mob/living/user)
	var/target = targets[1]
	if(istype(target, /mob/living/carbon/human)) //Putting flower on head check
		var/mob/living/carbon/human/C = target
		if(!C.get_item_by_slot(SLOT_HEAD))
			var/obj/item/clothing/head/peaceflower/F = new(get_turf(C))
			C.equip_to_slot_if_possible(F, SLOT_HEAD, TRUE, TRUE)
			to_chat(C, "<span class='info'>A flower of Sune blooms on my head. I feel at peace.</span>")
			return TRUE
		else
			to_chat(user, "<span class='warning'>The target's head is covered. The flowers of Sune need an open space to bloom.</span>")
			revert_cast()
			return FALSE
	var/turf/T = get_turf(targets[1])
	if(!isclosedturf(T))
		new /obj/item/clothing/head/peaceflower(T)
		return TRUE
	to_chat(user, "<span class='warning'>The targeted location is blocked. The flowers of Sune refuse to grow.</span>")
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/invoked/eoracurse
	name = "Sune's Curse"
	overlay_state = "curse2"
	releasedrain = 50
	chargetime = 30
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	chargedloop = null
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/whiteflame.ogg'
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 10 SECONDS
	miracle = FALSE
	cost = 2

/obj/effect/proc_holder/spell/invoked/eoracurse/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		target.apply_status_effect(/datum/status_effect/buff/druqks)
		target.apply_status_effect(/datum/status_effect/buff/drunk)
		target.visible_message("<span class='info'>A purple haze shrouds [target]!</span>", "<span class='notice'>I feel much calmer.</span>")
		target.blur_eyes(10)
		return TRUE
	revert_cast()
	return FALSE
