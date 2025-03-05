/obj/item/wallframe/secure_safe
	name = "secure safe frame"
	desc = "A locked safe. It being unpowered prevents any access until placed back onto a wall."
	icon = 'icons/obj/storage/storage.dmi'
	icon_state = "wall_safe"
	base_icon_state = "wall_safe"
	result_path = /obj/structure/secure_safe
	pixel_shift = 32

/obj/item/wallframe/secure_safe/Initialize(mapload)
	. = ..()
	create_storage(
		max_specific_storage = WEIGHT_CLASS_GIGANTIC,
		max_total_storage = 20,
	)
	atom_storage.locked = STORAGE_FULLY_LOCKED

/obj/item/wallframe/secure_safe/after_attach(obj/attached_to)
	. = ..()
	for(var/obj/item in contents)
		item.forceMove(attached_to)

/**
 * Wall safes
 * Holds items and uses the lockable storage component
 * to allow people to lock items up.
 */
/obj/structure/secure_safe
	name = "secure safe"
	desc = "Excellent for securing things away from grubby hands."
	icon = 'icons/obj/storage/storage.dmi'
	icon_state = "wall_safe"
	base_icon_state = "wall_safe"
	anchored = TRUE
	density = FALSE

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/secure_safe, 32)

/obj/structure/secure_safe/Initialize(mapload)
	. = ..()
	//this will create the storage for us.
	AddComponent(/datum/component/lockable_storage)
	if(!density)
		find_and_hang_on_wall()
	if(mapload)
		PopulateContents()

/obj/structure/secure_safe/atom_deconstruct(disassembled)
	if(!density) //if we're a wall item, we'll drop a wall frame.
		var/obj/item/wallframe/secure_safe/new_safe = new(get_turf(src))
		for(var/obj/item in contents)
			item.forceMove(new_safe)

/obj/structure/secure_safe/proc/PopulateContents()
	new /obj/item/paper(src)
	new /obj/item/pen(src)

/obj/structure/secure_safe/hos
	name = "head of security's safe"
