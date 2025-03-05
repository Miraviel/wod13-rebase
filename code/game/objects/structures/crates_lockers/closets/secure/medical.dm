/obj/structure/closet/secure_closet/medical1
	name = "medicine closet"
	desc = "Filled to the brim with medical junk."
	icon_state = "med"
	req_access = list(ACCESS_MEDICAL)

/obj/structure/closet/secure_closet/medical1/PopulateContents()
	..()
	var/static/items_inside = list(
		/obj/item/reagent_containers/cup/beaker = 2,
		/obj/item/reagent_containers/dropper = 2,
		/obj/item/storage/belt/medical = 1,
		/obj/item/storage/box/syringes = 1,
		/obj/item/reagent_containers/cup/bottle/toxin = 1,
		/obj/item/reagent_containers/cup/bottle/morphine = 2,
		/obj/item/reagent_containers/cup/bottle/epinephrine= 3,
		/obj/item/reagent_containers/cup/bottle/multiver = 3,
		/obj/item/storage/box/rxglasses = 1)
	generate_items_inside(items_inside,src)

/obj/structure/closet/secure_closet/medical2
	name = "anesthetic closet"
	desc = "Used to knock people out."
	icon_state = "med_secure"
	req_access = list(ACCESS_SURGERY)

/obj/structure/closet/secure_closet/medical2/PopulateContents()
	..()
	for(var/i in 1 to 3)
		new /obj/item/tank/internals/anesthetic(src)
	for(var/i in 1 to 3)
		new /obj/item/clothing/mask/muzzle/breath(src)

/obj/structure/closet/secure_closet/psychology
	name = "psychology locker"
	req_access = list(ACCESS_PSYCHOLOGY)
	icon_state = "cabinet"
	door_anim_time = 0 // no animation
	open_sound = 'sound/machines/closet/wooden_closet_open.ogg'
	close_sound = 'sound/machines/closet/wooden_closet_close.ogg'
	open_sound_volume = 25
	close_sound_volume = 50

/obj/structure/closet/secure_closet/psychology/PopulateContents()
	..()
	new /obj/item/clothing/under/costume/buttondown/slacks/service(src)
	new /obj/item/clothing/under/costume/buttondown/skirt/service(src)
	new /obj/item/clothing/neck/tie/black(src)
	new /obj/item/clothing/shoes/laceup(src)
	new /obj/item/storage/backpack/medic(src)
	new /obj/item/radio/headset/headset_srvmed(src)
	new /obj/item/clipboard(src)
	new /obj/item/clothing/suit/jacket/straight_jacket(src)
	new /obj/item/clothing/ears/earmuffs(src)
	new /obj/item/clothing/mask/muzzle(src)
	new /obj/item/clothing/glasses/blindfold(src)

/obj/structure/closet/secure_closet/animal
	name = "animal control locker"
	icon_door = "chemical"
	req_access = list(ACCESS_SURGERY)

/obj/structure/closet/secure_closet/animal/PopulateContents()
	..()
	new /obj/item/assembly/signaler(src)
	for(var/i in 1 to 3)
		new /obj/item/electropack(src)
