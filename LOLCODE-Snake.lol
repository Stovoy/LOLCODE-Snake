HAI 1.4
CAN HAS STDIO?

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

HOW IZ I move_snake
	snake_direction, WTF?
		OMG "north"
			snake_head_y R SUM OF snake_head_y AN -1
			GTFO
		OMG "west"
			snake_head_x R SUM OF snake_head_x AN -1
			GTFO
		OMG "south"
			snake_head_y R SUM OF snake_head_y AN 1
			GTFO
		OMG "east"
			snake_head_x R SUM OF snake_head_x AN 1
			GTFO
	OIC
IF U SAY SO

HOW IZ I get_location_value YR x AN YR y
	I HAS A location_value ITZ " "

	ALL OF ...
	BOTH SAEM snake_head_x AN x AN ...
	BOTH SAEM snake_head_y AN y MKAY, O RLY?
		YA RLY
			location_value R "S"
	OIC

	OBTW
	ALL OF ...
	BOTH SAEM snake_tail_x AN x AN ...
	BOTH SAEM snake_tail_y AN y MKAY, O RLY?
		YA RLY
			location_value R "S"
	OIC
	TLDR
	
	FOUND YR location_value
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

I IZ create_board MKAY
IM IN YR game_loop
	I IZ update_board MKAY
	I IZ print_board MKAY
	I IZ user_input MKAY
	I IZ move_snake MKAY
IM OUTTA YR game_loop

KTHXBYE
