HAI 1.2

I HAS A ll_head_sigil ITZ "__linked_list_head__"
HOW IZ I create_ll
	I HAS A ll ITZ A BUKKIT
	ll HAS A SRS ll_head_sigil ITZ ""
	FOUND YR ll
IF U SAY SO

HOW IZ I get_ll_head YR ll
	FOUND YR ll'Z SRS ll_head_sigil
IF U SAY SO

HOW IZ I get_ll_tail YR ll
	I HAS A head ITZ I IZ get_ll_head YR ll MKAY
	BOTH SAEM head AN "", O RLY?
		YA RLY
			FOUND YR ""
		NO WAI
			I HAS A pointer ITZ head
			IM IN YR traversal_loop
				I HAS A next_pointer ITZ ...
				ll'Z SRS pointer

				BOTH SAEM next_pointer AN "", O RLY?
					YA RLY
						FOUND YR pointer
					NO WAI
						pointer R next_pointer
				OIC
			IM OUTTA YR traversal_loop
	OIC
IF U SAY SO

HOW IZ I get_ll_next YR ll AN YR pointer
	FOUND YR ll'Z SRS pointer
IF U SAY SO

HOW IZ I append_ll YR ll AN YR item
	VISIBLE item
	I HAS A head ITZ I IZ get_ll_head YR ll MKAY
	BOTH SAEM head AN "", O RLY?
		YA RLY
			ll'Z SRS ll_head_sigil R item
		NO WAI
			I HAS A tail ITZ ...
			I IZ get_ll_tail YR ll MKAY

			ll'Z SRS tail R item
	OIC

	ll HAS A SRS item ITZ ""
IF U SAY SO

VISIBLE "WELCOM 2 LOLSNAKE!!"

I HAS A board ITZ A BUKKIT
I HAS A board_width ITZ 5
I HAS A board_height ITZ 5

HOW IZ I create_board
	IM IN YR y_loop ...
	UPPIN YR y TIL BOTH SAEM y AN board_height
		IM IN YR x_loop ...
		UPPIN YR x TIL BOTH SAEM x AN board_width
			I HAS A key ITZ ":{x},:{y}"
			board HAS A SRS key ITZ " "
		IM OUTTA YR x_loop
	IM OUTTA YR y_loop
IF U SAY SO

I HAS A snake_head_x ITZ 0
I HAS A snake_head_y ITZ 0
I HAS A snake_tail_x ITZ 0
I HAS A snake_tail_y ITZ 0
I HAS A snake_body_order_map ITZ A BUKKIT
I HAS A snake_direction ITZ "east"

HOW IZ I try_move_snake
	I HAS A new_x ITZ snake_head_x
	I HAS A new_y ITZ snake_head_y

	snake_direction, WTF?
		OMG "north"
			new_y R SUM OF snake_head_y AN -1
			GTFO
		OMG "west"
			new_x R SUM OF snake_head_x AN -1
			GTFO
		OMG "south"
			new_y R SUM OF snake_head_y AN 1
			GTFO
		OMG "east"
			new_x R SUM OF snake_head_x AN 1
			GTFO
	OIC

	I HAS A will_die ITZ ...
	I IZ is_deadly YR new_x AN YR new_y MKAY

	BOTH SAEM will_die AN WIN, O RLY?
		YA RLY
			FOUND YR FAIL
	OIC

	snake_head_x R new_x
	snake_head_y R new_y

	FOUND YR WIN
IF U SAY SO

I HAS A apple_tick ITZ 0
I HAS A apple_interval ITZ 5
I HAS A apples ITZ I IZ create_ll MKAY

HOW IZ I generate_apples
	BOTH SAEM apple_tick AN 0, O RLY?
		YA RLY
			apple_tick R apple_interval

			I HAS A apple_x ITZ 5
			I HAS A apple_y ITZ 23

			IM IN YR y_loop ...
			UPPIN YR y TIL BOTH SAEM y AN board_height
				IM IN YR x_loop ...
				UPPIN YR x TIL BOTH SAEM x AN board_width
					I HAS A location_value ITZ ...
					I IZ get_location_value YR x AN YR y MKAY

					BOTH SAEM location_value AN "S", O RLY?
						YA RLY
							apple_x R SUM OF apple_x AN SUM OF x AN 3
							apple_y R SUM OF apple_y AN SUM OF y AN 4
					OIC

					BOTH SAEM location_value AN "¤", O RLY?
						YA RLY
							apple_x R SUM OF apple_x AN SUM OF x AN 5
							apple_y R SUM OF apple_y AN SUM OF y AN 6
					OIC
				IM OUTTA YR x_loop
			IM OUTTA YR y_loop

			apple_x R MOD OF apple_x AN board_width
			apple_y R MOD OF apple_y AN board_height

			IM IN YR apple_gen_loop
				I HAS A location_value ITZ ...
				I IZ get_location_value YR apple_x AN YR apple_y MKAY

				ANY OF ...
				BOTH SAEM location_value AN "¤" AN ...
				BOTH SAEM location_value AN "O" MKAY, O RLY?
					YA RLY
						apple_x R SUM OF apple_x AN 1
						BOTH SAEM apple_x AN board_width, O RLY?
							YA RLY
								apple_x R 0
								apple_y R SUM OF apple_y AN 1
								BOTH SAEM apple_y AN board_height, O RLY?
									YA RLY
										apple_y R 0
								OIC
						OIC
					NO WAI
						GTFO
				OIC
			IM OUTTA YR apple_gen_loop

			apple_x R MOD OF apple_x AN board_width
			apple_y R MOD OF apple_y AN board_height

			I IZ append_ll YR apples AN YR ":{apple_x},:{apple_y}" MKAY
	OIC

	apple_tick R DIFF OF apple_tick AN 1
IF U SAY SO

HOW IZ I get_location_value YR x AN YR y
	ALL OF ...
	BOTH SAEM snake_head_x AN x AN ...
	BOTH SAEM snake_head_y AN y MKAY, O RLY?
		YA RLY
			FOUND YR "O"
	OIC

	OBTW
	ALL OF ...
	BOTH SAEM snake_tail_x AN x AN ...
	BOTH SAEM snake_tail_y AN y MKAY, O RLY?
		YA RLY
			FOUND YR "O"
	OIC
	TLDR

	I HAS A apple_pointer ITZ I IZ get_ll_head YR apples MKAY
	IM IN YR apple_loop
		BOTH SAEM apple_pointer AN "", O RLY?
			YA RLY
				GTFO
		OIC

		I HAS A current_location_yarn ITZ SMOOSH x AN "," AN y MKAY
		BOTH SAEM apple_pointer AN current_location_yarn, O RLY?
			YA RLY
				FOUND YR "¤"
		OIC

		apple_pointer R I IZ get_ll_next YR apples AN YR apple_pointer MKAY
	IM OUTTA YR apple_loop

	FOUND YR " "
IF U SAY SO

HOW IZ I update_board
	IM IN YR y_loop ...
	UPPIN YR y TIL BOTH SAEM y AN board_height
		IM IN YR x_loop ...
		UPPIN YR x TIL BOTH SAEM x AN board_width
			I HAS A key ITZ ":{x},:{y}"

			board'Z SRS key R ...
			I IZ get_location_value ...
			YR x AN YR y MKAY
		IM OUTTA YR x_loop
	IM OUTTA YR y_loop
IF U SAY SO

HOW IZ I print_board
	IM IN YR y_loop ...
	UPPIN YR y TIL BOTH SAEM y AN board_height
		I HAS A line ITZ "| "
		IM IN YR x_loop ...
		UPPIN YR x TIL BOTH SAEM x AN board_width
			I HAS A key ITZ ":{x},:{y}"
			line R SMOOSH line AN board'Z SRS key AN " | " MKAY
		IM OUTTA YR x_loop
		VISIBLE line
	IM OUTTA YR y_loop
IF U SAY SO

HOW IZ I user_input
	I HAS A command ITZ A YARN
	IM IN YR input_loop
		GIMMEH command
		I HAS A valid_input ITZ WIN
		command, WTF?
			OMG "w"
				snake_direction R "north"
				GTFO
			OMG "a"
				snake_direction R "west"
				GTFO
			OMG "s"
				snake_direction R "south"
				GTFO
			OMG "d"
				snake_direction R "east"
				GTFO
			OMGWTF
				valid_input R FAIL
		OIC

		BOTH SAEM valid_input AN WIN, O RLY?
			YA RLY
				GTFO
			NO WAI
				VISIBLE "wtf! thatz not wasd!!?"
		OIC
	IM OUTTA YR input_loop
IF U SAY SO

HOW IZ I is_deadly YR x AN YR y
	ALL OF ...
		BOTH SAEM ...
			SMALLR OF x AN 0 ...
		AN x AN ...
		DIFFRINT x AN 0 ...
	MKAY, O RLY?
		YA RLY
			FOUND YR WIN
	OIC

	ALL OF ...
		BOTH SAEM ...
			BIGGR OF x AN DIFF OF board_width AN 1 ...
		AN x AN ...
		DIFFRINT x AN DIFF OF board_width AN 1 ...
	MKAY, O RLY?
		YA RLY
			FOUND YR WIN
	OIC

	ALL OF ...
		BOTH SAEM ...
			SMALLR OF y AN 0 ...
		AN y AN ...
		DIFFRINT y AN 0 ...
	MKAY, O RLY?
		YA RLY
			FOUND YR WIN
	OIC

	ALL OF ...
		BOTH SAEM ...
			BIGGR OF y AN DIFF OF board_height AN 1 ...
		AN y AN ...
		DIFFRINT y AN DIFF OF board_height AN 1 ...
	MKAY, O RLY?
		YA RLY
			FOUND YR WIN
	OIC

	I HAS A location_value ...
	ITZ I IZ get_location_value ...
	YR x AN ...
	YR y MKAY

	BOTH SAEM location_value AN "S", O RLY?
		YA RLY
			FOUND YR WIN
	OIC

IF U SAY SO

I IZ create_board MKAY
IM IN YR game_loop
	I IZ generate_apples MKAY
	I IZ update_board MKAY
	I IZ print_board MKAY
	I IZ user_input MKAY

	I HAS A has_died ITZ I IZ try_move_snake MKAY
	BOTH SAEM has_died AN FAIL, O RLY?
		YA RLY
			VISIBLE "U IZ DIED!!"
			GTFO
	OIC
IM OUTTA YR game_loop

KTHXBYE
