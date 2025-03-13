/datum/preference/choiced/archetype
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "archetype"
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/choiced/archetype/init_possible_values()
	return GLOB.archetypes

/datum/preference/choiced/archetype/apply_to_human(mob/living/carbon/human/target, value)
	return
