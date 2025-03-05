// WOD13TODO: When all jobs are nuked and ours are added, make sure all captain mentions are gone from the code.
// Almost everything here has to be changed. This is just a placeholder for now.
// Needs a spawnpoint.
/datum/job/prince
	title = JOB_PRINCE
	description = "Lead the city."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	department_head = list("The Inner Circle.")
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Archons"
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 180
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "PRINCE"

	outfit = /datum/outfit/job/prince

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC

	mind_traits = list(HEAD_OF_STAFF_MIND_TRAITS)
	liver_traits = list(TRAIT_ROYAL_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_PRINCE
	department_for_prefs = /datum/job_department/prince
	departments_list = list(
		/datum/job_department/command,	// WOD13TODO: change this
	)

	family_heirlooms = list(/obj/item/reagent_containers/cup/glass/flask/gold) // WOD13TODO: change this

	mail_goodies = list(	// WOD13TODO: change this
		/obj/item/cigarette/cigar/havana = 20,
		/obj/item/storage/fancy/cigarettes/cigars/havana = 15,
		/obj/item/reagent_containers/cup/glass/bottle/champagne = 5,
		/obj/item/reagent_containers/cup/glass/bottle/champagne/cursed = 5,
		/obj/item/skillchip/sabrage = 5
	)

	job_flags = STATION_JOB_FLAGS | HEAD_OF_STAFF_JOB_FLAGS	// WOD13TODO: change this

	human_authority = JOB_AUTHORITY_HUMANS_ONLY	// WOD13TODO: change this

/datum/job/prince/get_prince_announcement(mob/living/prince)
	return "Prince [prince.real_name] has arrived in the city."

/datum/job/prince/get_radio_information()	// WOD13TODO: remove these
	. = ..()
	. += "\nYou have access to all radio channels, but they are not automatically tuned. Check your radio for more information."

//WOD13TODO: Change these
/datum/outfit/job/prince
	name = "Prince"
	jobtype = /datum/job/prince

	//id = /obj/item/card/id/advanced/gold WOD13TODO: Needs a custom one here
	id_trim = /datum/id_trim/job/prince
	uniform = /obj/item/clothing/under/rank/captain
	suit = /obj/item/clothing/suit/armor/vest/capcarapace
	backpack_contents = list(
		/obj/item/melee/baton/telescopic/gold = 1,
		/obj/item/station_charter = 1,
		)
	belt = /obj/item/modular_computer/pda/heads/captain
	ears = /obj/item/radio/headset/heads/captain/alt
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/captain
	head = /obj/item/clothing/head/hats/caphat
	shoes = /obj/item/clothing/shoes/laceup


	backpack = /obj/item/storage/backpack/captain
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain
	messenger = /obj/item/storage/backpack/messenger/cap

	accessory = /obj/item/clothing/accessory/medal/gold/captain
	chameleon_extras = list(
		/obj/item/gun/energy/e_gun,
		/obj/item/stamp/head/captain,
		)
	implants = list(/obj/item/implant/mindshield)
	skillchips = list(/obj/item/skillchip/disk_verifier)

/datum/outfit/job/prince/pre_equip(mob/living/carbon/human/H, visuals_only)
	. = ..()
	//WOD13TODO: Need this?

/datum/outfit/job/prince/post_equip(mob/living/carbon/human/equipped, visuals_only)
	. = ..()
	//WOD13TODO: Need this?
