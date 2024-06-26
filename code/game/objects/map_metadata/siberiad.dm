/obj/map_metadata/siberiad
	ID = MAP_SIBERIAD
	title = "Operation Siberiad"
	lobby_icon = 'icons/lobby/siberiad.png'
	caribbean_blocking_area_types = list(/area/caribbean/no_mans_land/invisible_wall,/area/caribbean/no_mans_land/invisible_wall/one,/area/caribbean/no_mans_land/invisible_wall/two)
	respawn_delay = 600
	no_hardcore = FALSE
	ambience = list('sound/ambience/winter.ogg')

	faction_organization = list(
		AMERICAN,
		RUSSIAN)

	roundend_condition_sides = list(
		list(AMERICAN) = /area/caribbean/no_mans_land/capturable/one,
		list(RUSSIAN) = /area/caribbean/no_mans_land/capturable/one,
		)
	age = "1992"
	faction_distribution_coeffs = list(AMERICAN = 0.5, RUSSIAN = 0.5)
	battle_name = "Siberian Conflict"
	mission_start_message = "<font size=4>The remnants of the <font color = 'blue'>Coalition</font color> and the <font color = red>Soviet Army</font> are fighting for the control of a <b>Military Industrial Complex</b> in the <b>MIDDLE</b> of the area of operations.<br>In order to win, a side has to hold the <b>Control Room</b> for<b>5 minutes</b>.<br>The battle will start in <b>5 minutes</b>.</font>"
	faction1 = AMERICAN
	faction2 = RUSSIAN
	ordinal_age = 7
	songs = list(
		"Audio - Emissions:1" = "sound/music/emissions.ogg")
	gamemode = "Extraction"
	var/activation_code = 0

/obj/map_metadata/siberiad/New()
	..()
	activation_code = rand(1000,9999) // Lazy way for now.

/obj/map_metadata/siberiad/faction2_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 3600 || admin_ended_all_grace_periods)

/obj/map_metadata/siberiad/faction1_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 3600 || admin_ended_all_grace_periods)

/obj/map_metadata/siberiad/job_enabled_specialcheck(var/datum/job/J)
	..()
	if (istype(J, /datum/job/american))
		if (J.is_siberiad)
			. = TRUE
		else
			. = FALSE
	else if (istype(J, /datum/job/russian))
		if (J.is_siberiad)
			. = TRUE
		else
			. = FALSE
	else
		. = FALSE

/obj/map_metadata/siberiad/short_win_time(faction)
	if (!(alive_n_of_side(faction1)) || !(alive_n_of_side(faction2)))
		return 600
	else
		return 3000 // 5 minutes

/obj/map_metadata/siberiad/long_win_time(faction)
	if (!(alive_n_of_side(faction1)) || !(alive_n_of_side(faction2)))
		return 600
	else
		return 3000 // 5 minutes

/obj/map_metadata/siberiad/roundend_condition_def2name(define)
	..()
	switch (define)
		if (AMERICAN)
			return "American"
		if (RUSSIAN)
			return "Soviet"

/obj/map_metadata/siberiad/roundend_condition_def2army(define)
	..()
	switch (define)
		if (AMERICAN)
			return "Americans"
		if (RUSSIAN)
			return "Soviets"

/obj/map_metadata/siberiad/army2name(army)
	..()
	switch (army)
		if ("Americans")
			return "American"
		if ("Soviets")
			return "Soviet"

/obj/map_metadata/siberiad/cross_message(faction)
	if (faction == AMERICAN)
		return "<font size = 4>The <font color = blue>Coalition</font color> may now cross the invisible wall!</font>"
	else if (faction == RUSSIAN)
		return "<font size = 4>The <font color = red>Soviet Army</font color> may now cross the invisible wall!</font>"
	else
		return ""

/obj/map_metadata/siberiad/reverse_cross_message(faction)
	if (faction == AMERICAN)
		return "<span class = 'userdanger'>The <b><font color = blue>Coalition</b></font> may no longer cross the invisible wall!</span>"
	else if (faction == RUSSIAN)
		return "<span class = 'userdanger'>The <b><font color = red>Soviets</b></font> may no longer cross the invisible wall!</span>"
	else
		return ""

/obj/map_metadata/siberiad/update_win_condition()
	if (world.time >= next_win && next_win != -1)
		if (win_condition_spam_check)
			return FALSE
		ticker.finished = TRUE
		var/message = "The [battle_name ? battle_name : "battle"] has ended in a stalemate!"
		if (current_winner && current_loser)
			message = "The battle is over! The [current_winner] were victorious over the [current_loser][battle_name ? " in the [battle_name]" : ""]!"
		world << "<font size = 4><span class = 'notice'>[message]</span></font>"
		for (var/obj/structure/props/computerprops/tracking/siberiad/TS in world)
			if (TS.active)
				for (var/obj/structure/nuclear_missile/nuke in world)
					nuke.activate()
				switch (TS.destination)
					if (1)
						world << "<big> A nuclear missile is heading towards Seattle. The Coalition's capitol is about to turn to dust.</big>"
					if (2)
						world << "<big> A nuclear missile is heading towards Novosibirsk. The remnants of the Soviet Union are to be extinct.</big>"

		win_condition_spam_check = TRUE
		return FALSE
	// German major
	else if (win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[2]]), roundend_condition_sides[1], roundend_condition_sides[2], 1.33, TRUE))
		if (!win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[1]]), roundend_condition_sides[2], roundend_condition_sides[1], 1.33))
			if (last_win_condition != win_condition.hash)
				current_win_condition = "The [roundend_condition_def2army(roundend_condition_sides[1][1])] have captured the Control Room! They will win in {time} minute{s}."
				next_win = world.time + short_win_time(roundend_condition_sides[2][1])
				announce_current_win_condition()
				current_winner = roundend_condition_def2army(roundend_condition_sides[1][1])
				current_loser = roundend_condition_def2army(roundend_condition_sides[2][1])
	// German minor
	else if (win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[2]]), roundend_condition_sides[1], roundend_condition_sides[2], 1.01, TRUE))
		if (!win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[1]]), roundend_condition_sides[2], roundend_condition_sides[1], 1.01))
			if (last_win_condition != win_condition.hash)
				current_win_condition = "The [roundend_condition_def2army(roundend_condition_sides[1][1])] have captured the Control Room! They will win in {time} minute{s}."
				next_win = world.time + long_win_time(roundend_condition_sides[2][1])
				announce_current_win_condition()
				current_winner = roundend_condition_def2army(roundend_condition_sides[1][1])
				current_loser = roundend_condition_def2army(roundend_condition_sides[2][1])
	// Soviet major
	else if (win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[1]]), roundend_condition_sides[2], roundend_condition_sides[1], 1.33, TRUE))
		if (!win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[2]]), roundend_condition_sides[1], roundend_condition_sides[2], 1.33))
			if (last_win_condition != win_condition.hash)
				current_win_condition = "The [roundend_condition_def2army(roundend_condition_sides[2][1])] have secured the Control Room! They will win in {time} minute{s}."
				next_win = world.time + short_win_time(roundend_condition_sides[1][1])
				announce_current_win_condition()
				current_winner = roundend_condition_def2army(roundend_condition_sides[2][1])
				current_loser = roundend_condition_def2army(roundend_condition_sides[1][1])
	// Soviet minor
	else if (win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[1]]), roundend_condition_sides[2], roundend_condition_sides[1], 1.01, TRUE))
		if (!win_condition.check(typesof(roundend_condition_sides[roundend_condition_sides[2]]), roundend_condition_sides[1], roundend_condition_sides[2], 1.01))
			if (last_win_condition != win_condition.hash)
				current_win_condition = "The [roundend_condition_def2army(roundend_condition_sides[2][1])] have secured the Control Room! They will win in {time} minute{s}."
				next_win = world.time + long_win_time(roundend_condition_sides[1][1])
				announce_current_win_condition()
				current_winner = roundend_condition_def2army(roundend_condition_sides[2][1])
				current_loser = roundend_condition_def2army(roundend_condition_sides[1][1])

	else
		if (current_win_condition != no_winner && current_winner && current_loser)
			world << "<font size = 3>The [current_winner] have lost control of the Control Room!</font>"
			current_winner = null
			current_loser = null
		next_win = -1
		current_win_condition = no_winner
		win_condition.hash = 0
	last_win_condition = win_condition.hash
	return TRUE

/obj/map_metadata/siberiad/check_caribbean_block(var/mob/living/human/H, var/turf/T)
	if (!istype(H) || !istype(T))
		return FALSE
	var/area/A = get_area(T)
	if (istype(A, /area/caribbean/no_mans_land/invisible_wall))
		if (istype(A, /area/caribbean/no_mans_land/invisible_wall/one))
			if (H.faction_text == faction1)
				return TRUE
		else if (istype(A, /area/caribbean/no_mans_land/invisible_wall/two))
			if (H.faction_text == faction2)
				return TRUE
		else
			return !faction1_can_cross_blocks()
	return FALSE

// MAP SPECIFIC OBJECTS //

/obj/structure/props/computerprops/tracking/siberiad
	name = "launch terminal"
	desc = "A terminal used to control the missile silo."
	var/active = FALSE
	var/destination = 1

/obj/structure/props/computerprops/tracking/siberiad/attack_hand(var/mob/living/human/H as mob)
	if (map && map.ID == MAP_SIBERIAD)
		var/obj/map_metadata/siberiad/SD = map
		if (src.active)
			to_chat(H, SPAN_WARNING("The nuclear missile has already been activated."))
			return
		var/code = input(H, "Enter the activation code:", "Access Termninal") as num
		if (code == SD.activation_code)
			src.visible_message(SPAN_NOTICE("\icon[src] Initiliazing protocols... Please wait."))
			spawn(100)
				src.active = TRUE
				src.visible_message(SPAN_WARNING("\icon[src] Nuclear missile activated."))
				if (H.faction_text == RUSSIAN)
					src.visible_message(SPAN_WARNING("\icon[src] Target destination: SEATTLE <br>(LAT: 47.608013, LONG: -122.335167)."))
					destination = 1
				else
					src.visible_message(SPAN_WARNING("\icon[src] Target destination: NOVOSIBIRSK <br>(LAT: 55.018803, LONG: 82.933952)."))
					destination = 2
		else
			to_chat(H, SPAN_WARNING("\icon[src] Wrong password."))