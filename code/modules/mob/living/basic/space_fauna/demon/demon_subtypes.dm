/// The famous blood-crawling slaughter demons of wizardry fame.
/mob/living/basic/demon/slaughter
	name = "slaughter demon"
	real_name = "slaughter demon"
	unique_name = FALSE
	speak_emote = list("gurgles","wails","screeches")

	icon_state = "slaughter_demon"
	icon_living = "slaughter_demon"

	minimum_survivable_temperature = TCMB

	// slaughter demons are specifically intended to have low melee damage, but as they hit and build up their killstreak
	// their wound bonuses grow and grow higher. this is how they're able to efficiently kill and slaughter their victims.
	// consider this before you balance them.
	obj_damage = 50
	melee_damage_lower = 15
	melee_damage_upper = 15
	wound_bonus = -10
	bare_wound_bonus = 0
	sharpness = SHARP_EDGED

	antag_type = /datum/antagonist/slaughter

	/// Which blood crawl do we give to the demon
	var/crawl_type = /datum/action/cooldown/spell/jaunt/bloodcrawl/slaughter_demon
	/// How long it takes for the alt-click slam attack to come off cooldown
	var/slam_cooldown_time = 45 SECONDS
	/// How many times we have hit humanoid targets since we last bloodcrawled, scaling wounding power
	var/current_hitstreak = 0
	/// How much both our wound_bonus and bare_wound_bonus go up per hitstreak hit
	var/wound_bonus_per_hit = 5
	/// How much our wound_bonus hitstreak bonus caps at (peak demonry)
	var/wound_bonus_hitstreak_max = 12
	/// Cooldown tracker for the slam
	COOLDOWN_DECLARE(slam_cooldown)

/mob/living/basic/demon/slaughter/Initialize(mapload)
	. = ..()
	GRANT_ACTION(crawl_type)
	RegisterSignal(src, COMSIG_LIVING_UNARMED_ATTACK, PROC_REF(on_attack))
	RegisterSignals(src, list(COMSIG_MOB_ENTER_JAUNT, COMSIG_MOB_AFTER_EXIT_JAUNT), PROC_REF(on_crawl))

/mob/living/basic/demon/slaughter/grant_loot()
	var/static/list/droppable_loot = list(
		/obj/effect/decal/cleanable/blood,
		/obj/effect/decal/cleanable/blood/innards,
		/obj/item/organ/heart/demon,
	)

	return droppable_loot

/// Whenever we enter or exit blood crawl, reset our bonus and hitstreaks.
/mob/living/basic/demon/slaughter/proc/on_crawl(datum/source)
	SIGNAL_HANDLER

	// Grant us a speed boost if we're on the mortal plane
	if(isturf(loc))
		add_movespeed_modifier(/datum/movespeed_modifier/slaughter)
		addtimer(CALLBACK(src, PROC_REF(remove_movespeed_modifier), /datum/movespeed_modifier/slaughter), 6 SECONDS, TIMER_UNIQUE | TIMER_OVERRIDE)

	// Reset our streaks
	current_hitstreak = 0
	wound_bonus = initial(wound_bonus)
	bare_wound_bonus = initial(bare_wound_bonus)

/// Performs the classic slaughter demon bodyslam on the attack_target. Yeets them a screen away.
/mob/living/basic/demon/slaughter/proc/bodyslam(atom/attack_target)
	if(!isliving(attack_target) || attack_target == src)
		return

	if(!Adjacent(attack_target))
		to_chat(src, span_warning("You are too far away to use your slam attack on [attack_target]!"))
		return

	if(!COOLDOWN_FINISHED(src, slam_cooldown))
		to_chat(src, span_warning("Your slam ability is still on cooldown!"))
		return

	face_atom(attack_target)

	var/mob/living/victim = attack_target
	victim.take_bodypart_damage(brute = 20, wound_bonus = wound_bonus) // don't worry, there's more punishment when they hit something

	visible_message(
		span_danger("[src] slams into [victim] with monstrous strength!"),
		span_danger("You slam into [victim] with monstrous strength!"),
		ignored_mobs = victim,
	)
	to_chat(victim, span_userdanger("[src] slams into you with monstrous strength, sending you flying like a ragdoll!"))

	var/turf/yeet_target = get_edge_target_turf(victim, dir)
	victim.throw_at(yeet_target, 10, 5, src)
	COOLDOWN_START(src, slam_cooldown, slam_cooldown_time)
	log_combat(src, victim, "slaughter slammed")

/// Proc that we execute on attacking someone to keep track of our hitstreaks and wound bonuses. Also handles triggering the bodyslam on attacks.
/mob/living/basic/demon/slaughter/proc/on_attack(mob/living/source, atom/attack_target, proximity_flag, list/modifiers)
	SIGNAL_HANDLER

	if(!proximity_flag)
		return NONE

	if(LAZYACCESS(modifiers, RIGHT_CLICK))
		bodyslam(attack_target)
		return COMPONENT_CANCEL_ATTACK_CHAIN

	if(!iscarbon(attack_target))
		return NONE

	var/mob/living/carbon/target = attack_target
	if(target.stat == DEAD || isnull(target.mind) || (current_hitstreak > wound_bonus_hitstreak_max))
		return NONE

	current_hitstreak++
	wound_bonus += wound_bonus_per_hit
	bare_wound_bonus += wound_bonus_per_hit

/mob/living/basic/demon/slaughter/engine_demon
	name = "engine demon"
	faction = list(FACTION_HELL, FACTION_NEUTRAL)
