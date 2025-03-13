/datum/preference/choiced/clan
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "clan"
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/choiced/clan/init_possible_values()
	return GLOB.vampireclans

/datum/preference/choiced/create_default_value()
	return /datum/vampireclan/brujah

/datum/preference/choiced/clan/apply_to_human(mob/living/carbon/human/target, value)
	return
