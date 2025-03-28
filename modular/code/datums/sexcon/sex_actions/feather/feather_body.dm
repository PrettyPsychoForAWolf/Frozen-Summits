/datum/sex_action/feather_body
	name = "Tickle their body with feather"

/datum/sex_action/feather_body/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user == target)
		return FALSE
	if(!get_feather_in_either_hand(user))
		return FALSE
	return TRUE

/datum/sex_action/feather_body/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(target))
		var/mob/living/carbon/human/targethuman = target
		if(targethuman.wear_pants)
			var/obj/item/clothing/under/roguetown/pantsies = targethuman.wear_pants
			if(pantsies.flags_inv & HIDECROTCH)
				if(!pantsies.genitalaccess)
					return FALSE
	if(!get_feather_in_either_hand(user))
		return FALSE
	return TRUE

/datum/sex_action/feather_body/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] begins to tickle [target]'s body with a feather..."))

/datum/sex_action/feather_body/on_perform(mob/living/user, mob/living/target)
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] tickles [target]'s body with a feather..."))

	user.sexcon.perform_sex_action(target, 0.5, 0, TRUE)
	target.sexcon.handle_passive_ejaculation()

	var/chosen_emote = pick("giggle", "chuckle", "laugh")
	if(prob(33))
		if(prob(15))
			target.emote("scream", forced = TRUE)
			to_chat(target, span_warning("It's too much!"))
		else
			target.emote(chosen_emote, forced = TRUE)
			to_chat(target, span_warning("It tickles!"))

/datum/sex_action/feather_body/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] stops tickling [target]'s body..."))

/datum/sex_action/feather_body/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE
