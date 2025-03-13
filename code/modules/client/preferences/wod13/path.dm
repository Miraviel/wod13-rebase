/datum/preference/numeric/path
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_key = "path"
	savefile_identifier = PREFERENCE_CHARACTER

	minimum = 1
	maximum = 5

/datum/preference/numeric/path/apply_to_human(mob/living/carbon/human/target, value)
	target.path = value

/datum/preference/numeric/path/create_informed_default_value(datum/preferences/preferences)
	return 1
