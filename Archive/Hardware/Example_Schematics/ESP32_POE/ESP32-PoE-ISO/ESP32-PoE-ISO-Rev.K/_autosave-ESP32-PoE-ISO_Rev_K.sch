(kicad_sch
	(version 20250114)
	(generator "eeschema")
	(generator_version "9.0")
	(uuid "b0918c41-b461-44d3-bf5c-8abd0b2cc1d3")
	(paper "A2")
	(title_block
		(title "ESP32-PoE-ISO")
		(date "2022-07-28")
		(rev "K")
		(company "OLIMEX LTD.")
		(comment 1 "https://www.olimex.com")
	)
	(lib_symbols
		(symbol "ESP32-PoE-ISO_Rev_K:+3.3V"
			(power)
			(pin_names
				(offset 0)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "#PWR"
				(at 0 -3.81 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Value" "+3.3V"
				(at 0 3.556 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "+3.3V_0_1"
				(polyline
					(pts
						(xy -0.762 1.27) (xy 0 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 2.54) (xy 0.762 1.27)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 0) (xy 0 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "+3.3V_1_1"
				(pin power_in line
					(at 0 0 90)
					(length 0)
					(hide yes)
					(name "+3V3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:+3.3VLAN"
			(power)
			(pin_names
				(offset 0)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "#PWR"
				(at 0 -3.81 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Value" "+3.3VLAN"
				(at 0 3.556 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "+3.3VLAN_0_1"
				(polyline
					(pts
						(xy -0.762 1.27) (xy 0 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 2.54) (xy 0.762 1.27)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 0) (xy 0 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "+3.3VLAN_1_1"
				(pin power_in line
					(at 0 0 90)
					(length 0)
					(hide yes)
					(name "+3.3VLAN"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:+5V"
			(power)
			(pin_names
				(offset 0)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "#PWR"
				(at 0 -3.81 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Value" "+5V"
				(at 0 3.556 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "+5V_0_1"
				(polyline
					(pts
						(xy -0.762 1.27) (xy 0 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 2.54) (xy 0.762 1.27)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 0) (xy 0 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "+5V_1_1"
				(pin power_in line
					(at 0 0 90)
					(length 0)
					(hide yes)
					(name "+5V"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:+5VP"
			(power)
			(pin_names
				(offset 0)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "#PWR"
				(at 0 -3.81 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Value" "+5VP"
				(at 0 3.556 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "+5VP_0_1"
				(polyline
					(pts
						(xy -0.762 1.27) (xy 0 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 2.54) (xy 0.762 1.27)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 0) (xy 0 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "+5VP_1_1"
				(pin power_in line
					(at 0 0 90)
					(length 0)
					(hide yes)
					(name "+5VP"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:BAT54C(SOT23-3)"
			(pin_names
				(offset 0)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "D"
				(at 0 6.35 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Value" "BAT54C(SOT23-3)"
				(at 0 3.81 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
					(hide yes)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "BAT54C(SOT23-3)_0_1"
				(polyline
					(pts
						(xy -2.54 2.54) (xy 2.54 2.54) (xy 2.54 -2.54) (xy -2.54 -2.54) (xy -2.54 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type background)
					)
				)
				(polyline
					(pts
						(xy -2.54 0) (xy 2.54 0)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.905 0.635) (xy -1.905 -0.635) (xy -0.635 0) (xy -1.905 0.635)
					)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy -0.889 0.635) (xy -0.635 0.635)
					)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.635 0.635) (xy -0.635 -0.635)
					)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.635 -0.635) (xy -0.381 -0.635)
					)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 0) (xy 0 -1.905)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center 0 0)
					(radius 0.127)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 -1.905) (xy 0 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.381 0.635) (xy 0.635 0.635)
					)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.635 0.635) (xy 0.635 -0.635)
					)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.635 -0.635) (xy 0.889 -0.635)
					)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.905 0.635) (xy 1.905 -0.635) (xy 0.635 0) (xy 1.905 0.635)
					)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
			)
			(symbol "BAT54C(SOT23-3)_1_1"
				(pin passive line
					(at -5.08 0 0)
					(length 2.54)
					(name "A1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 0 -5.08 90)
					(length 2.54)
					(name "CC"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 5.08 0 180)
					(length 2.54)
					(name "A2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:BAT_CON"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "BAT_CON"
				(at 0.635 5.08 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Value" "BAT_CON"
				(at 0 -5.334 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "BAT_CON_0_0"
				(rectangle
					(start -2.0066 4.064)
					(end 1.9812 -4.0132)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -1.905 3.9116)
					(end 1.8796 -3.8608)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.905 1.27) (xy -1.143 1.27)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.905 -1.27) (xy -1.143 -1.27)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -1.1684 1.5748)
					(end 0.762 1.016)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -1.1684 -0.9652)
					(end 0.762 -1.524)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -1.0414 1.3716)
					(end 0.635 1.1684)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.9398 -1.143)
					(end 0.7366 -1.3462)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 0.6858 1.2446)
					(end -0.9652 1.3462)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 0.7112 1.1176)
					(end -1.0668 1.4732)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 0.7112 -1.3208)
					(end -0.9398 -1.2192)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 0.7366 -1.4224)
					(end -1.0414 -1.0668)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(text "+"
					(at 0 2.794 0)
					(effects
						(font
							(size 1.524 1.524)
						)
					)
				)
				(text "-"
					(at 0 -2.286 0)
					(effects
						(font
							(size 1.524 1.524)
						)
					)
				)
			)
			(symbol "BAT_CON_1_1"
				(pin passive line
					(at -5.08 1.27 0)
					(length 2.9972)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -5.08 -1.27 0)
					(length 2.9972)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:BH10S"
			(pin_names
				(offset 1.016)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "CON"
				(at 0.0508 8.9154 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Value" "BH10S"
				(at 0.3048 -9.4234 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Footprint" ""
				(at -0.2032 -1.1938 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at -0.2032 -1.1938 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "BH10S_0_0"
				(rectangle
					(start -3.1242 -2.3368)
					(end -0.5588 -2.794)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -3.1242 -4.8514)
					(end -0.5588 -5.3086)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -3.0988 0.254)
					(end -0.5334 -0.2032)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -3.0734 2.7686)
					(end -0.508 2.3114)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -3.048 5.334)
					(end -0.4826 4.8768)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.0226 0.1016) (xy -0.5842 0.1016) (xy -0.5842 -0.127) (xy -2.9972 -0.1524) (xy -3.0226 0.0254)
						(xy -0.7112 0.0254) (xy -0.7112 -0.0508) (xy -2.9972 0)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.0226 -5.0038) (xy -0.5842 -5.0038) (xy -0.5842 -5.2324) (xy -2.9972 -5.2578) (xy -3.0226 -5.08)
						(xy -0.7112 -5.08) (xy -0.7112 -5.1562) (xy -2.9972 -5.1054)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.9972 -2.4638) (xy -0.5588 -2.4638) (xy -0.5588 -2.6924) (xy -2.9718 -2.7178) (xy -2.9972 -2.54)
						(xy -0.6858 -2.54) (xy -0.6858 -2.6162) (xy -2.9718 -2.5654)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.9718 2.667) (xy -0.5334 2.667) (xy -0.5334 2.4384) (xy -2.9464 2.413) (xy -2.9718 2.5908)
						(xy -0.6604 2.5908) (xy -0.6604 2.5146) (xy -2.9464 2.5654)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.9464 5.2324) (xy -0.508 5.2324) (xy -0.508 5.0038) (xy -2.921 4.9784) (xy -2.9464 5.1562)
						(xy -0.635 5.1562) (xy -0.635 5.08) (xy -2.921 5.1308)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 0.508 0.2286)
					(end 3.0734 -0.2286)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 0.508 -2.3114)
					(end 3.0734 -2.7686)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 0.5334 2.7686)
					(end 3.0988 2.3114)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 0.5588 5.334)
					(end 3.1242 4.8768)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.5588 0.1016) (xy 2.9972 0.1016) (xy 2.9972 -0.127) (xy 0.5842 -0.1524) (xy 0.5588 0.0254)
						(xy 2.8702 0.0254) (xy 2.8702 -0.0508) (xy 0.5842 0)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 0.5588 -4.8514)
					(end 3.1242 -5.3086)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.5842 2.667) (xy 3.0226 2.667) (xy 3.0226 2.4384) (xy 0.6096 2.413) (xy 0.5842 2.5908) (xy 2.8956 2.5908)
						(xy 2.8956 2.5146) (xy 0.6096 2.5654)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.5842 -2.4384) (xy 3.0226 -2.4384) (xy 3.0226 -2.667) (xy 0.6096 -2.6924) (xy 0.5842 -2.5146)
						(xy 2.8956 -2.5146) (xy 2.8956 -2.5908) (xy 0.6096 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.635 -4.953) (xy 3.0734 -4.953) (xy 3.0734 -5.1816) (xy 0.6604 -5.207) (xy 0.635 -5.0292)
						(xy 2.9464 -5.0292) (xy 2.9464 -5.1054) (xy 0.6604 -5.0546)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.6858 5.2324) (xy 3.1242 5.2324) (xy 3.1242 5.0038) (xy 0.7112 4.9784) (xy 0.6858 5.1562)
						(xy 2.9972 5.1562) (xy 2.9972 5.08) (xy 0.7112 5.1308)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "BH10S_0_1"
				(rectangle
					(start -3.81 7.62)
					(end 3.81 -7.62)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.81 5.08) (xy -3.048 5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.81 2.54) (xy -3.048 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.81 0) (xy -3.048 0)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.81 -2.54) (xy -3.048 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.81 -5.08) (xy -3.048 -5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 3.81 5.08) (xy 3.048 5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 3.81 2.54) (xy 3.048 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 3.81 0) (xy 3.048 0)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 3.81 -2.54) (xy 3.048 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 3.81 -5.08) (xy 3.048 -5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "BH10S_1_1"
				(pin passive line
					(at -7.62 5.08 0)
					(length 3.7084)
					(name "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -7.62 2.54 0)
					(length 3.7084)
					(name "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -7.62 0 0)
					(length 3.7084)
					(name "5"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "5"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -7.62 -2.54 0)
					(length 3.7084)
					(name "7"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "7"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -7.62 -5.08 0)
					(length 3.7084)
					(name "9"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "9"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 7.62 5.08 180)
					(length 3.7084)
					(name "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 7.62 2.54 180)
					(length 3.7084)
					(name "4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 7.62 0 180)
					(length 3.7084)
					(name "6"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "6"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 7.62 -2.54 180)
					(length 3.7084)
					(name "8"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "8"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 7.62 -5.08 180)
					(length 3.7084)
					(name "10"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "10"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:BL4054B-42TPRN(SOT23-5)"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "U"
				(at 0 8.89 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Value" "BL4054B-42TPRN(SOT23-5)"
				(at 0 -8.89 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Footprint" "OLIMEX_IC-FP:SOT-23-5"
				(at 0 -12.7 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 0 0.635 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Note" "PB-Free"
				(at 0 -17.78 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(symbol "BL4054B-42TPRN(SOT23-5)_0_0"
				(text "VCC=4.5V to 6.5V(at least a 1 μF)"
					(at -4.953 0 900)
					(effects
						(font
							(size 0.3048 0.3048)
							(italic yes)
						)
					)
				)
				(text "VBAT final float voltage to 4.2V"
					(at 0 3.937 0)
					(effects
						(font
							(size 0.3048 0.3048)
							(italic yes)
						)
					)
				)
				(text "R(PROG)=2 to 10kΩ"
					(at 0 -3.683 0)
					(effects
						(font
							(size 0.3048 0.3048)
							(italic yes)
						)
					)
				)
				(text "Charge Current Up to 800mA"
					(at 4.953 0 900)
					(effects
						(font
							(size 0.3048 0.3048)
							(italic yes)
						)
					)
				)
			)
			(symbol "BL4054B-42TPRN(SOT23-5)_1_0"
				(polyline
					(pts
						(xy -2.3368 1.7018) (xy -1.8796 1.7018)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.3368 1.6764) (xy -1.8796 1.6764)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.1336 2.5146) (xy -2.159 1.8288)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.1082 2.1336) (xy -2.1336 1.7272)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.0828 1.7272) (xy -2.0828 2.4638)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.0574 2.4892) (xy -1.905 2.4892)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.9304 1.8034) (xy -2.0066 1.8034)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.905 2.6162) (xy -2.3368 2.6162) (xy -2.3368 1.7272) (xy -2.3368 1.6764) (xy -2.032 1.6764)
						(xy -2.032 1.778) (xy -2.2352 1.778) (xy -2.2606 2.54) (xy -1.9304 2.54) (xy -1.9304 2.5146) (xy -1.9304 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.8796 2.6162) (xy -1.8796 2.5146)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.8796 1.7272) (xy -1.8796 1.8034)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.651 2.3114) (xy -1.8288 2.3114) (xy -1.8288 2.032) (xy -1.6764 2.032) (xy -1.7272 2.2352)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.27 1.778) (xy -1.3716 2.5654) (xy -1.4224 1.778) (xy -1.4478 2.5908) (xy -1.524 1.8288)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -1.2192 1.7018)
					(end -1.6002 2.6416)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.8636 2.5654) (xy -0.6858 1.905)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.6858 1.8034) (xy -0.8128 1.8288) (xy -0.762 2.5146)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.635 2.5654) (xy -0.635 1.8034)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.5334 1.7018)
					(end -0.9144 2.6416)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.0762 2.286) (xy 0.0254 1.8288)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.0508 2.2098) (xy -0.0254 2.5908)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.0508 1.8288) (xy -0.0762 1.778)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 1.8288) (xy -0.1016 1.9812)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.0762 1.8034) (xy 0.1016 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 0.2032 1.7018)
					(end -0.1778 2.6416)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.5842 2.5146) (xy 0.5842 1.7018)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.7874 2.5654) (xy 0.762 1.8288) (xy 0.635 1.8542) (xy 0.6604 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 0.889 1.7018)
					(end 0.508 2.6416)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.3208 2.54) (xy 1.3208 1.8288) (xy 1.4732 1.8542) (xy 1.4478 2.4638)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.4224 2.5146) (xy 1.397 2.5654) (xy 1.4732 2.5654)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.4986 2.4638) (xy 1.4732 2.5654)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 1.6002 1.7018)
					(end 1.2192 2.6416)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.6764 2.3114) (xy 1.8542 2.3114) (xy 1.8542 2.0066) (xy 1.651 2.0066) (xy 1.7526 2.1844)
						(xy 1.7526 2.159)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.7018 2.1336) (xy 1.7018 2.2098)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.8542 2.6416) (xy 2.2352 2.6416) (xy 2.2352 1.7272) (xy 1.8542 1.7272) (xy 2.1336 1.7272)
						(xy 2.1336 2.5908)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 2.032 1.778) (xy 1.8542 1.778)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 2.0574 2.5146) (xy 2.0574 1.8034)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 2.1082 2.5146) (xy 1.8542 2.5146)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(text "BATTERY"
					(at 0.0508 -1.397 0)
					(effects
						(font
							(size 0.762 0.762)
						)
					)
				)
				(text "CHARGER"
					(at 0.1016 -2.5654 0)
					(effects
						(font
							(size 0.762 0.762)
						)
					)
				)
			)
			(symbol "BL4054B-42TPRN(SOT23-5)_1_1"
				(polyline
					(pts
						(xy -5.715 6.35) (xy -5.715 -6.35) (xy 5.715 -6.35) (xy 5.715 6.35) (xy -5.715 6.35)
					)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type background)
					)
				)
				(pin power_in line
					(at -10.16 5.08 0)
					(length 4.4958)
					(name "VCC"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin power_in line
					(at -10.16 -5.08 0)
					(length 4.4958)
					(name "GND"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin output line
					(at 10.16 5.08 180)
					(length 4.4958)
					(name "VBAT"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin open_collector line
					(at 10.16 0 180)
					(length 4.4958)
					(name "CHRGb"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 10.16 -5.08 180)
					(length 4.4958)
					(name "PROG"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "5"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:C"
			(pin_numbers
				(hide yes)
			)
			(pin_names
				(offset 0.254)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "C"
				(at 0.254 1.778 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left)
				)
			)
			(property "Value" "C"
				(at 0.254 -2.032 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "C? C_????_* C_???? SMD*_c Capacitor*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "C_0_1"
				(polyline
					(pts
						(xy -1.524 0.508) (xy 1.524 0.508)
					)
					(stroke
						(width 0.3048)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.524 -0.508) (xy 1.524 -0.508)
					)
					(stroke
						(width 0.3302)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "C_1_1"
				(pin passive line
					(at 0 2.54 270)
					(length 1.905)
					(name "~"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin passive line
					(at 0 -2.54 90)
					(length 2.032)
					(name "~"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:CH340T(SSOP20W)"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "U"
				(at 0 16.51 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Value" "CH340T(SSOP20W)"
				(at 0 -16.51 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Footprint" "OLIMEX_IC-FP:SSOP-20W"
				(at 0 -20.32 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Note" "PB-Free"
				(at 0 -22.86 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "ki_fp_filters" "SSOP-20W"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "CH340T(SSOP20W)_0_1"
				(rectangle
					(start -7.62 15.24)
					(end 7.62 -15.24)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type background)
					)
				)
			)
			(symbol "CH340T(SSOP20W)_1_1"
				(pin power_in line
					(at -12.7 12.7 0)
					(length 5.08)
					(name "VCC"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "19"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin power_in line
					(at -12.7 10.16 0)
					(length 5.08)
					(name "V3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "5"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin power_in line
					(at -12.7 5.08 0)
					(length 5.08)
					(name "GND"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "8"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at -12.7 0 0)
					(length 5.08)
					(name "UD-"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "7"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at -12.7 -2.54 0)
					(length 5.08)
					(name "UD+"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "6"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at -12.7 -7.62 0)
					(length 5.08)
					(name "XI"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "9"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin output line
					(at -12.7 -12.7 0)
					(length 5.08)
					(name "XO"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "10"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin output line
					(at 12.7 12.7 180)
					(length 5.08)
					(name "TXD"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 12.7 10.16 180)
					(length 5.08)
					(name "RXD"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin output line
					(at 12.7 5.08 180)
					(length 5.08)
					(name "RTS#"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "16"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 12.7 2.54 180)
					(length 5.08)
					(name "CTS#"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "11"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin output line
					(at 12.7 0 180)
					(length 5.08)
					(name "DTR#"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "15"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 12.7 -2.54 180)
					(length 5.08)
					(name "DSR#"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "12"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 12.7 -5.08 180)
					(length 5.08)
					(name "DCD#"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "14"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 12.7 -7.62 180)
					(length 5.08)
					(name "RI#"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "13"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 12.7 -10.16 180)
					(length 5.08)
					(name "NOS#"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "20"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 12.7 -12.7 180)
					(length 5.08)
					(name "IR#"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "17"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:CON10"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "CON"
				(at -1.27 12.7 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Value" "CON10"
				(at -1.27 -15.24 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Footprint" ""
				(at -1.905 8.89 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at -1.905 8.89 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "CON10_0_0"
				(rectangle
					(start -2.6416 7.4676)
					(end -0.8636 7.8232)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -2.6416 4.9276)
					(end -0.8636 5.2832)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -2.6416 2.3876)
					(end -0.8636 2.7432)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -2.6416 -0.1524)
					(end -0.8636 0.2032)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -2.6416 -2.6924)
					(end -0.8636 -2.3368)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -2.6416 -5.2324)
					(end -0.8636 -4.8768)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -2.6416 -7.7724)
					(end -0.8636 -7.4168)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -2.6416 -12.8524)
					(end -0.8636 -12.4968)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -2.6162 10.0076)
					(end -0.8382 10.3632)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -2.6162 7.5692)
					(end -0.9652 7.6708)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -2.6162 5.0292)
					(end -0.9652 5.1308)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -2.6162 2.4892)
					(end -0.9652 2.5908)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -2.6162 -0.0508)
					(end -0.9652 0.0508)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -2.6162 -2.5908)
					(end -0.9652 -2.4892)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -2.6162 -5.1308)
					(end -0.9652 -5.0292)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -2.6162 -7.6708)
					(end -0.9652 -7.5692)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -2.6162 -10.3124)
					(end -0.8382 -9.9568)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -2.6162 -12.7508)
					(end -0.9652 -12.6492)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -2.5908 10.1346)
					(end -0.9398 10.2362)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -2.5908 -10.1854)
					(end -0.9398 -10.0838)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.9652 7.747)
					(end -2.6416 7.5438)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.9652 5.207)
					(end -2.6416 5.0038)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.9652 2.667)
					(end -2.6416 2.4638)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.9652 0.127)
					(end -2.6416 -0.0762)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.9652 -2.413)
					(end -2.6416 -2.6162)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.9652 -4.953)
					(end -2.6416 -5.1562)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.9652 -7.493)
					(end -2.6416 -7.6962)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.9652 -12.573)
					(end -2.6416 -12.7762)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.8636 10.2616)
					(end -2.54 10.0584)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.8636 -10.0584)
					(end -2.54 -10.2616)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.7366 10.4648)
					(end -2.667 9.906)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.7366 7.9248)
					(end -2.667 7.366)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.7366 5.3848)
					(end -2.667 4.826)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.7366 2.8448)
					(end -2.667 2.286)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.7366 0.3048)
					(end -2.667 -0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.7366 -2.2352)
					(end -2.667 -2.794)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.7366 -4.7752)
					(end -2.667 -5.334)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.7366 -7.3152)
					(end -2.667 -7.874)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.7366 -9.8552)
					(end -2.667 -10.414)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -0.7366 -12.3952)
					(end -2.667 -12.954)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 10.16) (xy -0.762 10.16)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 7.62) (xy -0.762 7.62)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 5.08) (xy -0.762 5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 2.54) (xy -0.762 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 0) (xy -0.762 0)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 -2.54) (xy -0.762 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 -5.08) (xy -0.762 -5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 -7.62) (xy -0.762 -7.62)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 -10.16) (xy -0.762 -10.16)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 -12.7) (xy -0.762 -12.7)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "CON10_0_1"
				(rectangle
					(start 0 11.43)
					(end -3.81 -13.97)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "CON10_1_1"
				(pin passive line
					(at 2.54 10.16 180)
					(length 2.54)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 7.62 180)
					(length 2.54)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 5.08 180)
					(length 2.54)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 2.54 180)
					(length 2.54)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 0 180)
					(length 2.54)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "5"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 -2.54 180)
					(length 2.54)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "6"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 -5.08 180)
					(length 2.54)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "7"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 -7.62 180)
					(length 2.54)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "8"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 -10.16 180)
					(length 2.54)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "9"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 -12.7 180)
					(length 2.54)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "10"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:CP"
			(pin_names
				(offset 0.254)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "C"
				(at 1.27 1.905 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left)
				)
			)
			(property "Value" "CP"
				(at 1.27 -1.905 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "CP* Elko* TantalC* C*elec c_elec* SMD*_Pol"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "CP_0_1"
				(rectangle
					(start -1.524 0.6858)
					(end 1.524 0.3048)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -1.524 -0.3048)
					(end 1.524 -0.6858)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy 0.635 1.524) (xy 1.143 1.524)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.889 1.27) (xy 0.889 1.778)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "CP_1_1"
				(pin passive line
					(at 0 2.54 270)
					(length 1.8542)
					(name "+"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin passive line
					(at 0 -2.54 90)
					(length 1.8542)
					(name "-"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:Crystal_GND"
			(pin_names
				(offset 1.016)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "Q"
				(at 0 2.286 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "Crystal_GND"
				(at 0.762 -2.794 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "Crystal_GND_0_1"
				(polyline
					(pts
						(xy -1.143 1.27) (xy -1.143 -1.27)
					)
					(stroke
						(width 0.4064)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.143 -1.778) (xy 1.143 -1.778)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.508 1.016) (xy 0.508 1.016) (xy 0.508 -1.016) (xy -0.508 -1.016) (xy -0.508 1.016)
					)
					(stroke
						(width 0.3048)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy 1.143 1.27) (xy 1.143 -1.27)
					)
					(stroke
						(width 0.4064)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "Crystal_GND_1_1"
				(pin passive line
					(at -2.54 0 0)
					(length 1.27)
					(name "1"
						(effects
							(font
								(size 0.508 0.508)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 0.635 0.635)
							)
						)
					)
				)
				(pin passive line
					(at 0 -2.54 90)
					(length 0.762)
					(name "case"
						(effects
							(font
								(size 0.508 0.508)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 0.635 0.635)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 0 180)
					(length 1.27)
					(name "2"
						(effects
							(font
								(size 0.508 0.508)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 0.635 0.635)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:D_Schottky"
			(pin_names
				(offset 0)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "D"
				(at 0 2.54 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "D_Schottky"
				(at 0 -2.54 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "D-Pak_TO252AA Diode_* *SingleDiode *SingleDiode* *_Diode_*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "D_Schottky_0_1"
				(polyline
					(pts
						(xy -0.635 1.27) (xy -1.27 1.27) (xy -1.27 -1.27) (xy -1.905 -1.27)
					)
					(stroke
						(width 0.2032)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 1.27 1.27)
					(end 1.27 -1.27)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.27 -1.27) (xy -1.27 0) (xy 1.27 1.27)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
			)
			(symbol "D_Schottky_1_1"
				(pin passive line
					(at -3.81 0 0)
					(length 2.54)
					(name "K"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin passive line
					(at 3.81 0 180)
					(length 2.54)
					(name "A"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:D_Schottky_Small"
			(pin_names
				(offset 0)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "D"
				(at -1.27 3.175 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left)
				)
			)
			(property "Value" "D_Schottky_Small"
				(at -7.62 -3.175 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left)
				)
			)
			(property "Footprint" ""
				(at 0 0 90)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 0 0 90)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "Diode_* D-Pak_TO252AA *SingleDiode *SingleDiode* *_Diode_*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "D_Schottky_Small_0_1"
				(polyline
					(pts
						(xy -0.762 1.016) (xy -0.762 1.016)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.762 1.016) (xy -0.508 1.016)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.762 -1.016) (xy -1.016 -1.016)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.762 -1.016) (xy -0.762 1.016)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.762 -1.016) (xy -0.762 0) (xy 0.762 1.016) (xy 0.762 -1.016)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
			)
			(symbol "D_Schottky_Small_1_1"
				(pin passive line
					(at -2.54 0 0)
					(length 1.778)
					(name "K"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 0 180)
					(length 1.778)
					(name "A"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:ESDS314DBVR(SOT-23-5)"
			(pin_names
				(offset 0)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "TVS"
				(at -2.54 10.16 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left)
				)
			)
			(property "Value" "ESDS314DBVR(SOT-23-5)"
				(at -12.7 -10.16 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left)
				)
			)
			(property "Footprint" "OLIMEX_Diodes-FP:SOT-23-5"
				(at 0 -12.7 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at -2.54 5.08 90)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "Diode_* D-Pak_TO252AA *SingleDiode *SingleDiode* *_Diode_*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "ESDS314DBVR(SOT-23-5)_0_1"
				(rectangle
					(start -5.08 7.62)
					(end 5.08 -7.62)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type background)
					)
				)
				(polyline
					(pts
						(xy -5.08 5.08) (xy 5.08 5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.302 6.096) (xy -3.302 6.096)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.302 6.096) (xy -3.302 6.096)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.302 6.096) (xy -2.794 6.604)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.302 6.096) (xy -2.794 6.604)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.302 4.064) (xy -3.81 3.556)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.302 4.064) (xy -3.302 6.096)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.302 4.064) (xy -3.302 6.096)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.302 -4.064) (xy -3.302 -4.064)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.302 -4.064) (xy -3.302 -4.064)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.302 -4.064) (xy -2.794 -3.556)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.302 -4.064) (xy -2.794 -3.556)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.302 -6.096) (xy -3.81 -6.604)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.302 -6.096) (xy -3.302 -4.064)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.302 -6.096) (xy -3.302 -4.064)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.778 4.064) (xy -3.302 5.08) (xy -1.778 6.096) (xy -1.778 4.064)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy -1.778 4.064) (xy -3.302 5.08) (xy -1.778 6.096) (xy -1.778 4.064)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy -1.778 -6.096) (xy -3.302 -5.08) (xy -1.778 -4.064) (xy -1.778 -6.096)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy -1.778 -6.096) (xy -3.302 -5.08) (xy -1.778 -4.064) (xy -1.778 -6.096)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 0 5.08)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 0 5.08)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy 0 5.08) (xy 0 -5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 0) (xy -5.08 0)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 0) (xy -5.08 0)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center 0 0)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 0 0)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 0 -5.08)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 0 -5.08)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy 1.778 6.096) (xy 3.302 5.08) (xy 1.778 4.064) (xy 1.778 6.096)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy 1.778 6.096) (xy 3.302 5.08) (xy 1.778 4.064) (xy 1.778 6.096)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy 1.778 -4.064) (xy 3.302 -5.08) (xy 1.778 -6.096) (xy 1.778 -4.064)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy 1.778 -4.064) (xy 3.302 -5.08) (xy 1.778 -6.096) (xy 1.778 -4.064)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy 3.302 6.096) (xy 3.302 4.064)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 3.302 6.096) (xy 3.302 4.064)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 3.302 6.096) (xy 3.81 6.604)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 3.302 4.064) (xy 2.794 3.556)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 3.302 4.064) (xy 2.794 3.556)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 3.302 4.064) (xy 3.302 4.064)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 3.302 4.064) (xy 3.302 4.064)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 3.302 -4.064) (xy 3.302 -6.096)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 3.302 -4.064) (xy 3.302 -6.096)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 3.302 -4.064) (xy 3.81 -3.556)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 3.302 -6.096) (xy 2.794 -6.604)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 3.302 -6.096) (xy 2.794 -6.604)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 3.302 -6.096) (xy 3.302 -6.096)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 3.302 -6.096) (xy 3.302 -6.096)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 5.08 -5.08) (xy -5.08 -5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "ESDS314DBVR(SOT-23-5)_1_1"
				(pin passive line
					(at -10.16 5.08 0)
					(length 5.08)
					(name "I/O1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -10.16 5.08 0)
					(length 5.08)
					(name "I/O1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -10.16 0 0)
					(length 5.08)
					(name "GND"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at -10.16 -5.08 0)
					(length 5.08)
					(name "I/O2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 10.16 5.08 180)
					(length 5.08)
					(name "I/O4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "5"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 10.16 -5.08 180)
					(length 5.08)
					(name "I/O3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:ESP32-WROVER(WROOM)-UNIVERSAL"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "U"
				(at 0 43.18 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Value" "ESP32-WROVER(WROOM)-UNIVERSAL"
				(at 0 -45.72 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Footprint" "OLIMEX_Cases-FP:ESP32-WROVER(WROOM)-UNIVERSAL_MODULE"
				(at 0 -49.53 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at -22.86 5.08 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "ESP32-WROVER(WROOM)-UNIVERSAL_0_0"
				(polyline
					(pts
						(xy -1.905 -6.35) (xy 4.445 -6.35)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 2.54 -3.81) (xy 8.89 -3.81)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(text "Note:"
					(at -39.37 -29.21 0)
					(effects
						(font
							(size 1.27 1.27)
							(bold yes)
							(italic yes)
						)
					)
				)
				(text "2. GPIO6 to GPIO11 are connected to "
					(at -26.67 -36.83 0)
					(effects
						(font
							(size 1.016 1.016)
							(bold yes)
							(italic yes)
						)
					)
				)
				(text "1. When ESP32-WROVER, take in mind that"
					(at -24.765 -31.75 0)
					(effects
						(font
							(size 1.016 1.016)
							(bold yes)
							(italic yes)
						)
					)
				)
				(text "are not led out!"
					(at -24.765 -41.91 0)
					(effects
						(font
							(size 1.016 1.016)
							(bold yes)
							(italic yes)
						)
					)
				)
				(text "ESP32-WROVER &"
					(at -23.876 -9.906 0)
					(effects
						(font
							(size 2.4892 2.4892)
							(bold yes)
						)
					)
				)
				(text "ESP32-WROOM-32"
					(at -23.876 -14.986 0)
					(effects
						(font
							(size 2.4892 2.4892)
							(bold yes)
						)
					)
				)
				(text "MODULEs"
					(at -23.876 -20.066 0)
					(effects
						(font
							(size 2.4892 2.4892)
							(bold yes)
						)
					)
				)
				(text "the SPI flash integrated on the module and"
					(at -22.225 -39.37 0)
					(effects
						(font
							(size 1.016 1.016)
							(bold yes)
							(italic yes)
						)
					)
				)
				(text "GPIO16<27> and GPIO17<28> are not connected!"
					(at -19.685 -34.29 0)
					(effects
						(font
							(size 1.016 1.016)
							(bold yes)
							(italic yes)
						)
					)
				)
				(text "1."
					(at 5.08 -4.572 0)
					(effects
						(font
							(size 0.508 0.508)
						)
					)
				)
				(text "1."
					(at 9.398 -2.032 0)
					(effects
						(font
							(size 0.508 0.508)
						)
					)
				)
				(text "2."
					(at 41.529 23.368 0)
					(effects
						(font
							(size 0.508 0.508)
						)
					)
				)
				(text "2."
					(at 41.529 20.828 0)
					(effects
						(font
							(size 0.508 0.508)
						)
					)
				)
				(text "2."
					(at 41.529 18.288 0)
					(effects
						(font
							(size 0.508 0.508)
						)
					)
				)
				(text "2."
					(at 41.529 15.748 0)
					(effects
						(font
							(size 0.508 0.508)
						)
					)
				)
				(text "2."
					(at 41.529 13.208 0)
					(effects
						(font
							(size 0.508 0.508)
						)
					)
				)
				(text "2."
					(at 41.529 10.668 0)
					(effects
						(font
							(size 0.508 0.508)
						)
					)
				)
			)
			(symbol "ESP32-WROVER(WROOM)-UNIVERSAL_0_1"
				(rectangle
					(start -43.18 40.64)
					(end 45.72 -43.18)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type background)
					)
				)
			)
			(symbol "ESP32-WROVER(WROOM)-UNIVERSAL_1_1"
				(pin power_in line
					(at -45.72 38.1 0)
					(length 2.54)
					(name "VDD33(3V3)"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin power_in line
					(at -45.72 35.56 0)
					(length 2.54)
					(name "GND"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin power_in line
					(at -45.72 33.02 0)
					(length 2.54)
					(name "GND"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "15"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin power_in line
					(at -45.72 30.48 0)
					(length 2.54)
					(name "GND"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "38"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin power_in line
					(at -45.72 22.86 0)
					(length 2.54)
					(name "THERMAL_PAD"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "39"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at -45.72 17.78 0)
					(length 2.54)
					(name "EN"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin no_connect line
					(at -45.72 12.7 0)
					(length 2.54)
					(name "NC"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "32"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 38.1 180)
					(length 2.54)
					(name "GPIO0/ADC2_CH1/TOUCH1/RTC_GPIO11/CLK_OUT1/EMAC_TX_CLK"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "25"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 35.56 180)
					(length 2.54)
					(name "GPIO1/U0TXD/CLK_OUT3/EMAC_RXD2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "35"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 33.02 180)
					(length 2.54)
					(name "GPIO2/ADC2_CH2/TOUCH2/RTC_GPIO12/HSPIWP/HS2_DATA0/SD_DATA0"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "24"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 30.48 180)
					(length 2.54)
					(name "GPIO3/U0RXD/CLK_OUT2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "34"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 27.94 180)
					(length 2.54)
					(name "GPIO4/ADC2_CH0/TOUCH0/RTC_GPIO10/HSPIHD/HS2_DATA1/SD_DATA1/EMAC_TX_ER"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "26"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 25.4 180)
					(length 2.54)
					(name "GPIO5/VSPICS0/HS1_DATA6/EMAC_RX_CLK"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "29"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 22.86 180)
					(length 2.54)
					(name "NC"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "20"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 20.32 180)
					(length 2.54)
					(name "NC"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "21"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 17.78 180)
					(length 2.54)
					(name "NC"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "22"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 15.24 180)
					(length 2.54)
					(name "NC"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "17"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 12.7 180)
					(length 2.54)
					(name "NC"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "18"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 10.16 180)
					(length 2.54)
					(name "NC"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "19"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 7.62 180)
					(length 2.54)
					(name "GPIO12/ADC2_CH5/TOUCH5/RTC_GPIO15/MTDI/HSPIQ/HS2_DATA2/SD_DATA2/EMAC_TXD3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "14"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 5.08 180)
					(length 2.54)
					(name "GPIO13/ADC2_CH4/TOUCH4/RTC_GPIO14/MTCK/HSPID/HS2_DATA3/SD_DATA3/EMAC_RX_ER"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "16"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 2.54 180)
					(length 2.54)
					(name "GPIO14/ADC2_CH6/TOUCH6/RTC_GPIO16/MTMS/HSPICLK/HS2_CLK/SD_CLK/EMAC_TXD2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "13"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 0 180)
					(length 2.54)
					(name "GPIO15/ADC2_CH3/TOUCH3/MTDO/HSPICS0/RTC_GPIO13/HS2_CMD/SD_CMD/EMAC_RXD3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "23"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 -2.54 180)
					(length 2.54)
					(name "NC(GPIO16/HS1_DATA4/U2RXD/EMAC_CLK_OUT)"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "27"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 -5.08 180)
					(length 2.54)
					(name "NC(GPIO17/HS1_DATA5/U2TXD/EMAC_CLK_OUT_180)"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "28"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 -7.62 180)
					(length 2.54)
					(name "GPIO18/VSPICLK/HS1_DATA7"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "30"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 -10.16 180)
					(length 2.54)
					(name "GPIO19/VSPIQ/U0CTS/EMAC_TXD0"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "31"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 -12.7 180)
					(length 2.54)
					(name "GPIO21/VSPIHD/EMAC_TX_EN"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "33"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 -15.24 180)
					(length 2.54)
					(name "GPIO22/VSPIWP/U0RTS/EMAC_TXD1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "36"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 -17.78 180)
					(length 2.54)
					(name "GPIO23/VSPID/HS1_STROBE"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "37"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 -20.32 180)
					(length 2.54)
					(name "GPIO25/DAC_1/ADC2_CH8/RTC_GPIO6/EMAC_RXD0"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "10"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 -22.86 180)
					(length 2.54)
					(name "GPIO26/DAC_2/ADC2_CH9/RTC_GPIO7/EMAC_RXD1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "11"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 -25.4 180)
					(length 2.54)
					(name "GPIO27/ADC2_CH7/TOUCH7/RTC_GPIO17/EMAC_RX_DV"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "12"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 -27.94 180)
					(length 2.54)
					(name "GPIO32/XTAL_32K_P/ADC1_CH4/TOUCH9/RTC_GPIO9"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "8"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 48.26 -30.48 180)
					(length 2.54)
					(name "GPIO33/XTAL_32K_N/ADC1_CH5/TOUCH8/RTC_GPIO8"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "9"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 48.26 -33.02 180)
					(length 2.54)
					(name "GPI34/ADC1_CH6/RTC_GPIO4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "6"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 48.26 -35.56 180)
					(length 2.54)
					(name "GPI35/ADC1_CH7/RTC_GPIO5"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "7"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 48.26 -38.1 180)
					(length 2.54)
					(name "GPI36/SENSOR_VP/ADC1_CH0/RTC_GPIO0"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 48.26 -40.64 180)
					(length 2.54)
					(name "GPI39/SENSOR_VN/ADC1_CH3/RTC_GPIO3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "5"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:Earth"
			(power)
			(pin_names
				(offset 0)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "#PWR"
				(at 0 -6.35 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Value" "Earth"
				(at 0 -3.81 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "Earth_0_1"
				(polyline
					(pts
						(xy -0.635 -1.905) (xy 0.635 -1.905)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.127 -2.54) (xy 0.127 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 -1.27) (xy 0 0)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.27 -1.27) (xy -1.27 -1.27)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "Earth_1_1"
				(pin power_in line
					(at 0 0 270)
					(length 0)
					(hide yes)
					(name "Earth"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:F0505S-2WR2_AM1D-0505S-NZ(SIP-7_Universal)"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "DCDC"
				(at -3.048 6.858 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left bottom)
				)
			)
			(property "Value" "F0505S-2WR2_AM1D-0505S-NZ(SIP-7_Universal)"
				(at -24.765 -8.255 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left bottom)
				)
			)
			(property "Footprint" ""
				(at 0.762 2.54 0)
				(effects
					(font
						(size 0.508 0.508)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at 0 -1.27 0)
				(effects
					(font
						(size 2.54 2.54)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "*SOT-23-5*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "F0505S-2WR2_AM1D-0505S-NZ(SIP-7_Universal)_0_0"
				(polyline
					(pts
						(xy 5.08 1.27) (xy 0.254 1.27)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 5.08 -1.27) (xy 0.254 -1.27)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(text "ISOLATION"
					(at -0.381 0 900)
					(effects
						(font
							(size 0.5588 0.5588)
						)
					)
				)
				(text "AM1D-0505S-NZ"
					(at 2.667 -3.81 0)
					(effects
						(font
							(size 0.3556 0.3556)
							(bold yes)
							(italic yes)
						)
					)
				)
				(text "F0505S-2WR2"
					(at 2.794 3.81 0)
					(effects
						(font
							(size 0.381 0.381)
							(bold yes)
							(italic yes)
						)
					)
				)
			)
			(symbol "F0505S-2WR2_AM1D-0505S-NZ(SIP-7_Universal)_1_0"
				(polyline
					(pts
						(xy -1.143 6.35) (xy -1.143 -6.35)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.254 6.35) (xy 0.254 -6.35)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 5.08 6.35)
					(end -5.08 -6.35)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type background)
					)
				)
			)
			(symbol "F0505S-2WR2_AM1D-0505S-NZ(SIP-7_Universal)_1_1"
				(pin power_in line
					(at -7.62 2.54 0)
					(length 2.54)
					(name "Vin+"
						(effects
							(font
								(size 0.7874 0.7874)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 0.7874 0.7874)
							)
						)
					)
				)
				(pin input line
					(at -7.62 -2.54 0)
					(length 2.54)
					(name "Vin-"
						(effects
							(font
								(size 0.7874 0.7874)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 0.7874 0.7874)
							)
						)
					)
				)
				(pin power_in line
					(at 7.62 5.08 180)
					(length 2.54)
					(name "Vout+"
						(effects
							(font
								(size 0.7874 0.7874)
							)
						)
					)
					(number "7"
						(effects
							(font
								(size 0.7874 0.7874)
							)
						)
					)
				)
				(pin power_in line
					(at 7.62 2.54 180)
					(length 2.54)
					(name "Vout-"
						(effects
							(font
								(size 0.7874 0.7874)
							)
						)
					)
					(number "5"
						(effects
							(font
								(size 0.7874 0.7874)
							)
						)
					)
				)
				(pin power_in line
					(at 7.62 -2.54 180)
					(length 2.54)
					(name "Vout+"
						(effects
							(font
								(size 0.7874 0.7874)
							)
						)
					)
					(number "6"
						(effects
							(font
								(size 0.7874 0.7874)
							)
						)
					)
				)
				(pin power_in line
					(at 7.62 -5.08 180)
					(length 2.54)
					(name "Vout-"
						(effects
							(font
								(size 0.7874 0.7874)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 0.7874 0.7874)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:Fiducial"
			(pin_numbers
				(hide yes)
			)
			(pin_names
				(offset 0)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "FID"
				(at -1.905 3.175 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left bottom)
				)
			)
			(property "Value" "Fiducial"
				(at -3.81 -4.445 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left bottom)
				)
			)
			(property "Footprint" "OLIMEX_Other-FP:Fiducial1x3"
				(at 0.254 -5.715 0)
				(effects
					(font
						(size 0.508 0.508)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at -1.27 0 90)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "*TEST_PAD40/70/SQUARE* *TESTPAD50/80* *TESPAD28/40* *TESTPAD32/56* *TESTPAD34/60* *TESTPAD311_1* *TESTPAD40/66/SQUARE* *TESTPAD40/66* *TESTPAD* *TESTPAD2* *TESTPAD43/80* *SMD50/40* *TESTPAD50/80* *TESTPAD50/80_SQUARE* *TESTPAD60/110* *TESTPAD311* *SMD80/30* *SMD80/40* *SMD80/50* *TESTPAD80/130* *TESTPAD90/69* *SMD100/40* *TESTPAD100/150* *SMD250/80* *TESTPAD40/OBLONG* *TESTPAD_RPM* *TESTPAD60/90_WITHOUT_MASK*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "Fiducial_0_1"
				(polyline
					(pts
						(xy -1.778 -1.778) (xy 1.778 1.778)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center 0 0)
					(radius 0.635)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 0 0)
					(radius 2.54)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type background)
					)
				)
				(polyline
					(pts
						(xy 1.778 -1.778) (xy -1.778 1.778)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "Fiducial_1_1"
				(pin no_connect line
					(at 0 0 90)
					(length 0)
					(name "FID*"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "Fid1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:GG0402052R542P"
			(pin_names
				(offset 0)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "TVS"
				(at -1.27 2.54 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left)
				)
			)
			(property "Value" "GG0402052R542P"
				(at -10.16 -2.54 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left)
				)
			)
			(property "Footprint" "OLIMEX_Diodes-FP:D_0402_5MIL_DWS"
				(at 0 -5.08 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at -0.635 0 90)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "Diode_* D-Pak_TO252AA *SingleDiode *SingleDiode* *_Diode_*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "GG0402052R542P_0_1"
				(polyline
					(pts
						(xy -2.667 1.016) (xy -1.143 0) (xy -2.667 -1.016) (xy -2.667 1.016)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy -2.667 1.016) (xy -1.143 0) (xy -2.667 -1.016) (xy -2.667 1.016)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy -1.27 0.635) (xy -1.016 1.016)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.27 -0.635) (xy -1.524 -1.016)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.27 -0.635) (xy -1.27 0.635)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.127 -1.016) (xy -1.397 0) (xy 0.127 1.016) (xy 0.127 -1.016)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy 0.127 -1.016) (xy -1.397 0) (xy 0.127 1.016) (xy 0.127 -1.016)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
			)
			(symbol "GG0402052R542P_1_1"
				(pin passive line
					(at -5.08 0 0)
					(length 2.54)
					(name "IO1"
						(effects
							(font
								(size 0.762 0.762)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 0.762 0.762)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 0 180)
					(length 2.54)
					(name "IO2"
						(effects
							(font
								(size 0.762 0.762)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 0.762 0.762)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:GND"
			(power)
			(pin_names
				(offset 0)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "#PWR"
				(at 0 -6.35 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Value" "GND"
				(at 0 -3.81 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "GND_0_1"
				(polyline
					(pts
						(xy 0 0) (xy 0 -1.27) (xy 1.27 -1.27) (xy 0 -2.54) (xy -1.27 -1.27) (xy 0 -1.27)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "GND_1_1"
				(pin power_in line
					(at 0 0 270)
					(length 0)
					(hide yes)
					(name "GND"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:L"
			(pin_numbers
				(hide yes)
			)
			(pin_names
				(offset 0)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "L"
				(at -1.27 2.54 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "L"
				(at -1.27 -1.27 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at -1.27 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at -1.27 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "L_0_1"
				(arc
					(start -3.81 0)
					(mid -2.54 1.27)
					(end -1.27 0)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start -1.27 0)
					(mid 0 1.27)
					(end 1.27 0)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 1.27 0)
					(mid 2.54 1.27)
					(end 3.81 0)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "L_1_1"
				(pin passive line
					(at -5.08 0 0)
					(length 1.27)
					(name "1"
						(effects
							(font
								(size 0.762 0.762)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 0.762 0.762)
							)
						)
					)
				)
				(pin passive line
					(at 5.08 0 180)
					(length 1.27)
					(name "2"
						(effects
							(font
								(size 0.762 0.762)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 0.762 0.762)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:LAN8710A-EZC(QFN32)"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "U"
				(at -9.906 37.084 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Value" "LAN8710A-EZC(QFN32)"
				(at 0.254 -37.338 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Footprint" ""
				(at 10.16 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at 10.16 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
					(hide yes)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "LAN8710A-EZC(QFN32)_0_1"
				(rectangle
					(start -12.7 35.56)
					(end 12.7 -35.56)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type background)
					)
				)
			)
			(symbol "LAN8710A-EZC(QFN32)_1_1"
				(pin power_in line
					(at -15.24 33.02 0)
					(length 2.4892)
					(name "VDDIO"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "12"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin power_in line
					(at -15.24 25.4 0)
					(length 2.4892)
					(name "VDD1A"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "27"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin power_in line
					(at -15.24 20.32 0)
					(length 2.4892)
					(name "VDD2A"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin power_in line
					(at -15.24 15.24 0)
					(length 2.4892)
					(name "VDDCR"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "6"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin power_in line
					(at -15.24 2.54 0)
					(length 2.4892)
					(name "GND"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "33"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin output line
					(at -15.24 -5.08 0)
					(length 2.4892)
					(name "XTAL2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at -15.24 -10.16 0)
					(length 2.4892)
					(name "XTAL1/CLKIN"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "5"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at -15.24 -17.78 0)
					(length 2.4892)
					(name "LED2/NINTSEL"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at -15.24 -20.32 0)
					(length 2.4892)
					(name "LED1/REGOFF"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin output line
					(at -15.24 -25.4 0)
					(length 2.4892)
					(name "TXP"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "29"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin output line
					(at -15.24 -27.94 0)
					(length 2.4892)
					(name "TXN"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "28"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at -15.24 -30.48 0)
					(length 2.4892)
					(name "RXP"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "31"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at -15.24 -33.02 0)
					(length 2.4892)
					(name "RXN"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "30"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 15.24 33.02 180)
					(length 2.4892)
					(name "TXD0"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "22"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 15.24 30.48 180)
					(length 2.4892)
					(name "TXD1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "23"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 15.24 27.94 180)
					(length 2.4892)
					(name "TXD2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "24"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 15.24 25.4 180)
					(length 2.4892)
					(name "TXD3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "25"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 15.24 22.86 180)
					(length 2.4892)
					(name "TXEN"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "21"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin output line
					(at 15.24 20.32 180)
					(length 2.4892)
					(name "TXCLK"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "20"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 15.24 17.78 180)
					(length 2.4892)
					(name "NINT/TXER/TXD4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "18"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 15.24 12.7 180)
					(length 2.4892)
					(name "RXD0/MODE0"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "11"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 15.24 10.16 180)
					(length 2.4892)
					(name "RXD1/MODE1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "10"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 15.24 7.62 180)
					(length 2.4892)
					(name "RXD2/RMIISEL"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "9"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 15.24 5.08 180)
					(length 2.4892)
					(name "RXD3/PHYAD2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "8"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin output line
					(at 15.24 2.54 180)
					(length 2.4892)
					(name "RXDV"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "26"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 15.24 0 180)
					(length 2.4892)
					(name "RXCLK/PHYAD1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "7"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 15.24 -2.54 180)
					(length 2.4892)
					(name "RXER/RXD4/PHYAD0"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "13"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input clock
					(at 15.24 -7.62 180)
					(length 2.4892)
					(name "MDC"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "17"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 15.24 -10.16 180)
					(length 2.4892)
					(name "MDIO"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "16"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin output line
					(at 15.24 -17.78 180)
					(length 2.4892)
					(name "CRS"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "14"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at 15.24 -22.86 180)
					(length 2.4892)
					(name "COL/CRS_DV/MODE2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "15"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input inverted
					(at 15.24 -27.94 180)
					(length 2.4892)
					(name "NRST"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "19"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 15.24 -33.02 180)
					(length 2.4892)
					(name "RBIAS"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "32"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:LED"
			(pin_names
				(offset 0)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "LED"
				(at 0 2.54 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "LED"
				(at 0 -2.54 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "LED-3MM LED-5MM LED-10MM LED-0603 LED-0805 LED-1206 LEDV"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "LED_0_1"
				(polyline
					(pts
						(xy -3.302 1.397) (xy -3.302 0.889)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.54 1.905) (xy -2.032 1.905)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.286 0.381) (xy -3.302 1.397) (xy -2.794 1.397)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.651 1.016) (xy -2.54 1.905) (xy -2.54 1.397)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.27 -1.27) (xy -1.27 1.27)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 1.27 1.27)
					(end 1.27 -1.27)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.27 -1.27) (xy -1.27 0) (xy 1.27 1.27)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
			)
			(symbol "LED_1_1"
				(pin passive line
					(at -5.08 0 0)
					(length 3.81)
					(name "K"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin passive line
					(at 5.08 0 180)
					(length 3.81)
					(name "A"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:LMUN2211LT1G(SOT-23)"
			(pin_names
				(offset 0)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "T"
				(at 5.08 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left bottom)
				)
			)
			(property "Value" "LMUN2211LT1G(SOT-23)"
				(at 5.08 -2.54 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left bottom)
				)
			)
			(property "Footprint" "OLIMEX_Transistors-FP:SOT23"
				(at 11.43 -3.81 0)
				(effects
					(font
						(size 0.508 0.508)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "*SOT-23*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "LMUN2211LT1G(SOT-23)_1_0"
				(polyline
					(pts
						(xy -3.556 0.254) (xy -3.556 0.127)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.556 0.254) (xy -2.286 0.254)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.556 0.127) (xy -3.556 0)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.556 0.127) (xy -2.286 0.127)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.556 0) (xy -3.556 -0.127)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.556 -0.127) (xy -3.556 -0.254)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.556 -0.127) (xy -2.286 -0.127)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.556 -0.254) (xy -2.286 -0.254)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.286 0.254) (xy -2.286 0.127)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.286 0.127) (xy -2.286 0)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.286 0) (xy -3.556 0)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.286 0) (xy -2.286 -0.254)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.524 -1.016) (xy -1.397 -1.016)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.524 -2.286) (xy -1.524 -1.016)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.524 -2.286) (xy -1.397 -2.286)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.397 -1.016) (xy -1.143 -1.016)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.397 -2.286) (xy -1.397 -1.016)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.397 -2.286) (xy -1.143 -2.286)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.27 0) (xy -2.286 0)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.27 0) (xy -1.27 -3.175)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.27 -3.175) (xy 2.54 -3.175)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.143 -1.016) (xy -1.016 -1.016)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.143 -2.286) (xy -1.143 -1.016)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.143 -2.286) (xy -1.016 -2.286)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.016 -2.286) (xy -1.016 -1.016)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 0) (xy -1.27 0)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.27 -2.54) (xy 1.778 -1.524)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.524 -2.032) (xy 0.3048 -1.4224)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.778 -1.524) (xy 2.54 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 2.54 2.54) (xy 0.508 1.524)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 2.54 -2.54) (xy 1.27 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(text "10k"
					(at -2.7686 0.7366 0)
					(effects
						(font
							(size 0.6096 0.6096)
						)
					)
				)
				(text "10k"
					(at -2.0066 -1.4986 900)
					(effects
						(font
							(size 0.6096 0.6096)
						)
					)
				)
			)
			(symbol "LMUN2211LT1G(SOT-23)_1_1"
				(circle
					(center -1.27 0)
					(radius 0.127)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(rectangle
					(start -0.254 -2.54)
					(end 0.508 2.54)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 0 0)
					(radius 4.4704)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center 2.54 -3.175)
					(radius 0.127)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(pin passive line
					(at -5.08 0 0)
					(length 2.54)
					(name "B"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 5.08 270)
					(length 2.54)
					(name "C"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 -5.08 90)
					(length 2.54)
					(name "E"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:MICRO_SD(TFC-9P-1.xH(ATFFS150A01BR016))"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "MICRO_SD"
				(at -3.81 16.51 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left bottom)
				)
			)
			(property "Value" "MICRO_SD(TFC-9P-1.xH(ATFFS150A01BR016))"
				(at -25.4 -17.78 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left bottom)
				)
			)
			(property "Footprint" ""
				(at 5.842 6.35 0)
				(effects
					(font
						(size 0.508 0.508)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at 5.08 2.54 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_locked" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "ki_fp_filters" "*TFC-WXCP11-08-LF*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "MICRO_SD(TFC-9P-1.xH(ATFFS150A01BR016))_0_0"
				(polyline
					(pts
						(xy 5.715 -1.397) (xy 5.969 -1.143)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 5.715 -1.397) (xy 5.969 -1.778)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 6.731 -0.635)
					(mid 6.4809 -1.3599)
					(end 5.715 -1.397)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(text "Normal Open Switch"
					(at 4.445 -1.27 900)
					(effects
						(font
							(size 0.762 0.762)
						)
					)
				)
			)
			(symbol "MICRO_SD(TFC-9P-1.xH(ATFFS150A01BR016))_0_1"
				(rectangle
					(start -5.08 15.24)
					(end 7.62 -15.24)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type background)
					)
				)
				(polyline
					(pts
						(xy -0.635 7.62) (xy 5.715 7.62) (xy 5.715 0) (xy 6.985 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 5.715 -2.54) (xy 5.715 -10.16) (xy 5.08 -10.16)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "MICRO_SD(TFC-9P-1.xH(ATFFS150A01BR016))_1_1"
				(pin bidirectional line
					(at -7.62 12.7 0)
					(length 2.54)
					(name "CD/DAT3/CS"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin input line
					(at -7.62 10.16 0)
					(length 2.54)
					(name "CMD/DI"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin power_in line
					(at -7.62 7.62 0)
					(length 2.54)
					(name "VDD"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin power_in line
					(at -7.62 5.08 0)
					(length 2.54)
					(name "GND"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "6"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin input clock
					(at -7.62 2.54 0)
					(length 2.54)
					(name "CLK/SCLK"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "5"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin bidirectional line
					(at -7.62 0 0)
					(length 2.54)
					(name "DAT0/DO"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "7"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin bidirectional line
					(at -7.62 -2.54 0)
					(length 2.54)
					(name "DAT1/RES"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "8"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin bidirectional line
					(at -7.62 -5.08 0)
					(length 2.54)
					(name "DAT2/RES"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin input line
					(at -7.62 -10.16 0)
					(length 2.54)
					(name "Card_Detect"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "CD1"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin input line
					(at -7.62 -12.7 0)
					(length 2.54)
					(name "Card_Housing"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "CH1"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:Mounting_Hole_NPTH"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "MH"
				(at 0 5.08 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "Mounting_Hole_NPTH"
				(at 0 -5.08 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at -1.27 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at -1.27 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "Mounting_Hole_NPTH_0_1"
				(polyline
					(pts
						(xy -1.905 1.27) (xy 1.778 -1.524)
					)
					(stroke
						(width 0.508)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.905 1.27) (xy 1.905 -1.397)
					)
					(stroke
						(width 0.508)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.778 1.524) (xy 1.905 -1.27)
					)
					(stroke
						(width 0.508)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.524 -1.778) (xy 1.27 1.905)
					)
					(stroke
						(width 0.508)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.27 -1.905) (xy 1.397 1.905)
					)
					(stroke
						(width 0.508)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.27 -1.905) (xy 1.524 1.778)
					)
					(stroke
						(width 0.508)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center 0 0)
					(radius 2.54)
					(stroke
						(width 0.508)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center 0 0)
					(radius 3.175)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type background)
					)
				)
				(polyline
					(pts
						(xy 1.1938 2.1844) (xy -1.778 -1.778)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.778 1.778) (xy -1.2192 -2.2098)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.778 -1.778) (xy -2.2098 1.2192)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 2.1844 -1.1938) (xy -1.778 1.778)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "Mounting_Hole_NPTH_1_1"
				(circle
					(center 0 0)
					(radius 1.27)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:P-MOS+DIOD"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "FET"
				(at -6.35 -3.81 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Value" "P-MOS+DIOD"
				(at -10.16 -6.35 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "P-MOS+DIOD_0_0"
				(polyline
					(pts
						(xy -4.445 0.2286) (xy 4.4196 0.254) (xy 4.4196 0.0762) (xy -4.4196 0.0762) (xy -4.445 0.0762)
						(xy -4.445 0.1524) (xy 4.2926 0.1524)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.0988 -1.016) (xy 3.0988 -1.016) (xy 3.0988 -1.1938) (xy -3.0734 -1.2192) (xy -3.1242 -1.2192)
						(xy -3.1242 -1.0414) (xy -3.048 -1.143) (xy 2.9972 -1.1176)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center -2.54 3.3782)
					(radius 0.1016)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.5146 3.3782) (xy -0.9144 3.3782) (xy -0.9144 4.2926) (xy -0.9144 2.5146) (xy 0.4064 3.3782)
						(xy -0.889 4.3434)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.0762 1.7018) (xy -0.7112 0.7874) (xy -0.6858 0.8382)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.0254 1.7018) (xy 0.6604 0.7874)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.0254 0.254) (xy -0.0254 1.7272) (xy 2.5146 1.7272)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center 0 0)
					(radius 4.7752)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.4318 4.3688) (xy 0.4318 2.4892)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.4572 3.4036) (xy 2.4892 3.4036)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center 2.5146 3.4036)
					(radius 0.1016)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center 2.5146 1.7272)
					(radius 0.1016)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(text "D"
					(at -3.429 3.9878 900)
					(effects
						(font
							(size 1.27 1.27)
						)
					)
				)
				(text "P-MOS"
					(at 0.0254 -0.381 0)
					(effects
						(font
							(size 0.4064 0.4064)
						)
					)
				)
				(text "G"
					(at 1.7272 -2.032 900)
					(effects
						(font
							(size 1.27 1.27)
						)
					)
				)
				(text "S"
					(at 1.7526 4.1402 900)
					(effects
						(font
							(size 1.27 1.27)
						)
					)
				)
			)
			(symbol "P-MOS+DIOD_1_1"
				(pin passive line
					(at -2.54 5.08 270)
					(length 5.08)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 5.08 270)
					(length 5.08)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 2.54 -6.35 90)
					(length 5.08)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:PWR_FLAG"
			(power)
			(pin_numbers
				(hide yes)
			)
			(pin_names
				(offset 0)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "#FLG"
				(at 0 2.413 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Value" "PWR_FLAG"
				(at 0 4.572 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "PWR_FLAG_0_0"
				(pin power_out line
					(at 0 0 90)
					(length 0)
					(name "pwr"
						(effects
							(font
								(size 0.508 0.508)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 0.508 0.508)
							)
						)
					)
				)
			)
			(symbol "PWR_FLAG_0_1"
				(polyline
					(pts
						(xy 0 0) (xy 0 1.27) (xy -1.905 2.54) (xy 0 3.81) (xy 1.905 2.54) (xy 0 1.27)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:Q_NPN_BEC"
			(pin_names
				(offset 0)
				(hide yes)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "Q"
				(at 7.62 1.27 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify right)
				)
			)
			(property "Value" "Q_NPN_BEC"
				(at 15.24 -1.27 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify right)
				)
			)
			(property "Footprint" ""
				(at 5.08 2.54 0)
				(effects
					(font
						(size 0.7366 0.7366)
					)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "Q_NPN_BEC_0_1"
				(polyline
					(pts
						(xy 0.635 1.905) (xy 0.635 -1.905) (xy 0.635 -1.905)
					)
					(stroke
						(width 0.508)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.635 0.635) (xy 2.54 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.635 -0.635) (xy 2.54 -2.54) (xy 2.54 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center 1.27 0)
					(radius 2.8194)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.27 -1.778) (xy 1.778 -1.27) (xy 2.286 -2.286) (xy 1.27 -1.778) (xy 1.27 -1.778)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
			)
			(symbol "Q_NPN_BEC_1_1"
				(pin passive line
					(at -5.08 0 0)
					(length 5.715)
					(name "B"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 5.08 270)
					(length 2.54)
					(name "C"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 -5.08 90)
					(length 2.54)
					(name "E"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:R"
			(pin_numbers
				(hide yes)
			)
			(pin_names
				(offset 0)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "R"
				(at 0 2.032 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "R"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 0 -1.778 0)
				(effects
					(font
						(size 0.762 0.762)
					)
				)
			)
			(property "Datasheet" ""
				(at 0 0 90)
				(effects
					(font
						(size 0.762 0.762)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "R_* Resistor_*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "R_0_1"
				(rectangle
					(start 2.54 -1.016)
					(end -2.54 1.016)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "R_1_1"
				(pin passive line
					(at -3.81 0 0)
					(length 1.27)
					(name "~"
						(effects
							(font
								(size 1.524 1.524)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.524 1.524)
							)
						)
					)
				)
				(pin passive line
					(at 3.81 0 180)
					(length 1.27)
					(name "~"
						(effects
							(font
								(size 1.524 1.524)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.524 1.524)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:RA1206_(4x0603)_4B8_Smashed"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "RM"
				(at 0 6.35 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Value" "RA1206_(4x0603)_4B8_Smashed"
				(at 0.2032 1.016 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Footprint" ""
				(at 1.27 -2.54 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 1.27 -2.54 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "RA1206_(4x0603)_4B8_Smashed_0_0"
				(rectangle
					(start -1.2446 4.445)
					(end 1.2954 3.175)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "RA1206_(4x0603)_4B8_Smashed_1_1"
				(pin passive line
					(at -5.08 3.81 0)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "1.1"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
				(pin passive line
					(at 5.08 3.81 180)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "1.2"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
			)
			(symbol "RA1206_(4x0603)_4B8_Smashed_1_2"
				(pin passive line
					(at -5.08 3.81 0)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "1.1"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
				(pin passive line
					(at 5.08 3.81 180)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "1.2"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
			)
			(symbol "RA1206_(4x0603)_4B8_Smashed_2_1"
				(pin passive line
					(at -5.08 3.81 0)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "2.1"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
				(pin passive line
					(at 5.08 3.81 180)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "2.2"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
			)
			(symbol "RA1206_(4x0603)_4B8_Smashed_2_2"
				(pin passive line
					(at -5.08 3.81 0)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "1.1"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
				(pin passive line
					(at 5.08 3.81 180)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "1.2"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
			)
			(symbol "RA1206_(4x0603)_4B8_Smashed_3_1"
				(pin passive line
					(at -5.08 3.81 0)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "3.1"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
				(pin passive line
					(at 5.08 3.81 180)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "3.2"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
			)
			(symbol "RA1206_(4x0603)_4B8_Smashed_3_2"
				(pin passive line
					(at -5.08 3.81 0)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "1.1"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
				(pin passive line
					(at 5.08 3.81 180)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "1.2"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
			)
			(symbol "RA1206_(4x0603)_4B8_Smashed_4_1"
				(pin passive line
					(at -5.08 3.81 0)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "4.1"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
				(pin passive line
					(at 5.08 3.81 180)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "4.2"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
			)
			(symbol "RA1206_(4x0603)_4B8_Smashed_4_2"
				(pin passive line
					(at -5.08 3.81 0)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "1.1"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
				(pin passive line
					(at 5.08 3.81 180)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "1.2"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:RJP-003TC1(LPJ4112CNL)"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "LAN_CON"
				(at 0 22.86 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "RJP-003TC1(LPJ4112CNL)"
				(at 0 -20.32 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" ""
				(at 2.54 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at 2.54 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "RJP-003TC1(LPJ4112CNL)_0_0"
				(text "Filter Connector Module"
					(at 13.335 -1.27 0)
					(effects
						(font
							(size 1.016 1.016)
						)
					)
				)
				(text "Single 10/100 BASE-TX "
					(at 13.97 0.635 0)
					(effects
						(font
							(size 1.016 1.016)
						)
					)
				)
			)
			(symbol "RJP-003TC1(LPJ4112CNL)_0_1"
				(polyline
					(pts
						(xy -20.32 -6.35) (xy -13.97 -6.35) (xy -13.97 -8.89) (xy -20.32 -8.89)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "RJP-003TC1(LPJ4112CNL)_1_0"
				(polyline
					(pts
						(xy -20.32 20.32) (xy -20.32 -17.78)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -20.32 -17.78) (xy 25.4 -17.78)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -12.7 17.78) (xy -10.16 17.78)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -12.7 7.62) (xy -10.16 7.62)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -10.16 15.24) (xy -12.7 15.24)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -10.16 12.7) (xy -12.7 12.7)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -10.16 5.08) (xy -12.7 5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -10.16 2.54) (xy -12.7 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -10.16 -2.54) (xy -12.7 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -10.16 -2.54) (xy -8.89 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -10.16 -5.08) (xy -12.7 -5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -10.16 -7.62) (xy -10.16 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -10.16 -12.7) (xy -12.7 -12.7)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -8.89 -1.905) (xy -5.08 -1.905)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -8.89 -2.54) (xy -8.89 -1.905)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -8.89 -3.175) (xy -8.89 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -8.89 -6.985) (xy -5.08 -6.985)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -8.89 -7.62) (xy -10.16 -7.62)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -8.89 -7.62) (xy -8.89 -6.985)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -8.89 -8.255) (xy -8.89 -7.62)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -8.001 16.51) (xy -8.001 13.97)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -8.001 6.35) (xy -8.001 3.81)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -7.239 16.51) (xy -7.239 13.97)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -7.239 6.35) (xy -7.239 3.81)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -5.08 15.24) (xy 2.54 15.24)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -5.08 5.08) (xy 0 5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -5.08 -1.905) (xy -5.08 -3.175)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -5.08 -3.175) (xy -8.89 -3.175)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -5.08 -6.985) (xy -5.08 -8.255)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -5.08 -8.255) (xy -8.89 -8.255)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.81 -1.27) (xy -3.81 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.81 -2.54) (xy -5.08 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.81 -2.54) (xy -3.81 -3.81)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.81 -6.35) (xy -3.81 -7.62)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.81 -7.62) (xy -5.08 -7.62)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -3.81 -7.62) (xy -3.81 -8.89)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.54 -1.27) (xy -2.54 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.54 -2.54) (xy -2.54 -3.81)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.54 -2.54) (xy 0 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.54 -6.35) (xy -2.54 -7.62)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.54 -7.62) (xy -2.54 -8.89)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -2.54 -7.62) (xy 2.54 -7.62)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 5.08) (xy 0 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0 -2.54) (xy 7.62 -2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 2.54 15.24) (xy 2.54 -7.62)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 2.54 -7.62) (xy 7.62 -7.62)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 5.08 -5.08) (xy 5.08 -12.7)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 5.08 -12.7) (xy -10.16 -12.7)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 6.985 -3.81) (xy 6.985 -6.35)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 7.62 17.78) (xy -5.08 17.78)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 7.62 17.145) (xy 7.62 17.78)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 7.62 13.335) (xy 7.62 12.7)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 7.62 12.7) (xy -5.08 12.7)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 7.62 7.62) (xy -5.08 7.62)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 7.62 6.985) (xy 7.62 7.62)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 7.62 3.175) (xy 7.62 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 7.62 2.54) (xy -5.08 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 7.62 -2.54) (xy 5.08 -5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 7.62 -2.54) (xy 10.16 -5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 7.62 -7.62) (xy 5.08 -5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 8.89 -5.08) (xy 6.35 -5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 10.16 -5.08) (xy 7.62 -7.62)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 10.16 -5.08) (xy 15.24 -5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 10.16 -10.16) (xy 10.16 -12.7)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 10.16 -10.16) (xy 12.7 -12.7)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 10.16 -12.7) (xy 5.08 -12.7)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 12.065 -8.89) (xy 12.065 -10.16)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 12.065 -10.16) (xy 11.43 -10.16)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 12.065 -10.16) (xy 12.065 -11.43)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 12.7 -7.62) (xy 10.16 -10.16)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 12.7 -7.62) (xy 20.32 -7.62)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 12.7 -12.7) (xy 15.24 -10.16)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 12.7 -12.7) (xy 20.32 -12.7)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 13.97 15.24) (xy 8.89 15.24)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 13.97 12.065) (xy 8.89 6.985)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 13.97 5.08) (xy 8.89 5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 13.97 -10.16) (xy 12.065 -10.16)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 15.24 17.78) (xy 15.24 17.145)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 15.24 17.78) (xy 20.32 17.78)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 15.24 12.7) (xy 15.24 13.335)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 15.24 12.7) (xy 20.32 12.7)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 15.24 7.62) (xy 15.24 6.985)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 15.24 7.62) (xy 20.32 7.62)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 15.24 2.54) (xy 15.24 3.175)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 15.24 2.54) (xy 20.32 2.54)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 15.24 -5.08) (xy 15.24 -10.16)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 15.24 -10.16) (xy 12.7 -7.62)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 15.24 -10.16) (xy 15.24 -15.24)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 15.24 -15.24) (xy -12.7 -15.24)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 25.4 20.32) (xy -20.32 20.32)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 25.4 -17.78) (xy 25.4 20.32)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(text "2x1000pF/2KV"
					(at -8.255 0 0)
					(effects
						(font
							(size 1.27 1.27)
						)
					)
				)
				(text "2x75 Ohm"
					(at -4.445 -10.16 0)
					(effects
						(font
							(size 1.27 1.27)
						)
					)
				)
				(text "J4,5"
					(at 22.86 -5.715 0)
					(effects
						(font
							(size 1.27 1.27)
						)
					)
				)
				(text "J7,8"
					(at 22.86 -14.605 0)
					(effects
						(font
							(size 1.27 1.27)
						)
					)
				)
				(text "J1"
					(at 23.495 17.78 0)
					(effects
						(font
							(size 1.27 1.27)
						)
					)
				)
				(text "J2"
					(at 23.495 12.7 0)
					(effects
						(font
							(size 1.27 1.27)
						)
					)
				)
				(text "J3"
					(at 23.495 7.62 0)
					(effects
						(font
							(size 1.27 1.27)
						)
					)
				)
				(text "J6"
					(at 23.495 2.54 0)
					(effects
						(font
							(size 1.27 1.27)
						)
					)
				)
			)
			(symbol "RJP-003TC1(LPJ4112CNL)_1_1"
				(circle
					(center -12.7 17.78)
					(radius 0.635)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center -12.7 15.24)
					(radius 0.635)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center -12.7 12.7)
					(radius 0.635)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center -12.7 7.62)
					(radius 0.635)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center -12.7 5.08)
					(radius 0.635)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center -12.7 2.54)
					(radius 0.635)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center -12.7 -2.54)
					(radius 0.635)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center -12.7 -5.08)
					(radius 0.635)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center -12.7 -12.7)
					(radius 0.635)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center -12.7 -15.24)
					(radius 0.635)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(arc
					(start -10.16 17.78)
					(mid -9.262 17.408)
					(end -8.89 16.51)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center -10.16 16.51)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(arc
					(start -8.89 16.51)
					(mid -9.262 15.612)
					(end -10.16 15.24)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start -10.16 15.24)
					(mid -9.262 14.868)
					(end -8.89 13.97)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start -8.89 13.97)
					(mid -9.262 13.072)
					(end -10.16 12.7)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start -10.16 7.62)
					(mid -9.262 7.248)
					(end -8.89 6.35)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center -10.16 6.35)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(arc
					(start -8.89 6.35)
					(mid -9.262 5.452)
					(end -10.16 5.08)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start -10.16 5.08)
					(mid -9.262 4.708)
					(end -8.89 3.81)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start -8.89 3.81)
					(mid -9.262 2.912)
					(end -10.16 2.54)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center -10.16 -2.54)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center -10.16 -5.08)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(arc
					(start -6.35 16.51)
					(mid -5.978 17.408)
					(end -5.08 17.78)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center -5.08 16.51)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(arc
					(start -5.08 15.24)
					(mid -5.978 15.612)
					(end -6.35 16.51)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start -6.35 13.97)
					(mid -5.978 14.868)
					(end -5.08 15.24)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start -5.08 12.7)
					(mid -5.978 13.072)
					(end -6.35 13.97)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start -6.35 6.35)
					(mid -5.978 7.248)
					(end -5.08 7.62)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center -5.08 6.35)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(arc
					(start -5.08 5.08)
					(mid -5.978 5.452)
					(end -6.35 6.35)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start -6.35 3.81)
					(mid -5.978 4.708)
					(end -5.08 5.08)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start -5.08 2.54)
					(mid -5.978 2.912)
					(end -6.35 3.81)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center 0 -2.54)
					(radius 0.2794)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 2.54 -7.62)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 5.08 -5.08)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 5.08 -12.7)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(polyline
					(pts
						(xy 6.985 -5.08) (xy 8.255 -3.81) (xy 8.255 -3.81) (xy 8.255 -6.35) (xy 8.255 -6.35) (xy 6.985 -5.08)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(arc
					(start 8.89 15.875)
					(mid 7.992 16.247)
					(end 7.62 17.145)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 10.16 17.145)
					(mid 9.788 16.247)
					(end 8.89 15.875)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 7.62 13.335)
					(mid 7.992 14.233)
					(end 8.89 14.605)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 8.89 14.605)
					(mid 9.788 14.233)
					(end 10.16 13.335)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 8.89 5.715)
					(mid 7.992 6.087)
					(end 7.62 6.985)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 10.16 6.985)
					(mid 9.788 6.087)
					(end 8.89 5.715)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 7.62 3.175)
					(mid 7.992 4.073)
					(end 8.89 4.445)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 8.89 4.445)
					(mid 9.788 4.073)
					(end 10.16 3.175)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center 10.16 -5.08)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 10.16 -10.16)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(arc
					(start 11.43 15.875)
					(mid 10.532 16.247)
					(end 10.16 17.145)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 12.7 17.145)
					(mid 12.328 16.247)
					(end 11.43 15.875)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 10.16 13.335)
					(mid 10.532 14.233)
					(end 11.43 14.605)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 11.43 14.605)
					(mid 12.328 14.233)
					(end 12.7 13.335)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 11.43 5.715)
					(mid 10.532 6.087)
					(end 10.16 6.985)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 12.7 6.985)
					(mid 12.328 6.087)
					(end 11.43 5.715)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 10.16 3.175)
					(mid 10.532 4.073)
					(end 11.43 4.445)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 11.43 4.445)
					(mid 12.328 4.073)
					(end 12.7 3.175)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 12.065 -10.16) (xy 13.335 -8.89) (xy 13.335 -8.89) (xy 13.335 -11.43) (xy 13.335 -11.43) (xy 12.065 -10.16)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 13.97 17.145)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(arc
					(start 13.97 15.875)
					(mid 13.072 16.247)
					(end 12.7 17.145)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 15.24 17.145)
					(mid 14.868 16.247)
					(end 13.97 15.875)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 12.7 13.335)
					(mid 13.072 14.233)
					(end 13.97 14.605)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 13.97 14.605)
					(mid 14.868 14.233)
					(end 15.24 13.335)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center 13.97 13.335)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 13.97 6.985)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(arc
					(start 13.97 5.715)
					(mid 13.072 6.087)
					(end 12.7 6.985)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 15.24 6.985)
					(mid 14.868 6.087)
					(end 13.97 5.715)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 12.7 3.175)
					(mid 13.072 4.073)
					(end 13.97 4.445)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(arc
					(start 13.97 4.445)
					(mid 14.868 4.073)
					(end 15.24 3.175)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center 13.97 3.175)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 15.24 -10.16)
					(radius 0.254)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 20.32 17.78)
					(radius 0.635)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 20.32 12.7)
					(radius 0.635)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 20.32 7.62)
					(radius 0.635)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 20.32 2.54)
					(radius 0.635)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 20.32 -7.62)
					(radius 0.635)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(circle
					(center 20.32 -12.7)
					(radius 0.635)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type outline)
					)
				)
				(pin bidirectional line
					(at -25.4 17.78 0)
					(length 5.08)
					(name "TD+"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin input line
					(at -25.4 15.24 0)
					(length 5.08)
					(name "TCT"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin bidirectional line
					(at -25.4 12.7 0)
					(length 5.08)
					(name "TD-"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin bidirectional line
					(at -25.4 7.62 0)
					(length 5.08)
					(name "RD+"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin input line
					(at -25.4 5.08 0)
					(length 5.08)
					(name "RCT"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "5"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin bidirectional line
					(at -25.4 2.54 0)
					(length 5.08)
					(name "RD-"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "6"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin power_in line
					(at -25.4 -2.54 0)
					(length 5.08)
					(name "GND/NC"
						(effects
							(font
								(size 0.9398 0.9398)
							)
						)
					)
					(number "7"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin power_in line
					(at -25.4 -5.08 0)
					(length 5.08)
					(name "NC/GND"
						(effects
							(font
								(size 0.9398 0.9398)
							)
						)
					)
					(number "8"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin passive line
					(at -25.4 -7.62 0)
					(length 5.08)
					(name "Shield"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "0"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin power_out line
					(at -25.4 -12.7 0)
					(length 5.08)
					(name "PW+"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "9"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin power_out line
					(at -25.4 -15.24 0)
					(length 5.08)
					(name "PW-"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "10"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:SIDE_WTCM-TR(3x4)"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "SW"
				(at -4.064 2.794 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Value" "SIDE_WTCM-TR(3x4)"
				(at 14.478 2.794 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Footprint" ""
				(at -0.0254 0.9652 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at -0.0254 0.9652 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "SIDE_WTCM-TR(3x4)_0_1"
				(circle
					(center -2.0066 0)
					(radius 0.4318)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.635 3.048) (xy 0.6096 3.048)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.0254 1.016) (xy -0.0254 2.9718)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.0254 0.9398) (xy -2.0066 0.9398)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -0.0254 0.9398) (xy 1.9812 0.9398)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(circle
					(center 2.0574 0.0254)
					(radius 0.4318)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "SIDE_WTCM-TR(3x4)_1_1"
				(pin passive line
					(at -5.08 0 0)
					(length 2.5908)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 5.08 0 180)
					(length 2.5908)
					(name "~"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:SMBJ6.0A"
			(pin_names
				(offset 0)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "D"
				(at -2.9464 2.6416 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left bottom)
				)
			)
			(property "Value" "SMBJ6.0A"
				(at -4.445 -4.445 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left bottom)
				)
			)
			(property "Footprint" ""
				(at 0.762 3.81 0)
				(effects
					(font
						(size 0.508 0.508)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "ki_fp_filters" "*DO214AA*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "SMBJ6.0A_0_1"
				(rectangle
					(start -2.54 0)
					(end -1.27 0)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start 1.27 0)
					(end 2.54 0)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "SMBJ6.0A_1_0"
				(polyline
					(pts
						(xy -1.27 1.905) (xy -1.27 -1.905)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.27 -1.905) (xy 1.27 0)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.27 0) (xy -1.27 1.905)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.397 1.905) (xy 1.397 -1.905)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 1.397 -1.905) (xy 0.762 -1.905)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "SMBJ6.0A_1_1"
				(pin passive line
					(at -2.54 0 0)
					(length 0)
					(name "A"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 0 180)
					(length 0)
					(name "K"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:SN74LVC1G04DBVR(SOT23-5)"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "U"
				(at 0 6.35 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "SN74LVC1G04DBVR(SOT23-5)"
				(at 0 -6.35 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" "OLIMEX_IC-FP:SOT-23-5"
				(at 0 -8.89 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "SN74LVC1G04DBVR(SOT23-5)_0_1"
				(circle
					(center 1.778 2.54)
					(radius 0.508)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "SN74LVC1G04DBVR(SOT23-5)_1_1"
				(rectangle
					(start -7.62 5.08)
					(end 7.62 -5.08)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type background)
					)
				)
				(polyline
					(pts
						(xy -1.905 4.445) (xy -1.905 2.54)
					)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.905 4.445) (xy 1.27 2.54)
					)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.905 2.54) (xy -3.81 2.54)
					)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.905 2.54) (xy -1.905 0.635)
					)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.905 0.635) (xy 1.27 2.54)
					)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 2.286 2.54) (xy 3.81 2.54)
					)
					(stroke
						(width 0.254)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(text "Power"
					(at 0 -2.54 0)
					(effects
						(font
							(size 1.27 1.27)
						)
					)
				)
				(pin input line
					(at -10.16 2.54 0)
					(length 2.54)
					(name "A"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin no_connect line
					(at -10.16 0 0)
					(length 2.54)
					(name "NC"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin power_in line
					(at -10.16 -2.54 0)
					(length 2.54)
					(name "GND"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin output line
					(at 10.16 2.54 180)
					(length 2.54)
					(name "Y"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin power_in line
					(at 10.16 -2.54 180)
					(length 2.54)
					(name "VCC"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "5"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:SY8009AAAC(SOT23-5)"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "U"
				(at -1.27 5.715 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left bottom)
				)
			)
			(property "Value" "SY8009AAAC(SOT23-5)"
				(at -10.16 -6.985 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(justify left bottom)
				)
			)
			(property "Footprint" "OLIMEX_Regulators-FP:SOT-23-5"
				(at 0 -8.255 0)
				(effects
					(font
						(size 1.016 1.016)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at 0.762 1.016 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Note" "PB-Free"
				(at 0 -10.16 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "ki_fp_filters" "*SOT23-5*"
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "SY8009AAAC(SOT23-5)_0_0"
				(polyline
					(pts
						(xy -5.08 1.778) (xy -1.016 1.778) (xy -1.016 0.254) (xy -1.016 -1.651) (xy -5.08 -1.651)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(rectangle
					(start -1.016 -1.651)
					(end 1.651 -3.302)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy -1.016 -1.651) (xy -1.016 -3.302) (xy -5.08 -3.302)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(polyline
					(pts
						(xy 0.635 5.08) (xy 0.635 4.191) (xy 0.635 2.794) (xy -1.016 2.794) (xy -1.016 1.016) (xy -1.016 -1.651)
						(xy 5.08 -1.651)
					)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
				(text "Do not float."
					(at -3.2512 0.8382 0)
					(effects
						(font
							(size 0.2032 0.2032)
						)
					)
				)
				(text "V(ENH)=1.5V"
					(at -3.175 -0.762 0)
					(effects
						(font
							(size 0.254 0.254)
							(bold yes)
						)
					)
				)
				(text "V(ENL)=0.4V"
					(at -3.175 -1.27 0)
					(effects
						(font
							(size 0.254 0.254)
							(bold yes)
						)
					)
				)
				(text "Pull high to turn on."
					(at -3.0226 1.143 0)
					(effects
						(font
							(size 0.1778 0.1778)
							(bold yes)
						)
					)
				)
				(text "Enable control."
					(at -2.9972 1.4732 0)
					(effects
						(font
							(size 0.254 0.254)
							(bold yes)
						)
					)
				)
				(text "Vin=2.7-5.5V"
					(at -2.286 4.445 0)
					(effects
						(font
							(size 0.4572 0.4572)
							(bold yes)
						)
					)
				)
				(text "Cin=22uF/6.3V/X5R"
					(at -2.286 3.683 0)
					(effects
						(font
							(size 0.3048 0.3048)
							(bold yes)
						)
					)
				)
				(text "Feedback Reference Voltage, V(REF)=0.6V"
					(at 0 -3.81 0)
					(effects
						(font
							(size 0.3048 0.3048)
							(bold yes)
						)
					)
				)
				(text "FB Input Current, I(FB)=50nA(max)"
					(at 0 -4.445 0)
					(effects
						(font
							(size 0.3048 0.3048)
							(bold yes)
						)
					)
				)
				(text "Part Number:"
					(at 0.381 -2.032 0)
					(effects
						(font
							(size 0.2286 0.2286)
							(italic yes)
						)
					)
				)
				(text "SY8089AAC"
					(at 0.381 -2.4638 0)
					(effects
						(font
							(size 0.254 0.254)
							(italic yes)
						)
					)
				)
				(text "SY8089AAAC"
					(at 0.381 -2.921 0)
					(effects
						(font
							(size 0.254 0.254)
							(italic yes)
						)
					)
				)
				(text "2A continuous, 3A peak"
					(at 1.905 1.651 0)
					(effects
						(font
							(size 0.3048 0.3048)
							(bold yes)
						)
					)
				)
				(text "load current capability!"
					(at 1.905 1.016 0)
					(effects
						(font
							(size 0.3048 0.3048)
							(bold yes)
						)
					)
				)
				(text "Quiescent Current I(Q)=55uA"
					(at 2.0066 0.381 0)
					(effects
						(font
							(size 0.254 0.254)
							(bold yes)
						)
					)
				)
				(text "Shutdown Current I(SHDN)=0.1-1uA"
					(at 2.032 -0.254 0)
					(effects
						(font
							(size 0.2032 0.2032)
							(bold yes)
						)
					)
				)
				(text "Recommended:"
					(at 2.032 -0.762 0)
					(effects
						(font
							(size 0.3048 0.3048)
							(bold yes)
						)
					)
				)
				(text "Cout=2x22uF/6.3V/X5R"
					(at 2.032 -1.27 0)
					(effects
						(font
							(size 0.3048 0.3048)
							(bold yes)
						)
					)
				)
				(text "Lx=2.2uH"
					(at 2.794 4.445 0)
					(effects
						(font
							(size 0.4572 0.4572)
							(bold yes)
						)
					)
				)
				(text "DCR<50mR"
					(at 2.921 3.683 0)
					(effects
						(font
							(size 0.4572 0.4572)
						)
					)
				)
				(text "Vout=0.6*(1+Ra/Rb)"
					(at 3.302 -3.302 0)
					(effects
						(font
							(size 0.1778 0.1778)
							(italic yes)
						)
					)
				)
			)
			(symbol "SY8009AAAC(SOT23-5)_0_1"
				(rectangle
					(start -5.08 5.08)
					(end 5.08 -5.08)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type background)
					)
				)
			)
			(symbol "SY8009AAAC(SOT23-5)_1_1"
				(pin input line
					(at -7.62 2.54 0)
					(length 2.54)
					(name "IN"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin input line
					(at -7.62 0 0)
					(length 2.54)
					(name "EN"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin power_in line
					(at -7.62 -2.54 0)
					(length 2.54)
					(name "GND"
						(effects
							(font
								(size 0.762 0.762)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin output line
					(at 7.62 2.54 180)
					(length 2.54)
					(name "LX"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin input line
					(at 7.62 -2.54 180)
					(length 2.54)
					(name "FB"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "5"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:TPS2375PW(TSSOP-8)"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "U"
				(at -5.08 10.16 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "TPS2375PW(TSSOP-8)"
				(at 0 -10.16 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" "OLIMEX_IC-FP:TSSOP-8_Pitch-0.65mm_Dimensions-4.40x3.00x1.20mm"
				(at 0 -12.7 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "TPS2375PW(TSSOP-8)_0_0"
				(text "When TPS2375/77, Pin <7> is NC."
					(at 0 1.27 0)
					(effects
						(font
							(size 0.508 0.508)
							(bold yes)
						)
					)
				)
				(text "When TPS2376, Pin <7> is UVLO."
					(at 0 0 0)
					(effects
						(font
							(size 0.508 0.508)
							(bold yes)
						)
					)
				)
			)
			(symbol "TPS2375PW(TSSOP-8)_0_1"
				(rectangle
					(start -7.62 7.62)
					(end 7.62 -5.08)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type background)
					)
				)
			)
			(symbol "TPS2375PW(TSSOP-8)_1_1"
				(pin output line
					(at -10.16 5.08 0)
					(length 2.54)
					(name "DET"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin output line
					(at -10.16 2.54 0)
					(length 2.54)
					(name "ILIM"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin output line
					(at -10.16 -2.54 0)
					(length 2.54)
					(name "CLASS"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin power_in line
					(at 0 10.16 270)
					(length 2.54)
					(name "VDD"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "8"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin power_in line
					(at 0 -7.62 90)
					(length 2.54)
					(name "VSS"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin open_collector line
					(at 10.16 5.08 180)
					(length 2.54)
					(name "PG"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "6"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 10.16 2.54 180)
					(length 2.54)
					(name "NC/UVLO"
						(effects
							(font
								(size 0.762 0.762)
							)
						)
					)
					(number "7"
						(effects
							(font
								(size 1.016 1.016)
							)
						)
					)
				)
				(pin power_out line
					(at 10.16 -2.54 180)
					(length 2.54)
					(name "RTN"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "5"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:TX4138(ESOIC-8)"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "U"
				(at 0 11.43 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Value" "TX4138(ESOIC-8)"
				(at 0 8.89 0)
				(effects
					(font
						(size 1.27 1.27)
					)
				)
			)
			(property "Footprint" "OLIMEX_Regulators-FP:ESOIC-8"
				(at 0 -12.7 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Datasheet" ""
				(at 1.27 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "TX4138(ESOIC-8)_0_0"
				(text "Input Range"
					(at -4.826 7.239 0)
					(effects
						(font
							(size 0.508 0.508)
						)
					)
				)
				(text "4.5V to 60V"
					(at -4.826 6.35 0)
					(effects
						(font
							(size 0.508 0.508)
						)
					)
				)
				(text "Continuous Output"
					(at 3.175 7.239 0)
					(effects
						(font
							(size 0.508 0.508)
						)
					)
				)
				(text "Current 4A "
					(at 3.175 6.35 0)
					(effects
						(font
							(size 0.508 0.508)
						)
					)
				)
				(text "IBIAS(FB)=10nA"
					(at 3.683 -6.985 0)
					(effects
						(font
							(size 0.508 0.508)
						)
					)
				)
				(text "Standby Current"
					(at 3.81 3.175 0)
					(effects
						(font
							(size 0.508 0.508)
						)
					)
				)
				(text "400uA"
					(at 3.81 2.286 0)
					(effects
						(font
							(size 0.508 0.508)
						)
					)
				)
				(text "Output Adjustable"
					(at 3.81 -1.27 0)
					(effects
						(font
							(size 0.508 0.508)
						)
					)
				)
				(text "0.8V to 40V"
					(at 3.81 -2.159 0)
					(effects
						(font
							(size 0.508 0.508)
						)
					)
				)
				(text "VFB=0.805V"
					(at 4.445 -6.35 0)
					(effects
						(font
							(size 0.508 0.508)
						)
					)
				)
			)
			(symbol "TX4138(ESOIC-8)_0_1"
				(rectangle
					(start -7.62 7.62)
					(end 7.62 -7.62)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type background)
					)
				)
			)
			(symbol "TX4138(ESOIC-8)_1_1"
				(pin power_in line
					(at -10.16 5.08 0)
					(length 2.54)
					(name "Vin"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at -10.16 2.54 0)
					(length 2.54)
					(name "ILIM"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at -10.16 0 0)
					(length 2.54)
					(name "ILIM"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "9"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at -10.16 -2.54 0)
					(length 2.54)
					(name "EN"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "6"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin open_collector line
					(at -10.16 -5.08 0)
					(length 2.54)
					(name "POK"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "7"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin power_in line
					(at 0 -10.16 90)
					(length 2.54)
					(name "GND"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 10.16 5.08 180)
					(length 2.54)
					(name "BS"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "8"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin output line
					(at 10.16 0 180)
					(length 2.54)
					(name "SW"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at 10.16 -5.08 180)
					(length 2.54)
					(name "FB"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "5"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "ESP32-PoE-ISO_Rev_K:USB-MINI"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "USB"
				(at -4.445 8.255 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Value" "USB-MINI"
				(at -7.62 -8.89 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Footprint" ""
				(at 2.54 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 2.54 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "USB-MINI_0_1"
				(rectangle
					(start 3.81 6.35)
					(end -2.54 -6.35)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "USB-MINI_1_1"
				(pin input line
					(at -7.62 5.08 0)
					(length 5.08)
					(name "VBUS"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at -7.62 2.54 0)
					(length 5.08)
					(name "D-"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at -7.62 0 0)
					(length 5.08)
					(name "D+"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at -7.62 -2.54 0)
					(length 5.08)
					(name "ID"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin power_in line
					(at -7.62 -5.08 0)
					(length 5.08)
					(name "GND"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "5"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 0 10.16 270)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "0"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
				(pin passive line
					(at 0 -10.16 90)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "0"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 10.16 270)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "0"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 -10.16 90)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "0"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
		(symbol "USB-MINI_1"
			(pin_names
				(offset 1.016)
			)
			(exclude_from_sim no)
			(in_bom yes)
			(on_board yes)
			(property "Reference" "USB"
				(at -4.445 8.255 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Value" "USB-MINI"
				(at -7.62 -8.89 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Footprint" ""
				(at 2.54 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Datasheet" ""
				(at 2.54 0 0)
				(effects
					(font
						(size 1.524 1.524)
					)
				)
			)
			(property "Description" ""
				(at 0 0 0)
				(effects
					(font
						(size 1.27 1.27)
					)
					(hide yes)
				)
			)
			(symbol "USB-MINI_1_0_1"
				(rectangle
					(start 3.81 6.35)
					(end -2.54 -6.35)
					(stroke
						(width 0)
						(type solid)
					)
					(fill
						(type none)
					)
				)
			)
			(symbol "USB-MINI_1_1_1"
				(pin input line
					(at -7.62 5.08 0)
					(length 5.08)
					(name "VBUS"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "1"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at -7.62 2.54 0)
					(length 5.08)
					(name "D-"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "2"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin bidirectional line
					(at -7.62 0 0)
					(length 5.08)
					(name "D+"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "3"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin input line
					(at -7.62 -2.54 0)
					(length 5.08)
					(name "ID"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "4"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin power_in line
					(at -7.62 -5.08 0)
					(length 5.08)
					(name "GND"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
					(number "5"
						(effects
							(font
								(size 1.27 1.27)
							)
						)
					)
				)
				(pin passive line
					(at 0 10.16 270)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "0"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
				(pin passive line
					(at 0 -10.16 90)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "0"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 10.16 270)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "0"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
				(pin passive line
					(at 2.54 -10.16 90)
					(length 3.81)
					(name "~"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
					(number "0"
						(effects
							(font
								(size 0.9906 0.9906)
							)
						)
					)
				)
			)
			(embedded_fonts no)
		)
	)
	(text "Vout=0.6*(1+Ra/Rb)"
		(exclude_from_sim no)
		(at 185.42 93.98 0)
		(effects
			(font
				(size 1.2954 1.2954)
			)
			(justify left bottom)
		)
		(uuid "00baebd1-fa6d-42e6-8893-6da900f1c8ee")
	)
	(text "1"
		(exclude_from_sim no)
		(at 379.222 395.986 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "047aab77-34f7-4414-97c5-93f0de1a1fee")
	)
	(text "Pull-Up"
		(exclude_from_sim no)
		(at 384.937 347.091 0)
		(effects
			(font
				(size 1.4986 1.4986)
			)
			(justify left bottom)
		)
		(uuid "0611b061-3039-4290-a956-6824436476d4")
	)
	(text "HSPIQ"
		(exclude_from_sim no)
		(at 497.205 276.225 0)
		(effects
			(font
				(size 0.635 0.635)
			)
			(justify left bottom)
		)
		(uuid "0776bfa8-bf22-42e9-878d-c2436321a80c")
	)
	(text "VSPI_CS1_out"
		(exclude_from_sim no)
		(at 274.955 386.08 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "07aa8f20-353d-4aca-ac32-a16e5fb6e0c7")
	)
	(text "VSPID_in/_out"
		(exclude_from_sim no)
		(at 274.955 378.46 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "07b2ab28-20ff-45e6-9363-3dc6ec7a5e06")
	)
	(text "HSPI_CS2_out"
		(exclude_from_sim no)
		(at 274.955 373.38 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "082ad375-96c0-44fa-a373-6230e25a759b")
	)
	(text "Falling-edge:Input"
		(exclude_from_sim no)
		(at 373.888 388.62 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "085a1977-03b5-4506-8666-2ac9d3bd754a")
	)
	(text "I2CEXT1_SDA_in"
		(exclude_from_sim no)
		(at 274.955 343.535 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "0a9dbf3d-7782-404b-8097-2189bee14348")
	)
	(text "Power Supply"
		(exclude_from_sim no)
		(at 96.52 30.48 0)
		(effects
			(font
				(size 5.08 5.08)
				(thickness 1.016)
				(bold yes)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "0ab54d91-876a-41a7-870a-8f70d208c51c")
	)
	(text "I2CEXT1_SDA_out"
		(exclude_from_sim no)
		(at 274.955 353.695 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "0dbdcc82-01ec-45f8-a7c0-ac9c93c24ee7")
	)
	(text "Pin"
		(exclude_from_sim no)
		(at 292.735 318.77 0)
		(effects
			(font
				(size 1.4986 1.4986)
			)
			(justify left bottom)
		)
		(uuid "0e54968c-ea22-4418-bd36-87bfb153c8c8")
	)
	(text "Pin"
		(exclude_from_sim no)
		(at 332.994 381 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "0ef0e10a-ec7f-45be-a74e-053a32480e86")
	)
	(text "1"
		(exclude_from_sim no)
		(at 213.995 360.68 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "11a987f8-f265-4744-a3a9-a9434e0c1cb4")
	)
	(text "For more information refer to \nesp_wroom_32_datasheet_en.pdf."
		(exclude_from_sim no)
		(at 267.97 395.605 0)
		(effects
			(font
				(size 1.1938 1.1938)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "14b560e1-3525-48d6-a123-fa9c3c4902e5")
	)
	(text "Bootstrapping Pins \n     Settings"
		(exclude_from_sim no)
		(at 396.367 370.205 0)
		(effects
			(font
				(size 1.8034 1.8034)
				(thickness 0.3607)
				(bold yes)
			)
			(justify left bottom)
		)
		(uuid "15a22b50-597a-405c-ab56-344a0d744fc0")
	)
	(text "Auto program\n"
		(exclude_from_sim no)
		(at 210.185 347.345 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "16d0d97b-b4b0-4974-adc9-c7e9a2855ea8")
	)
	(text "GPIO2"
		(exclude_from_sim no)
		(at 332.994 375.666 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "198620d7-f354-4de5-9979-efeb01eeaecc")
	)
	(text "RDET"
		(exclude_from_sim no)
		(at 289.56 216.535 0)
		(effects
			(font
				(size 0.762 0.762)
			)
			(justify right bottom)
		)
		(uuid "1c04b79b-8235-41d9-951c-7503c3433724")
	)
	(text "Fiducials"
		(exclude_from_sim no)
		(at 502.92 307.34 0)
		(effects
			(font
				(size 5.08 5.08)
				(thickness 1.016)
				(bold yes)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "1d74e8f1-0b99-4f32-b89d-c12356765fdc")
	)
	(text "0"
		(exclude_from_sim no)
		(at 220.345 358.14 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "1e656fe8-75d8-468f-8111-972f7f1ba6f8")
	)
	(text "VSPI_CS0_in/_out"
		(exclude_from_sim no)
		(at 274.955 383.54 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "1f258fa3-4cb1-44b2-b4a6-915778b51652")
	)
	(text "or ESP32-WROOM-32E"
		(exclude_from_sim no)
		(at 337.82 133.35 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "211c486d-ab97-4739-a0be-241bc6e5b7be")
	)
	(text "EMAC_CRS_out"
		(exclude_from_sim no)
		(at 274.955 329.565 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "217acbc2-3d55-43c4-957b-2cc2e60b133e")
	)
	(text "EMAC_MDC_out"
		(exclude_from_sim no)
		(at 274.955 321.945 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "228fcdaf-09a3-4164-aa16-4001b2b9b57f")
	)
	(text "U0TXD Silent"
		(exclude_from_sim no)
		(at 374.142 381 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "238995b9-89d9-4d08-b07f-dee9d37db429")
	)
	(text "I2C"
		(exclude_from_sim no)
		(at 266.065 345.44 0)
		(effects
			(font
				(size 1.4986 1.4986)
			)
			(justify left bottom)
		)
		(uuid "24809e43-dc13-47f9-9603-7a805e1298a8")
	)
	(text "I2CEXT0_SDA_in"
		(exclude_from_sim no)
		(at 274.955 338.455 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "2781bff3-86ad-42f0-9c1d-944d45be7240")
	)
	(text "Pull-Up"
		(exclude_from_sim no)
		(at 384.937 343.281 0)
		(effects
			(font
				(size 1.4986 1.4986)
			)
			(justify left bottom)
		)
		(uuid "290b4177-0fee-439d-95cb-f5cc3fccf75e")
	)
	(text "Galvanic Isolated Part"
		(exclude_from_sim no)
		(at 165.1 278.13 0)
		(effects
			(font
				(size 7.62 7.62)
				(thickness 1.524)
				(bold yes)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "29cc5b31-0c1f-40f1-b123-dd4b4816a14b")
	)
	(text "Any GPIO"
		(exclude_from_sim no)
		(at 293.37 326.39 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "2ef35d15-3ccc-4861-87ce-a0bb3606c7bb")
	)
	(text "Rb"
		(exclude_from_sim no)
		(at 210.82 89.916 0)
		(effects
			(font
				(size 1.2954 1.2954)
			)
			(justify left bottom)
		)
		(uuid "30f1de37-8b6f-4cdb-a9ca-62a28de71ed0")
	)
	(text "1"
		(exclude_from_sim no)
		(at 414.782 395.986 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "31a8a28e-6641-44dd-9d0a-d9cf21dd3cb0")
	)
	(text "Buttons"
		(exclude_from_sim no)
		(at 508 27.94 0)
		(effects
			(font
				(size 5.08 5.08)
				(thickness 1.016)
				(bold yes)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "31aadd70-d8ba-4c12-b3c8-db44a7c5ca88")
	)
	(text "SD/MMC Card"
		(exclude_from_sim no)
		(at 502.92 83.82 0)
		(effects
			(font
				(size 4.572 4.572)
				(thickness 0.9144)
				(bold yes)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "31eccd6b-ce4a-4af2-adc2-501111b26979")
	)
	(text "I2CEXT1_SCL_out"
		(exclude_from_sim no)
		(at 274.955 351.155 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "31ff21c9-b2f7-45cb-ac2f-7ada9455f46c")
	)
	(text "Falling-edge:Output"
		(exclude_from_sim no)
		(at 354.33 390.398 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "379a1ec6-67e1-441b-a925-bb13b7b08f22")
	)
	(text "Voltage of Internal LDO(VDD_SDIO)"
		(exclude_from_sim no)
		(at 358.902 359.918 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(thickness 0.1981)
				(bold yes)
			)
			(justify left bottom)
		)
		(uuid "396f3988-e453-4e1f-8e88-f07885cf1fe0")
	)
	(text "1"
		(exclude_from_sim no)
		(at 220.345 360.68 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "3ac5f5ef-b50f-4026-9b06-726e90a50a02")
	)
	(text "U0TXD Toggling"
		(exclude_from_sim no)
		(at 356.362 381 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "3eead335-0d67-49ca-a91e-041cf1ca586a")
	)
	(text "In RMII\n Mode\n"
		(exclude_from_sim no)
		(at 160.02 175.26 0)
		(effects
			(font
				(size 1.4986 1.4986)
			)
			(justify left bottom)
		)
		(uuid "3fb8b0ae-9c96-47b2-9e63-7d64a51e7351")
	)
	(text "0"
		(exclude_from_sim no)
		(at 361.442 395.986 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "41c112c8-0fa7-4013-a138-5da3e53dadc3")
	)
	(text "1"
		(exclude_from_sim no)
		(at 226.06 353.06 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "42458f0f-8c4b-4692-ae0e-98d4dd039503")
	)
	(text "Booting Mode"
		(exclude_from_sim no)
		(at 366.522 367.792 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(thickness 0.1981)
				(bold yes)
			)
			(justify left bottom)
		)
		(uuid "437425fc-673d-4ee9-9af6-3c2df1e03646")
	)
	(text "1.8V"
		(exclude_from_sim no)
		(at 379.222 362.585 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "4524e2e0-824a-4b8b-a3f4-befbd119a271")
	)
	(text "GPIO5"
		(exclude_from_sim no)
		(at 332.994 395.986 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "46862bba-b32f-48cd-8daf-b1156fdaed31")
	)
	(text "Pin"
		(exclude_from_sim no)
		(at 333.248 388.62 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "480e64f3-1a7f-48c4-82ff-7d98d33a6233")
	)
	(text "Pull-Down"
		(exclude_from_sim no)
		(at 384.937 339.471 0)
		(effects
			(font
				(size 1.4986 1.4986)
			)
			(justify left bottom)
		)
		(uuid "48310b20-d110-465c-b99a-295de9dbcf38")
	)
	(text "EMAC_MDO_out"
		(exclude_from_sim no)
		(at 274.955 327.025 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "4e1bc8c6-4a78-487b-b626-a1d17af6e22e")
	)
	(text "1"
		(exclude_from_sim no)
		(at 226.06 358.14 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "4f39b052-e417-4830-a405-b44576c4c68c")
	)
	(text "LiPo Charger"
		(exclude_from_sim no)
		(at 104.14 55.88 0)
		(effects
			(font
				(size 3.302 3.302)
				(thickness 0.6604)
				(bold yes)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "505981cc-15da-4401-b14c-eccd03c7c160")
	)
	(text "CDET"
		(exclude_from_sim no)
		(at 276.225 222.25 90)
		(effects
			(font
				(size 0.762 0.762)
			)
			(justify left bottom)
		)
		(uuid "50e2c2c1-093a-4907-a556-c2d391a852f8")
	)
	(text "1"
		(exclude_from_sim no)
		(at 226.06 355.6 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "5321895e-9982-4c7f-a03d-b3f0566ab4a8")
	)
	(text "USB to UART"
		(exclude_from_sim no)
		(at 97.79 307.34 0)
		(effects
			(font
				(size 5.08 5.08)
				(thickness 1.016)
				(bold yes)
			)
			(justify left bottom)
		)
		(uuid "5556291b-0e47-48c9-b280-4b5e2111da8c")
	)
	(text "I2CEXT1_SCL_in"
		(exclude_from_sim no)
		(at 274.955 340.995 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "5700200a-ec2d-49dc-9517-58854ee7f9f4")
	)
	(text "0"
		(exclude_from_sim no)
		(at 207.645 355.6 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "580b44e6-b350-40ea-bfc1-1c0f3aa1fbcb")
	)
	(text "0"
		(exclude_from_sim no)
		(at 379.222 393.7 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "59086db5-8c36-480d-b51a-d462d918efdb")
	)
	(text "Battery\nMeasurement"
		(exclude_from_sim no)
		(at 195.58 30.48 0)
		(effects
			(font
				(size 1.778 1.778)
				(thickness 0.3556)
				(bold yes)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "5a9ff78e-c731-49db-bdea-a406374c715c")
	)
	(text "External \nPower\nSense"
		(exclude_from_sim no)
		(at 226.06 30.48 0)
		(effects
			(font
				(size 1.778 1.778)
				(thickness 0.3556)
				(bold yes)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "5c0ae0db-8df7-4d06-accc-a719dd588ba7")
	)
	(text "Pull-Down"
		(exclude_from_sim no)
		(at 384.937 328.041 0)
		(effects
			(font
				(size 1.4986 1.4986)
			)
			(justify left bottom)
		)
		(uuid "600b3d79-4bb7-44e1-bd81-e3472608e151")
	)
	(text "Don't-care"
		(exclude_from_sim no)
		(at 358.902 375.666 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "60f9b8b9-1fc5-4eae-9aae-2aee64ec195b")
	)
	(text "0"
		(exclude_from_sim no)
		(at 226.06 360.68 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "642f2d60-7d0d-40f3-ac87-6b3757a062c9")
	)
	(text "Rclass"
		(exclude_from_sim no)
		(at 290.195 224.155 0)
		(effects
			(font
				(size 0.762 0.762)
			)
			(justify right bottom)
		)
		(uuid "64b898d4-c6ed-478b-823f-732e68fe0673")
	)
	(text "Ethernet"
		(exclude_from_sim no)
		(at 73.66 139.7 0)
		(effects
			(font
				(size 5.08 5.08)
				(thickness 1.016)
				(bold yes)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "656d5bf3-5ef4-40ae-a657-cc9945f31ba8")
	)
	(text "Pull-Up"
		(exclude_from_sim no)
		(at 344.932 383.286 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "679bc561-062a-4b12-a29b-3f2dcd761a4b")
	)
	(text "HSPID_in/_out"
		(exclude_from_sim no)
		(at 274.955 363.22 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "684cae3d-e515-4b04-b104-34ccd5f95cbb")
	)
	(text "0"
		(exclude_from_sim no)
		(at 379.222 375.666 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "6874a6a6-e419-40d9-8ea5-74f6244c6edb")
	)
	(text "Download Boot"
		(exclude_from_sim no)
		(at 377.317 370.205 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "6960cb9f-33ea-42a5-9f02-0c52f00386ae")
	)
	(text "Debugging Log on U0TXD During Booting"
		(exclude_from_sim no)
		(at 356.362 377.952 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(thickness 0.1981)
				(bold yes)
			)
			(justify left bottom)
		)
		(uuid "6a521a25-6b77-4dab-9a6a-ddbae1f2e385")
	)
	(text "General\nPurpose\nSPI"
		(exclude_from_sim no)
		(at 262.89 377.19 0)
		(effects
			(font
				(size 1.4986 1.4986)
			)
			(justify left bottom)
		)
		(uuid "6aaee665-3420-4d23-80c1-90f26180c8be")
	)
	(text "Rising-edge:Output"
		(exclude_from_sim no)
		(at 409.448 390.398 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "6bc7fe5e-d6a3-4e84-a511-95a7f8a3b204")
	)
	(text "HSPICLK"
		(exclude_from_sim no)
		(at 497.205 278.765 0)
		(effects
			(font
				(size 0.635 0.635)
			)
			(justify left bottom)
		)
		(uuid "6c52d888-5479-4c2a-a6f7-60f8b14c7dc7")
	)
	(text "1"
		(exclude_from_sim no)
		(at 361.442 373.38 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "6c78590c-a471-4d2d-acd7-e0dd813b9631")
	)
	(text "SPI Flash Boot"
		(exclude_from_sim no)
		(at 357.632 370.205 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "6cf84f8a-0b84-46e2-9f75-a611f1b627e5")
	)
	(text "UEXT"
		(exclude_from_sim no)
		(at 505.46 236.22 0)
		(effects
			(font
				(size 4.572 4.572)
				(thickness 0.9144)
				(bold yes)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "73742a7c-b310-48f4-bff0-464ebf80a8c5")
	)
	(text "Rising-edge:Output"
		(exclude_from_sim no)
		(at 373.634 390.398 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "753eb458-97ec-471e-9844-f68e4fedfa85")
	)
	(text "Pin"
		(exclude_from_sim no)
		(at 332.994 362.712 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "776a17cf-6fb0-4c89-9ead-37c3c8e3365b")
	)
	(text "VSPICLK_in/_out"
		(exclude_from_sim no)
		(at 274.955 381 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "796ef8c8-7baf-4309-a687-6d734e906a60")
	)
	(text "IBAT = 1000/Rprog = 100mA"
		(exclude_from_sim no)
		(at 101.6 106.68 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "79daa311-8ab2-455a-ac23-76cb168cb5bd")
	)
	(text "0"
		(exclude_from_sim no)
		(at 207.645 360.68 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "7b20a990-5ef2-4000-873f-faf0a0b8cb8e")
	)
	(text "0"
		(exclude_from_sim no)
		(at 379.222 383.54 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "7f9409e0-7ac2-4e99-8398-a09d3b1899a8")
	)
	(text "1"
		(exclude_from_sim no)
		(at 414.782 393.7 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "802d74bb-9ccc-49bc-a398-f21162a8d2a2")
	)
	(text "Pull-Up"
		(exclude_from_sim no)
		(at 344.932 395.986 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "83281351-f3f5-47ec-ae73-53ff9bab38ef")
	)
	(text "Any GPIO"
		(exclude_from_sim no)
		(at 293.37 374.65 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "88a9f2f8-e720-4c39-bebd-1b79abcb4248")
	)
	(text "Rising-edge:Input"
		(exclude_from_sim no)
		(at 391.922 388.62 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "8ce07f6a-5993-49fd-af36-ed0182ce89c1")
	)
	(text "1"
		(exclude_from_sim no)
		(at 379.222 365.125 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "8e80a6cc-617d-4d0f-b34e-865526759464")
	)
	(text "Ra"
		(exclude_from_sim no)
		(at 210.82 84.836 0)
		(effects
			(font
				(size 1.2954 1.2954)
			)
			(justify left bottom)
		)
		(uuid "8f0807e0-e728-4e23-92c4-3bd4dd2cacc0")
	)
	(text "0"
		(exclude_from_sim no)
		(at 213.995 355.6 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "9373cb29-eb1f-4a27-9672-d678e5d2d71c")
	)
	(text "1"
		(exclude_from_sim no)
		(at 207.645 353.06 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "94fbcb5f-c7a9-4b01-83a2-26612fd38613")
	)
	(text "Class=0 (0.44 to 12.95W)"
		(exclude_from_sim no)
		(at 278.13 233.68 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "95bfd24c-06fd-473e-badb-463d5160baf0")
	)
	(text "GPIO12/MTDI"
		(exclude_from_sim no)
		(at 332.994 365.252 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "967e055c-1788-4c17-b847-d6a6bd373079")
	)
	(text "HSPI_CS0_in/_out"
		(exclude_from_sim no)
		(at 274.955 368.3 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "9788cce5-cb4f-4273-89d0-ca6b58fdc14c")
	)
	(text "Pull-Down"
		(exclude_from_sim no)
		(at 344.932 375.666 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "a010b29c-96bc-4de3-b11a-c58976a7ad59")
	)
	(text "Pull-Up"
		(exclude_from_sim no)
		(at 384.937 331.851 0)
		(effects
			(font
				(size 1.4986 1.4986)
			)
			(justify left bottom)
		)
		(uuid "a433998b-c195-488b-b4ba-86c2630ab745")
	)
	(text "I2CEXT0_SCL_in"
		(exclude_from_sim no)
		(at 274.955 335.915 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "a47bbb6e-8196-49af-819d-a8e6230ced02")
	)
	(text "HSPID"
		(exclude_from_sim no)
		(at 516.89 276.225 0)
		(effects
			(font
				(size 0.635 0.635)
			)
			(justify left bottom)
		)
		(uuid "a4c31e9a-9cff-4375-8218-0ab25b7ff368")
	)
	(text "1"
		(exclude_from_sim no)
		(at 397.002 393.7 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "a84c54db-bacb-4bc9-a4ed-509ec9ae561d")
	)
	(text "Falling-edge:Output"
		(exclude_from_sim no)
		(at 391.668 390.398 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "a8adba61-d61e-4f16-a176-8b4f37b6e2ea")
	)
	(text "5V/2A"
		(exclude_from_sim no)
		(at 401.32 213.36 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "ac20ca22-8262-465c-916c-c7e498dbdbe8")
	)
	(text "Notes:"
		(exclude_from_sim no)
		(at 365.76 309.88 0)
		(effects
			(font
				(size 5.08 5.08)
				(thickness 1.016)
				(bold yes)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "b0998bc7-2086-4f9b-a619-2777fdddf636")
	)
	(text "ESP32-WROOM-32E MODULE"
		(exclude_from_sim no)
		(at 289.56 30.48 0)
		(effects
			(font
				(size 5.08 5.08)
				(thickness 1.016)
				(bold yes)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "b16b13c8-fa20-474e-a89c-66ed86658546")
	)
	(text "HSPICLK_in/_out"
		(exclude_from_sim no)
		(at 274.955 365.76 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "b1e827a5-4ca5-478e-8be8-c4d5bc61f2fc")
	)
	(text "HSPI_CS1_out"
		(exclude_from_sim no)
		(at 274.955 370.84 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "b20ce8a6-2a2d-4ca7-b3f3-4e7777c4a9ce")
	)
	(text "Pull-Down"
		(exclude_from_sim no)
		(at 344.932 365.125 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "b2719188-e7aa-47d7-81ae-d3d1b0bb5644")
	)
	(text "0"
		(exclude_from_sim no)
		(at 358.902 365.125 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "b43b75a6-6ec9-47f3-a8fb-a74d3d0db872")
	)
	(text "Interface"
		(exclude_from_sim no)
		(at 263.525 318.77 0)
		(effects
			(font
				(size 1.4986 1.4986)
			)
			(justify left bottom)
		)
		(uuid "b49026f1-0c6e-45ba-999e-e880f0bf5c82")
	)
	(text "CHARGING"
		(exclude_from_sim no)
		(at 104.14 66.04 0)
		(effects
			(font
				(size 1.524 1.524)
				(thickness 0.3048)
				(bold yes)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "b4f3bd51-7e75-430f-aed3-1c7f42150dd1")
	)
	(text "Ra"
		(exclude_from_sim no)
		(at 404.876 222.25 90)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify right bottom)
		)
		(uuid "b545841f-2c24-446b-acb8-cb73e81f963b")
	)
	(text "Default"
		(exclude_from_sim no)
		(at 344.932 388.62 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "b8024c37-d892-4717-9627-cab6ca2a31cb")
	)
	(text "I2CEXT0_SCL_out"
		(exclude_from_sim no)
		(at 274.955 346.075 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "b8245b9f-4f52-44af-a9f8-259187070e1c")
	)
	(text "1"
		(exclude_from_sim no)
		(at 361.442 383.54 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "b8702c08-dec4-4d76-9c32-efb28c3d04de")
	)
	(text "Pull-Up"
		(exclude_from_sim no)
		(at 344.932 393.7 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "ba427407-86fc-4de8-b3b8-470b2c74d2bf")
	)
	(text "VSPIQ_in/_out"
		(exclude_from_sim no)
		(at 274.955 375.92 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "bc31412f-6290-425b-b8c9-1c70a91e35b1")
	)
	(text "Vout=0.8*(1+Ra/Rb)"
		(exclude_from_sim no)
		(at 375.92 236.22 0)
		(effects
			(font
				(size 1.778 1.778)
				(thickness 0.3556)
				(bold yes)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "bcf790a6-62f4-4175-ac7d-b7b0d5105eb0")
	)
	(text "Default"
		(exclude_from_sim no)
		(at 344.932 370.586 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "bd4e789f-1e57-4100-9629-510289a51319")
	)
	(text "Rising-edge:Input"
		(exclude_from_sim no)
		(at 409.702 388.62 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "be8b3fa2-c200-4fae-b3be-b4f5171aa7fb")
	)
	(text "EMAC"
		(exclude_from_sim no)
		(at 264.16 327.66 0)
		(effects
			(font
				(size 1.4986 1.4986)
			)
			(justify left bottom)
		)
		(uuid "bf262121-1ddc-48b7-8093-916324823132")
	)
	(text "Rb"
		(exclude_from_sim no)
		(at 383.794 232.156 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify right bottom)
		)
		(uuid "bfb5fbc4-b0ba-43d2-ae11-ad063244e00d")
	)
	(text "GPIO0"
		(exclude_from_sim no)
		(at 332.994 373.38 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "c0f7e5dc-8911-44f9-babb-6dfb20570f8e")
	)
	(text "Pin"
		(exclude_from_sim no)
		(at 332.994 370.586 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "c1bd8992-6887-43d7-992f-dfcf3ef46fdb")
	)
	(text "The PHY is setted up as follows:\nMODE: All capable(10/100Base)\n-Auto-negotiation enabled\n-RMII Configuration\n-SMI address: 0x00"
		(exclude_from_sim no)
		(at 162.56 264.16 0)
		(effects
			(font
				(size 2.54 2.54)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "c21cd334-fbac-489c-a90b-d127535fd836")
	)
	(text "EMAC_COL_out"
		(exclude_from_sim no)
		(at 274.955 332.105 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "c551d7e9-fa18-476e-bd65-a3a3e2a4f307")
	)
	(text "Default"
		(exclude_from_sim no)
		(at 344.932 362.585 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "c757b8c3-8626-4118-8b67-ee78666c6834")
	)
	(text "Software Selectable Pins"
		(exclude_from_sim no)
		(at 262.89 313.69 0)
		(effects
			(font
				(size 2.0066 2.0066)
				(thickness 0.4013)
				(bold yes)
			)
			(justify left bottom)
		)
		(uuid "c7d421da-a473-4a25-8c83-6d7a260bc2ce")
	)
	(text "Timing of SDIO Slave"
		(exclude_from_sim no)
		(at 363.982 385.572 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(thickness 0.1981)
				(bold yes)
			)
			(justify left bottom)
		)
		(uuid "c9346943-3015-4fcc-87bf-5635b7775a40")
	)
	(text "0"
		(exclude_from_sim no)
		(at 213.995 358.14 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "cdf713fc-6ac8-4731-8845-de28c5536830")
	)
	(text "Mounting Holes"
		(exclude_from_sim no)
		(at 485.14 350.52 0)
		(effects
			(font
				(size 5.08 5.08)
				(thickness 1.016)
				(bold yes)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "d0094a36-1d22-448c-8db3-546124d84f32")
	)
	(text "1"
		(exclude_from_sim no)
		(at 220.345 353.06 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "d4936932-737a-4c7f-af59-72bfd53c0283")
	)
	(text "GPIO15/MTDO"
		(exclude_from_sim no)
		(at 332.994 393.7 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "d5d38d11-b401-4188-87d9-3cacc3ee7517")
	)
	(text "MTDO/GPIO15:"
		(exclude_from_sim no)
		(at 358.267 343.281 0)
		(effects
			(font
				(size 1.4986 1.4986)
			)
			(justify left bottom)
		)
		(uuid "d7422f5f-de22-41b8-9430-54604713f73c")
	)
	(text "Internal Bootstrapping Resistors"
		(exclude_from_sim no)
		(at 353.822 323.088 0)
		(effects
			(font
				(size 2.0066 2.0066)
				(thickness 0.4013)
				(bold yes)
			)
			(justify left bottom)
		)
		(uuid "d7f1aca4-c930-42a5-9164-32dde190a409")
	)
	(text "Signal"
		(exclude_from_sim no)
		(at 276.225 318.77 0)
		(effects
			(font
				(size 1.4986 1.4986)
			)
			(justify left bottom)
		)
		(uuid "d80b29ba-bf36-4feb-8a7e-5eae4ac451ca")
	)
	(text "MTDI/GPIO12:"
		(exclude_from_sim no)
		(at 359.537 328.041 0)
		(effects
			(font
				(size 1.4986 1.4986)
			)
			(justify left bottom)
		)
		(uuid "d85db090-8b94-43e9-9767-c52afacfbe54")
	)
	(text "1"
		(exclude_from_sim no)
		(at 213.995 353.06 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "d9029766-1cf9-45a8-a19d-7e35e7affbcb")
	)
	(text "0"
		(exclude_from_sim no)
		(at 397.002 395.986 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "da00f186-e750-461a-ae83-59e9debd3a31")
	)
	(text "Default"
		(exclude_from_sim no)
		(at 344.932 381 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "da91b624-c672-4bcd-8d54-b7a2794a7075")
	)
	(text "U8, C29 and R42 have to be Populated -> when WROVER is used, \nU8, C29 and R42 have to be NA -> when WROOM is used."
		(exclude_from_sim no)
		(at 142.24 130.81 0)
		(effects
			(font
				(size 1.524 1.524)
				(thickness 0.3048)
				(bold yes)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "db701e18-beed-465d-8d96-f9c0cc84fbba")
	)
	(text "DTR  RTS->EN  IO0"
		(exclude_from_sim no)
		(at 205.74 350.52 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "dcb9d75d-38da-4d02-8d8c-f4b35d65c445")
	)
	(text "GPIO2:"
		(exclude_from_sim no)
		(at 367.157 335.661 0)
		(effects
			(font
				(size 1.4986 1.4986)
			)
			(justify left bottom)
		)
		(uuid "e08a869c-b065-42ee-a6b6-e1e4aedc943c")
	)
	(text "1"
		(exclude_from_sim no)
		(at 220.345 355.6 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "e147f667-2644-4432-a413-17502759ae29")
	)
	(text "3.3V"
		(exclude_from_sim no)
		(at 358.902 362.585 0)
		(effects
			(font
				(size 0.9906 0.9906)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "e439b9bd-1a4b-4b70-a401-03247ea4f3d0")
	)
	(text "Any GPIO"
		(exclude_from_sim no)
		(at 293.37 345.44 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "e5cce482-5b72-4018-a4c4-6191f5e96927")
	)
	(text "1"
		(exclude_from_sim no)
		(at 207.645 358.14 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "e65c08ca-77f9-4674-961f-dbdc7fa5df20")
	)
	(text "Extensions"
		(exclude_from_sim no)
		(at 497.84 157.48 0)
		(effects
			(font
				(size 5.08 5.08)
				(thickness 1.016)
				(bold yes)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "e6abacc1-08ff-4682-857f-78c0a1483fa0")
	)
	(text "GPIO15/MTDO"
		(exclude_from_sim no)
		(at 332.994 383.286 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "e6b3e4e3-7f2d-4628-94e2-5579fc7888d1")
	)
	(text "0"
		(exclude_from_sim no)
		(at 379.222 373.38 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "e6d677b5-eeb2-4d21-a581-697cf0a1c03c")
	)
	(text "Pull-Down"
		(exclude_from_sim no)
		(at 384.937 335.661 0)
		(effects
			(font
				(size 1.4986 1.4986)
			)
			(justify left bottom)
		)
		(uuid "e6ef2a77-214f-4e65-b5a5-a8ee0ef948a7")
	)
	(text "I2CEXT0_SDA_out"
		(exclude_from_sim no)
		(at 274.955 348.615 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "eaf1ccec-62c6-4971-9743-3559a1479506")
	)
	(text "GPIO4:"
		(exclude_from_sim no)
		(at 367.157 339.471 0)
		(effects
			(font
				(size 1.4986 1.4986)
			)
			(justify left bottom)
		)
		(uuid "eb708646-8fcc-47cc-86b3-8768fd1cdc8f")
	)
	(text "Pull-Up"
		(exclude_from_sim no)
		(at 344.932 373.38 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "ed8136a2-ec20-4a7d-8a37-e913ef22d05c")
	)
	(text "Rprog"
		(exclude_from_sim no)
		(at 133.985 97.155 0)
		(effects
			(font
				(size 0.889 0.889)
				(thickness 0.1778)
				(bold yes)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "edbe6f68-3dfd-4c4f-b85d-be783c137921")
	)
	(text "PoE Power Supply"
		(exclude_from_sim no)
		(at 314.96 157.48 0)
		(effects
			(font
				(size 5.08 5.08)
				(thickness 1.016)
				(bold yes)
				(italic yes)
			)
			(justify left bottom)
		)
		(uuid "ef0b1bef-1d02-4d9f-af7c-cba66db23d2c")
	)
	(text "HSPIQ_in/_out"
		(exclude_from_sim no)
		(at 274.955 360.68 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "f0412e38-0765-4904-b9c8-577a38e8cb7d")
	)
	(text "GPIO0:"
		(exclude_from_sim no)
		(at 367.157 331.851 0)
		(effects
			(font
				(size 1.4986 1.4986)
			)
			(justify left bottom)
		)
		(uuid "f547fd08-7597-4427-a880-b60933cd7fbf")
	)
	(text "GPIO5:"
		(exclude_from_sim no)
		(at 367.157 347.091 0)
		(effects
			(font
				(size 1.4986 1.4986)
			)
			(justify left bottom)
		)
		(uuid "f64d2c06-97ae-4662-834e-190116dca4cd")
	)
	(text "0"
		(exclude_from_sim no)
		(at 361.442 393.7 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "f799e925-0f8d-4a53-b5dc-6d663c38f3e8")
	)
	(text "VSPI_CS2_out"
		(exclude_from_sim no)
		(at 274.955 388.62 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "fac370c7-7388-4972-a171-088951756ae3")
	)
	(text "EMAC_MDI_in"
		(exclude_from_sim no)
		(at 274.955 324.485 0)
		(effects
			(font
				(size 1.0922 1.0922)
			)
			(justify left bottom)
		)
		(uuid "ffedc9e3-02ac-4cc0-bc64-f1c9659ed462")
	)
	(junction
		(at 441.96 208.28)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "04888b2e-2adc-4d8a-9a54-ca4fc100e5d0")
	)
	(junction
		(at 541.02 274.32)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "051218c1-1e23-497a-b5b8-ba362785339f")
	)
	(junction
		(at 27.94 337.82)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "0867f0fc-8752-4ff9-b34a-2bdeaf957603")
	)
	(junction
		(at 187.96 190.5)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "0a7f418b-f25e-4916-8f48-24104230a927")
	)
	(junction
		(at 276.86 208.28)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "0bad91d8-7e84-4c58-86c1-75fa079444c2")
	)
	(junction
		(at 485.14 93.98)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "0c94e82a-700a-416a-a1fa-b6a139fb6659")
	)
	(junction
		(at 223.52 185.42)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "0cb8cad4-989c-46f7-a70a-958785bc1180")
	)
	(junction
		(at 116.84 218.44)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "0def60e7-8453-4b53-bf9c-78a71dc4a16c")
	)
	(junction
		(at 533.4 99.06)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "104fcaa3-3a05-44e1-b834-3c5d54df88e6")
	)
	(junction
		(at 398.78 228.6)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "1105cc04-e8f0-47c5-ac8a-a60f1928336c")
	)
	(junction
		(at 543.56 279.4)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "149ae564-5a65-46f9-9311-a3fb4424b9dd")
	)
	(junction
		(at 134.62 228.6)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "17768555-5f6c-4e7b-a712-208de79b6f3b")
	)
	(junction
		(at 119.38 213.36)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "1a647de7-f21f-4c6a-b2cb-96e890784543")
	)
	(junction
		(at 416.56 218.44)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "1a742254-42a1-4c1b-84f7-c6c90c431570")
	)
	(junction
		(at 185.42 226.06)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "1bcf6b02-7014-484e-aa6d-0dbb2717a909")
	)
	(junction
		(at 121.92 177.8)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "1c2e915e-bff4-49ee-a3ee-9d17dc4292d5")
	)
	(junction
		(at 76.2 236.22)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "1eb70b93-65f6-48c8-8221-1362507d2308")
	)
	(junction
		(at 485.14 101.6)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "1ef15c01-c845-4bd0-bc89-79c6737ad3f0")
	)
	(junction
		(at 327.66 208.28)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "214a3050-d58b-4d56-97dd-709627a604d1")
	)
	(junction
		(at 223.52 203.2)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "26d35bcb-f603-43e4-99bd-3d7015ada4f2")
	)
	(junction
		(at 276.86 231.14)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "2764b1b3-57af-4774-bc33-649917e21810")
	)
	(junction
		(at 129.54 200.66)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "27db7cd2-fb92-4d8c-a13b-ac92a9319f44")
	)
	(junction
		(at 269.24 208.28)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "2855bbc5-376a-492b-8458-80f09493588c")
	)
	(junction
		(at 177.8 81.28)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "2a38a068-c605-4e9f-b277-9a3c426d187c")
	)
	(junction
		(at 116.84 177.8)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "2aaeefd7-a504-4d41-9f8c-49521a433d35")
	)
	(junction
		(at 104.14 228.6)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "308e8c2e-f5cb-4417-8e7d-1764ff01cead")
	)
	(junction
		(at 281.94 223.52)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "34af548b-e95e-4aea-b1a6-211cdb93620a")
	)
	(junction
		(at 109.22 226.06)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "35649a61-a44e-4e3e-95b5-a33a98339909")
	)
	(junction
		(at 124.46 177.8)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "35f31e7c-25c5-4f76-97ed-14a795a8884d")
	)
	(junction
		(at 139.7 337.82)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "374a5c35-3da9-4206-8532-295ff1763872")
	)
	(junction
		(at 205.74 142.24)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "38e5270e-b01e-47e9-9e65-6895677cbf2d")
	)
	(junction
		(at 438.15 215.9)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "38e53cf2-3834-4aef-8e38-ddd2e851477c")
	)
	(junction
		(at 73.66 360.68)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "3c4c8a5a-f980-48ef-a1a1-31562a3e0cc3")
	)
	(junction
		(at 38.1 48.26)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "3f6cfa9c-9c89-4432-be3f-6715eb459dc2")
	)
	(junction
		(at 269.24 231.14)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "41acac59-ea4b-42c5-b355-d49c771e1fea")
	)
	(junction
		(at 340.36 218.44)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "424665ee-1322-4c3d-ab4b-1d2faee24ff2")
	)
	(junction
		(at 144.78 200.66)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "42f057f9-44c3-496d-890d-efce172e0524")
	)
	(junction
		(at 30.48 363.22)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "4a83b8ac-f83b-4afd-953c-921682f3274f")
	)
	(junction
		(at 398.78 218.44)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "4b04469a-9123-4ceb-811e-7967ef7b5229")
	)
	(junction
		(at 96.52 86.36)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "4cc64bae-3ace-4ec9-b41c-620627003341")
	)
	(junction
		(at 185.42 175.26)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "4e68f4a9-5747-417c-92b9-2e5734f2913b")
	)
	(junction
		(at 119.38 177.8)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "4fb24267-cdb9-440b-8979-8cf2ba5480a0")
	)
	(junction
		(at 284.48 76.2)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "513242fc-0867-4dc5-aafc-9d0f3a55bc0a")
	)
	(junction
		(at 546.1 271.78)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "51556a98-0e60-409a-8162-70f40c1336aa")
	)
	(junction
		(at 134.62 200.66)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "5228cb86-4e84-45a8-97c9-832f7e3abbfa")
	)
	(junction
		(at 81.28 213.36)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "54bfe758-293f-43bf-9054-3639df828779")
	)
	(junction
		(at 129.54 177.8)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "5712f02e-f988-4e64-92c0-a5b0be694c90")
	)
	(junction
		(at 88.9 48.26)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "59f5cea9-94bd-4ab1-a65b-0aba79268b66")
	)
	(junction
		(at 142.24 182.88)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "5ceb4824-7b35-4f17-acd1-2bc802332ad0")
	)
	(junction
		(at 177.8 73.66)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "61ebeed7-16c0-45f2-949b-19d5bbd2e3f0")
	)
	(junction
		(at 139.7 200.66)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "64d6dda2-0965-4728-8405-bb8c1d9ae1a0")
	)
	(junction
		(at 203.2 86.36)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "672f56ad-d8e5-4592-8810-e4e55db9636e")
	)
	(junction
		(at 533.4 111.76)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "67d8c635-856b-4d23-9ca5-f1c81ad43743")
	)
	(junction
		(at 88.9 38.1)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "693d99ee-5853-48c7-93d9-1102674ea038")
	)
	(junction
		(at 101.6 360.68)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "69d1e524-b38f-48e0-98f6-7411c7df8d61")
	)
	(junction
		(at 490.22 246.38)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "6a93ffd4-1b9b-4536-9cd8-6a2ee8ee1994")
	)
	(junction
		(at 109.22 177.8)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "6b45b30a-ef96-483d-8563-c7eb1e40ce80")
	)
	(junction
		(at 114.3 223.52)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "6ebd746d-afc3-4b12-b23e-ed6832f2b1aa")
	)
	(junction
		(at 190.5 40.64)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "708c4f1e-7dc9-4fd8-95ef-b588ba911fdc")
	)
	(junction
		(at 73.66 358.14)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "71faf3b6-b2aa-4d5f-b685-79732738f38c")
	)
	(junction
		(at 109.22 215.9)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "746167df-33c9-4f47-bcdd-ddac5e0c7eec")
	)
	(junction
		(at 185.42 193.04)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "76fa7e9a-122b-4c1c-bc60-e66174a8ba24")
	)
	(junction
		(at 142.24 170.18)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "774b82ea-98c7-4494-bccd-f4c0027cf703")
	)
	(junction
		(at 104.14 337.82)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "8043a3ed-143a-413f-94a9-ef13a1ba79e1")
	)
	(junction
		(at 208.28 236.22)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "83ae485d-28b2-4d00-9ad2-6122223a6cd3")
	)
	(junction
		(at 114.3 177.8)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "8629a0a2-804c-4508-80fb-045e81006e7d")
	)
	(junction
		(at 464.82 160.02)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "8abb54d2-f872-4f60-9fe8-f0173653458b")
	)
	(junction
		(at 167.64 335.28)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "8ba38957-4526-4563-8050-5351bc0a9ede")
	)
	(junction
		(at 88.9 170.18)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "8da05726-39b6-4d76-8ec1-eaca280a2d4d")
	)
	(junction
		(at 157.48 73.66)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "8f7bc7ff-35fa-47ec-864c-163f7be3e319")
	)
	(junction
		(at 383.54 218.44)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "927fbe55-d25e-410f-acb0-af1c95ce68e2")
	)
	(junction
		(at 88.9 177.8)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "950b3e1b-5423-41c5-94b1-14550b18016c")
	)
	(junction
		(at 101.6 335.28)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "9806420b-fca4-4b32-999a-332db89cc77f")
	)
	(junction
		(at 96.52 96.52)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "98176f34-a880-4c1d-888d-3b2016c0674e")
	)
	(junction
		(at 27.94 363.22)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "987148cd-3e36-484e-a9c8-15df7936f140")
	)
	(junction
		(at 73.66 170.18)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "987ba6f7-24e3-4ae9-a0e2-51fa9c60467d")
	)
	(junction
		(at 76.2 223.52)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "9c283fe6-e7d4-4a79-a5bc-ce595781352c")
	)
	(junction
		(at 170.18 38.1)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "a6fae04b-a75b-4fe0-8ba8-97f936db5b0b")
	)
	(junction
		(at 441.96 241.3)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "a7d016a6-da66-43fa-9881-8dc8ea3e33e8")
	)
	(junction
		(at 281.94 231.14)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "aa70d9ef-9826-4d5d-b53a-32a39109171f")
	)
	(junction
		(at 167.64 325.12)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "aa8181a9-09ca-45ab-9c0c-5d427fa1c2a0")
	)
	(junction
		(at 111.76 228.6)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "aa8d27f8-07ff-4056-8c8b-50e8e8d55ae8")
	)
	(junction
		(at 403.86 228.6)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "ab946390-854e-40d0-992b-a1386e74feaf")
	)
	(junction
		(at 284.48 68.58)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "ac877daa-816e-46cc-9bc4-d21d61f75208")
	)
	(junction
		(at 220.98 81.28)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "ad50322a-fbe5-42b3-adaf-f32af8dd7b9b")
	)
	(junction
		(at 182.88 81.28)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "ad8e33de-2b11-4ea7-b6cb-29716319ee1d")
	)
	(junction
		(at 185.42 231.14)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "ae9d6077-4386-43ae-9663-68326d084c03")
	)
	(junction
		(at 223.52 198.12)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "afe599c6-035f-4ca6-b683-b71400059879")
	)
	(junction
		(at 495.3 104.14)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "b15e737e-0c5c-4966-8856-f02b643ed704")
	)
	(junction
		(at 490.22 274.32)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "b48f580f-fd41-40ff-add6-0ce39637742a")
	)
	(junction
		(at 144.78 233.68)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "b94ba009-b48c-489e-8c16-238593c9e48a")
	)
	(junction
		(at 142.24 236.22)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "ba7f6917-2c2d-4529-b939-d1a2581cdf8b")
	)
	(junction
		(at 287.02 53.34)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "baa30f91-c3b8-4646-a790-69c5e815e516")
	)
	(junction
		(at 101.6 328.93)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "bcc5d95f-5914-4520-be1e-a03fd0374c49")
	)
	(junction
		(at 485.14 111.76)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "bf0375ae-1c79-411b-80a2-a02c61d86158")
	)
	(junction
		(at 485.14 96.52)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "bf3ade12-831f-4f45-b72e-b06c22d5c944")
	)
	(junction
		(at 411.48 218.44)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "bf7ddada-d3db-4c33-83e1-9ae2b27737c4")
	)
	(junction
		(at 76.2 238.76)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "c4fe53e0-78f1-4ad1-9b3f-69cb8fca15dd")
	)
	(junction
		(at 142.24 177.8)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "c5b74885-bc34-4b96-90fa-65b55654fb37")
	)
	(junction
		(at 144.78 187.96)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "c5edffd8-c736-4cbb-97ae-b69321b27395")
	)
	(junction
		(at 416.56 208.28)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "c62f1629-41c5-4611-ac1d-d9464af3ec47")
	)
	(junction
		(at 43.18 167.64)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "c73b85d5-e840-4d3f-96e8-b22cf97c636f")
	)
	(junction
		(at 287.02 50.8)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "caec483f-ba55-4a5b-b404-3a8bbe10b145")
	)
	(junction
		(at 185.42 213.36)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "cbfd2274-83a8-4ab1-a9ea-f6d8ead5bb40")
	)
	(junction
		(at 281.94 251.46)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "cca0f7ad-0ada-4844-afdd-c3323e733117")
	)
	(junction
		(at 35.56 149.86)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "cd78f93e-c462-4e23-bc6f-d8f962a9f6d8")
	)
	(junction
		(at 170.18 142.24)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "cd873368-bc77-4ab1-b3be-9d1069e4b618")
	)
	(junction
		(at 25.4 48.26)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "d2d10ab8-1741-4a46-8e01-b818e0042d9c")
	)
	(junction
		(at 441.96 215.9)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "d3a1eef4-d6f5-4e46-bd3a-0f1aaa6da4f4")
	)
	(junction
		(at 281.94 208.28)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "d659f500-2bf3-4fe0-ac8a-e59151e48de8")
	)
	(junction
		(at 528.32 43.18)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "d7e07b3e-fae3-4d0e-8c93-c4041610deb8")
	)
	(junction
		(at 76.2 48.26)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "d92a1c8d-bc2c-4735-bfb2-4edd604b8291")
	)
	(junction
		(at 35.56 167.64)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "d93fc20e-235c-42f9-95be-8595db17019a")
	)
	(junction
		(at 340.36 215.9)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "daa91480-1351-4ad6-a6dc-2ff1a45e3963")
	)
	(junction
		(at 403.86 218.44)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "db9ae948-b1fe-4c69-8e80-41dc25a4bce6")
	)
	(junction
		(at 101.6 355.6)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "dec1c113-0fae-4298-bf19-5f502e661970")
	)
	(junction
		(at 132.08 231.14)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "e18b8d63-a401-438d-b773-850ca2a28e48")
	)
	(junction
		(at 226.06 81.28)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "e283d0fd-fdec-4b6d-92f6-90f9654da583")
	)
	(junction
		(at 541.02 246.38)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "e29c1267-b1b1-4054-bdf4-64f60a105af5")
	)
	(junction
		(at 441.96 226.06)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "e3fa1e12-ba21-4e3e-9797-6cd45af38d9e")
	)
	(junction
		(at 149.86 347.98)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "ea50cf9c-64d8-4735-88fe-fd74d5f6153f")
	)
	(junction
		(at 304.8 208.28)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "ea555539-9eda-4497-b18a-df1530f50037")
	)
	(junction
		(at 325.12 208.28)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "ea90c2dd-2788-485d-a73c-07ba6c659939")
	)
	(junction
		(at 485.14 114.3)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "eb7ab00e-14eb-47e9-9938-f0d919fe6c06")
	)
	(junction
		(at 25.4 60.96)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "eb8d4052-e490-407a-a702-afa4188fbc8c")
	)
	(junction
		(at 96.52 73.66)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "ee1956b1-a886-49e2-8be6-797c26adfbaf")
	)
	(junction
		(at 109.22 180.34)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "f0f46556-2936-45b9-acf4-bdbf4920914e")
	)
	(junction
		(at 101.6 320.04)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "f0f8bad9-c5dc-4e25-a032-8387b65d267f")
	)
	(junction
		(at 543.56 246.38)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "f4266373-b723-40a8-b80b-91754eaf211f")
	)
	(junction
		(at 144.78 355.6)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "f46871ec-24b5-44e1-ba01-19cdacdd81c5")
	)
	(junction
		(at 530.86 104.14)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "f5542617-cdb3-4347-8f23-a4a1b7e7fab5")
	)
	(junction
		(at 435.61 226.06)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "f57b214a-1283-4e39-a224-939cc0b8c37c")
	)
	(junction
		(at 101.6 218.44)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "f7802212-87d3-47f1-a995-1e86246ba215")
	)
	(junction
		(at 220.98 40.64)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "f7f80938-1be2-41a6-8cc3-6291f6288488")
	)
	(junction
		(at 96.52 38.1)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "fbc1c38d-c3e1-4946-91af-262789f8220c")
	)
	(junction
		(at 546.1 104.14)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "fdd78ba9-acde-4c59-b320-131e132b00dd")
	)
	(junction
		(at 76.2 233.68)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "fe26153c-ae07-4499-8382-949161a2402f")
	)
	(junction
		(at 60.96 363.22)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "fe732834-3edb-4d1d-90b5-5f01e6c43fb8")
	)
	(junction
		(at 111.76 177.8)
		(diameter 0)
		(color 0 0 0 0)
		(uuid "fe97747d-fe27-487b-822b-d115f28fc66c")
	)
	(no_connect
		(at 386.08 68.58)
		(uuid "0dc27f34-f6d9-4a0e-b363-985d038c596b")
	)
	(no_connect
		(at 386.08 63.5)
		(uuid "209c7840-f56c-48cc-89af-e46b4ac37c1b")
	)
	(no_connect
		(at 386.08 66.04)
		(uuid "3492685d-8b99-4f3e-803e-f059e4de699c")
	)
	(no_connect
		(at 386.08 73.66)
		(uuid "3c65eaaa-6a48-4f13-b05e-96a2297810f7")
	)
	(no_connect
		(at 132.08 358.14)
		(uuid "3c9c65bd-282e-4420-bd75-3a58787c35d2")
	)
	(no_connect
		(at 38.1 353.06)
		(uuid "3d9148f4-5c93-4997-bbb8-0054ec774e94")
	)
	(no_connect
		(at 386.08 76.2)
		(uuid "52a34aa8-fb8f-434e-9ff9-e7b098c2f834")
	)
	(no_connect
		(at 180.34 185.42)
		(uuid "5e6fafda-7b25-4d7c-85be-a8b7ce41dda2")
	)
	(no_connect
		(at 132.08 353.06)
		(uuid "6a3f7276-5653-4324-a71f-1b252a0b8daa")
	)
	(no_connect
		(at 132.08 345.44)
		(uuid "7197c599-0049-4226-9960-860fe42a9027")
	)
	(no_connect
		(at 180.34 182.88)
		(uuid "7525723f-6022-47ba-8a29-c9720c6cfa9c")
	)
	(no_connect
		(at 149.86 208.28)
		(uuid "819295a8-a6da-4850-9e41-d23166adf1d6")
	)
	(no_connect
		(at 132.08 360.68)
		(uuid "9f4eea09-65ae-4fe2-bda5-aaee65554fd3")
	)
	(no_connect
		(at 180.34 220.98)
		(uuid "aba47c0d-c53c-4000-9e88-c1868ec184c6")
	)
	(no_connect
		(at 180.34 200.66)
		(uuid "b3ba771b-f17e-42da-9685-b7b3dcbf1137")
	)
	(no_connect
		(at 132.08 350.52)
		(uuid "bbd17687-e448-48a7-9042-ae1fb8738644")
	)
	(no_connect
		(at 132.08 355.6)
		(uuid "ed1f7a11-bcf2-4415-9d77-8b4e98c60c6f")
	)
	(no_connect
		(at 556.26 121.92)
		(uuid "f791de4a-6cc5-47d7-bdb8-e00d2dbdb4eb")
	)
	(no_connect
		(at 386.08 71.12)
		(uuid "fe4d29c1-fa7c-43d8-ba07-11cc806004e8")
	)
	(no_connect
		(at 342.9 223.52)
		(uuid "ff5a6ccf-dd46-414d-bf45-4d9240be4ec9")
	)
	(bus_entry
		(at 464.82 116.84)
		(size 2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "09fd5b95-9176-4348-9e11-26c7a6479a1c")
	)
	(bus_entry
		(at 571.5 195.58)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1da33729-4c00-449a-b38a-bc00851e8471")
	)
	(bus_entry
		(at 464.82 198.12)
		(size 2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1f1267b8-38c9-4e13-b93e-806e12eeee77")
	)
	(bus_entry
		(at 571.5 180.34)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "24e9e07f-6fd6-475f-8d46-e4686dafad29")
	)
	(bus_entry
		(at 464.82 195.58)
		(size 2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "28b0d14f-9714-4133-9bd5-de92f7358dd6")
	)
	(bus_entry
		(at 439.42 78.74)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3c9efdc1-385b-4bfe-a737-ffeb1788570b")
	)
	(bus_entry
		(at 439.42 45.72)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "40ba2ac4-b8ef-4edb-aada-e92222db1a86")
	)
	(bus_entry
		(at 464.82 106.68)
		(size 2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "446901f6-d226-4497-9734-dfbbdf9734a8")
	)
	(bus_entry
		(at 571.5 190.5)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4933b01e-3e15-4aaa-bbc5-602a7cb484b4")
	)
	(bus_entry
		(at 464.82 96.52)
		(size 2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4ea9ee6f-1515-47fb-89c5-f19f8940c517")
	)
	(bus_entry
		(at 571.5 274.32)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5237fd03-4d74-45bf-80b9-03b3f3a6966a")
	)
	(bus_entry
		(at 439.42 124.46)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5d5f45f6-8e67-4a00-a1af-8768d0fd5f9f")
	)
	(bus_entry
		(at 464.82 185.42)
		(size 2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5e0f2349-fc12-4291-92b1-fddc511e85bc")
	)
	(bus_entry
		(at 571.5 187.96)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "60f84cac-3aa7-4ba9-b868-67cd12709662")
	)
	(bus_entry
		(at 439.42 86.36)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "646ae017-9254-4679-bfec-cbb18bf7370f")
	)
	(bus_entry
		(at 439.42 81.28)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "65a52978-5311-4633-a12f-b7b3cb7e2ff1")
	)
	(bus_entry
		(at 571.5 276.86)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "67c64061-88ba-44c0-bff2-788b5cecf38a")
	)
	(bus_entry
		(at 464.82 274.32)
		(size 2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "693ac9b9-c8bd-472d-b90f-cd15d2f5b6e0")
	)
	(bus_entry
		(at 571.5 271.78)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7880dff7-e20a-44a2-8d2e-21540888d618")
	)
	(bus_entry
		(at 464.82 276.86)
		(size 2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "79feed39-1f19-4ca3-b043-43b1f72cd77b")
	)
	(bus_entry
		(at 464.82 187.96)
		(size 2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7a89a625-3dd7-4012-9763-7358eb4b74d1")
	)
	(bus_entry
		(at 464.82 269.24)
		(size 2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "81d98ea9-bb3f-4987-9e88-329a967040ba")
	)
	(bus_entry
		(at 464.82 193.04)
		(size 2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8d2d0ded-d312-4805-813b-851ed6dc33b7")
	)
	(bus_entry
		(at 464.82 271.78)
		(size 2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "90cea57d-fb0c-4c3e-b043-06d24003ab63")
	)
	(bus_entry
		(at 571.5 185.42)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a69470df-aa49-4ef4-95e7-d1bd0c25857f")
	)
	(bus_entry
		(at 439.42 48.26)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ac941949-7bab-4ed9-9f5b-49e734544a0a")
	)
	(bus_entry
		(at 439.42 50.8)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ad8fb700-6ced-4007-b71e-d1ae3589a893")
	)
	(bus_entry
		(at 571.5 269.24)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "b434fe3f-25de-4a2d-b299-dc1df05877b7")
	)
	(bus_entry
		(at 439.42 83.82)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c1ab51ed-c01a-45c1-8979-9e5933ef7394")
	)
	(bus_entry
		(at 439.42 114.3)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ce174461-fc14-4cfd-b284-2401525ec78f")
	)
	(bus_entry
		(at 439.42 119.38)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ce940d24-c02c-42f8-bdcc-ee9571535938")
	)
	(bus_entry
		(at 571.5 198.12)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d4c01ba0-d139-4eda-8a1b-6858076269f3")
	)
	(bus_entry
		(at 571.5 177.8)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d55061db-a313-4cbe-997f-b96e5b265cfd")
	)
	(bus_entry
		(at 571.5 182.88)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d5a785d3-a5ad-4de6-bcf9-55c9210a73e1")
	)
	(bus_entry
		(at 464.82 190.5)
		(size 2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d7bf6544-f440-423c-9497-3abf68c0e578")
	)
	(bus_entry
		(at 464.82 200.66)
		(size 2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d8eda5b6-9b27-4251-ae3e-7cfc8bfc1c47")
	)
	(bus_entry
		(at 439.42 53.34)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "dc9e25df-6fcd-4e8b-987f-9d3feef473fb")
	)
	(bus_entry
		(at 439.42 121.92)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "de40028b-2e24-4c4f-a3e6-95b9c920ab03")
	)
	(bus_entry
		(at 439.42 111.76)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "dec807d3-1eb2-40a5-a45b-bc8ae6e7f3bb")
	)
	(bus_entry
		(at 439.42 55.88)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e7eba26d-05e7-4e61-8840-243cc34e6c38")
	)
	(bus_entry
		(at 439.42 58.42)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ee81aab3-817a-4319-a98a-fed2ca9cc517")
	)
	(bus_entry
		(at 571.5 193.04)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "eeea6d2f-79b5-47db-8f5e-2263b99cb948")
	)
	(bus_entry
		(at 439.42 116.84)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f242f3fa-7371-48d9-ba4a-b173c15e2c2b")
	)
	(bus_entry
		(at 571.5 200.66)
		(size -2.54 2.54)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f8df141e-4771-465e-a751-4fec67d5bb53")
	)
	(wire
		(pts
			(xy 467.36 187.96) (xy 500.38 187.96)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0043810e-7c4a-41cf-8a47-0732791c8da1")
	)
	(wire
		(pts
			(xy 38.1 48.26) (xy 49.53 48.26)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "005d04ed-4f5e-4653-83a0-192db761719d")
	)
	(polyline
		(pts
			(xy 426.72 185.42) (xy 426.72 279.4)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "00d05697-6170-4baa-9541-acd5b98b390b")
	)
	(wire
		(pts
			(xy 137.16 73.66) (xy 137.16 91.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "01626842-5160-4768-be2f-9e8d5558122f")
	)
	(wire
		(pts
			(xy 403.86 219.71) (xy 403.86 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "01beb358-8b61-4850-91f6-202d49af9757")
	)
	(wire
		(pts
			(xy 96.52 238.76) (xy 96.52 254)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "02569378-cfb7-4f89-98cb-4eba2fc0343b")
	)
	(wire
		(pts
			(xy 149.86 358.14) (xy 149.86 347.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "026533a9-6c8b-4c39-ac9b-b454e101c890")
	)
	(wire
		(pts
			(xy 182.88 83.82) (xy 182.88 81.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "027d7bab-8906-4801-8d45-307a5283e7e3")
	)
	(polyline
		(pts
			(xy 459.74 297.18) (xy 459.74 332.74)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "0299cbf0-601a-40b9-a3b4-161aea84082c")
	)
	(wire
		(pts
			(xy 121.92 246.38) (xy 121.92 254)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "029c27df-1c51-459d-826c-266e1ee76a87")
	)
	(wire
		(pts
			(xy 383.54 213.36) (xy 381 213.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "02ad57a0-3303-42fb-a4da-8c8d618ebc80")
	)
	(wire
		(pts
			(xy 535.94 93.98) (xy 505.46 93.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "02c1047b-71b0-4392-bd1a-a746a25aa62a")
	)
	(wire
		(pts
			(xy 546.1 187.96) (xy 568.96 187.96)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "02d380ea-f0ff-4715-a67b-0fc1b2ff2586")
	)
	(wire
		(pts
			(xy 73.66 215.9) (xy 109.22 215.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0301f11b-8878-418f-a4b8-137bd4154150")
	)
	(bus
		(pts
			(xy 439.42 55.88) (xy 439.42 58.42)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0316f1f3-42e4-42a6-8167-de0617478c39")
	)
	(wire
		(pts
			(xy 340.36 215.9) (xy 337.82 215.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "032e2209-9c30-433d-b8b3-938d732bb1b1")
	)
	(wire
		(pts
			(xy 292.1 63.5) (xy 284.48 63.5)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "038df6bb-c4e8-47e7-a4bd-65a72d28ed75")
	)
	(wire
		(pts
			(xy 134.62 254) (xy 134.62 228.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "03dfa1eb-7359-4ee6-8468-0d168b7f2dee")
	)
	(wire
		(pts
			(xy 190.5 27.94) (xy 190.5 30.48)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "03edacef-ebd5-4981-a24c-1ad1feefad36")
	)
	(polyline
		(pts
			(xy 241.3 17.78) (xy 241.3 111.76)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "05235a03-c7c7-4b03-9025-2927f514f424")
	)
	(wire
		(pts
			(xy 132.08 231.14) (xy 149.86 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0529502e-7320-44fd-8cc8-6cd32db48dcd")
	)
	(wire
		(pts
			(xy 200.66 198.12) (xy 223.52 198.12)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "05b32273-7e32-4024-a8e1-8c8b4af149e4")
	)
	(wire
		(pts
			(xy 223.52 187.96) (xy 223.52 185.42)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "05d94e40-e3c2-462c-95a8-4b957f48f9aa")
	)
	(bus
		(pts
			(xy 439.42 121.92) (xy 439.42 124.46)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "064dda7e-159d-43a9-8778-58fb5c8947c0")
	)
	(wire
		(pts
			(xy 568.96 180.34) (xy 546.1 180.34)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "07482dde-2406-4e0b-8c28-22d51e324ae2")
	)
	(wire
		(pts
			(xy 340.36 208.28) (xy 340.36 213.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0763c04a-b188-487c-ae17-cfd673b804cf")
	)
	(wire
		(pts
			(xy 546.1 264.16) (xy 546.1 271.78)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "07b46c83-fe14-4cc9-aba8-bac97400fd80")
	)
	(wire
		(pts
			(xy 449.58 241.3) (xy 441.96 241.3)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "07c1ad19-075e-438e-a01e-d0f32673c8f2")
	)
	(polyline
		(pts
			(xy 353.187 319.151) (xy 353.187 348.361)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "0887186f-8c6c-4543-a09a-8ea2bd6c5ad6")
	)
	(wire
		(pts
			(xy 111.76 236.22) (xy 142.24 236.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0952fc0c-9eec-4989-8e7d-96cad46542fb")
	)
	(wire
		(pts
			(xy 304.8 210.82) (xy 304.8 208.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "09530b73-5a49-4621-a8ff-86b88f1b6908")
	)
	(polyline
		(pts
			(xy 17.78 17.78) (xy 241.3 17.78)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "09982341-23db-40f8-ac48-0716a10ec808")
	)
	(wire
		(pts
			(xy 170.18 73.66) (xy 177.8 73.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0a37e6fc-d6fa-4b6f-8120-312ae15cdf25")
	)
	(wire
		(pts
			(xy 88.9 177.8) (xy 96.52 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0a5eca8e-db22-4709-83b2-115252c3053d")
	)
	(wire
		(pts
			(xy 96.52 38.1) (xy 170.18 38.1)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0aa30d5d-65ad-46e9-aa6f-5c44bdeff534")
	)
	(wire
		(pts
			(xy 485.14 101.6) (xy 495.3 101.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0ad62fb0-67e7-463f-9d49-bcae8b84d2d0")
	)
	(wire
		(pts
			(xy 142.24 241.3) (xy 142.24 236.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0bfab446-5d7d-4125-9110-c696e45a0e0f")
	)
	(polyline
		(pts
			(xy 353.187 319.151) (xy 403.987 319.151)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "0c0133fb-8914-4dc0-954b-667509f76075")
	)
	(wire
		(pts
			(xy 43.18 198.12) (xy 43.18 195.58)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0ca34f26-d600-4da3-be4a-003d4214f0b9")
	)
	(wire
		(pts
			(xy 541.02 246.38) (xy 541.02 256.54)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0cbe6222-2ce9-44a1-85b5-71efe95f766e")
	)
	(wire
		(pts
			(xy 134.62 220.98) (xy 149.86 220.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0d382ae4-334f-4a58-ae5e-2efc63befb8b")
	)
	(bus
		(pts
			(xy 571.5 165.1) (xy 568.96 162.56)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0e3b3d04-6b50-42bd-b2fa-907d7d58410e")
	)
	(wire
		(pts
			(xy 546.1 182.88) (xy 568.96 182.88)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0e5eebbe-6615-407f-b168-13b94d3240c8")
	)
	(wire
		(pts
			(xy 502.92 104.14) (xy 530.86 104.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0eb58b6d-06db-4ab1-8672-b87300057814")
	)
	(wire
		(pts
			(xy 60.96 363.22) (xy 60.96 365.76)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0ec2bc7a-6625-4493-ba83-78b0334510c8")
	)
	(polyline
		(pts
			(xy 353.187 378.46) (xy 353.187 383.54)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "0ee1ae42-b9ba-489f-9621-232ba723fc7b")
	)
	(wire
		(pts
			(xy 220.98 38.1) (xy 220.98 40.64)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0f2d4367-4d3a-475b-8359-f9456987d27e")
	)
	(wire
		(pts
			(xy 500.38 180.34) (xy 487.68 180.34)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "0f3f8fa7-8ab7-4c27-bfd7-0e190c71a764")
	)
	(polyline
		(pts
			(xy 459.74 137.16) (xy 576.58 137.16)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "102f0f80-3be5-4c6e-a313-ff63654dd0dc")
	)
	(wire
		(pts
			(xy 530.86 101.6) (xy 530.86 104.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "103e22af-9aba-4246-8bfe-3b0b04fa9ad2")
	)
	(wire
		(pts
			(xy 485.14 114.3) (xy 485.14 116.84)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "10685a79-1124-48b5-8aff-c70e8809a166")
	)
	(polyline
		(pts
			(xy 424.942 396.24) (xy 424.942 358.14)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "1072c37e-fc1e-40c3-9aae-45b87f75035d")
	)
	(wire
		(pts
			(xy 284.48 76.2) (xy 266.7 76.2)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "108d8d39-7e5f-41bb-9f8b-48b7f325ddae")
	)
	(wire
		(pts
			(xy 27.94 363.22) (xy 30.48 363.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "10c0c54e-a62e-41bb-92ea-ddfd5b38ba20")
	)
	(wire
		(pts
			(xy 129.54 185.42) (xy 129.54 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "10d8aa9a-7e0e-4a88-97d3-cd7a247ea54a")
	)
	(polyline
		(pts
			(xy 17.78 289.56) (xy 241.3 289.56)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "10e0cf88-db7a-43ec-a9fb-2de1dfc8659a")
	)
	(wire
		(pts
			(xy 35.56 149.86) (xy 43.18 149.86)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "111169f1-6c07-4531-ba7b-6d0b4d14795b")
	)
	(wire
		(pts
			(xy 500.38 271.78) (xy 467.36 271.78)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "11820483-69e9-4b77-ad9e-19f74e874ed6")
	)
	(polyline
		(pts
			(xy 261.62 391.16) (xy 302.895 391.16)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "11e311b1-80b5-4f82-a1d5-33665b58ff47")
	)
	(wire
		(pts
			(xy 182.88 81.28) (xy 185.42 81.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "126d689d-766b-48cd-b5fe-01bc4c914cf5")
	)
	(polyline
		(pts
			(xy 229.87 345.44) (xy 205.74 345.44)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "12deeeeb-211a-4f18-910f-cfc9e082a56b")
	)
	(wire
		(pts
			(xy 177.8 66.04) (xy 177.8 73.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "12f21645-c83e-4e9d-9f29-4103e9cd9e8a")
	)
	(wire
		(pts
			(xy 373.38 220.98) (xy 370.84 220.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "13681575-b5a4-4c67-936c-482af9bde30a")
	)
	(wire
		(pts
			(xy 200.66 86.36) (xy 203.2 86.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "13d3968a-4691-4a84-9a17-615a778e3f1b")
	)
	(wire
		(pts
			(xy 101.6 328.93) (xy 101.6 320.04)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "13ef89e2-6e03-4b62-93d4-04d52af2bb7c")
	)
	(polyline
		(pts
			(xy 248.92 401.32) (xy 452.12 401.32)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "142bb2f0-e75a-4cd1-83e2-8b8c4cc46739")
	)
	(wire
		(pts
			(xy 505.46 43.18) (xy 528.32 43.18)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "15776762-1b63-4c7c-83b5-67d6ae6d8784")
	)
	(wire
		(pts
			(xy 38.1 33.02) (xy 38.1 48.26)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "158eaa4a-6a72-4bef-a037-b2bcec85ed21")
	)
	(wire
		(pts
			(xy 322.58 220.98) (xy 322.58 215.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "15f1d242-a8aa-4d88-91be-43938c647baa")
	)
	(wire
		(pts
			(xy 398.78 228.6) (xy 403.86 228.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1644ee42-4aeb-429a-be08-6dfc8d6a87cf")
	)
	(bus
		(pts
			(xy 464.82 190.5) (xy 464.82 193.04)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "166ac3f4-b9d4-4165-864a-693919de782c")
	)
	(wire
		(pts
			(xy 541.02 243.84) (xy 541.02 246.38)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1689b830-cd2c-4f12-a8ae-f366d4de8593")
	)
	(polyline
		(pts
			(xy 256.54 185.42) (xy 426.72 185.42)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "168cd329-773a-48c6-82c0-d704252ffe47")
	)
	(wire
		(pts
			(xy 101.6 335.28) (xy 106.68 335.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "16e32a24-e5ee-4ffb-ba15-bf46fbd24e06")
	)
	(wire
		(pts
			(xy 66.04 43.18) (xy 66.04 35.56)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "174e7614-f4bb-43eb-9e66-50bc54daffcb")
	)
	(wire
		(pts
			(xy 220.98 40.64) (xy 220.98 43.18)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1798b990-d286-4e24-9941-2768209acef5")
	)
	(wire
		(pts
			(xy 533.4 271.78) (xy 546.1 271.78)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "18206096-ab82-4311-9ff0-8f614ed04581")
	)
	(wire
		(pts
			(xy 281.94 223.52) (xy 281.94 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "183a66b5-5674-4f02-99d3-7957e6a3ce8a")
	)
	(polyline
		(pts
			(xy 241.3 289.56) (xy 241.3 279.4)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "192491e6-03a2-4b83-8d49-550a0c0511eb")
	)
	(wire
		(pts
			(xy 203.2 88.9) (xy 208.28 88.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "195f4f11-eb7f-42b3-b408-60e97ce526c0")
	)
	(wire
		(pts
			(xy 165.1 73.66) (xy 165.1 66.04)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1998b5ea-cc48-433c-b31f-d012be694ba6")
	)
	(wire
		(pts
			(xy 490.22 274.32) (xy 500.38 274.32)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "19bba480-b1a8-4a15-bbac-2cc3add3c641")
	)
	(wire
		(pts
			(xy 449.58 223.52) (xy 449.58 241.3)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1a201e6b-ae56-4aab-a744-7ca958101e4a")
	)
	(wire
		(pts
			(xy 190.5 53.34) (xy 190.5 50.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1a89de57-d067-480f-8f76-16ddc09a0d31")
	)
	(wire
		(pts
			(xy 144.78 104.14) (xy 144.78 96.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1a958210-695d-4114-9a55-baaa50cfc4f1")
	)
	(wire
		(pts
			(xy 73.66 218.44) (xy 101.6 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1b1b0308-761f-4e65-8513-aaf836ac2a80")
	)
	(polyline
		(pts
			(xy 332.867 358.14) (xy 332.867 396.24)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "1b625e20-24e3-4d5b-b248-0774c5e0453c")
	)
	(wire
		(pts
			(xy 330.2 218.44) (xy 327.66 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1b954774-35ef-4579-9156-a0d4055a8a97")
	)
	(wire
		(pts
			(xy 419.1 218.44) (xy 416.56 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1b981d2b-1555-4300-a95d-da4964a65f2e")
	)
	(wire
		(pts
			(xy 342.9 215.9) (xy 340.36 215.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1d0d4f60-e2f3-4f1b-b608-ec86ffab4c8b")
	)
	(wire
		(pts
			(xy 149.86 213.36) (xy 124.46 213.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1d55eaae-a3d8-4fe4-98ab-a01cf00fb5f1")
	)
	(polyline
		(pts
			(xy 576.58 17.78) (xy 459.74 17.78)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "1d650118-2309-497f-9a98-a8e0bf586b6f")
	)
	(wire
		(pts
			(xy 58.42 60.96) (xy 76.2 60.96)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1edeae8c-36b5-4e2f-a4ec-e12bd8b6197c")
	)
	(wire
		(pts
			(xy 129.54 96.52) (xy 132.08 96.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1eec51d8-39ba-48da-9517-49dc22b348c7")
	)
	(wire
		(pts
			(xy 43.18 180.34) (xy 43.18 185.42)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1ef0ead0-104a-4327-a922-83cb77685756")
	)
	(bus
		(pts
			(xy 571.5 198.12) (xy 571.5 200.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "1f2cee16-cd61-4626-8131-28be07ee08bc")
	)
	(wire
		(pts
			(xy 438.15 223.52) (xy 434.34 223.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "210d74d2-d6cf-4463-8882-92e73c0f77ca")
	)
	(polyline
		(pts
			(xy 332.867 375.92) (xy 424.942 375.92)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "210ec83e-ae45-4177-ab10-a76a1f788e94")
	)
	(wire
		(pts
			(xy 142.24 172.72) (xy 142.24 170.18)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "21472ab4-b6cb-4697-9bbb-3af29f3270ac")
	)
	(bus
		(pts
			(xy 571.5 271.78) (xy 571.5 274.32)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2157c807-ac4b-4564-beaf-7d8a4b782675")
	)
	(polyline
		(pts
			(xy 459.74 17.78) (xy 459.74 66.04)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "216786d1-64e0-4fd7-9489-20e4ed5e5951")
	)
	(polyline
		(pts
			(xy 344.297 368.3) (xy 344.297 375.92)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "21b25aad-6082-4ba6-a1e5-c8b6919bb3aa")
	)
	(wire
		(pts
			(xy 266.7 68.58) (xy 271.78 68.58)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "22f7a596-b89d-4dfb-9d72-a38b6b9180c1")
	)
	(wire
		(pts
			(xy 226.06 81.28) (xy 226.06 83.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2314bff8-ec73-4d2d-a181-51f731915b11")
	)
	(polyline
		(pts
			(xy 248.92 144.78) (xy 452.12 144.78)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "23a3a7f3-f1ff-454c-a613-ed76a23c43e0")
	)
	(wire
		(pts
			(xy 500.38 193.04) (xy 467.36 193.04)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "24127d64-3a7c-468a-8a1c-6b4cf0f31c70")
	)
	(wire
		(pts
			(xy 485.14 111.76) (xy 495.3 111.76)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "24241d1b-7876-4cb9-b3bf-51c859813024")
	)
	(wire
		(pts
			(xy 203.2 86.36) (xy 203.2 88.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2474e66a-ddd9-4e57-b043-7c14b4579a84")
	)
	(polyline
		(pts
			(xy 229.87 345.44) (xy 229.87 361.315)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "248b3bc4-2e34-4728-b958-06e93fcee0b1")
	)
	(wire
		(pts
			(xy 485.14 114.3) (xy 495.3 114.3)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "24c8bed5-38e0-42fc-9871-801293f8c1cc")
	)
	(wire
		(pts
			(xy 73.66 360.68) (xy 73.66 365.76)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "24cc1e4c-e743-4f9b-bfe7-ef23a294ef5c")
	)
	(wire
		(pts
			(xy 96.52 104.14) (xy 96.52 96.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "24e1633f-2c9b-495b-9b4a-142017dccb32")
	)
	(bus
		(pts
			(xy 464.82 271.78) (xy 464.82 274.32)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "24f49524-2c65-468d-9240-23939eba96f9")
	)
	(polyline
		(pts
			(xy 134.62 124.46) (xy 134.62 162.56)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "250c15d5-473b-4318-a88f-30b9f927fcb1")
	)
	(polyline
		(pts
			(xy 372.872 368.3) (xy 372.872 375.92)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "25349c4d-7c57-49cf-9951-fe2704dbc1a7")
	)
	(wire
		(pts
			(xy 38.1 345.44) (xy 66.04 345.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "254a7219-a8cc-4758-99cf-a07ba4d7ce46")
	)
	(wire
		(pts
			(xy 220.98 88.9) (xy 215.9 88.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "25a0cd8f-0cca-4f42-a012-689f1b50b3ce")
	)
	(polyline
		(pts
			(xy 576.58 218.44) (xy 576.58 144.78)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "25ad532f-1d7b-4da0-af28-0b094ab91297")
	)
	(wire
		(pts
			(xy 180.34 203.2) (xy 190.5 203.2)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "25c67c35-61d2-4459-baf0-44e7485bd4ed")
	)
	(wire
		(pts
			(xy 266.7 208.28) (xy 269.24 208.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "25e650b9-e872-45b7-9c91-7a7d45c3e6d0")
	)
	(wire
		(pts
			(xy 226.06 81.28) (xy 233.68 81.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "267b7306-1382-43fc-8ef8-167b906954d1")
	)
	(bus
		(pts
			(xy 439.42 38.1) (xy 439.42 45.72)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "26b8eeb8-a8a5-470e-9f5f-3bcf0da52aae")
	)
	(wire
		(pts
			(xy 429.26 241.3) (xy 441.96 241.3)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "26c2a555-095c-460f-b316-0807ef3f87dc")
	)
	(wire
		(pts
			(xy 177.8 378.46) (xy 170.18 378.46)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "271fe56d-f3f1-4f6f-8e5e-fc48927751f2")
	)
	(polyline
		(pts
			(xy 332.867 358.14) (xy 424.942 358.14)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "27aef8d8-b3a2-46c0-8196-5f2b3e330bdd")
	)
	(wire
		(pts
			(xy 533.4 111.76) (xy 541.02 111.76)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "27dd349b-4125-42c1-a63b-7d078001aa94")
	)
	(polyline
		(pts
			(xy 55.88 205.74) (xy 20.32 205.74)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "280f6581-7226-4d64-b1d4-cf76a9420f04")
	)
	(wire
		(pts
			(xy 91.44 238.76) (xy 96.52 238.76)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2830315c-3ca1-479e-9ef1-032efdc868f7")
	)
	(wire
		(pts
			(xy 200.66 203.2) (xy 223.52 203.2)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "283f6e74-0c47-4151-99ca-7321eac26cc8")
	)
	(wire
		(pts
			(xy 292.1 53.34) (xy 287.02 53.34)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "28844195-0ce3-4cd3-abf1-2ba41cb74537")
	)
	(wire
		(pts
			(xy 134.62 228.6) (xy 149.86 228.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "28fd0c0c-b3d2-4e7e-b075-b60cd54feca2")
	)
	(polyline
		(pts
			(xy 353.187 386.08) (xy 353.187 396.24)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "29135af9-5ae5-4dff-9dcf-ed172b23c7a1")
	)
	(wire
		(pts
			(xy 114.3 177.8) (xy 116.84 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "29160951-fd2c-4b81-af5a-ceaf49e03146")
	)
	(wire
		(pts
			(xy 292.1 223.52) (xy 294.64 223.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2929ebe7-a47a-4aa7-9c6b-bcc49bc231ad")
	)
	(polyline
		(pts
			(xy 17.78 401.32) (xy 241.3 401.32)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "294b2f36-ead6-4d39-a90b-99365283d4d5")
	)
	(wire
		(pts
			(xy 30.48 363.22) (xy 40.64 363.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "298780a7-4934-4662-bc7b-a921f891fff0")
	)
	(wire
		(pts
			(xy 88.9 38.1) (xy 96.52 38.1)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "29c78936-a3d8-4bf4-ac23-7080cba4b407")
	)
	(wire
		(pts
			(xy 76.2 177.8) (xy 63.5 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2a8058ba-af5a-47a0-96f0-e835611c2943")
	)
	(wire
		(pts
			(xy 287.02 55.88) (xy 292.1 55.88)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2aaa0347-2a37-4b11-9958-8c4a553e9b38")
	)
	(wire
		(pts
			(xy 157.48 73.66) (xy 144.78 73.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2b963674-36ba-476e-afff-2b985dc28d35")
	)
	(wire
		(pts
			(xy 533.4 111.76) (xy 533.4 119.38)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2b99c614-7ffa-4189-876e-06c0d06d37ca")
	)
	(wire
		(pts
			(xy 73.66 213.36) (xy 81.28 213.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2bae0fe7-8192-47a1-aba8-2e6f53959a97")
	)
	(wire
		(pts
			(xy 535.94 99.06) (xy 535.94 93.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2be66daa-6998-419a-8dcd-a2b4eb476dde")
	)
	(wire
		(pts
			(xy 170.18 353.06) (xy 170.18 355.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2c384c47-47ba-4652-a843-65b2b58e3617")
	)
	(wire
		(pts
			(xy 76.2 233.68) (xy 76.2 236.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2c855f5f-a0b5-4390-9d1c-a818055cb0d8")
	)
	(wire
		(pts
			(xy 436.88 86.36) (xy 386.08 86.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2cd76f23-7007-421f-b7d8-04380eb51a7a")
	)
	(bus
		(pts
			(xy 571.5 190.5) (xy 571.5 193.04)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2cef6f82-1236-4b5d-8490-055c61547581")
	)
	(wire
		(pts
			(xy 88.9 66.04) (xy 88.9 83.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2d081523-c831-440e-979c-d30113714c01")
	)
	(wire
		(pts
			(xy 121.92 220.98) (xy 127 220.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2d30c524-7611-4f29-b7a1-9ffe6c12ead5")
	)
	(polyline
		(pts
			(xy 576.58 340.36) (xy 576.58 368.3)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "2d75698c-6433-4bfd-bcef-e5fdc9a8fa80")
	)
	(wire
		(pts
			(xy 276.86 220.98) (xy 276.86 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2d800e0e-c43d-490f-8206-917f3dd1939d")
	)
	(wire
		(pts
			(xy 27.94 337.82) (xy 30.48 337.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2df6f6c8-7b3e-4c98-affc-6b76527bf6db")
	)
	(wire
		(pts
			(xy 185.42 193.04) (xy 231.14 193.04)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2e1bad06-cebd-47c8-9720-f76c331d2179")
	)
	(wire
		(pts
			(xy 200.66 205.74) (xy 223.52 205.74)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2e1c16dc-6fef-4371-91e4-3344492e7738")
	)
	(wire
		(pts
			(xy 73.66 238.76) (xy 76.2 238.76)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2ed3b223-da73-482b-a3bf-14e8d5d86a80")
	)
	(wire
		(pts
			(xy 129.54 86.36) (xy 144.78 86.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2f029e24-9aa1-4762-a0e5-e31c737d9324")
	)
	(wire
		(pts
			(xy 546.1 104.14) (xy 556.26 104.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "2f05a8e5-aca7-4bc5-986a-3e68a67fd8db")
	)
	(polyline
		(pts
			(xy 353.187 360.045) (xy 353.187 365.76)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "2ff70cef-0a04-4eb7-9073-e8a076b9cea9")
	)
	(wire
		(pts
			(xy 76.2 33.02) (xy 76.2 48.26)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "30f152b3-375b-4126-a4e5-08d3d6107c5e")
	)
	(wire
		(pts
			(xy 548.64 43.18) (xy 568.96 43.18)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "30f60819-f080-4e20-936d-34b287aeb720")
	)
	(wire
		(pts
			(xy 284.48 215.9) (xy 281.94 215.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3158da49-7e29-4ec1-8e58-ee1530d9ce8b")
	)
	(wire
		(pts
			(xy 195.58 233.68) (xy 208.28 233.68)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "31b61432-c4bb-44c8-8d4d-93482cd1370b")
	)
	(wire
		(pts
			(xy 157.48 104.14) (xy 157.48 91.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "323f3c57-8aec-4c1b-8d3d-0195c808c750")
	)
	(wire
		(pts
			(xy 96.52 73.66) (xy 96.52 86.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "32643a83-c50d-4903-9b10-8b6b2152638c")
	)
	(wire
		(pts
			(xy 63.5 170.18) (xy 73.66 170.18)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "327a6193-d787-4ec9-963f-ad605d021d6d")
	)
	(polyline
		(pts
			(xy 248.92 401.32) (xy 248.92 297.18)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "32bf6acc-d2da-4eac-89f3-1d3ea855d82a")
	)
	(polyline
		(pts
			(xy 211.455 350.52) (xy 211.455 361.315)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "32db04ec-3d7f-4fec-a194-b5286a96b069")
	)
	(bus
		(pts
			(xy 462.28 35.56) (xy 464.82 38.1)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "32efbb17-de74-42ca-b6bc-beebc3e1e83c")
	)
	(wire
		(pts
			(xy 30.48 360.68) (xy 30.48 363.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3364cd8b-de25-44aa-9aa7-cdd87552e2f3")
	)
	(wire
		(pts
			(xy 104.14 340.36) (xy 99.06 340.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "33abc2c6-d163-43cb-a5bb-4e26c3f2f819")
	)
	(wire
		(pts
			(xy 495.3 93.98) (xy 485.14 93.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "33b4ddc3-4c7e-466d-8eee-989b641e84de")
	)
	(wire
		(pts
			(xy 48.26 152.4) (xy 48.26 149.86)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "33bc3150-7f34-4105-bc54-47dd0ca6794c")
	)
	(wire
		(pts
			(xy 485.14 93.98) (xy 485.14 96.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3412435f-7ba8-4655-9985-ce180fd7cefa")
	)
	(wire
		(pts
			(xy 546.1 195.58) (xy 568.96 195.58)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "345d8aab-5d11-408b-8222-03c4a1bc6314")
	)
	(bus
		(pts
			(xy 571.5 182.88) (xy 571.5 185.42)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "349804a0-7b08-4c80-9556-1a0ea77f3254")
	)
	(wire
		(pts
			(xy 223.52 198.12) (xy 223.52 203.2)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "34ce7a7e-8334-4a87-8e12-237bcb0f84c5")
	)
	(wire
		(pts
			(xy 190.5 157.48) (xy 231.14 157.48)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "34eb3823-067e-436e-98d2-3b2d9b915e23")
	)
	(wire
		(pts
			(xy 492.76 104.14) (xy 495.3 104.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3504ab28-21c2-4596-ab26-3a224161685d")
	)
	(polyline
		(pts
			(xy 353.441 332.613) (xy 403.987 332.613)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "3538bcf8-1d71-43e3-842c-be0b0de203c7")
	)
	(wire
		(pts
			(xy 185.42 220.98) (xy 185.42 226.06)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "359d5fd8-6ab6-4e25-87b5-a6df3095cac3")
	)
	(wire
		(pts
			(xy 60.96 48.26) (xy 76.2 48.26)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "35d2160d-365e-448c-a5a4-e9d33d020c39")
	)
	(wire
		(pts
			(xy 127 172.72) (xy 142.24 172.72)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3654a76f-c9f7-4770-9d86-7693e47643fb")
	)
	(wire
		(pts
			(xy 386.08 114.3) (xy 436.88 114.3)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3671dcf0-069f-4ee9-adbd-c3b74df0747f")
	)
	(wire
		(pts
			(xy 434.34 215.9) (xy 438.15 215.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "368c3ce6-f0fc-49ff-a1c7-f2a6424cb0ee")
	)
	(wire
		(pts
			(xy 132.08 248.92) (xy 132.08 254)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "371b1f9c-86da-4227-acdf-0b96c5ca2576")
	)
	(wire
		(pts
			(xy 139.7 337.82) (xy 139.7 320.04)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "37398968-ddbc-47a9-a87b-1a6021dd8e3a")
	)
	(wire
		(pts
			(xy 386.08 60.96) (xy 436.88 60.96)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "378a1a7e-c81f-43f3-a7d7-578923a18b75")
	)
	(wire
		(pts
			(xy 200.66 187.96) (xy 223.52 187.96)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "37a4fe0f-45fa-42b3-b5c4-40b720b9394c")
	)
	(wire
		(pts
			(xy 101.6 355.6) (xy 106.68 355.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "37fe3fb3-d252-43f1-a24a-5f7b55fcbc9b")
	)
	(polyline
		(pts
			(xy 344.297 386.08) (xy 344.297 396.24)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "3887375a-c0ed-4024-b178-a3c136a66160")
	)
	(wire
		(pts
			(xy 119.38 177.8) (xy 121.92 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "38ce87a9-ab56-449a-b509-905232fe80ea")
	)
	(bus
		(pts
			(xy 439.42 50.8) (xy 439.42 53.34)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3955beec-e13b-40aa-a2a5-43899ffb26cd")
	)
	(wire
		(pts
			(xy 365.76 228.6) (xy 365.76 223.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "39fc34c4-7195-48d1-92cc-2db0bbbf82e0")
	)
	(wire
		(pts
			(xy 548.64 48.26) (xy 568.96 48.26)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3a04527c-46be-4337-a5ab-2df22255248e")
	)
	(wire
		(pts
			(xy 546.1 193.04) (xy 568.96 193.04)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3a37adbf-efc7-4c5f-9bbc-144ab9dc1cf9")
	)
	(wire
		(pts
			(xy 180.34 177.8) (xy 185.42 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3abd3579-fd8d-4aa1-af8d-c3d470827b44")
	)
	(wire
		(pts
			(xy 88.9 165.1) (xy 88.9 170.18)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3abd49fa-bd7b-4216-becc-fd7d33f9767d")
	)
	(wire
		(pts
			(xy 373.38 213.36) (xy 375.92 213.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3ac80885-3d9c-4cde-88b1-086f089c6e20")
	)
	(polyline
		(pts
			(xy 261.62 309.88) (xy 302.895 309.88)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "3ae30e17-5266-4002-8a7e-1b67e5d5b407")
	)
	(wire
		(pts
			(xy 266.7 63.5) (xy 266.7 68.58)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3b0ac100-cedb-46bd-a926-e4855e005f90")
	)
	(wire
		(pts
			(xy 185.42 218.44) (xy 185.42 213.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3b9efd74-505f-41d8-9308-bc11f942622c")
	)
	(wire
		(pts
			(xy 220.98 83.82) (xy 220.98 81.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3bcf9e71-8d0e-4174-8023-2befa8956793")
	)
	(wire
		(pts
			(xy 438.15 215.9) (xy 438.15 223.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3bd90057-6442-41a9-859c-2082f8f573e7")
	)
	(wire
		(pts
			(xy 363.22 213.36) (xy 365.76 213.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3bf156a3-8476-494b-b505-5fb7e39f6036")
	)
	(wire
		(pts
			(xy 81.28 200.66) (xy 78.74 200.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3c33b082-1a0c-4f7e-8542-c2b4ef3ea27e")
	)
	(wire
		(pts
			(xy 220.98 104.14) (xy 220.98 88.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3c451a25-e8df-4ada-81ef-62e1b701ed66")
	)
	(wire
		(pts
			(xy 434.34 218.44) (xy 435.61 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3c841c84-13d8-4590-9baa-c1e49394c26b")
	)
	(wire
		(pts
			(xy 226.06 76.2) (xy 226.06 81.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3d22335f-5ba7-4c4c-b0d1-bc5c2436d63b")
	)
	(polyline
		(pts
			(xy 459.74 289.56) (xy 576.58 289.56)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "3de29aaf-f05d-46e9-964a-f1aedceb3422")
	)
	(wire
		(pts
			(xy 449.58 208.28) (xy 441.96 208.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3df17639-140d-4115-937a-ea963a69ee64")
	)
	(polyline
		(pts
			(xy 205.74 347.98) (xy 229.87 347.98)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "3e1fda1a-a437-42ca-a254-c54cb95dd971")
	)
	(polyline
		(pts
			(xy 576.58 289.56) (xy 576.58 226.06)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "3e3d5778-49a9-4c24-a5c0-40872dbd4798")
	)
	(wire
		(pts
			(xy 185.42 231.14) (xy 185.42 233.68)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3e427b68-1b2f-4a8b-84b9-a444c2dac6aa")
	)
	(wire
		(pts
			(xy 543.56 246.38) (xy 543.56 256.54)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3e96ab03-5631-420c-9c05-ed0dde6bbc9d")
	)
	(wire
		(pts
			(xy 25.4 60.96) (xy 25.4 83.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3f1188b3-0f65-4b92-ab48-7ca46f0ff802")
	)
	(wire
		(pts
			(xy 109.22 215.9) (xy 109.22 226.06)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "3f374ce5-ce31-4dfc-8253-27c9cdda4b24")
	)
	(polyline
		(pts
			(xy 17.78 297.18) (xy 17.78 401.32)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "3f5d72e8-2901-4b26-b719-75f0b4aaa396")
	)
	(wire
		(pts
			(xy 142.24 254) (xy 144.78 254)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4005e1ca-da8b-48c0-b91f-733c8b9e0abb")
	)
	(wire
		(pts
			(xy 190.5 27.94) (xy 157.48 27.94)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "400f0a9a-dc6f-43bb-978c-6889e4b3637c")
	)
	(wire
		(pts
			(xy 386.08 78.74) (xy 424.18 78.74)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "401df7a3-debb-43d1-aff0-dd24b944b88f")
	)
	(wire
		(pts
			(xy 325.12 210.82) (xy 325.12 208.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4072f637-f6ea-480a-aed3-7b2f20dc42cf")
	)
	(wire
		(pts
			(xy 96.52 86.36) (xy 96.52 88.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "40864d14-ce26-49b8-8298-8519de70d5b4")
	)
	(wire
		(pts
			(xy 185.42 175.26) (xy 187.96 175.26)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "40996d25-be32-47be-8970-1d7bba4c36e1")
	)
	(wire
		(pts
			(xy 490.22 264.16) (xy 490.22 274.32)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4128de17-c146-40a1-9e81-27471a2dc257")
	)
	(wire
		(pts
			(xy 515.62 279.4) (xy 543.56 279.4)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "41323378-d541-49cc-8e0d-32168d7263a3")
	)
	(wire
		(pts
			(xy 340.36 218.44) (xy 342.9 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "413f515b-8610-47a3-bd44-124c8383d769")
	)
	(wire
		(pts
			(xy 279.4 68.58) (xy 284.48 68.58)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "42aeb97c-e7a1-42a4-8372-23addecc6694")
	)
	(wire
		(pts
			(xy 386.08 104.14) (xy 424.18 104.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "42c2ea35-80f6-46b2-a55e-727fae3cf16f")
	)
	(wire
		(pts
			(xy 200.66 81.28) (xy 205.74 81.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "43032c54-2455-43a9-9f12-7e07d103e7c2")
	)
	(wire
		(pts
			(xy 73.66 236.22) (xy 76.2 236.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "43107cf9-d20b-454f-b754-0258ef113370")
	)
	(wire
		(pts
			(xy 167.64 325.12) (xy 167.64 323.85)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4321773d-a7fe-4138-8c1f-6f0c248dde55")
	)
	(wire
		(pts
			(xy 25.4 48.26) (xy 38.1 48.26)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4321e82a-0312-4a22-99f3-f55751f0e835")
	)
	(wire
		(pts
			(xy 546.1 246.38) (xy 546.1 256.54)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4322d660-741c-40b8-96d8-b548489e02c4")
	)
	(wire
		(pts
			(xy 182.88 157.48) (xy 139.7 157.48)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "434ace73-c4de-41ba-b54c-597f400b9ca5")
	)
	(wire
		(pts
			(xy 101.6 195.58) (xy 104.14 195.58)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4371c117-aaae-428d-8f3d-ef2a1c9471b6")
	)
	(bus
		(pts
			(xy 439.42 58.42) (xy 439.42 78.74)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "43b20e62-61ed-4956-a7bc-ebdf0e5135c2")
	)
	(wire
		(pts
			(xy 515.62 276.86) (xy 568.96 276.86)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4417bea0-c26f-419b-8076-69d10b9dd0e4")
	)
	(wire
		(pts
			(xy 132.08 347.98) (xy 149.86 347.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "442c1795-b817-49c7-8376-e43ef445652c")
	)
	(polyline
		(pts
			(xy 353.187 368.3) (xy 353.187 375.92)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "44678bce-aa33-4d1f-b1a3-224fba685938")
	)
	(wire
		(pts
			(xy 38.1 104.14) (xy 38.1 93.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "449a0283-f7e3-418f-ab6d-0ff84e9bb1f8")
	)
	(wire
		(pts
			(xy 170.18 38.1) (xy 177.8 38.1)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "44dfa48b-1d5a-4937-bb76-4d08f312a4eb")
	)
	(wire
		(pts
			(xy 187.96 340.36) (xy 231.14 340.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "453402a0-6673-4d38-8fd7-c8756715be80")
	)
	(wire
		(pts
			(xy 119.38 213.36) (xy 119.38 228.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "455699c2-0b75-45f5-a0b6-1bcd4feaae09")
	)
	(wire
		(pts
			(xy 180.34 231.14) (xy 185.42 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "457327b7-9dee-4d55-9de2-1ce6407cbaa1")
	)
	(polyline
		(pts
			(xy 452.12 17.78) (xy 452.12 137.16)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "46890ec5-2c16-4ffa-8bd7-2057f9365c3d")
	)
	(wire
		(pts
			(xy 441.96 208.28) (xy 441.96 215.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4723e94b-f170-4ac9-adeb-3d803787fe79")
	)
	(wire
		(pts
			(xy 441.96 226.06) (xy 441.96 241.3)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "47be7f4e-306b-445b-9d8c-fd4e158923a8")
	)
	(wire
		(pts
			(xy 157.48 73.66) (xy 157.48 88.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "47dac58a-5ef3-4b4e-bf34-4c59d4f4c460")
	)
	(wire
		(pts
			(xy 287.02 50.8) (xy 287.02 53.34)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "47e02ef0-4f17-4efe-8dcf-01b89506eec9")
	)
	(wire
		(pts
			(xy 177.8 91.44) (xy 177.8 104.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "488c38b1-ff09-42d7-ae04-2cd91e104a86")
	)
	(wire
		(pts
			(xy 500.38 203.2) (xy 467.36 203.2)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "48a8f94b-98df-4193-8991-ff297a9b38dc")
	)
	(wire
		(pts
			(xy 386.08 218.44) (xy 383.54 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "48ac65d4-2b3c-4e5d-a94c-164199f90ac9")
	)
	(wire
		(pts
			(xy 149.86 223.52) (xy 144.78 223.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "48b34e80-7b37-470b-bd9f-522b320af5b8")
	)
	(wire
		(pts
			(xy 180.34 172.72) (xy 231.14 172.72)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "491b4941-f66f-4d7f-a7b8-7cdb4e08f2a6")
	)
	(wire
		(pts
			(xy 515.62 274.32) (xy 541.02 274.32)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4921e818-36ab-42ff-8bf0-036f5f637fff")
	)
	(wire
		(pts
			(xy 114.3 195.58) (xy 114.3 223.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "498dfde3-f9c3-4535-83d5-8cc03f97b175")
	)
	(wire
		(pts
			(xy 111.76 177.8) (xy 114.3 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "49c17bdb-43ef-430d-aa3e-f35e7ee40d02")
	)
	(polyline
		(pts
			(xy 390.017 386.08) (xy 390.017 396.24)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "49ecd079-2ec1-4b7f-84d8-aeaf862cd46e")
	)
	(wire
		(pts
			(xy 208.28 383.54) (xy 208.28 386.08)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4a71e721-8904-433d-b926-9e5348cf24bb")
	)
	(wire
		(pts
			(xy 541.02 48.26) (xy 528.32 48.26)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4aafa89c-8ed7-48c3-bcaf-b2b914d9d15f")
	)
	(wire
		(pts
			(xy 568.96 43.18) (xy 568.96 35.56)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4ae0217c-a1c9-4e11-9567-cf12fa330da0")
	)
	(wire
		(pts
			(xy 48.26 149.86) (xy 63.5 149.86)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4aea8f47-646e-4066-927e-b290ad1eee4d")
	)
	(wire
		(pts
			(xy 396.24 218.44) (xy 398.78 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4b89a16b-0144-4adb-b006-d0f5eb38aa9b")
	)
	(wire
		(pts
			(xy 411.48 241.3) (xy 424.18 241.3)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4bc5cdb3-5390-452a-b5ed-b5994945330e")
	)
	(wire
		(pts
			(xy 129.54 200.66) (xy 129.54 205.74)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4bc85a51-d5a3-4521-8c47-8dbdb4d1bae5")
	)
	(polyline
		(pts
			(xy 248.92 144.78) (xy 248.92 266.7)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "4c2d0481-7440-4baf-a4e8-3e2e1eecbe9e")
	)
	(wire
		(pts
			(xy 187.96 187.96) (xy 187.96 190.5)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4c39dc9f-b255-4509-8118-c1df653d00ab")
	)
	(bus
		(pts
			(xy 439.42 116.84) (xy 439.42 119.38)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4d2bb113-cb18-41eb-817d-9627bbf90dc1")
	)
	(wire
		(pts
			(xy 533.4 99.06) (xy 467.36 99.06)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4d4ea605-2c03-4f38-abc6-35d74d376f24")
	)
	(polyline
		(pts
			(xy 459.74 218.44) (xy 576.58 218.44)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "4e8e86ad-b810-4ba8-a32f-f055264b5408")
	)
	(wire
		(pts
			(xy 386.08 96.52) (xy 424.18 96.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4ed44a4d-9c0f-45e2-9488-201e2e38039d")
	)
	(polyline
		(pts
			(xy 332.867 391.16) (xy 424.942 391.16)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "4f2ddc63-ab9c-4c8b-a0b4-6766207b92a5")
	)
	(wire
		(pts
			(xy 276.86 231.14) (xy 281.94 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4f5339fd-96e9-4f19-ad7e-ddb5f68cabf9")
	)
	(bus
		(pts
			(xy 439.42 38.1) (xy 441.96 35.56)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4fc46639-cd62-43e5-9c63-9482336e71ce")
	)
	(bus
		(pts
			(xy 464.82 160.02) (xy 464.82 185.42)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "4fcae095-5ac5-4939-b291-8daba2cc501d")
	)
	(bus
		(pts
			(xy 464.82 269.24) (xy 464.82 271.78)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "501cfb05-7525-4d34-bd63-e3c55ddf7a27")
	)
	(bus
		(pts
			(xy 571.5 165.1) (xy 571.5 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "503c0c7b-9822-43dd-a82a-2926c03cc547")
	)
	(wire
		(pts
			(xy 66.04 345.44) (xy 66.04 328.93)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5047a445-bbe0-4f8f-afa0-dc200d3a239f")
	)
	(bus
		(pts
			(xy 464.82 96.52) (xy 464.82 106.68)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "505b6ae1-32aa-40c5-8a4b-b66397e0b0d3")
	)
	(polyline
		(pts
			(xy 217.805 350.52) (xy 217.805 361.315)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "507f34ab-9a80-4afa-9c68-24dcd0ee4b54")
	)
	(wire
		(pts
			(xy 35.56 167.64) (xy 35.56 162.56)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "50c2a327-7511-44b4-9971-754a74a704ac")
	)
	(wire
		(pts
			(xy 25.4 48.26) (xy 25.4 60.96)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "50c793a3-1a86-423d-98c6-7f1d92d7bd54")
	)
	(wire
		(pts
			(xy 25.4 167.64) (xy 35.56 167.64)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "51148858-040d-4022-911a-4ffd6847bf1c")
	)
	(wire
		(pts
			(xy 124.46 200.66) (xy 129.54 200.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "511b37b2-1e25-4fdb-8ae8-db2d5a8f50ba")
	)
	(wire
		(pts
			(xy 142.24 182.88) (xy 149.86 182.88)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "513384ed-9538-4ed3-ab2d-059f2ca91e57")
	)
	(wire
		(pts
			(xy 134.62 182.88) (xy 142.24 182.88)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "515d1f25-73aa-4782-ade3-95132810284d")
	)
	(bus
		(pts
			(xy 464.82 193.04) (xy 464.82 195.58)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "517f6b65-7f82-46ad-9f51-807090a2e56f")
	)
	(wire
		(pts
			(xy 104.14 337.82) (xy 106.68 337.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "51c5c7b2-a317-4e83-8b1f-8c361c4d9d0e")
	)
	(wire
		(pts
			(xy 96.52 38.1) (xy 96.52 73.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "52d42dc0-df66-4ba8-a383-0bdec423bc0a")
	)
	(wire
		(pts
			(xy 541.02 274.32) (xy 568.96 274.32)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "531dff71-5c41-45c0-bd49-cf951ff41157")
	)
	(bus
		(pts
			(xy 464.82 195.58) (xy 464.82 198.12)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5390d9bf-1d7b-43fc-b2e8-a31390b3743b")
	)
	(wire
		(pts
			(xy 190.5 38.1) (xy 190.5 40.64)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "545e40b4-541e-47c0-85d9-ea00d8d73a79")
	)
	(bus
		(pts
			(xy 571.5 269.24) (xy 571.5 271.78)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "549134e1-c5fb-4299-9b32-0ffcb7e50db8")
	)
	(polyline
		(pts
			(xy 17.78 119.38) (xy 241.3 119.38)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "54ecb0f1-b4c3-44a9-ba5a-4be6371b2833")
	)
	(wire
		(pts
			(xy 104.14 337.82) (xy 104.14 340.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "54fa50ca-f167-43a6-b082-87d074799214")
	)
	(wire
		(pts
			(xy 533.4 101.6) (xy 556.26 101.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "550c39a2-9114-49bf-a297-df0add0739b3")
	)
	(wire
		(pts
			(xy 215.9 81.28) (xy 220.98 81.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "55ffca19-f6c7-4831-bd20-bff7dce8de63")
	)
	(wire
		(pts
			(xy 543.56 246.38) (xy 541.02 246.38)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5605dfc0-30d0-4ec3-9287-a6de33317cfa")
	)
	(wire
		(pts
			(xy 139.7 96.52) (xy 144.78 96.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "56ce554e-37b7-408d-b3dc-c0b29dfb727b")
	)
	(polyline
		(pts
			(xy 261.62 320.04) (xy 302.895 320.04)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "573fb990-25fa-4001-b8d9-e98704e082ee")
	)
	(wire
		(pts
			(xy 556.26 106.68) (xy 495.3 106.68)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "576c8008-85c0-4db0-ab41-780489a00a8a")
	)
	(wire
		(pts
			(xy 190.5 185.42) (xy 185.42 185.42)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "57bb4f66-888b-46de-833f-6295e2dc1fa6")
	)
	(wire
		(pts
			(xy 101.6 218.44) (xy 116.84 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "580c700e-d05b-448f-bfab-a0d3fdfce42b")
	)
	(wire
		(pts
			(xy 132.08 342.9) (xy 144.78 342.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "582a8d71-c5f6-411d-b262-3002222b2b46")
	)
	(wire
		(pts
			(xy 180.34 180.34) (xy 231.14 180.34)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5850f080-63d4-48d3-a550-f5c181312dba")
	)
	(wire
		(pts
			(xy 205.74 149.86) (xy 205.74 142.24)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "59698d1b-f369-4c25-a5e7-bffecf426145")
	)
	(wire
		(pts
			(xy 190.5 220.98) (xy 185.42 220.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "598a8a14-641f-43d3-9f31-1fae976b6e8b")
	)
	(wire
		(pts
			(xy 160.02 347.98) (xy 162.56 347.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "599faaec-40d8-4863-8223-0b1bc2651d77")
	)
	(wire
		(pts
			(xy 66.04 35.56) (xy 45.72 35.56)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "59ea44d5-104b-481b-8707-cc8958fe194c")
	)
	(polyline
		(pts
			(xy 353.441 340.487) (xy 403.987 340.487)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "59fd67c9-2196-4c0b-9117-a79db3fb5e88")
	)
	(wire
		(pts
			(xy 284.48 50.8) (xy 287.02 50.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5a419ce6-aeb3-420b-95fd-78aa355ca2bd")
	)
	(wire
		(pts
			(xy 22.86 363.22) (xy 27.94 363.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5a8205dd-c19d-403d-9ae8-7fcac9775762")
	)
	(wire
		(pts
			(xy 170.18 355.6) (xy 144.78 355.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5a97c656-d7f6-46c8-a162-b24e3050779f")
	)
	(wire
		(pts
			(xy 208.28 233.68) (xy 208.28 236.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5ab47f7a-07ee-4ad7-81f5-2e4ddd58c33d")
	)
	(wire
		(pts
			(xy 419.1 223.52) (xy 416.56 223.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5abefb0c-9c50-4f0e-9abc-5956910dc540")
	)
	(polyline
		(pts
			(xy 134.62 162.56) (xy 236.22 162.56)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "5b7e7226-ebfb-4f73-88b5-baf8bbe23f25")
	)
	(wire
		(pts
			(xy 123.19 320.04) (xy 139.7 320.04)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5c31530e-8f4a-4f4c-b0bf-7bbb99d37899")
	)
	(polyline
		(pts
			(xy 261.62 332.74) (xy 302.895 332.74)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "5c4c664b-ae98-4a92-8344-b3411e45b411")
	)
	(wire
		(pts
			(xy 177.8 81.28) (xy 177.8 86.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5cba995a-8bf3-4728-9444-c28ce1b923ae")
	)
	(wire
		(pts
			(xy 114.3 233.68) (xy 144.78 233.68)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5ced64c9-043c-44ac-ab55-63314c51cae4")
	)
	(wire
		(pts
			(xy 185.42 83.82) (xy 182.88 83.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5d1d9c15-d214-462c-b008-13672de12863")
	)
	(wire
		(pts
			(xy 485.14 116.84) (xy 495.3 116.84)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5d3dad31-cc38-4bb5-9b84-f06984297658")
	)
	(wire
		(pts
			(xy 129.54 190.5) (xy 129.54 200.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5d42ea90-f069-480c-9ebc-eecea4a3e058")
	)
	(polyline
		(pts
			(xy 576.58 226.06) (xy 459.74 226.06)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "5dc08e26-9a7d-4f68-a331-c806655f635f")
	)
	(wire
		(pts
			(xy 109.22 86.36) (xy 96.52 86.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5e42e894-3fc8-461d-b62f-6ce163df0b4c")
	)
	(polyline
		(pts
			(xy 452.12 17.78) (xy 248.92 17.78)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "5e49553a-cc5b-4cea-9105-39586761d678")
	)
	(wire
		(pts
			(xy 182.88 86.36) (xy 182.88 104.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5e97805f-bbd7-4f39-a242-cb845ad9a7c0")
	)
	(wire
		(pts
			(xy 195.58 236.22) (xy 180.34 236.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5ea0698b-5c13-4707-8e02-c0c76f9c7ff5")
	)
	(wire
		(pts
			(xy 139.7 187.96) (xy 144.78 187.96)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5fae97b4-548f-452a-948e-2a39a98c5c97")
	)
	(wire
		(pts
			(xy 474.98 58.42) (xy 495.3 58.42)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "5fc8b4f7-4731-42e4-8b9f-ec719cdd1aac")
	)
	(wire
		(pts
			(xy 121.92 177.8) (xy 124.46 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "604e5681-ec04-4aba-a3d5-f3687a7d393c")
	)
	(wire
		(pts
			(xy 185.42 378.46) (xy 203.2 378.46)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "607d06a8-0a42-47af-9128-ecea0a395a3d")
	)
	(wire
		(pts
			(xy 27.94 337.82) (xy 22.86 337.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6099afb3-2318-4258-9e94-228d68cdf08e")
	)
	(polyline
		(pts
			(xy 205.74 345.44) (xy 205.74 361.315)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "60c18a84-e5a2-4493-9632-dea5ba8efdde")
	)
	(wire
		(pts
			(xy 281.94 208.28) (xy 281.94 215.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "61215a8d-a1e4-44bc-9abe-eb0712c0282b")
	)
	(polyline
		(pts
			(xy 576.58 137.16) (xy 576.58 73.66)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "61715bbe-357c-4775-996f-87601f6c01cb")
	)
	(wire
		(pts
			(xy 198.12 142.24) (xy 205.74 142.24)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6227ea21-8fbc-48dd-a609-5761a0c26969")
	)
	(wire
		(pts
			(xy 322.58 215.9) (xy 314.96 215.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "631fcc6a-6e6a-4af2-9202-bc9c42a3f228")
	)
	(wire
		(pts
			(xy 185.42 226.06) (xy 231.14 226.06)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "63a3b3f6-23fa-4b2c-a5bf-e6c891be2b58")
	)
	(wire
		(pts
			(xy 78.74 233.68) (xy 76.2 233.68)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "63cf6de5-8465-48f6-8289-33321e65e512")
	)
	(wire
		(pts
			(xy 266.7 238.76) (xy 281.94 238.76)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "641434ee-81a3-4e74-bfda-f47a58e10153")
	)
	(wire
		(pts
			(xy 487.68 43.18) (xy 495.3 43.18)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "642d2b85-9175-4ce6-bc17-3e374338bacf")
	)
	(polyline
		(pts
			(xy 236.22 162.56) (xy 236.22 124.46)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "645428d1-d3a7-471f-bf1f-d8ee8cc26188")
	)
	(wire
		(pts
			(xy 320.04 218.44) (xy 314.96 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6459da90-9c7a-43f6-b410-7c6de6fdb4d2")
	)
	(wire
		(pts
			(xy 132.08 254) (xy 134.62 254)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6468b33c-623a-44ab-a023-bb94ea81fc54")
	)
	(wire
		(pts
			(xy 43.18 163.83) (xy 43.18 167.64)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "650855fd-f10a-4217-86fb-1cde9e38b938")
	)
	(wire
		(pts
			(xy 276.86 215.9) (xy 276.86 208.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "66123bc4-80ba-4074-98aa-7f040303ed36")
	)
	(wire
		(pts
			(xy 73.66 226.06) (xy 109.22 226.06)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "668e0e88-cbc2-44dc-92d7-f4f7750d553e")
	)
	(wire
		(pts
			(xy 73.66 358.14) (xy 73.66 360.68)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "66d94d69-d4a2-4fa5-8855-71628ca240ce")
	)
	(wire
		(pts
			(xy 490.22 243.84) (xy 490.22 246.38)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "672ad552-0a60-4456-9903-8ac26a90deb8")
	)
	(wire
		(pts
			(xy 180.34 198.12) (xy 190.5 198.12)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "67787125-c376-48ad-a0b6-1502c42b7df1")
	)
	(wire
		(pts
			(xy 500.38 276.86) (xy 467.36 276.86)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "679931a6-d14b-41fa-b43a-288cf7020003")
	)
	(wire
		(pts
			(xy 27.94 360.68) (xy 27.94 363.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "67bf8f77-ae76-4642-ba39-8feab9c39dc0")
	)
	(wire
		(pts
			(xy 43.18 149.86) (xy 43.18 152.4)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "68e1aa3d-966a-4782-883a-279d3b689b63")
	)
	(wire
		(pts
			(xy 226.06 231.14) (xy 203.2 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "68f70426-ded9-4890-856d-94abf02f9875")
	)
	(wire
		(pts
			(xy 208.28 370.84) (xy 208.28 373.38)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "694a83aa-bd48-4c4e-8263-d9e6b90ff2bd")
	)
	(wire
		(pts
			(xy 99.06 358.14) (xy 73.66 358.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6952370d-42c7-424d-8e00-88ab9a2cc97b")
	)
	(wire
		(pts
			(xy 269.24 231.14) (xy 276.86 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6993847c-1b91-4528-84c8-29c9e03d8866")
	)
	(wire
		(pts
			(xy 96.52 96.52) (xy 96.52 93.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6a4bebd6-fe34-4ad4-9aa4-ad01ada375a6")
	)
	(polyline
		(pts
			(xy 408.432 386.08) (xy 408.432 396.24)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "6a508187-0fb6-45da-97e3-5c67006712f5")
	)
	(wire
		(pts
			(xy 104.14 325.12) (xy 115.57 325.12)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6a9fdf96-8887-4034-8cf6-f1c48719356e")
	)
	(polyline
		(pts
			(xy 248.92 137.16) (xy 452.12 137.16)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "6aa16cd3-a780-4024-8cea-38d1f160ec04")
	)
	(wire
		(pts
			(xy 485.14 96.52) (xy 490.22 96.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6b5e0441-ed8a-4160-88fc-6b59bbedb044")
	)
	(wire
		(pts
			(xy 27.94 340.36) (xy 27.94 337.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6beb0fd8-0bbb-41a8-b64c-3bbf3a52d467")
	)
	(polyline
		(pts
			(xy 370.967 386.08) (xy 370.967 396.24)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "6c13e6ad-4260-409f-a76b-45388628c274")
	)
	(wire
		(pts
			(xy 416.56 208.28) (xy 398.78 208.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6c6fa753-9d64-44d3-a618-c9c01f372a3e")
	)
	(wire
		(pts
			(xy 139.7 337.82) (xy 152.4 337.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6c748476-f97b-472d-827a-d85565258e6c")
	)
	(polyline
		(pts
			(xy 17.78 17.78) (xy 17.78 111.76)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "6c9f1427-f673-4537-9afb-a786bddb220f")
	)
	(wire
		(pts
			(xy 83.82 335.28) (xy 101.6 335.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6cb14ca7-fa2d-4abd-8485-9c5236537d6f")
	)
	(wire
		(pts
			(xy 281.94 251.46) (xy 281.94 248.92)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6d0b4c1b-a79e-48fc-96c1-b08f3b265e9d")
	)
	(wire
		(pts
			(xy 337.82 215.9) (xy 337.82 213.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6d3e3424-39a8-4ebe-8e2f-f49b46e56bca")
	)
	(wire
		(pts
			(xy 134.62 190.5) (xy 134.62 200.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6d7f661b-4276-4656-a98f-f9063ef9138e")
	)
	(wire
		(pts
			(xy 497.84 96.52) (xy 533.4 96.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6dd79854-8c74-4adf-9993-1215fe10cb61")
	)
	(wire
		(pts
			(xy 411.48 218.44) (xy 416.56 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6edf3ce1-2c08-450c-8c7b-59c7ac2025e3")
	)
	(wire
		(pts
			(xy 386.08 111.76) (xy 424.18 111.76)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "6f3743f9-86bb-4c15-86dd-901354352e48")
	)
	(wire
		(pts
			(xy 81.28 213.36) (xy 119.38 213.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7071a4c9-c85a-4ff6-8e04-680627166027")
	)
	(wire
		(pts
			(xy 73.66 167.64) (xy 73.66 170.18)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "70772b8e-8b6d-4660-9c89-eb85dbb01833")
	)
	(wire
		(pts
			(xy 337.82 213.36) (xy 330.2 213.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7109619a-d91e-4564-b46e-976b1a4b8e5e")
	)
	(wire
		(pts
			(xy 398.78 228.6) (xy 365.76 228.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "71444163-eec2-4672-934e-ad3115eb42db")
	)
	(wire
		(pts
			(xy 203.2 236.22) (xy 208.28 236.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "715f7e66-5f79-41fe-a183-a868a62946a3")
	)
	(wire
		(pts
			(xy 386.08 88.9) (xy 436.88 88.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "71a2c197-41b8-44cc-a1a0-8f064c55f7a0")
	)
	(wire
		(pts
			(xy 119.38 187.96) (xy 119.38 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "71ecc141-aa5b-4908-93bc-4d936fb797d9")
	)
	(wire
		(pts
			(xy 386.08 83.82) (xy 436.88 83.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "723c606f-689e-4022-9d71-4222face393f")
	)
	(polyline
		(pts
			(xy 261.62 314.96) (xy 302.895 314.96)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "723d4356-8725-403f-9405-40c9ef8b654c")
	)
	(wire
		(pts
			(xy 180.34 190.5) (xy 187.96 190.5)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "725b7a44-1840-45a1-ac8c-0a0ed814b945")
	)
	(wire
		(pts
			(xy 144.78 190.5) (xy 144.78 187.96)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "72b1368f-e170-4cf6-a9e3-5fe1d6bcc2f3")
	)
	(wire
		(pts
			(xy 22.86 337.82) (xy 22.86 363.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "72f4c56a-9e56-4cd7-a1d7-5958e0d20a2a")
	)
	(wire
		(pts
			(xy 116.84 187.96) (xy 116.84 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "734b443e-ae7a-4ff0-b8d4-f0ef97c4afa6")
	)
	(bus
		(pts
			(xy 439.42 81.28) (xy 439.42 83.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "73a43b10-273d-430f-bb14-ba6034967561")
	)
	(bus
		(pts
			(xy 464.82 187.96) (xy 464.82 190.5)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "740158fc-cd1f-4101-8795-a72a650abf69")
	)
	(wire
		(pts
			(xy 180.34 226.06) (xy 185.42 226.06)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "74228f4b-1cb8-4cb7-a4aa-6c2ffbb59de0")
	)
	(wire
		(pts
			(xy 104.14 195.58) (xy 104.14 228.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7479dee7-714f-467d-a3ff-56179ee89bb4")
	)
	(wire
		(pts
			(xy 548.64 111.76) (xy 556.26 111.76)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "74a0b590-90be-4305-b215-a7cc4203aeaf")
	)
	(wire
		(pts
			(xy 139.7 175.26) (xy 144.78 175.26)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "760d956a-acb3-472a-bf44-d6372d45c7d5")
	)
	(wire
		(pts
			(xy 284.48 76.2) (xy 284.48 83.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "765312a1-30c5-4b61-b5a8-3e1cb56c340c")
	)
	(wire
		(pts
			(xy 383.54 218.44) (xy 383.54 220.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "76d2f160-6585-48d7-8da5-3bd0c43fe26f")
	)
	(wire
		(pts
			(xy 144.78 73.66) (xy 144.78 86.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "76f9262a-de31-4fb0-9941-0a88fc4c7588")
	)
	(wire
		(pts
			(xy 215.9 83.82) (xy 220.98 83.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "77fa7394-280e-4832-8b48-2337ab172e26")
	)
	(wire
		(pts
			(xy 142.24 236.22) (xy 149.86 236.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7836bded-a52d-4e95-9533-d0f0ccb725fb")
	)
	(wire
		(pts
			(xy 50.8 60.96) (xy 25.4 60.96)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "787e66d7-3088-427b-ad4c-899025519b7e")
	)
	(polyline
		(pts
			(xy 576.58 66.04) (xy 576.58 17.78)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "788fd888-64b1-41a4-8e75-97b1f863d3d9")
	)
	(polyline
		(pts
			(xy 248.92 297.18) (xy 452.12 297.18)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "78d32ed5-7a7e-42af-82b9-7856de59e180")
	)
	(wire
		(pts
			(xy 119.38 228.6) (xy 134.62 228.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "78d5e4f6-06b6-4521-8e93-971509536bc8")
	)
	(wire
		(pts
			(xy 177.8 73.66) (xy 177.8 81.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "78eddea7-d761-41cf-a220-761f0cb82575")
	)
	(wire
		(pts
			(xy 292.1 215.9) (xy 294.64 215.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "790359fa-624c-4583-90df-d28c14645395")
	)
	(wire
		(pts
			(xy 533.4 99.06) (xy 533.4 101.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "79638b9b-8baf-449b-a017-b32e88bdf096")
	)
	(wire
		(pts
			(xy 43.18 167.64) (xy 43.18 172.72)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "796fff77-9add-41b7-9510-2c6d3883af6d")
	)
	(wire
		(pts
			(xy 170.18 360.68) (xy 170.18 358.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "79d766d0-8d9d-4c41-baf6-4d1a1111a1bb")
	)
	(polyline
		(pts
			(xy 459.74 332.74) (xy 576.58 332.74)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "79e9ccb5-3188-4a58-9a5b-8b45ffff47c4")
	)
	(bus
		(pts
			(xy 467.36 162.56) (xy 464.82 160.02)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7ab5da59-c13a-43de-874d-a828b19ede0b")
	)
	(wire
		(pts
			(xy 139.7 187.96) (xy 139.7 190.5)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7ae4bf11-e751-44e9-b718-820ea91a627c")
	)
	(wire
		(pts
			(xy 88.9 170.18) (xy 142.24 170.18)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7b4e55d3-1168-45f3-b365-bb901e8775a4")
	)
	(wire
		(pts
			(xy 116.84 195.58) (xy 116.84 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7be798c7-ada0-4d38-8d8d-65ae7cfd4c7f")
	)
	(wire
		(pts
			(xy 294.64 218.44) (xy 292.1 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7c09b0b5-8661-491e-b637-180eba6bebb3")
	)
	(wire
		(pts
			(xy 160.02 337.82) (xy 231.14 337.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7d07d752-2759-4097-bc94-55b833b62f40")
	)
	(wire
		(pts
			(xy 185.42 53.34) (xy 185.42 50.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7d098203-ab70-487f-957a-7419f0b09a3f")
	)
	(wire
		(pts
			(xy 124.46 185.42) (xy 124.46 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7d0e96a6-2bac-4d6e-9154-63c17c3caeea")
	)
	(wire
		(pts
			(xy 467.36 195.58) (xy 500.38 195.58)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7d599867-db65-4579-9d6a-fa17aa6a116a")
	)
	(bus
		(pts
			(xy 439.42 45.72) (xy 439.42 48.26)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7db88c8f-ef50-4b16-b80d-adb85268e3e9")
	)
	(wire
		(pts
			(xy 515.62 269.24) (xy 520.7 269.24)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7e4753a9-af46-4f6f-8562-e6331083fc0b")
	)
	(wire
		(pts
			(xy 180.34 195.58) (xy 190.5 195.58)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7ecffe39-3ece-4e4c-9e60-7a96936f2636")
	)
	(wire
		(pts
			(xy 129.54 177.8) (xy 142.24 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7effd3fc-0f43-4cba-8938-5ed9ed810211")
	)
	(polyline
		(pts
			(xy 17.78 111.76) (xy 241.3 111.76)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "7f062119-e13f-4c9d-a12e-63ad09334584")
	)
	(polyline
		(pts
			(xy 241.3 119.38) (xy 241.3 266.7)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "7f0ae54c-7e45-405e-9834-579e7dec9d4e")
	)
	(wire
		(pts
			(xy 312.42 203.2) (xy 307.34 203.2)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7f33e2c4-a54b-4ac8-b041-f1cca0915fd7")
	)
	(wire
		(pts
			(xy 104.14 228.6) (xy 111.76 228.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "7fab2f6b-b1c7-437a-8d6c-284bcbdb5163")
	)
	(wire
		(pts
			(xy 88.9 177.8) (xy 81.28 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "80c98c37-fee0-4639-a1eb-427a1c071242")
	)
	(wire
		(pts
			(xy 134.62 200.66) (xy 139.7 200.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "80f6d847-985f-43ab-b27b-c8b7b0a43de5")
	)
	(wire
		(pts
			(xy 142.24 177.8) (xy 142.24 182.88)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8179cfc4-657b-4731-bbc2-e13748afe4b9")
	)
	(wire
		(pts
			(xy 35.56 154.94) (xy 35.56 149.86)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "818ef610-6a08-477d-a143-0643d75f05a0")
	)
	(wire
		(pts
			(xy 50.8 363.22) (xy 60.96 363.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "81d65a14-1dfb-45bd-9b95-90edc8392fdb")
	)
	(polyline
		(pts
			(xy 459.74 73.66) (xy 459.74 137.16)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "8258544d-0bd3-4d04-b537-dbffc425de3e")
	)
	(wire
		(pts
			(xy 167.64 316.23) (xy 167.64 313.69)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8259d6e8-88d0-4bfa-903f-982f7d80c42b")
	)
	(wire
		(pts
			(xy 378.46 231.14) (xy 370.84 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "82739d5a-33cb-4d2b-8fc9-14733af1c6a4")
	)
	(wire
		(pts
			(xy 281.94 238.76) (xy 281.94 241.3)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8315c12b-d5e5-49c1-a6bd-aa70b3e5ba2f")
	)
	(polyline
		(pts
			(xy 353.187 348.234) (xy 403.987 348.234)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "83526e25-b03e-4dd6-a34c-7828b971e98c")
	)
	(polyline
		(pts
			(xy 224.155 350.52) (xy 224.155 361.315)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "83dc130a-8091-4c70-877f-fcb765d06fd9")
	)
	(wire
		(pts
			(xy 416.56 223.52) (xy 416.56 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "83e5865d-4dec-4691-b6ad-0a5f7952aa43")
	)
	(bus
		(pts
			(xy 439.42 83.82) (xy 439.42 86.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "844272c5-136a-4d6a-8a59-f1444ef26dfa")
	)
	(wire
		(pts
			(xy 78.74 337.82) (xy 76.2 337.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "84561eef-0db6-471a-afb3-07c87b0adbee")
	)
	(wire
		(pts
			(xy 556.26 109.22) (xy 515.62 109.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "84d4e5a1-7aeb-4b3b-aa55-dbec9696c816")
	)
	(wire
		(pts
			(xy 88.9 38.1) (xy 88.9 48.26)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8581a632-e989-4a14-8444-21c6046cd5a4")
	)
	(wire
		(pts
			(xy 200.66 185.42) (xy 223.52 185.42)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "85945d55-b766-44e9-8dbd-cc35392e7a8e")
	)
	(wire
		(pts
			(xy 208.28 386.08) (xy 231.14 386.08)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "86a2fed3-6c60-4ade-8c5b-b96ba5495ed6")
	)
	(wire
		(pts
			(xy 325.12 215.9) (xy 325.12 217.17)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "86b00562-0114-4ec9-a6f3-965bf921ff95")
	)
	(wire
		(pts
			(xy 327.66 208.28) (xy 340.36 208.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "86fd7ce3-db9e-4ca3-a5e8-1314e3637897")
	)
	(wire
		(pts
			(xy 322.58 220.98) (xy 342.9 220.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "87137333-adbf-4d85-80b9-8bfc1afd0e38")
	)
	(wire
		(pts
			(xy 109.22 243.84) (xy 109.22 254)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "871e221e-7e7f-4cea-ab36-221697a0e92a")
	)
	(polyline
		(pts
			(xy 332.867 368.3) (xy 391.922 368.3)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "8721fc28-4324-4bbe-abd3-7fd35cffb31e")
	)
	(wire
		(pts
			(xy 157.48 27.94) (xy 157.48 73.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "87533538-c3e7-43b3-9055-6b2695ddfd39")
	)
	(wire
		(pts
			(xy 185.42 40.64) (xy 190.5 40.64)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "875749da-0cef-4ca3-ae86-0f471789a67a")
	)
	(wire
		(pts
			(xy 144.78 187.96) (xy 149.86 187.96)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "87dfc775-2917-485e-b177-91fc49778e40")
	)
	(polyline
		(pts
			(xy 332.867 365.76) (xy 391.922 365.76)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "87f4101f-6991-478f-be77-ff445142f1ac")
	)
	(polyline
		(pts
			(xy 229.87 361.315) (xy 205.74 361.315)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "880efe48-d0ea-43ee-a259-e840cdf77b2b")
	)
	(wire
		(pts
			(xy 25.4 30.48) (xy 25.4 48.26)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "881db3ca-3856-4f88-a212-2121718ba734")
	)
	(polyline
		(pts
			(xy 353.187 344.297) (xy 403.987 344.297)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "88b5615b-dfb8-4366-8c1e-b5ba595fb63d")
	)
	(wire
		(pts
			(xy 144.78 200.66) (xy 144.78 195.58)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "88d7ad4a-20ab-45f7-af29-9d5353176953")
	)
	(wire
		(pts
			(xy 78.74 355.6) (xy 73.66 355.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "88eacf49-9935-49d0-bfbd-7110ef609114")
	)
	(polyline
		(pts
			(xy 459.74 144.78) (xy 459.74 218.44)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "8917623a-c0b3-411b-acb5-f942e5e8bf0d")
	)
	(wire
		(pts
			(xy 73.66 355.6) (xy 73.66 358.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "89197890-10fa-4277-a9f2-f8a92d44ad2f")
	)
	(wire
		(pts
			(xy 474.98 43.18) (xy 480.06 43.18)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "89373ac7-ad1a-486e-8b07-7deabc7b8ab9")
	)
	(wire
		(pts
			(xy 284.48 223.52) (xy 281.94 223.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "896cc43e-bf28-4e60-8b74-78a7b1bdbdcd")
	)
	(wire
		(pts
			(xy 398.78 220.98) (xy 398.78 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "89bb0731-9944-49e3-a80e-cea46b91c3b3")
	)
	(bus
		(pts
			(xy 439.42 119.38) (xy 439.42 121.92)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8a0dfce3-34fe-4943-a51c-75f260d0d6b2")
	)
	(bus
		(pts
			(xy 439.42 86.36) (xy 439.42 111.76)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8a895596-932d-40cc-a831-c912247f99da")
	)
	(wire
		(pts
			(xy 429.26 208.28) (xy 441.96 208.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8ae13a34-4c4e-4c4e-be7c-381aaebe5ed4")
	)
	(wire
		(pts
			(xy 50.8 190.5) (xy 71.12 190.5)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8b6adab6-a45a-4c80-903f-237c86d16633")
	)
	(wire
		(pts
			(xy 386.08 127) (xy 436.88 127)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8bba2f87-99b1-4477-a65f-2d1f9ee44925")
	)
	(wire
		(pts
			(xy 269.24 231.14) (xy 269.24 220.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8bdfd23d-905e-4229-8eb4-fb4cd17ab049")
	)
	(wire
		(pts
			(xy 96.52 73.66) (xy 104.14 73.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8be9878d-8703-4adb-b707-c82b94e31b6a")
	)
	(wire
		(pts
			(xy 411.48 220.98) (xy 411.48 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8c3889d1-8e2a-472b-b0b1-e135512a108c")
	)
	(wire
		(pts
			(xy 134.62 223.52) (xy 121.92 223.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8cd52009-991d-4d87-b3a0-704e3ada1fa9")
	)
	(wire
		(pts
			(xy 287.02 50.8) (xy 292.1 50.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8d01709c-58ba-44be-8c2a-91b5db4627e0")
	)
	(wire
		(pts
			(xy 223.52 185.42) (xy 226.06 185.42)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8d32a88e-338c-4c16-8f75-1a3c5cf606e1")
	)
	(wire
		(pts
			(xy 109.22 180.34) (xy 109.22 215.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8d5af19e-f2d6-48a7-8cd9-0f7667aa14bc")
	)
	(wire
		(pts
			(xy 500.38 269.24) (xy 492.76 269.24)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8db1c968-6b5c-4aec-aef9-a54231914048")
	)
	(polyline
		(pts
			(xy 55.88 231.14) (xy 55.88 205.74)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "8dda1f65-ded5-48b1-92da-b1ac259b6c28")
	)
	(wire
		(pts
			(xy 411.48 226.06) (xy 411.48 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8e0a8fd6-ad0c-4e0c-b3ff-6a5a9538bab9")
	)
	(wire
		(pts
			(xy 533.4 96.52) (xy 533.4 99.06)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8e0ca64e-3f76-4f62-be76-2d78e8b760d2")
	)
	(wire
		(pts
			(xy 123.19 325.12) (xy 167.64 325.12)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8e215ce4-dacb-4e30-9a78-6213cefb5ec0")
	)
	(wire
		(pts
			(xy 327.66 218.44) (xy 327.66 208.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8e3a3674-2d3b-4bcd-b583-ce781556a0b8")
	)
	(wire
		(pts
			(xy 386.08 99.06) (xy 424.18 99.06)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8e7e5b7e-15aa-49c7-accf-37ab6401890f")
	)
	(wire
		(pts
			(xy 170.18 66.04) (xy 170.18 73.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8ea848d2-edd7-4121-9486-31fa1fdeec91")
	)
	(wire
		(pts
			(xy 73.66 228.6) (xy 104.14 228.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8f1ca2c4-f5c6-48b6-a15d-e3b589acb3ea")
	)
	(wire
		(pts
			(xy 160.02 365.76) (xy 162.56 365.76)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8f89b918-4843-4b46-90e7-53b50dca0795")
	)
	(wire
		(pts
			(xy 185.42 177.8) (xy 185.42 175.26)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8fc53c64-4269-4bdf-b3d3-81b61155d3e5")
	)
	(polyline
		(pts
			(xy 274.32 314.96) (xy 274.32 391.16)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "8fe85402-8e72-450a-af5b-cff00c169d7c")
	)
	(wire
		(pts
			(xy 144.78 254) (xy 144.78 233.68)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "8ff1d414-fcef-44c1-a226-446e7526af92")
	)
	(polyline
		(pts
			(xy 241.3 401.32) (xy 241.3 297.18)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "903259a7-5a0e-481c-b89f-23354311c203")
	)
	(wire
		(pts
			(xy 111.76 195.58) (xy 111.76 228.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "9208164e-9d59-43ab-a3d2-c34d5790dead")
	)
	(wire
		(pts
			(xy 73.66 246.38) (xy 81.28 246.38)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "92e7387b-c359-4384-a9ad-192adbb33dfd")
	)
	(wire
		(pts
			(xy 568.96 190.5) (xy 546.1 190.5)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "9358e834-89b2-422f-b41f-331c2775e184")
	)
	(wire
		(pts
			(xy 170.18 342.9) (xy 170.18 340.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "93628792-3ab5-4ea6-ac06-e5919e7d3e4e")
	)
	(polyline
		(pts
			(xy 576.58 73.66) (xy 459.74 73.66)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "93860b78-8bed-44a0-9529-f32c3046ae41")
	)
	(bus
		(pts
			(xy 464.82 274.32) (xy 464.82 276.86)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "943d50fb-67dc-45ea-b4c0-ecbdabf68710")
	)
	(wire
		(pts
			(xy 170.18 358.14) (xy 149.86 358.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "94a8f4da-fdce-4744-8573-e95d63140810")
	)
	(polyline
		(pts
			(xy 353.187 324.231) (xy 403.987 324.231)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "950afb15-e25d-45a5-9f32-9c93dd5fd20a")
	)
	(wire
		(pts
			(xy 490.22 246.38) (xy 490.22 256.54)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "95aca56c-f55b-4a81-8fd2-dcfb9361d5d6")
	)
	(bus
		(pts
			(xy 571.5 180.34) (xy 571.5 182.88)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "95d38937-fe4d-4c7f-aa45-253ee8616144")
	)
	(wire
		(pts
			(xy 467.36 200.66) (xy 500.38 200.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "96265c14-9133-43ed-9348-486f64fde7c7")
	)
	(wire
		(pts
			(xy 281.94 259.08) (xy 281.94 261.62)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "965e15d0-b84b-49f5-9930-3c6eb8ad4ee7")
	)
	(wire
		(pts
			(xy 383.54 218.44) (xy 383.54 213.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "9686207c-28a6-4a59-a3a2-10f8e95d2655")
	)
	(polyline
		(pts
			(xy 459.74 226.06) (xy 459.74 289.56)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "968df0dd-b647-4799-a1f2-87cd713b4200")
	)
	(wire
		(pts
			(xy 78.74 200.66) (xy 78.74 205.74)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "96fc5471-37ec-499f-b840-55a85e66fc4a")
	)
	(wire
		(pts
			(xy 441.96 215.9) (xy 441.96 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "973289f9-9d6d-44a4-89a7-27d25000070b")
	)
	(bus
		(pts
			(xy 441.96 35.56) (xy 462.28 35.56)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "9753298b-68ef-4994-8313-78042df3de99")
	)
	(wire
		(pts
			(xy 276.86 208.28) (xy 281.94 208.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "97a6a19a-a0b6-4b0b-a643-19395fd63b80")
	)
	(wire
		(pts
			(xy 492.76 269.24) (xy 492.76 246.38)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "97be8be4-b8cb-42c6-a726-4c9edcb67a4e")
	)
	(wire
		(pts
			(xy 568.96 198.12) (xy 546.1 198.12)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "98b573df-ad37-4d4d-9079-9817bac4c85b")
	)
	(wire
		(pts
			(xy 203.2 83.82) (xy 203.2 86.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "98dbe055-9b56-428f-9f0c-6222453f87ff")
	)
	(wire
		(pts
			(xy 185.42 213.36) (xy 231.14 213.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "996c17c9-4265-4100-a676-6cf72d057cc0")
	)
	(wire
		(pts
			(xy 185.42 231.14) (xy 195.58 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "99e4175e-7d6d-43f0-b0f9-f9153129fe6a")
	)
	(wire
		(pts
			(xy 101.6 328.93) (xy 101.6 335.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "9a7fd39c-c768-4ef5-bf8f-b945dc3b12ad")
	)
	(wire
		(pts
			(xy 223.52 203.2) (xy 223.52 205.74)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "9ab7645e-e6e5-40e2-a38e-db208a6d4907")
	)
	(wire
		(pts
			(xy 121.92 172.72) (xy 116.84 172.72)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "9aca5a35-58f9-4bbc-9828-b461c0825ffe")
	)
	(wire
		(pts
			(xy 63.5 149.86) (xy 63.5 170.18)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "9b1fef14-0757-456b-9396-47949c073b10")
	)
	(wire
		(pts
			(xy 223.52 198.12) (xy 226.06 198.12)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "9b423f7c-e432-4052-9e4f-77a21535c865")
	)
	(wire
		(pts
			(xy 83.82 337.82) (xy 104.14 337.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "9cb06c36-23b2-4689-a501-f3079931eae1")
	)
	(wire
		(pts
			(xy 180.34 205.74) (xy 190.5 205.74)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "9d73bf80-4762-42c0-8f16-24b7cc2ba8c5")
	)
	(wire
		(pts
			(xy 266.7 231.14) (xy 269.24 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "9d87c0be-3b03-4a0d-a263-2b4e8575e6dd")
	)
	(wire
		(pts
			(xy 546.1 200.66) (xy 568.96 200.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "9e541812-72d7-4cf9-9875-ddfb04ef0777")
	)
	(polyline
		(pts
			(xy 452.12 401.32) (xy 452.12 297.18)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "9e7e2682-568b-45b6-92dc-a6af979b38d6")
	)
	(wire
		(pts
			(xy 320.04 203.2) (xy 325.12 203.2)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "9ecf7cc8-c6a5-4bb3-96d9-a90097f5b8fb")
	)
	(wire
		(pts
			(xy 190.5 40.64) (xy 190.5 43.18)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "9f4b68bd-278b-477e-a42c-3a3505d23e16")
	)
	(polyline
		(pts
			(xy 302.895 396.24) (xy 261.62 396.24)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "a01b216d-d51f-41fa-9d45-1d108f6356e5")
	)
	(wire
		(pts
			(xy 568.96 203.2) (xy 546.1 203.2)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a06c0dc1-d11a-4cb6-b481-5094b00a029b")
	)
	(polyline
		(pts
			(xy 17.78 119.38) (xy 17.78 289.56)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "a09ad56e-88ed-4dd6-a18a-77a64e7f94a6")
	)
	(wire
		(pts
			(xy 43.18 167.64) (xy 35.56 167.64)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a0a69b4c-03c7-4e10-8ba2-80313d51e184")
	)
	(wire
		(pts
			(xy 386.08 231.14) (xy 403.86 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a0d3da65-bdfc-4ce6-a316-9cfcaa321bee")
	)
	(wire
		(pts
			(xy 435.61 226.06) (xy 441.96 226.06)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a1852acf-c628-4e8a-bbad-301091fa3d50")
	)
	(polyline
		(pts
			(xy 459.74 368.3) (xy 576.58 368.3)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "a1f9f1cb-1e72-43d9-848d-57d94745c0e8")
	)
	(wire
		(pts
			(xy 185.42 149.86) (xy 170.18 149.86)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a22d8ce1-d274-4bfd-b212-4e8da13f2d03")
	)
	(wire
		(pts
			(xy 142.24 177.8) (xy 149.86 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a321ce29-bab2-4156-b159-46dbb5a1604e")
	)
	(wire
		(pts
			(xy 132.08 337.82) (xy 139.7 337.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a35e2919-a62d-4230-82af-51cbc4f0c7c6")
	)
	(polyline
		(pts
			(xy 101.6 266.7) (xy 256.54 266.7)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "a3a3033d-1513-4dc3-a1c3-77d1fdcf72a4")
	)
	(wire
		(pts
			(xy 441.96 205.74) (xy 441.96 208.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a51c5811-54f6-4396-ad71-53c5b24b8131")
	)
	(polyline
		(pts
			(xy 576.58 144.78) (xy 459.74 144.78)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "a527980a-4f46-4221-872a-2082fa9c9d17")
	)
	(wire
		(pts
			(xy 386.08 48.26) (xy 436.88 48.26)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a546b2dc-c002-4830-a5ab-fb9b4a22bc67")
	)
	(wire
		(pts
			(xy 325.12 208.28) (xy 327.66 208.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a557e1d9-ea4b-4587-882c-9488d1a2b40c")
	)
	(polyline
		(pts
			(xy 344.297 378.46) (xy 344.297 383.54)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "a5d3a228-2c0d-4a29-8eab-d89d8f6d0d35")
	)
	(wire
		(pts
			(xy 185.42 45.72) (xy 185.42 40.64)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a5e6fcec-7984-4eb6-836a-26f83cc3dba9")
	)
	(wire
		(pts
			(xy 180.34 213.36) (xy 185.42 213.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a64ea8e4-5c0c-4d2d-9e73-f3576ad225ee")
	)
	(polyline
		(pts
			(xy 256.54 266.7) (xy 256.54 185.42)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "a6b2fe4e-26bb-401a-b67b-c7741c1b40ff")
	)
	(wire
		(pts
			(xy 467.36 119.38) (xy 533.4 119.38)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a73c4cda-f7f9-4d34-9217-325f9fa8e2c5")
	)
	(wire
		(pts
			(xy 83.82 355.6) (xy 101.6 355.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a742c052-46a9-4827-9a7f-766935c46ff5")
	)
	(wire
		(pts
			(xy 88.9 30.48) (xy 88.9 38.1)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a7bdd833-11ad-4468-8101-04e36717b3d5")
	)
	(polyline
		(pts
			(xy 17.78 297.18) (xy 241.3 297.18)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "a8a2ca29-3225-4369-bbb0-c2a4ae3ca684")
	)
	(wire
		(pts
			(xy 233.68 76.2) (xy 233.68 81.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a8b3e6a0-0c9b-4de2-bb5e-9e24f63bb0bd")
	)
	(wire
		(pts
			(xy 76.2 342.9) (xy 106.68 342.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a9115114-8868-4bbb-bb51-c0f383b51742")
	)
	(wire
		(pts
			(xy 177.8 38.1) (xy 177.8 58.42)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a91d1052-d590-4634-87a2-e9598eb2dabe")
	)
	(wire
		(pts
			(xy 132.08 241.3) (xy 132.08 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a91ff493-f1a1-416b-9eb6-366c3083f576")
	)
	(bus
		(pts
			(xy 439.42 53.34) (xy 439.42 55.88)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "a9dc3ad3-78ad-4090-a466-a4c518230ec4")
	)
	(wire
		(pts
			(xy 101.6 320.04) (xy 115.57 320.04)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "aa124659-4111-4d4e-9e94-dc295fa662fa")
	)
	(wire
		(pts
			(xy 66.04 328.93) (xy 101.6 328.93)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "aa1660bc-bd81-4fa9-9dd1-c69f78cc7645")
	)
	(wire
		(pts
			(xy 441.96 223.52) (xy 441.96 226.06)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ab12d8cc-45c8-4727-8a7e-b80649ce44b6")
	)
	(wire
		(pts
			(xy 76.2 236.22) (xy 76.2 238.76)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ab48b6bb-8437-4056-802a-2c383e0315d8")
	)
	(wire
		(pts
			(xy 109.22 226.06) (xy 109.22 238.76)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ab5ab251-8872-41d6-b408-498ea9493e94")
	)
	(wire
		(pts
			(xy 525.78 58.42) (xy 505.46 58.42)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ab5d54d3-58fc-4121-b63e-287a63743917")
	)
	(wire
		(pts
			(xy 101.6 360.68) (xy 106.68 360.68)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "abf80ada-b25a-4e2a-bfca-6b979f3184cc")
	)
	(wire
		(pts
			(xy 353.06 228.6) (xy 353.06 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "abfe00a4-e428-4804-b856-f1daacec4ab8")
	)
	(polyline
		(pts
			(xy 261.62 355.6) (xy 302.895 355.6)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "ac55aeab-1aa2-4a7e-87c4-ab154bf6ba38")
	)
	(wire
		(pts
			(xy 149.86 347.98) (xy 152.4 347.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ac679367-1c92-4d21-90a7-bc2d4305fe46")
	)
	(wire
		(pts
			(xy 398.78 218.44) (xy 403.86 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ad33af5a-396c-4663-b11d-e64b6d5407b8")
	)
	(wire
		(pts
			(xy 386.08 50.8) (xy 436.88 50.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ad40325c-9866-4b8f-ba07-54545143cd2e")
	)
	(wire
		(pts
			(xy 467.36 274.32) (xy 490.22 274.32)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ad42adb0-47e5-4398-a169-14de1e41cb87")
	)
	(wire
		(pts
			(xy 284.48 218.44) (xy 281.94 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ad487a81-5d9c-44c4-b843-89cc0274c5a1")
	)
	(wire
		(pts
			(xy 200.66 195.58) (xy 226.06 195.58)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ad5ec11d-4614-423d-ac82-16945ad62858")
	)
	(wire
		(pts
			(xy 190.5 218.44) (xy 185.42 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ad944d67-ddf3-4048-9c6a-7c9b96baab2b")
	)
	(bus
		(pts
			(xy 464.82 198.12) (xy 464.82 200.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ae2d52a0-41b3-4a87-8c50-083e055399c7")
	)
	(wire
		(pts
			(xy 287.02 53.34) (xy 287.02 55.88)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ae495a9d-c1e1-451a-834e-1398862d4ee8")
	)
	(wire
		(pts
			(xy 139.7 200.66) (xy 144.78 200.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "aebe3817-4236-423b-995c-45c82e8617d6")
	)
	(wire
		(pts
			(xy 177.8 137.16) (xy 139.7 137.16)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "aee53fa4-891d-47c4-ba0c-9f550653959e")
	)
	(wire
		(pts
			(xy 78.74 360.68) (xy 73.66 360.68)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "aef727e1-f0c7-47fc-a391-26df6791e422")
	)
	(wire
		(pts
			(xy 177.8 81.28) (xy 182.88 81.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "b0bf6286-9e43-49d1-ac43-1242339be6b2")
	)
	(wire
		(pts
			(xy 190.5 149.86) (xy 205.74 149.86)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "b1b07c51-52aa-4b8b-aeff-eae760418e05")
	)
	(wire
		(pts
			(xy 284.48 68.58) (xy 284.48 76.2)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "b1cda553-15d1-4f41-bf59-9424334c636a")
	)
	(bus
		(pts
			(xy 464.82 185.42) (xy 464.82 187.96)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "b2807db9-d449-4a55-9490-0d954dd64ea6")
	)
	(bus
		(pts
			(xy 464.82 116.84) (xy 464.82 160.02)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "b2baaae1-3ebe-4291-959a-03d7df8b78b2")
	)
	(wire
		(pts
			(xy 88.9 104.14) (xy 88.9 91.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "b2ce75fd-0bb0-43e7-9d15-7e68e0661dfa")
	)
	(wire
		(pts
			(xy 76.2 48.26) (xy 88.9 48.26)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "b2e6f377-5b06-4637-93d0-f599de2c3d4a")
	)
	(polyline
		(pts
			(xy 55.88 231.14) (xy 101.6 231.14)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "b34f54a2-f23c-497a-89ed-0fb59036e14a")
	)
	(wire
		(pts
			(xy 508 109.22) (xy 467.36 109.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "b36c37f4-29c0-42d1-94db-608d6c954aa2")
	)
	(wire
		(pts
			(xy 124.46 190.5) (xy 124.46 200.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "b3b97158-29df-47ba-980a-bcaa7770fd0e")
	)
	(polyline
		(pts
			(xy 261.62 396.24) (xy 261.62 309.88)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "b3faa3cd-b8a1-4e24-b250-82023b32e476")
	)
	(wire
		(pts
			(xy 403.86 227.33) (xy 403.86 228.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "b40131bf-2171-4883-8e18-8e89cc656b03")
	)
	(polyline
		(pts
			(xy 372.872 360.045) (xy 372.872 365.76)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "b474e96e-c06f-47b0-be47-bc6c33599580")
	)
	(wire
		(pts
			(xy 101.6 320.04) (xy 101.6 317.5)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "b6646bdc-a460-468e-8f2e-5669f14faeb3")
	)
	(wire
		(pts
			(xy 167.64 335.28) (xy 231.14 335.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "b6b80703-609e-48f5-a496-f314f49773da")
	)
	(wire
		(pts
			(xy 60.96 355.6) (xy 60.96 363.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "b763e32b-7891-4781-97d4-66744dce8049")
	)
	(bus
		(pts
			(xy 464.82 106.68) (xy 464.82 116.84)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "b7a171d5-ca94-435a-8732-58a8325b5e74")
	)
	(wire
		(pts
			(xy 180.34 210.82) (xy 231.14 210.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "b85f262a-7b9c-49d1-8cb4-45e0e10ed521")
	)
	(polyline
		(pts
			(xy 332.867 360.045) (xy 391.922 360.045)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "b9f56092-3103-41ec-b310-8e6536657843")
	)
	(wire
		(pts
			(xy 187.96 190.5) (xy 231.14 190.5)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ba14a90e-97da-47f8-b2c6-e45f8210898a")
	)
	(wire
		(pts
			(xy 386.08 124.46) (xy 436.88 124.46)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "bbbf5656-6014-4716-8f32-8766fedf9fbb")
	)
	(wire
		(pts
			(xy 337.82 218.44) (xy 340.36 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "bc6a4f5f-8e10-48a6-998a-e5f484225856")
	)
	(wire
		(pts
			(xy 180.34 170.18) (xy 231.14 170.18)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "bc6d99a0-3295-4b33-9918-31523aa91c12")
	)
	(wire
		(pts
			(xy 500.38 198.12) (xy 467.36 198.12)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "bca8490d-f419-4669-8cda-b234127016a0")
	)
	(wire
		(pts
			(xy 25.4 104.14) (xy 25.4 91.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "bcba1326-3977-4cd3-bc3e-d1fcb22cab80")
	)
	(polyline
		(pts
			(xy 332.867 370.84) (xy 391.922 370.84)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "bcf7c063-7786-4dcc-bd80-38c4fbadeae0")
	)
	(bus
		(pts
			(xy 439.42 114.3) (xy 439.42 116.84)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "bd2175fa-7c59-48f7-af79-da9309d9c8a3")
	)
	(wire
		(pts
			(xy 208.28 83.82) (xy 203.2 83.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "bd3b6f74-081c-41da-9571-aad0e0f048ae")
	)
	(bus
		(pts
			(xy 571.5 187.96) (xy 571.5 190.5)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "be03f810-37f8-42da-8bd8-1f73e914e118")
	)
	(wire
		(pts
			(xy 556.26 99.06) (xy 535.94 99.06)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "be051c2e-6803-47cf-91e5-10d56cc92557")
	)
	(wire
		(pts
			(xy 528.32 43.18) (xy 541.02 43.18)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "bf2509e1-ec3a-4208-8c7a-8276b54e92c0")
	)
	(wire
		(pts
			(xy 78.74 335.28) (xy 76.2 335.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "bf683a95-4dba-44e7-bc37-2b2995225928")
	)
	(wire
		(pts
			(xy 505.46 114.3) (xy 556.26 114.3)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "bf6c5dee-1f41-49f3-bfb3-e5b89260b085")
	)
	(wire
		(pts
			(xy 180.34 193.04) (xy 185.42 193.04)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "bfd813a7-bda0-4417-b910-a6bdb0b9449d")
	)
	(wire
		(pts
			(xy 398.78 226.06) (xy 398.78 228.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c05b0e77-3d0a-46df-8ee4-b3c9ccedd6b2")
	)
	(bus
		(pts
			(xy 464.82 38.1) (xy 464.82 96.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c07c2bdb-cb5a-4da2-81e5-1e73a72030c9")
	)
	(wire
		(pts
			(xy 106.68 177.8) (xy 109.22 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c093675e-2e60-4289-aca7-6acfd7c0aab3")
	)
	(wire
		(pts
			(xy 109.22 180.34) (xy 109.22 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c0960e7d-abdd-4f4b-8758-7ff3f0b31725")
	)
	(polyline
		(pts
			(xy 372.872 383.54) (xy 372.872 378.46)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "c113957c-4b94-4a14-a8b2-9ff0012c576c")
	)
	(wire
		(pts
			(xy 500.38 279.4) (xy 467.36 279.4)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c1323ef0-1fe0-472f-933d-ad2b1334f922")
	)
	(wire
		(pts
			(xy 114.3 223.52) (xy 114.3 233.68)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c1b02bb3-8899-4d92-9349-38591f7e073c")
	)
	(wire
		(pts
			(xy 284.48 48.26) (xy 292.1 48.26)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c2408705-9530-479d-81a3-b2d343727a61")
	)
	(polyline
		(pts
			(xy 332.867 386.08) (xy 424.942 386.08)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "c38a139b-c133-4299-912a-0d5de908e7d7")
	)
	(wire
		(pts
			(xy 60.96 355.6) (xy 38.1 355.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c4323f5e-56cc-4d58-9860-9fbac97bf2f1")
	)
	(wire
		(pts
			(xy 467.36 190.5) (xy 500.38 190.5)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c4474f83-e0a1-446f-b52e-8240adeb7600")
	)
	(wire
		(pts
			(xy 167.64 325.12) (xy 167.64 335.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c4b34c21-a981-4f7b-95a7-fc2cdf562777")
	)
	(wire
		(pts
			(xy 281.94 251.46) (xy 320.04 251.46)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c4e2d737-eeab-4844-b7e1-f4e17e13868a")
	)
	(wire
		(pts
			(xy 535.94 124.46) (xy 556.26 124.46)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c52a968c-765d-4811-acbf-707383b19a32")
	)
	(wire
		(pts
			(xy 495.3 106.68) (xy 495.3 104.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c5d65e50-5200-4615-90a8-3a53f95408bd")
	)
	(polyline
		(pts
			(xy 353.187 336.677) (xy 403.987 336.677)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "c648e1fd-b611-4805-be71-0a9d93311fe6")
	)
	(polyline
		(pts
			(xy 452.12 144.78) (xy 452.12 289.56)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "c652f6b5-f3f2-41ef-9ba6-52e3b69c6a64")
	)
	(wire
		(pts
			(xy 121.92 213.36) (xy 121.92 220.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c666690b-7fb7-4e76-8954-d9f93b82f75e")
	)
	(wire
		(pts
			(xy 378.46 220.98) (xy 383.54 220.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c692b51f-2775-40a3-b646-c933f6695444")
	)
	(wire
		(pts
			(xy 208.28 370.84) (xy 231.14 370.84)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c6f80b10-241a-4470-ac00-96886ff9ce2e")
	)
	(wire
		(pts
			(xy 340.36 215.9) (xy 340.36 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c78eb728-6b45-486b-a90e-f39f0ee12838")
	)
	(wire
		(pts
			(xy 500.38 185.42) (xy 487.68 185.42)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c87a8e16-e2c7-48ee-93e6-9a4138b3bf6b")
	)
	(wire
		(pts
			(xy 546.1 271.78) (xy 568.96 271.78)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c881456e-011e-4e53-904d-4a751281b888")
	)
	(wire
		(pts
			(xy 104.14 180.34) (xy 109.22 180.34)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c8e593bc-97d7-4e43-8b3b-8421e11d37b7")
	)
	(wire
		(pts
			(xy 111.76 228.6) (xy 111.76 236.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c8ff3bce-f235-4797-9118-34bcddc5e353")
	)
	(wire
		(pts
			(xy 144.78 355.6) (xy 144.78 365.76)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c94ae6fe-5f8b-485b-bd44-0538617c23ce")
	)
	(wire
		(pts
			(xy 314.96 223.52) (xy 317.5 223.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c98d3f67-5788-4181-962a-d0fa0b23c041")
	)
	(wire
		(pts
			(xy 88.9 170.18) (xy 88.9 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c9cbd066-5b36-4f1c-a1ab-e1c54bb7103b")
	)
	(wire
		(pts
			(xy 185.42 185.42) (xy 185.42 193.04)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "c9cfa6d6-b184-4828-9e75-604ed956f60a")
	)
	(polyline
		(pts
			(xy 205.74 350.52) (xy 229.87 350.52)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "ca113872-b5fa-4c9d-8add-b86e0a6bfb74")
	)
	(polyline
		(pts
			(xy 459.74 340.36) (xy 459.74 368.3)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "ca6590ab-20a1-468a-9d14-c9562b741b2e")
	)
	(wire
		(pts
			(xy 363.22 218.44) (xy 383.54 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "cad24f3e-0f75-4fb9-a3cd-2d613d69a505")
	)
	(wire
		(pts
			(xy 284.48 68.58) (xy 292.1 68.58)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "caf782b1-38e5-4e28-8973-f0b50e115c7b")
	)
	(wire
		(pts
			(xy 416.56 208.28) (xy 416.56 205.74)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "cb474bbf-a191-495c-849a-4dce6a57f5d0")
	)
	(wire
		(pts
			(xy 485.14 111.76) (xy 485.14 114.3)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "cb9013fb-fcae-4eb4-b346-a507ee303cd7")
	)
	(wire
		(pts
			(xy 81.28 205.74) (xy 81.28 213.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "cbc69590-5eec-4d25-afed-ec1b2dcbf89c")
	)
	(wire
		(pts
			(xy 83.82 360.68) (xy 101.6 360.68)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "cbce8981-8e13-4d64-8b54-2c45a2e044d4")
	)
	(polyline
		(pts
			(xy 248.92 289.56) (xy 452.12 289.56)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "cc009908-9445-4086-9043-9f9519f00ac4")
	)
	(wire
		(pts
			(xy 116.84 231.14) (xy 132.08 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "cc13190a-62af-44ef-ba47-3b29bcc7f54a")
	)
	(wire
		(pts
			(xy 304.8 228.6) (xy 304.8 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "cc1bd76e-9eb2-4086-9e8d-095e5196513b")
	)
	(wire
		(pts
			(xy 142.24 170.18) (xy 149.86 170.18)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "cc371671-bc2a-4937-9b1b-eade5e614cf3")
	)
	(wire
		(pts
			(xy 528.32 271.78) (xy 515.62 271.78)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "cc6eed90-4df0-46ae-9e22-d09762260632")
	)
	(wire
		(pts
			(xy 317.5 223.52) (xy 317.5 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ccce2a54-6e20-4757-9288-2e199d1883db")
	)
	(wire
		(pts
			(xy 60.96 43.18) (xy 66.04 43.18)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ccde1b8d-a08f-4d71-a147-9dea6e070d0b")
	)
	(wire
		(pts
			(xy 205.74 142.24) (xy 213.36 142.24)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "cd2171ab-f68c-4f15-bfd4-e381b692cf1f")
	)
	(bus
		(pts
			(xy 464.82 200.66) (xy 464.82 269.24)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "cd4a4706-ef5a-4f3a-ac83-9dab9a4977c5")
	)
	(wire
		(pts
			(xy 119.38 195.58) (xy 119.38 213.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "cde2cc35-354a-44e0-a5a3-7226d89e1890")
	)
	(wire
		(pts
			(xy 170.18 142.24) (xy 177.8 142.24)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "cded4249-08a0-426b-92a1-0a6ed89ea8d0")
	)
	(wire
		(pts
			(xy 386.08 91.44) (xy 424.18 91.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "cef2090b-6544-481b-b174-d2bebb936679")
	)
	(wire
		(pts
			(xy 543.56 246.38) (xy 546.1 246.38)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "cf83770f-4161-4667-9c68-227fb3440d61")
	)
	(wire
		(pts
			(xy 35.56 144.78) (xy 35.56 149.86)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "cfc61d95-ea1c-4807-8f9d-0f0feb69f01a")
	)
	(wire
		(pts
			(xy 165.1 142.24) (xy 170.18 142.24)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "cfd4d7fb-8c12-48c8-9ae3-6771b75a1439")
	)
	(wire
		(pts
			(xy 101.6 205.74) (xy 101.6 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d01605a1-48f2-4043-b3ac-6d1639c4399d")
	)
	(wire
		(pts
			(xy 266.7 261.62) (xy 281.94 261.62)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d06dd746-3884-45d0-9bd6-2ad1a3141407")
	)
	(wire
		(pts
			(xy 541.02 264.16) (xy 541.02 274.32)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d17543ff-d18a-40e1-a4cc-21122e50eefc")
	)
	(wire
		(pts
			(xy 543.56 279.4) (xy 568.96 279.4)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d1bd3f09-7242-4e58-acd0-715b3cfcad03")
	)
	(wire
		(pts
			(xy 170.18 54.61) (xy 170.18 38.1)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d1dfa98f-c437-4cf8-b7c1-99975b917f38")
	)
	(wire
		(pts
			(xy 160.02 335.28) (xy 167.64 335.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d254cb10-1115-4cf9-b2a2-98b0ca2a9a40")
	)
	(wire
		(pts
			(xy 25.4 149.86) (xy 35.56 149.86)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d265a62b-13d3-40d8-993f-6b65375971a5")
	)
	(wire
		(pts
			(xy 190.5 187.96) (xy 187.96 187.96)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d27a0630-c4c3-437f-af52-b6bce5153ecb")
	)
	(wire
		(pts
			(xy 386.08 93.98) (xy 424.18 93.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d2ed7af9-b65e-433d-837c-1f63ca66a5e8")
	)
	(polyline
		(pts
			(xy 459.74 340.36) (xy 576.58 340.36)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "d2f81746-40af-471d-bf40-517ed9eff7e3")
	)
	(wire
		(pts
			(xy 76.2 48.26) (xy 76.2 60.96)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d44ce004-14c0-4dc3-ba9e-fd6094084442")
	)
	(polyline
		(pts
			(xy 353.187 329.057) (xy 403.987 329.057)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "d4726ab5-58c1-4d5c-8c49-d48279b187e1")
	)
	(wire
		(pts
			(xy 76.2 195.58) (xy 76.2 223.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d476be23-7ab1-45c2-83d3-7b635046915d")
	)
	(wire
		(pts
			(xy 284.48 88.9) (xy 284.48 104.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d49aa8b5-c2e3-410a-93a3-f01a11e897a2")
	)
	(wire
		(pts
			(xy 25.4 156.21) (xy 25.4 149.86)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d4e5cc15-0498-4267-8ff1-177e8b88e85b")
	)
	(wire
		(pts
			(xy 134.62 182.88) (xy 134.62 185.42)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d5861e2f-c063-4ae6-bd6a-bd2a283c125b")
	)
	(wire
		(pts
			(xy 170.18 149.86) (xy 170.18 142.24)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d5b24cbc-26fb-4bff-b2e5-c31a4d049278")
	)
	(polyline
		(pts
			(xy 302.895 309.88) (xy 302.895 396.24)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "d62984be-0000-41c6-bd20-c02e87cb811b")
	)
	(wire
		(pts
			(xy 416.56 208.28) (xy 424.18 208.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d629b434-c284-4c05-ba39-205eef6c3654")
	)
	(wire
		(pts
			(xy 363.22 223.52) (xy 365.76 223.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d69c7b5e-869e-4949-b4d7-86a55303033e")
	)
	(wire
		(pts
			(xy 73.66 243.84) (xy 81.28 243.84)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d6fbbe17-7a50-4e25-8716-e3bb69dbb10f")
	)
	(wire
		(pts
			(xy 505.46 101.6) (xy 530.86 101.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d71fbd1d-ae48-4bf6-ae3d-69e866b14e16")
	)
	(wire
		(pts
			(xy 76.2 238.76) (xy 86.36 238.76)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d72b68b5-80e5-4ba2-a1d5-9a4784ed2e6e")
	)
	(bus
		(pts
			(xy 439.42 78.74) (xy 439.42 81.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d7431dba-afbe-45c8-94ed-b73ea74a9365")
	)
	(wire
		(pts
			(xy 144.78 187.96) (xy 144.78 175.26)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d7d8d3d3-f8b3-4f12-a2c3-8bdfa1a63502")
	)
	(wire
		(pts
			(xy 220.98 53.34) (xy 220.98 50.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d8d94ec5-aa31-4528-b6fd-36b19d9ba7b2")
	)
	(polyline
		(pts
			(xy 391.922 375.92) (xy 391.922 358.14)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "d93a7ece-8264-43e4-853b-7145d75c5edf")
	)
	(wire
		(pts
			(xy 530.86 104.14) (xy 546.1 104.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d956a15a-484e-4d44-822d-a3a50b5e63b2")
	)
	(bus
		(pts
			(xy 439.42 111.76) (xy 439.42 114.3)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "d99bcaa0-4ec1-4fca-8cb5-d89bd1eca680")
	)
	(wire
		(pts
			(xy 88.9 48.26) (xy 88.9 55.88)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "da10e001-3e22-43b5-bb25-280a9a00bb83")
	)
	(wire
		(pts
			(xy 568.96 185.42) (xy 546.1 185.42)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "da370a94-4429-4a3d-ae49-959ca83f8ff5")
	)
	(wire
		(pts
			(xy 226.06 88.9) (xy 226.06 104.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "da521a6d-47a4-4ea7-9dbf-27b412ad85a6")
	)
	(wire
		(pts
			(xy 386.08 119.38) (xy 436.88 119.38)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "da9399e6-2c52-41bd-8729-7a8c83d1762f")
	)
	(wire
		(pts
			(xy 485.14 88.9) (xy 485.14 93.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "daab826f-c577-4359-8b30-9eac60b21599")
	)
	(wire
		(pts
			(xy 220.98 81.28) (xy 226.06 81.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "dab48de2-c7cb-4ce7-aab3-9a333233766f")
	)
	(bus
		(pts
			(xy 571.5 193.04) (xy 571.5 195.58)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "db270ac4-474e-472a-980b-d224692c090d")
	)
	(wire
		(pts
			(xy 441.96 241.3) (xy 441.96 246.38)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "db325a39-9ad9-45ed-9c32-35d11c2c78bc")
	)
	(wire
		(pts
			(xy 38.1 347.98) (xy 106.68 347.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "dc110f98-33fe-4c2d-8b06-a0fab0439522")
	)
	(wire
		(pts
			(xy 281.94 218.44) (xy 281.94 223.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "dceb380f-edfe-478c-97c5-367e5970dd3a")
	)
	(polyline
		(pts
			(xy 332.867 383.54) (xy 424.942 383.54)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "dced4e77-b0a8-41fe-834f-a25c43ed931c")
	)
	(polyline
		(pts
			(xy 290.83 314.96) (xy 290.83 391.16)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "dd09bc43-2ca0-486a-98ca-cb0d7cdc6ed5")
	)
	(wire
		(pts
			(xy 121.92 203.2) (xy 121.92 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "dd350f24-82af-4fd4-b853-a4b9d279ed09")
	)
	(wire
		(pts
			(xy 386.08 55.88) (xy 436.88 55.88)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "dd554dd9-d8af-4548-9915-de14540b6dde")
	)
	(wire
		(pts
			(xy 81.28 195.58) (xy 76.2 195.58)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "dd71b157-e9d1-4936-9251-4d5031c318b6")
	)
	(wire
		(pts
			(xy 157.48 73.66) (xy 165.1 73.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "de3579aa-2dd5-4034-8185-146488b19c41")
	)
	(wire
		(pts
			(xy 490.22 246.38) (xy 492.76 246.38)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "de3923cc-8791-4833-bec4-14ed8983552f")
	)
	(wire
		(pts
			(xy 208.28 236.22) (xy 210.82 236.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "de4e4434-1933-4c54-a6f6-644a257e55a7")
	)
	(polyline
		(pts
			(xy 459.74 66.04) (xy 576.58 66.04)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "dec03b24-9239-4220-ac1f-485434ac61e0")
	)
	(wire
		(pts
			(xy 129.54 200.66) (xy 134.62 200.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "dfc2a34d-ec0d-49f3-9030-3b471661c2e2")
	)
	(polyline
		(pts
			(xy 248.92 17.78) (xy 248.92 137.16)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "e01258c2-72f1-4638-bdf6-ca26e0dc498b")
	)
	(wire
		(pts
			(xy 505.46 111.76) (xy 533.4 111.76)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e0bde9bd-0a5a-403c-bf51-57a1a08da685")
	)
	(wire
		(pts
			(xy 386.08 116.84) (xy 436.88 116.84)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e10998dd-4931-4c07-9e57-6589474aaedb")
	)
	(polyline
		(pts
			(xy 20.32 205.74) (xy 20.32 279.4)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "e1895603-0d36-4da7-9a1c-54d40f7dab60")
	)
	(wire
		(pts
			(xy 220.98 40.64) (xy 236.22 40.64)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e2008e64-04d5-48ae-a2f4-22fe36d205d0")
	)
	(wire
		(pts
			(xy 144.78 342.9) (xy 144.78 355.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e25fd4f9-e8e7-46b2-85ab-9f23d2a8c7f3")
	)
	(wire
		(pts
			(xy 304.8 208.28) (xy 325.12 208.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e29ec9c2-17fa-426d-ad8e-f223e1fe7eb8")
	)
	(wire
		(pts
			(xy 495.3 104.14) (xy 497.84 104.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e328b15e-1f89-473b-99f2-d245fde7b77f")
	)
	(wire
		(pts
			(xy 340.36 213.36) (xy 342.9 213.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e32c0236-7cd6-4dd1-bd0a-d141f596078d")
	)
	(wire
		(pts
			(xy 170.18 370.84) (xy 170.18 378.46)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e413f2f7-f664-4cc6-aa5d-f5b102af2e26")
	)
	(wire
		(pts
			(xy 411.48 241.3) (xy 411.48 246.38)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e47c364b-e278-4647-92dc-9f9df1eb1e8f")
	)
	(wire
		(pts
			(xy 25.4 161.29) (xy 25.4 167.64)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e4c5bc2f-b19e-437f-baaa-b4d4c19d198b")
	)
	(wire
		(pts
			(xy 76.2 223.52) (xy 114.3 223.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e50096fe-5b29-4ee6-8a58-c51981b0f242")
	)
	(wire
		(pts
			(xy 386.08 121.92) (xy 436.88 121.92)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e5274e97-e18a-4e48-bf0c-209dc538ffe3")
	)
	(wire
		(pts
			(xy 104.14 337.82) (xy 104.14 325.12)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e5beb990-9620-4920-b6af-67cb3c79f838")
	)
	(polyline
		(pts
			(xy 236.22 124.46) (xy 134.62 124.46)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "e7298b4a-541c-4a37-af7f-eef26e76c2f7")
	)
	(wire
		(pts
			(xy 30.48 340.36) (xy 30.48 337.82)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e7d732e1-b18b-4a02-820b-da92fbe5dbf9")
	)
	(wire
		(pts
			(xy 320.04 251.46) (xy 320.04 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e7dfa83b-8de1-4fa5-9d31-813e26e2f086")
	)
	(wire
		(pts
			(xy 449.58 218.44) (xy 449.58 208.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e7ed512c-4fbd-47d6-bdde-1b08bb8e8299")
	)
	(wire
		(pts
			(xy 132.08 335.28) (xy 152.4 335.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e7ee1aa3-10e9-4202-a2f0-66c1c2d2abea")
	)
	(wire
		(pts
			(xy 438.15 215.9) (xy 441.96 215.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e861bdea-d2f5-4ae8-9f36-57fabb986363")
	)
	(wire
		(pts
			(xy 144.78 365.76) (xy 152.4 365.76)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e909aba7-9784-4f7c-b592-4bb85c420a8f")
	)
	(wire
		(pts
			(xy 144.78 233.68) (xy 149.86 233.68)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e94ae45b-f91f-4b34-8935-f7f3f62380fd")
	)
	(wire
		(pts
			(xy 435.61 226.06) (xy 434.34 226.06)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e971fa25-1f5c-4a76-b658-16802a7facbc")
	)
	(bus
		(pts
			(xy 571.5 200.66) (xy 571.5 269.24)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "e993fc9c-bc48-4db1-83ea-3155c393bda8")
	)
	(wire
		(pts
			(xy 325.12 203.2) (xy 325.12 208.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ead9eade-0151-4179-ada7-53eb23059085")
	)
	(wire
		(pts
			(xy 403.86 228.6) (xy 403.86 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "eb3b3b2a-4bce-4480-ac7c-2e4d7afcffcc")
	)
	(polyline
		(pts
			(xy 459.74 297.18) (xy 576.58 297.18)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "eb9e5e31-8df6-4394-858a-cd9cfe69e87a")
	)
	(wire
		(pts
			(xy 137.16 91.44) (xy 129.54 91.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ebd7a65d-2b72-4397-a0f7-1297dd4ae091")
	)
	(wire
		(pts
			(xy 546.1 93.98) (xy 546.1 104.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ec405d44-fe09-49fd-b717-b0b7d5cd76c8")
	)
	(wire
		(pts
			(xy 144.78 200.66) (xy 149.86 200.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ed4c57bc-0244-4c2d-a779-db6cd7ce688b")
	)
	(wire
		(pts
			(xy 185.42 86.36) (xy 182.88 86.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "edb74187-5c5b-4f49-abbf-e65e15a67a7e")
	)
	(bus
		(pts
			(xy 571.5 195.58) (xy 571.5 198.12)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "edecedd5-44ee-4b27-a50a-073f6ec6a8da")
	)
	(wire
		(pts
			(xy 190.5 40.64) (xy 205.74 40.64)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ee112bf0-0fdf-440f-86dc-a42a9b931737")
	)
	(polyline
		(pts
			(xy 20.32 279.4) (xy 426.72 279.4)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "ee6de7a7-2a17-4483-93be-1f5397bad945")
	)
	(wire
		(pts
			(xy 38.1 350.52) (xy 106.68 350.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ee9ec7da-7013-43f7-afc9-db69a66f3e7d")
	)
	(wire
		(pts
			(xy 185.42 233.68) (xy 190.5 233.68)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "eeb32b08-89d4-445c-bbc1-76e946db5a77")
	)
	(wire
		(pts
			(xy 116.84 177.8) (xy 119.38 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ef186148-41a9-4778-be6b-b77ef1a96971")
	)
	(wire
		(pts
			(xy 198.12 137.16) (xy 231.14 137.16)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ef20a419-9bcb-402b-b21d-f1bdf992173b")
	)
	(wire
		(pts
			(xy 386.08 101.6) (xy 424.18 101.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ef370ea3-658b-47f3-991f-da1ff135621c")
	)
	(wire
		(pts
			(xy 121.92 223.52) (xy 121.92 238.76)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ef5461d4-5f51-422a-b5b9-71f7d1cf9262")
	)
	(wire
		(pts
			(xy 116.84 218.44) (xy 116.84 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f0955d68-dd3c-421e-97b9-3ce294f1e0bd")
	)
	(wire
		(pts
			(xy 281.94 208.28) (xy 304.8 208.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f0afc765-b310-4c8b-86ce-7dd586afb740")
	)
	(wire
		(pts
			(xy 487.68 182.88) (xy 500.38 182.88)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f1932205-26d2-4997-b1ca-056625a02815")
	)
	(wire
		(pts
			(xy 226.06 218.44) (xy 200.66 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f1db55c5-23df-486c-a6e4-003f6ef9ab6f")
	)
	(wire
		(pts
			(xy 170.18 340.36) (xy 180.34 340.36)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f1ee3e57-fdda-441f-b587-eeb4eaf1d5c6")
	)
	(wire
		(pts
			(xy 528.32 48.26) (xy 528.32 43.18)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f2280e9f-3c60-4430-9ed3-3ea42f231057")
	)
	(wire
		(pts
			(xy 109.22 96.52) (xy 96.52 96.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f33270f8-8503-4bee-8eed-cce0a41c0e76")
	)
	(wire
		(pts
			(xy 543.56 264.16) (xy 543.56 279.4)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f35eaf04-eb86-4c90-9d73-2d7cbadd56b4")
	)
	(wire
		(pts
			(xy 142.24 248.92) (xy 142.24 254)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f3e80ae8-675b-41ff-848e-1563c56336b6")
	)
	(wire
		(pts
			(xy 124.46 177.8) (xy 129.54 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f4acd352-981c-4b2c-95c3-dfe9f58594f6")
	)
	(wire
		(pts
			(xy 180.34 175.26) (xy 185.42 175.26)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f4ae41e2-6e37-4cbf-b2f7-7f38c2032737")
	)
	(polyline
		(pts
			(xy 248.92 279.4) (xy 248.92 289.56)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "f4b5d987-3ce9-43d9-ba97-ad1342d5e936")
	)
	(wire
		(pts
			(xy 139.7 200.66) (xy 139.7 195.58)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f4bc065d-efdc-45f2-86a4-57aeab15352c")
	)
	(polyline
		(pts
			(xy 101.6 231.14) (xy 101.6 266.7)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "f571cba0-37e7-4684-b3bf-6b842915efcf")
	)
	(wire
		(pts
			(xy 435.61 218.44) (xy 435.61 226.06)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f5ad48d8-c7e0-4772-b34d-39ad6447a855")
	)
	(wire
		(pts
			(xy 386.08 53.34) (xy 436.88 53.34)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f5b3ad66-2411-40c5-ba6f-aa6faddd3f69")
	)
	(wire
		(pts
			(xy 220.98 27.94) (xy 220.98 30.48)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f6017f03-1197-4540-9916-756246a480b1")
	)
	(wire
		(pts
			(xy 269.24 208.28) (xy 269.24 215.9)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f65158d3-7657-4be8-bc8e-820a114ccbe9")
	)
	(wire
		(pts
			(xy 73.66 233.68) (xy 76.2 233.68)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f68dbb00-d3de-4b63-b80c-46fbbd75ba9b")
	)
	(wire
		(pts
			(xy 416.56 218.44) (xy 416.56 208.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f6a5d858-ceef-4c98-a020-dd3b45bf5f00")
	)
	(wire
		(pts
			(xy 114.3 187.96) (xy 114.3 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f6d195de-ac3a-4ab7-85f1-9044adbeeeed")
	)
	(wire
		(pts
			(xy 485.14 101.6) (xy 485.14 111.76)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f6f7d53f-77f8-48a2-8fa1-fe094ac062b2")
	)
	(wire
		(pts
			(xy 386.08 81.28) (xy 436.88 81.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f724b2f3-09ed-4ba6-a91a-b30e337f2eb4")
	)
	(wire
		(pts
			(xy 226.06 220.98) (xy 200.66 220.98)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f79e44fc-bf1f-4560-9316-64334ce59949")
	)
	(wire
		(pts
			(xy 386.08 109.22) (xy 424.18 109.22)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f7d645c2-20bf-4a68-9cc6-c94ebf8f4d8a")
	)
	(bus
		(pts
			(xy 439.42 48.26) (xy 439.42 50.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f8358de4-98a1-4757-8212-9d5c94dbbe9a")
	)
	(wire
		(pts
			(xy 386.08 58.42) (xy 436.88 58.42)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f87fbbd2-5986-47f5-88a4-4e4267864755")
	)
	(wire
		(pts
			(xy 269.24 208.28) (xy 276.86 208.28)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "f98396bd-91a5-4134-95f8-04b7e70827ea")
	)
	(polyline
		(pts
			(xy 403.987 319.151) (xy 403.987 348.361)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "fa2adb7f-764e-44e4-9404-a3fea82e9114")
	)
	(polyline
		(pts
			(xy 332.867 378.46) (xy 424.942 378.46)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "fa761d9a-e308-4211-969f-5abfa01d3f9b")
	)
	(polyline
		(pts
			(xy 379.857 324.231) (xy 379.857 348.361)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "fa7b76f6-0132-45d3-955f-6942c46fb98a")
	)
	(wire
		(pts
			(xy 111.76 187.96) (xy 111.76 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "fac1d6f5-0967-4f68-b329-706d0fe7f22d")
	)
	(wire
		(pts
			(xy 109.22 177.8) (xy 111.76 177.8)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "fba00263-5e22-46e8-ad99-1627a47eec58")
	)
	(wire
		(pts
			(xy 485.14 96.52) (xy 485.14 101.6)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "fbac0e38-2e31-4885-a275-59bf0db58f6a")
	)
	(polyline
		(pts
			(xy 576.58 297.18) (xy 576.58 332.74)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "fbf92544-a739-4646-a20a-9ee12e889e89")
	)
	(wire
		(pts
			(xy 121.92 73.66) (xy 114.3 73.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "fc3b3675-dd58-433a-997f-c90a7724b612")
	)
	(polyline
		(pts
			(xy 344.297 360.045) (xy 344.297 365.76)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "fccf4990-3900-43b3-b79b-aa2f80095bb3")
	)
	(wire
		(pts
			(xy 403.86 218.44) (xy 411.48 218.44)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "fcf2f068-6e67-4a21-a4a2-ca1cfc61b69b")
	)
	(polyline
		(pts
			(xy 332.867 396.24) (xy 424.942 396.24)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "fd35e4f8-a0e2-4a65-81fa-4ddb7a9af4a0")
	)
	(bus
		(pts
			(xy 571.5 185.42) (xy 571.5 187.96)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "fd5488bb-a875-4553-aec9-621b2e3283a0")
	)
	(wire
		(pts
			(xy 535.94 132.08) (xy 535.94 124.46)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "fd5bcc42-488f-41e8-aeaa-0fad1d3cfe11")
	)
	(bus
		(pts
			(xy 571.5 177.8) (xy 571.5 180.34)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "fdae03ab-3415-4ed0-a3a0-007931e644a3")
	)
	(bus
		(pts
			(xy 568.96 162.56) (xy 467.36 162.56)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "fdde21f2-7335-45eb-bc19-b4d65f41c2ee")
	)
	(wire
		(pts
			(xy 505.46 116.84) (xy 556.26 116.84)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "fdee7aa6-1dcb-4c42-af84-25ba4c160e0f")
	)
	(wire
		(pts
			(xy 304.8 231.14) (xy 281.94 231.14)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "fe91c621-120f-4fe2-b39f-d68128f614fc")
	)
	(polyline
		(pts
			(xy 332.867 363.22) (xy 391.922 363.22)
		)
		(stroke
			(width 0)
			(type dash)
		)
		(uuid "fea38cf0-a7a4-4a61-8739-c9c782c6a400")
	)
	(wire
		(pts
			(xy 73.66 223.52) (xy 76.2 223.52)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "fed42b23-e086-4dc3-b495-29f375d09877")
	)
	(wire
		(pts
			(xy 73.66 170.18) (xy 88.9 170.18)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ff34c6e8-f165-49c1-9652-d55a49062229")
	)
	(wire
		(pts
			(xy 129.54 73.66) (xy 137.16 73.66)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "ffa30aa2-8d8f-482d-987c-19335b3bb488")
	)
	(wire
		(pts
			(xy 386.08 106.68) (xy 424.18 106.68)
		)
		(stroke
			(width 0)
			(type default)
		)
		(uuid "fffd847d-49ba-4a46-89c3-10da6a5d45f6")
	)
	(image
		(at 492.125 381)
		(scale 0.9)
		(uuid "64ee1743-bf56-46b7-a0e4-c2966ad00e9d")
		(data "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"
			"Z78GJWTcXrmlI8mythbQDkShKL6XbkJWhEcdUY2rxLEM+xHTEuy8owD1o+zYzwBe5mrC4+gq7zwn"
			"YwYWqzyx115HZoesg3JKqKhn+6hRaT4cD1MlHn8aGQhZm0Dc+Y+MdJ+5jyveEsaKU3dB2jS9d5/5"
			"dKODokDZZ3KdasGr0+re7c6xW9l254yA3UNrUal7SzWBQlWDx+Zr3Dxnk8O4luhyxzOerEvhyDCR"
			"yYwX4TZsua5cLy8hsyvMysczUWMgEqWOZKs8VQceM1OONc57rB5xF4Avp+fZ7p1w8QO6iWfdpv5w"
			"TEd66Dg88ByNqqjOuT3ph11RSXj2nGql5gjcmhnMkuddfR9oOaF90tN0Fqx+WklIZKIInormleHV"
			"RGdMZ8IYo8/L1ldhZ9Iu+Ly/wLpZc0YH7QM3iqiYqsL2nOXbKyuNvTO817ZJ97z/2iYPkLNfb7jj"
			"kXveIZHczi10E3MNOE/yErLOOvcfU6Vh3VO9U1abxOfBMlxvLg8xWff+wM/7rNvUyRpxRpqe/J8y"
			"K7U8vj2Q/DHovIZq/x31mjxXPJOc1J3ecRDvVcdnoskH01PO9yvCI3kn7fpKjDWWyHKZfFbUU7nJ"
			"9BeEqjwupVUJHSuxFGtFU44nJpDKtejaS2Lsmxp7UJo9XHCkAfmPCt+hU99VtJmKT5j6mL2N8g1/"
			"YQN+yiTphT5JaejYZQIG23gl+inwZDhx9E9yA7KA3UjuWaNwmc18eKVlERpVWk3JCtiM5v5aCj5V"
			"09JR9W998WdYqD9/2rZ0xT99LGQA7OYScqtTK4nQVPpNvru/KR7K/ZKipAq1+s6J4pW0F8S64MLZ"
			"hmn6ZapzZxf0GJmRdfRILqPpEz2oJTUSEnTq2imx/Ejyd07tsvNsCveXkL6Xvfs2t15CbNl7RDPk"
			"R25q/KHYzp7tQLv8hrK9r+ZyEpC5w5mPmwZ4UqNX+SG1wtSmIjNTtvOGojP4CtpyZD+9MwSed7nm"
			"l4P9ixfEO9LUoXZQJZKHSuZpPwpe62uUOsTbrj6Q6MfkDx0vth6Jh+VF1kYJ7dpbGgTd2wEYKZAx"
			"/fJGT0thNPqelZLWNBw9E/VGI1d3weGvyR+fPW4deo9D07KWFwL+lP3Pu/F61p5wNwif+ggRG0vH"
			"/Ut7wy2Lpn3ZPD/m4GoZqaz9H5VML+us2caAAAAAAElFTkSuQmCCWQcAAFoHAABbBwAAXAcAAF0H"
			"AABeBwAAXwcAAGAHAABhBwAAYQcAAGIHAABjBwAAZAcAAGUHAABmBwAAZwcAAGgHAABpBwAAagcA"
			"AGsHAABsBwAAbQcAAG4HAABvBwAAcAcAAHEHAAByBwAAcgcAAHMHAAB0BwAAdQcAAHY="
		)
	)
	(image
		(at 546.1 383.54)
		(scale 0.213)
		(uuid "f584ce61-056c-4175-b27d-42cf31ba269b")
		(data "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"
			"anaYvPrCvpo9eb3LuC6G5t7uu3xp6i/j8VSVFJ/vaa8v5WgMgE3Jg7jHMtf6RW+Vv+jz51q8WZ1c"
			"bCuIyIcXRk6OToy98rzX46bsADYpD+Ju0927u2/S03QLNICtkTdxj5Hszi62xXRvHYCcccr0A6nT"
			"3T7dWwcgZ/Iv7gCAdRF3AFCIuAOAQsQdABQi7gCgEHEHAIWIOwAoRNwBQCHiDgAKEXcAUIi4A4BC"
			"xB0AFCLuAKAQcQcAhYg7AChE3AFAIeIOAAoRdwBQiLgDgELEHQAUIu4AoBBxBwCFiDsAKETcAUAh"
			"4g4AChF3AFCIuAOAQsQdABQi7gCgEHEHAIWIOwAo9C9uDnNmafUxQgAAAABJRU5ErkJggkAcAABB"
			"HAAAQhwAAEMcAABEHAAARRwAAEYcAABHHAAASBwAAEkcAABKHAAASxwAAEwcAABNHAAAThwAAE8c"
			"AABQHAAAURwAAFIcAABTHAAAVBwAAFUcAABWHAAAVxwAAFgcAABZHAAAWhwAAFscAABcHAAAXRwA"
			"AF4cAABfHAAAYBwAAGEcAABiHAAAYxwAAGQcAABlHAAAZhwAAGccAABoHAAAaRwAAGocAABrHAAA"
			"bBwAAG0cAABuHAAAbxwAAAAAAAAAAAAA6BwAAHMcAAAAAAAAAAAAAOgcAAB3HAAAeBwAAHkcAAB6"
			"HAAAexwAAHwcAAB9HAAAfhwAAH8cAACAHAAAgRwAAIIcAACDHAAAhBwAAIUcAACGHAAAhxwAAIgc"
			"AACJHAAAihwAAIscAACMHAAAjRwAAI4cAACPHAAAkBwAAJEcAACSHAAAkxwAAJQcAACVHAAAlhwA"
			"AJccAACYHAAAmRwAAJocAACbHAAAnBwAAJ0cAACeHAAAnxwAAKAcAAChHAAAohwAAKMcAACkHAAA"
			"pRwAAKYcAACnHAAAqBwAAKkcAACqHAAAqxwAAKwcAACtHAAArhwAAK8cAACwHAAAsRwAALIcAACz"
			"HAAAtBwAALUcAAC2HAAAtxwAALgcAAC5HAAAuhwAALscAAC8HAAAvRwAAL4cAAC/HAAAwBwAAMEc"
			"AADCHAAAwxwAAMQcAADFHAAAxhwAAMccAADIHAAAyRwAAMocAADLHAAAzBwAAM0cAADOHAAAzxwA"
			"ANAcAADRHAAA0hwAANMcAADUHAAA1RwAANYcAADXHAAA2BwAANkcAADaHAAA2xwAANwcAADdHAAA"
			"3hwAAN8cAADgHAAA4RwAAOIcAADjHAAA5BwAAOUcAADmHAAA5xwAAOgcAADpHAAA6hwAAOscAADs"
			"HAAA7RwAAO4cAADvHAAA8BwAAPEcAADyHAAA8xwAAPQcAAA="
		)
	)
	(label "GPIO1/U0TXD"
		(at 210.82 337.82 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "00f024b5-2fec-455d-9842-4706daa8bd70")
	)
	(label "GPIO3/U0RXD"
		(at 210.82 335.28 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "053e76a0-0d07-4def-907d-2e0cca591302")
	)
	(label "GPIO14/HS2_CLK"
		(at 469.9 109.22 0)
		(effects
			(font
				(size 1.016 1.016)
			)
			(justify left bottom)
		)
		(uuid "08a461f9-eeb3-4b86-8c90-18282938cf7a")
	)
	(label "D_Com"
		(at 558.8 48.26 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "0a8f699a-2149-44d2-b87a-a9a0f0581cf7")
	)
	(label "GPIO16/I2C-SCL"
		(at 142.24 157.48 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "0c5151ae-6813-4743-8a14-5d59578de81b")
	)
	(label "GPIO0"
		(at 213.36 137.16 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "0fdea170-b501-454d-b472-de3f54dba981")
	)
	(label "ESP_EN"
		(at 495.3 187.96 180)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify right bottom)
		)
		(uuid "10fa6a5c-837e-43a1-ab67-417b0af3d34b")
	)
	(label "GPIO15/HS2_CMD"
		(at 396.24 86.36 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "12cdbfcb-5526-4bf0-832a-3aeac6668a21")
	)
	(label "+5V_USB"
		(at 45.72 345.44 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "13831451-0acd-4f0f-b6f4-4e2379a428c4")
	)
	(label "GPI34/BUT1"
		(at 551.18 187.96 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "141c6e16-cc9e-4414-a9f6-ab2586447e55")
	)
	(label "GPIO27/EMAC_RX_CRS_DV"
		(at 396.24 111.76 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "184305c9-a53d-4bf0-916e-bd867c4af316")
	)
	(label "GPI35"
		(at 198.12 40.64 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "1883df47-6cc5-4375-acc3-837ef665f164")
	)
	(label "GPIO33"
		(at 551.18 190.5 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "1b1dfd3d-af62-4d3f-ad96-e05587b48f76")
	)
	(label "GPI39"
		(at 396.24 127 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "1d25ed38-106f-4792-9f72-45abb01df93d")
	)
	(label "Shield"
		(at 78.74 238.76 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "1d2dcbd1-3919-4dae-9a51-fb9830c088f1")
	)
	(label "GPIO15/HS2_CMD"
		(at 551.18 198.12 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "23197975-14f7-459e-917b-4b7deef7a3a1")
	)
	(label "ESP_EN"
		(at 269.24 76.2 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "245d8fd2-94fc-46dd-b4e9-36d0e1f04a94")
	)
	(label "GPIO18/MDIO(RMII)"
		(at 208.28 213.36 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "27ee198d-5b56-4984-b0ec-4919f3bbf926")
	)
	(label "GPIO16/I2C-SCL"
		(at 551.18 195.58 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "28e0c86a-4343-4303-9eaa-070543b80d69")
	)
	(label "GPIO5/SPI_CS"
		(at 553.72 279.4 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "2cc0d3c9-c5b7-4a18-b094-91e4f1b0b317")
	)
	(label "GPIO17/EMAC_CLK_OUT_180"
		(at 142.24 137.16 0)
		(effects
			(font
				(size 1.016 1.016)
			)
			(justify left bottom)
		)
		(uuid "2d8a4d6e-fa6f-4fd0-bc49-4a7d6d1a709a")
	)
	(label "GPIO15/HS2_CMD"
		(at 515.62 96.52 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "303e1448-98f4-4501-91b3-7f8ffac884df")
	)
	(label "GPIO2/HS2_DATA0"
		(at 469.9 119.38 0)
		(effects
			(font
				(size 1.016 1.016)
			)
			(justify left bottom)
		)
		(uuid "31b6d4d1-1799-4eb3-88de-5227c79d4a48")
	)
	(label "GPIO14/HS2_CLK"
		(at 469.9 279.4 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "33c1117d-91af-44d5-b309-2e3ee632c08e")
	)
	(label "GPIO15/HS2_CMD"
		(at 469.9 276.86 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "36a7c192-0afe-4264-aabe-ca515f12c2ca")
	)
	(label "GPIO15/HS2_CMD"
		(at 469.9 99.06 0)
		(effects
			(font
				(size 1.016 1.016)
			)
			(justify left bottom)
		)
		(uuid "3acdf246-ad17-4b24-a186-acd4ea426ba5")
	)
	(label "GPIO22/EMAC_TXD1(RMII)"
		(at 208.28 172.72 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "3b2913b9-3208-44d2-9103-536709825670")
	)
	(label "GPIO12/PHY_PWR"
		(at 53.34 190.5 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "3d73e276-19b9-479c-b144-7b13c4a44c4b")
	)
	(label "GPIO17/EMAC_CLK_OUT_180"
		(at 127 213.36 0)
		(effects
			(font
				(size 1.016 1.016)
			)
			(justify left bottom)
		)
		(uuid "4847bfd6-b7ea-41c9-98c2-c3249da7ba7c")
	)
	(label "5V_DCDC"
		(at 401.32 208.28 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "4c5b20bd-cfae-4c9e-a777-780322aed5f7")
	)
	(label "GPIO23/MDC(RMII)"
		(at 208.28 210.82 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "4ca07403-4a5f-4056-b9bf-fcb1a9434adb")
	)
	(label "GPIO26/EMAC_RXD1(RMII)"
		(at 396.24 109.22 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "4e037baf-0d66-45e9-8426-c16d3976e9d5")
	)
	(label "GPIO2/HS2_DATA0"
		(at 210.82 386.08 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "4f160de8-c0c5-4692-bca6-392240aca318")
	)
	(label "GPIO33"
		(at 213.36 157.48 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "5e5a58f3-ba46-4cfc-a51f-ddcf5a16f6be")
	)
	(label "GPIO14/HS2_CLK"
		(at 490.22 109.22 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "602b2a40-34af-40f0-854c-4465c46c8ea7")
	)
	(label "GPIO1/U0TXD"
		(at 495.3 193.04 180)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify right bottom)
		)
		(uuid "603e589c-695a-452f-a8cd-d7a35abadcce")
	)
	(label "GPIO5/SPI_CS"
		(at 495.3 203.2 180)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify right bottom)
		)
		(uuid "62353c50-dcfc-4324-aeda-533d9df71d86")
	)
	(label "GPI35"
		(at 551.18 185.42 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "6328f0b0-cdff-4cb8-ba6c-6f7064eeaa1b")
	)
	(label "GPIO22/EMAC_TXD1(RMII)"
		(at 396.24 101.6 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "6449374d-e155-44fc-ab0d-da51156d62b5")
	)
	(label "GPI34/BUT1"
		(at 515.62 43.18 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "6c6e82d8-aebe-40fc-88c1-4c3ab6fb3d65")
	)
	(label "GPIO0"
		(at 495.3 190.5 180)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify right bottom)
		)
		(uuid "6d2b3f6b-b16e-4956-a282-c53f6aec5e0e")
	)
	(label "GPIO25/EMAC_RXD0(RMII)"
		(at 396.24 106.68 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "729c7aa7-d266-4044-9472-3c25fd568005")
	)
	(label "GPIO4/U1TXD"
		(at 469.9 271.78 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "76b05703-c6e2-4d26-a381-20abd08bd15c")
	)
	(label "ESP_EN"
		(at 210.82 340.36 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "7d68904d-9eb4-4607-a1ae-4667d94e0f32")
	)
	(label "GPIO32"
		(at 396.24 114.3 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "8253cf06-ba66-499b-aa4e-2e1321eec489")
	)
	(label "GPI39"
		(at 551.18 180.34 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "89534ced-0fc3-4fe2-9f4f-e579af57b875")
	)
	(label "GPIO25/EMAC_RXD0(RMII)"
		(at 208.28 190.5 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "8afd137b-aba1-4f9d-ab38-f3468a4203a4")
	)
	(label "GPIO2/HS2_DATA0"
		(at 553.72 276.86 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "8b283b2c-0ea9-4786-a997-360960c1a659")
	)
	(label "D_Com"
		(at 190.5 378.46 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "8c8218a9-14b2-478a-a009-c3e4f40813f0")
	)
	(label "GPIO2/HS2_DATA0"
		(at 495.3 195.58 180)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify right bottom)
		)
		(uuid "8e41c80e-40ff-4dae-84ae-c4ee208de283")
	)
	(label "GPI35"
		(at 396.24 121.92 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "96c61a11-3fb6-4b30-b73c-cb8d3e231e6c")
	)
	(label "ILIM"
		(at 332.74 213.36 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "992b97b1-5093-4351-9d0b-95061ad4e5b6")
	)
	(label "GPI36/U1RXD"
		(at 553.72 271.78 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "a138c00b-0f92-42e4-b82b-c5f106166144")
	)
	(label "GPIO4/U1TXD"
		(at 495.3 200.66 180)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify right bottom)
		)
		(uuid "a62f8a71-3826-45d9-a577-9e8cba6694a3")
	)
	(label "GPI36/U1RXD"
		(at 396.24 124.46 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "a6e1af53-cf2d-4eae-8caf-8e24a53bdc96")
	)
	(label "GPIO23/MDC(RMII)"
		(at 396.24 104.14 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "aa6bc446-8e66-4f6f-b8b4-fea88052079f")
	)
	(label "GPIO16/I2C-SCL"
		(at 469.9 274.32 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "aa9006d5-6431-483c-98d1-16a54da487fb")
	)
	(label "RD+"
		(at 91.44 223.52 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "ab806e3c-22ad-47e5-b02e-49edb0bfadf8")
	)
	(label "GPIO0"
		(at 396.24 48.26 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "acabdc5a-ebae-43af-9ca8-e3391c577b0c")
	)
	(label "GPI36/U1RXD"
		(at 551.18 182.88 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "ad4bbff6-b7c5-4793-9ef9-dc702e9a7e92")
	)
	(label "ESP_EN"
		(at 515.62 58.42 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "b1413f07-8cc5-4574-a497-2f79348550a2")
	)
	(label "GPIO19/EMAC_TXD0(RMII)"
		(at 208.28 170.18 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "b701c311-1cfe-46f9-b35d-1f5a8d5ffd18")
	)
	(label "TD-"
		(at 91.44 218.44 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "b835688d-0454-4d51-b49d-f7238f852ba4")
	)
	(label "TD+"
		(at 91.44 213.36 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "bf330bf6-8567-438d-aca3-2fccedc637ca")
	)
	(label "GPIO14/HS2_CLK"
		(at 551.18 200.66 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "c0246e58-899d-4e48-ae3b-2829c01ce9ad")
	)
	(label "GPIO32"
		(at 551.18 193.04 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "c759a3a7-c011-4198-af19-a1345b85d369")
	)
	(label "GPIO26/EMAC_RXD1(RMII)"
		(at 208.28 193.04 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "c7ca3189-20e0-4733-be22-1e9d64e67e98")
	)
	(label "GPIO27/EMAC_RX_CRS_DV"
		(at 208.28 226.06 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "caff296c-c414-4462-819a-7714088289b3")
	)
	(label "GPIO12/PHY_PWR"
		(at 396.24 78.74 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "cbb7fa84-d4ac-4080-8c75-374a7e9ab1ba")
	)
	(label "+5V_USB"
		(at 48.26 35.56 0)
		(effects
			(font
				(size 1.524 1.524)
			)
			(justify left bottom)
		)
		(uuid "cd42f719-03b1-4af1-8ef9-fd131dd6a304")
	)
	(label "GPIO19/EMAC_TXD0(RMII)"
		(at 396.24 96.52 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "d164919d-490d-4232-9ff6-a32a17e64a98")
	)
	(label "GPIO4/U1TXD"
		(at 396.24 58.42 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "d3b8a62a-918e-4037-8ba4-12814dd065a7")
	)
	(label "USB_D+"
		(at 45.72 350.52 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "d5c9fcdc-0feb-410f-aaa2-b38a696c3bf0")
	)
	(label "GPIO33"
		(at 396.24 116.84 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "da7b9395-c753-4ca5-ab08-5d1bbc4808ab")
	)
	(label "GPIO3/U0RXD"
		(at 495.3 198.12 180)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify right bottom)
		)
		(uuid "db0d20e2-cba8-44c9-a278-9f5b97cdea92")
	)
	(label "GPIO13/I2C-SDA"
		(at 551.18 203.2 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "de999419-7b79-47b7-ab7d-b7c7b883b440")
	)
	(label "GPIO16/I2C-SCL"
		(at 396.24 88.9 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "e52398c6-d257-4dce-8411-14441a5ab500")
	)
	(label "GPIO18/MDIO(RMII)"
		(at 396.24 93.98 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "e6166b64-6bb8-4e1e-b753-63f448dab037")
	)
	(label "GPIO14/HS2_CLK"
		(at 396.24 83.82 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "e6892700-f60e-4718-a3aa-7ad67917800f")
	)
	(label "GPIO2/HS2_DATA0"
		(at 515.62 111.76 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "e7904b7d-ba31-4706-8ce5-3c7b894c34b1")
	)
	(label "GPI39"
		(at 228.6 40.64 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "e7f3a696-0787-405c-b3b7-fef2aa756291")
	)
	(label "RD-"
		(at 91.44 228.6 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "e844245c-c846-4e89-afc6-e68cb23f410a")
	)
	(label "GPIO2/HS2_DATA0"
		(at 396.24 53.34 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "e986ecb9-c924-499f-8cda-9349ad445030")
	)
	(label "GPIO13/I2C-SDA"
		(at 396.24 81.28 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "e9acf490-4f4e-4a81-a881-3751cc15cabd")
	)
	(label "GPI34/BUT1"
		(at 396.24 119.38 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "eaa2a6dd-cebd-4d86-8575-923d7a57c55f")
	)
	(label "GPIO5/SPI_CS"
		(at 396.24 60.96 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "eae21401-e1da-4e8f-be72-3ad32678c6ad")
	)
	(label "GPIO1/U0TXD"
		(at 396.24 50.8 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "ec2e7f36-8e2a-44cf-981a-742a9411c562")
	)
	(label "GPIO17/EMAC_CLK_OUT_180"
		(at 396.24 91.44 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "edb45c6b-1df5-4452-96ca-e4504116f320")
	)
	(label "GPIO3/U0RXD"
		(at 396.24 55.88 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "eeea0151-c3fa-41a4-876e-cf2b5ebed2ba")
	)
	(label "GPIO13/I2C-SDA"
		(at 553.72 274.32 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "ef7386f1-267a-4b4b-88d9-1400d3f25ec7")
	)
	(label "USB_D-"
		(at 45.72 347.98 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "ef8c1410-8ff6-4377-beb1-6fa2320c664a")
	)
	(label "GPIO21/EMAC_TX_EN(RMII)"
		(at 396.24 99.06 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "f49f34a1-53e1-44e6-8978-b7926fccd7e1")
	)
	(label "GPIO0"
		(at 210.82 370.84 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left bottom)
		)
		(uuid "fa4e0fac-ba57-4ecd-a22d-df78b614709c")
	)
	(label "GPIO21/EMAC_TX_EN(RMII)"
		(at 208.28 180.34 0)
		(effects
			(font
				(size 0.9906 0.9906)
			)
			(justify left bottom)
		)
		(uuid "fd9837f4-1f37-4c9b-9fd4-80877ead7dd2")
	)
	(global_label "Spare2"
		(shape output)
		(at 81.28 246.38 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left)
		)
		(uuid "0cfbd1c8-2ce9-4d72-92d2-d1960193276e")
		(property "Intersheetrefs" "${INTERSHEET_REFS}"
			(at 81.28 246.38 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
	)
	(global_label "Spare2"
		(shape input)
		(at 266.7 261.62 180)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify right)
		)
		(uuid "47616c18-6f1e-4770-bfb0-f1e7de73d185")
		(property "Intersheetrefs" "${INTERSHEET_REFS}"
			(at 266.7 261.62 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
	)
	(global_label "Spare2"
		(shape input)
		(at 266.7 231.14 180)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify right)
		)
		(uuid "47acab7c-67d3-4f59-95d5-0af302c1ae2e")
		(property "Intersheetrefs" "${INTERSHEET_REFS}"
			(at 266.7 231.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
	)
	(global_label "Spare1"
		(shape input)
		(at 266.7 238.76 180)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify right)
		)
		(uuid "7c9d800c-3cb4-4e2b-b1f8-64c1a429ba25")
		(property "Intersheetrefs" "${INTERSHEET_REFS}"
			(at 266.7 238.76 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
	)
	(global_label "Spare1"
		(shape input)
		(at 266.7 208.28 180)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify right)
		)
		(uuid "a02ab61c-ee0e-43ea-9bf3-7cceb875519f")
		(property "Intersheetrefs" "${INTERSHEET_REFS}"
			(at 266.7 208.28 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
	)
	(global_label "Spare1"
		(shape output)
		(at 81.28 243.84 0)
		(effects
			(font
				(size 1.27 1.27)
			)
			(justify left)
		)
		(uuid "e8ca15b2-173f-4ad9-929a-22167d7c2fc9")
		(property "Intersheetrefs" "${INTERSHEET_REFS}"
			(at 81.28 243.84 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:PWR_FLAG")
		(at 38.1 93.98 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580dbee4")
		(property "Reference" "#FLG02"
			(at 38.1 91.567 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "PWR_FLAG"
			(at 38.1 88.2904 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 38.1 93.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 38.1 93.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 38.1 93.98 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "22c80250-ccdc-4bf0-ad0e-a59517c32c50")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#FLG02")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 38.1 104.14 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580dbf00")
		(property "Reference" "#PWR08"
			(at 38.1 110.49 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 38.1 107.95 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 38.1 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 38.1 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 38.1 104.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "c22c6758-44e7-404a-8805-3ef565b23e33")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR08")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:PWR_FLAG")
		(at 76.2 33.02 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580dc57f")
		(property "Reference" "#FLG04"
			(at 76.2 30.607 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "PWR_FLAG"
			(at 76.2 27.3304 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 76.2 33.02 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 76.2 33.02 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 76.2 33.02 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "c7721445-0752-4a14-b36b-27723ff053cc")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#FLG04")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+5V")
		(at 88.9 30.48 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580dd76c")
		(property "Reference" "#PWR018"
			(at 88.9 34.29 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+5V"
			(at 88.9 26.67 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 88.9 30.48 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 88.9 30.48 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 88.9 30.48 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "25958d37-5660-4f76-9abc-fe15ccf8dfe6")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR018")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 177.8 104.14 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580e092e")
		(property "Reference" "#PWR039"
			(at 177.8 110.49 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 177.8 107.95 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 177.8 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 177.8 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 177.8 104.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "d037f666-9a17-48f8-9380-11595fe9c444")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR039")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:SY8009AAAC(SOT23-5)")
		(at 193.04 83.82 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580e129e")
		(property "Reference" "U7"
			(at 190.246 76.962 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "SY8089AAAC(SOT23-5)"
			(at 193.04 90.17 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_Regulators-FP:SOT-23-5"
			(at 193.802 80.01 0)
			(effects
				(font
					(size 0.508 0.508)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 193.04 83.82 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 193.04 83.82 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 193.04 83.82 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 193.04 83.82 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 193.04 83.82 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "4"
			(uuid "91d0dfd7-7358-4052-8b67-5b84e8c804b7")
		)
		(pin "1"
			(uuid "8a28fd75-090a-4db4-b6b2-718dd6abccc6")
		)
		(pin "2"
			(uuid "b17f0ffa-f295-4ed2-a6d3-728fe7c9d230")
		)
		(pin "3"
			(uuid "7d2a1bd6-7e63-49dc-8bc1-4537c03cedb7")
		)
		(pin "5"
			(uuid "f1db8df8-d33c-4e5a-988c-fafc30c600c2")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "U7")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:L")
		(at 210.82 81.28 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580e1fa3")
		(property "Reference" "L2"
			(at 210.82 76.2254 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "2.2uH/1.5A/DCR=72mR/20%/3.00x3.00x1.50mm/CD32(NR3015T2R2M)"
			(at 216.535 78.105 0)
			(effects
				(font
					(size 0.635 0.635)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:CD32"
			(at 209.55 81.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 209.55 81.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 210.82 81.28 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 210.82 81.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 210.82 81.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 210.82 81.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "5c3531e1-8f5f-4f45-ab08-bcb6f28705ec")
		)
		(pin "2"
			(uuid "5569b9c4-c8bc-44b6-bc05-c18ee18b040a")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "L2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 212.09 83.82 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580e2698")
		(property "Reference" "R29"
			(at 216.662 82.804 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "220k/R0402"
			(at 212.344 85.598 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 212.09 85.598 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 212.09 83.82 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 212.09 83.82 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 212.09 83.82 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 212.09 83.82 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 212.09 83.82 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "24e77630-611d-4a4c-9ec7-8cd89c33e06c")
		)
		(pin "2"
			(uuid "19876b30-03a1-47ed-b1c3-a5c4562fe0df")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R29")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 212.09 88.9 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580e2cab")
		(property "Reference" "R30"
			(at 216.662 87.884 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "49.9k/1%/R0402"
			(at 212.344 90.678 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 212.09 90.678 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 212.09 88.9 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 212.09 88.9 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 212.09 88.9 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 212.09 88.9 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 212.09 88.9 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "d8e28113-fc6c-4b8f-8443-307962a131c8")
		)
		(pin "2"
			(uuid "20ecb77b-0f87-462d-a527-b8d35607de86")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R30")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 226.06 104.14 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580e37cf")
		(property "Reference" "#PWR048"
			(at 226.06 110.49 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 226.06 107.696 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 226.06 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 226.06 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 226.06 104.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "73beb896-b2a0-455c-9842-203501ac11e1")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR048")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 220.98 104.14 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580e3cb9")
		(property "Reference" "#PWR044"
			(at 220.98 110.49 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 220.98 107.696 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 220.98 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 220.98 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 220.98 104.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "65bb1324-3b99-4f22-806d-4aa939b7cba7")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR044")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 226.06 86.36 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580e3ce9")
		(property "Reference" "C22"
			(at 224.536 85.344 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "22uF/6.3V/20%/X5R/C0603"
			(at 228.6 104.14 90)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0603_5MIL_DWS"
			(at 226.06 86.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 226.06 86.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 226.06 86.36 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 226.06 86.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 226.06 86.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 226.06 86.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "8b8f6c30-552c-4caf-9153-f44e77c5c10b")
		)
		(pin "2"
			(uuid "2930f84c-e9ab-41c2-8688-7eed604b2c00")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C22")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+3.3V")
		(at 233.68 76.2 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580e51ca")
		(property "Reference" "#PWR050"
			(at 233.68 80.01 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+3V3"
			(at 234.061 71.8058 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 233.68 76.2 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 233.68 76.2 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 233.68 76.2 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "2e54d9b6-e51b-40f2-8646-ad4013e8364e")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR050")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:PWR_FLAG")
		(at 226.06 76.2 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580e51fe")
		(property "Reference" "#FLG08"
			(at 226.06 73.787 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "PWR_FLAG"
			(at 220.98 71.12 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 226.06 76.2 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 226.06 76.2 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 226.06 76.2 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "e9973156-b1ad-4998-a884-3d40c229f75c")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#FLG08")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 182.88 104.14 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580e5d08")
		(property "Reference" "#PWR041"
			(at 182.88 110.49 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 182.88 107.95 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 182.88 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 182.88 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 182.88 104.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "cff5796b-fa25-4e92-b12e-89ac03f5bde0")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR041")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:SIDE_WTCM-TR(3x4)")
		(at 500.38 43.18 0)
		(mirror y)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580f02b2")
		(property "Reference" "BUT1"
			(at 509.27 39.878 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify left)
			)
		)
		(property "Value" "IT1185AU2"
			(at 505.46 45.72 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Buttons-FP:IT1185AU2_V2"
			(at 500.4054 42.2148 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 500.4054 42.2148 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 500.38 43.18 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 500.38 43.18 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 500.38 43.18 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 500.38 43.18 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "09223608-6859-486a-be4f-d9526588e4da")
		)
		(pin "2"
			(uuid "e8538e8e-c8be-49b8-8746-1585c3ade7bf")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "BUT1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:SIDE_WTCM-TR(3x4)")
		(at 500.38 58.42 0)
		(mirror y)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580f1a95")
		(property "Reference" "RST1"
			(at 509.27 55.372 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify left)
			)
		)
		(property "Value" "IT1185AU2"
			(at 505.46 60.96 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Buttons-FP:IT1185AU2_V2"
			(at 500.4054 57.4548 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 500.4054 57.4548 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 500.38 58.42 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 500.38 58.42 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 500.38 58.42 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 500.38 58.42 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "e0eb0ab7-1773-4513-816f-86035679eb73")
		)
		(pin "2"
			(uuid "75523d6e-46a7-4a60-8398-fe92c7612423")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "RST1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 483.87 43.18 180)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580f34e3")
		(property "Reference" "R47"
			(at 485.394 41.148 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "220R/R0402"
			(at 488.696 45.212 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 483.87 41.402 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 483.87 43.18 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 483.87 43.18 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 483.87 43.18 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 483.87 43.18 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 483.87 43.18 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "74903c49-7306-4aaa-9b6c-0d0d3eb7d7b2")
		)
		(pin "2"
			(uuid "a1542a4c-76b7-4f9f-a0e7-a15c35677b3f")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R47")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 474.98 43.18 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580fa130")
		(property "Reference" "#PWR065"
			(at 468.63 43.18 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 471.17 43.18 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 474.98 43.18 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 474.98 43.18 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 474.98 43.18 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "5ced63f3-da40-4427-b4d5-d339542e1531")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR065")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 474.98 58.42 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000580fa16e")
		(property "Reference" "#PWR066"
			(at 468.63 58.42 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 471.17 58.42 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 474.98 58.42 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 474.98 58.42 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 474.98 58.42 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "aab4f309-c402-41ef-bcd2-d24e13d98b43")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR066")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:D_Schottky")
		(at 177.8 62.23 90)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581010c5")
		(property "Reference" "D3"
			(at 179.8066 61.0616 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Value" "1N5819S4/SOD123"
			(at 179.8066 63.373 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" "OLIMEX_Diodes-FP:SOD-123_1C-2A_KA"
			(at 177.8 62.23 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 177.8 62.23 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 177.8 62.23 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 177.8 62.23 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 177.8 62.23 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 177.8 62.23 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "e9f52427-a616-438e-a36b-46b15e60aa43")
		)
		(pin "2"
			(uuid "9931f69a-7267-4d21-b8b4-e33f72d86fb2")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "D3")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:LED")
		(at 109.22 73.66 180)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005810aba2")
		(property "Reference" "CHRG1"
			(at 106.68 69.85 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Value" "LED/YELLOW/0603"
			(at 100.33 77.47 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" "OLIMEX_LEDs-FP:LED_0603_KA"
			(at 109.22 73.66 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 109.22 73.66 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 109.22 73.66 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 109.22 73.66 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 109.22 73.66 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 109.22 73.66 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "fd75311b-026a-4217-9ae0-c23e115687f8")
		)
		(pin "2"
			(uuid "12277076-e829-4eaa-8aae-5f01d80567e6")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "CHRG1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:BH10S")
		(at 508 274.32 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005810e685")
		(property "Reference" "UEXT1"
			(at 508 265.176 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Value" "P-B-V-10-LF"
			(at 508 283.21 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Footprint" "OLIMEX_Connectors-FP:GBH-254-SMT-10"
			(at 507.7968 275.5138 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 507.7968 275.5138 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 508 274.32 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 508 274.32 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 508 274.32 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 508 274.32 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "85d49c66-362b-430d-be0b-e23b39b131ab")
		)
		(pin "3"
			(uuid "c4362cfb-6d85-412c-9cc5-c47e258c8d86")
		)
		(pin "5"
			(uuid "06c4940b-993d-42f3-9e74-423be92800f7")
		)
		(pin "7"
			(uuid "66821c62-9573-48ae-92dc-64ca32f9e502")
		)
		(pin "9"
			(uuid "f8ec0c59-10c2-4eed-b821-9346cb2fb3c3")
		)
		(pin "2"
			(uuid "ae1d5536-6208-42ed-8b13-97c54ebdf153")
		)
		(pin "4"
			(uuid "ff6e769c-d48b-42ef-879a-b70828b98735")
		)
		(pin "6"
			(uuid "daef29ee-dfe4-4ea6-8809-1e3fc0efee4a")
		)
		(pin "8"
			(uuid "a1fe22b9-76e3-4047-8c9e-777cf0b2acfd")
		)
		(pin "10"
			(uuid "79b85b3e-7ce3-4d38-9603-26f12af7d87b")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "UEXT1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 490.22 260.35 90)
		(mirror x)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005810f59c")
		(property "Reference" "R31"
			(at 484.886 259.334 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Value" "2.2k/R0402"
			(at 477.012 261.62 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 491.998 260.35 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 490.22 260.35 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 490.22 260.35 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 490.22 260.35 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 490.22 260.35 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 490.22 260.35 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "57c57573-6c9d-4db1-8782-1d37c54e6f5a")
		)
		(pin "2"
			(uuid "70f86dd1-e344-4cc7-8f4e-3c690c3b89bc")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R31")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+3.3V")
		(at 490.22 243.84 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005811121b")
		(property "Reference" "#PWR054"
			(at 490.22 247.65 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+3V3"
			(at 490.601 239.4458 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 490.22 243.84 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 490.22 243.84 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 490.22 243.84 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "92148cbc-f0f7-4b9f-a8e6-4f01d8dc7827")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR054")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 520.7 269.24 90)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058112459")
		(property "Reference" "#PWR058"
			(at 527.05 269.24 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 517.906 267.716 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" ""
			(at 520.7 269.24 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 520.7 269.24 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 520.7 269.24 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "75b2f0c1-e02c-4ab8-87bc-e6f9d5a4815e")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR058")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 541.02 260.35 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581137c2")
		(property "Reference" "R35"
			(at 540.258 263.652 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "2.2k/R0402"
			(at 540.512 247.65 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 539.242 260.35 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 541.02 260.35 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 541.02 260.35 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 541.02 260.35 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 541.02 260.35 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 541.02 260.35 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "78093fc7-d140-46ef-a122-74db3ed15277")
		)
		(pin "2"
			(uuid "3ef1ff65-6135-4a6f-aabe-4e98916a2601")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R35")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 543.56 260.35 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058113859")
		(property "Reference" "R36"
			(at 542.798 263.652 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "10k/R0402"
			(at 543.052 248.158 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 541.782 260.35 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 543.56 260.35 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 543.56 260.35 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 543.56 260.35 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 543.56 260.35 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 543.56 260.35 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "043bf76e-4a82-48ab-ae73-ca55ac151fca")
		)
		(pin "2"
			(uuid "f83767b8-d35a-45cc-831d-934def45ee0b")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R36")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 125.73 73.66 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005811c32f")
		(property "Reference" "R8"
			(at 124.46 71.12 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "2.2k/R0402"
			(at 120.65 76.2 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 125.73 75.438 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 125.73 73.66 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 125.73 73.66 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 125.73 73.66 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 125.73 73.66 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 125.73 73.66 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "e0052296-af71-450f-a1ba-573b56090430")
		)
		(pin "2"
			(uuid "a303cff3-30c0-4d6a-9508-eec086c0db2c")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R8")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 109.22 241.3 0)
		(mirror y)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058129115")
		(property "Reference" "C11"
			(at 107.95 240.03 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "100nF/16V/10%/X7R/C0402"
			(at 106.045 251.46 90)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0402_5MIL_DWS"
			(at 109.22 241.3 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 109.22 241.3 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 109.22 241.3 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 109.22 241.3 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 109.22 241.3 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 109.22 241.3 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "eb41e69c-c0de-47e6-b96c-a449786b1c68")
		)
		(pin "2"
			(uuid "77c49e00-242b-4c8a-9f25-ded64ea8b225")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C11")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:LED")
		(at 88.9 60.96 90)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005812a4e3")
		(property "Reference" "PWR1"
			(at 85.725 58.42 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Value" "LED/RED/0603"
			(at 91.44 53.34 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" "OLIMEX_LEDs-FP:LED_0603_KA"
			(at 88.9 60.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 88.9 60.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 88.9 60.96 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 88.9 60.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 88.9 60.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 88.9 60.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "b669d774-1482-4bd6-97ab-0588b88ad9e7")
		)
		(pin "2"
			(uuid "e9f08b02-8092-4e66-bc58-eaa8a79d2a2d")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "PWR1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 88.9 87.63 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005812d4c3")
		(property "Reference" "R5"
			(at 87.63 90.805 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "2.2k/R0402"
			(at 87.63 72.39 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 87.122 87.63 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 88.9 87.63 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 88.9 87.63 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 88.9 87.63 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 88.9 87.63 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 88.9 87.63 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "5dbde045-144a-4eca-bfa4-bc784d283ae6")
		)
		(pin "2"
			(uuid "e7c2c94e-04a2-42a9-8335-692ac5010487")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R5")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 109.22 254 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005812e829")
		(property "Reference" "#PWR025"
			(at 109.22 260.35 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 109.22 257.81 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 109.22 254 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 109.22 254 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 109.22 254 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "f7161415-700f-41d1-a80b-2fae33a42ca4")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR025")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 130.81 220.98 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005812f9f2")
		(property "Reference" "R14"
			(at 123.698 219.71 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "2.2k/R0402"
			(at 133.604 219.964 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 130.81 222.758 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 130.81 220.98 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 130.81 220.98 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 130.81 220.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 130.81 220.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 130.81 220.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "ec2563f0-5bde-4c2a-88da-60c6f4c6a4f4")
		)
		(pin "2"
			(uuid "1cf95c78-7266-4bd0-8a84-b3ca8dab7ae2")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R14")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 111.76 191.77 90)
		(mirror x)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005812fbbc")
		(property "Reference" "R10"
			(at 110.49 184.658 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "49.9R/1%/R0402"
			(at 110.744 194.564 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 113.538 191.77 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 111.76 191.77 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 111.76 191.77 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 111.76 191.77 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 111.76 191.77 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 111.76 191.77 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "0857852e-ebc1-4465-b7d4-ad8a7b521d28")
		)
		(pin "2"
			(uuid "27bf3e23-b7c7-4ae1-9f1d-acf6599e1f99")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R10")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 114.3 191.77 90)
		(mirror x)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005812fcdb")
		(property "Reference" "R11"
			(at 113.03 184.658 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "49.9R/1%/R0402"
			(at 113.284 194.564 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 116.078 191.77 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 114.3 191.77 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 114.3 191.77 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 114.3 191.77 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 114.3 191.77 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 114.3 191.77 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "d5234544-6227-41c8-afed-68f34d157df5")
		)
		(pin "2"
			(uuid "c8fc5ebf-dff3-4935-9d0b-e53dd5b097a0")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R11")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 116.84 191.77 90)
		(mirror x)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005812fdfd")
		(property "Reference" "R12"
			(at 115.57 184.658 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "49.9R/1%/R0402"
			(at 115.824 194.564 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 118.618 191.77 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 116.84 191.77 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 116.84 191.77 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 116.84 191.77 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 116.84 191.77 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 116.84 191.77 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "f22a460f-8445-4fd3-aa60-a89cd3ca28fb")
		)
		(pin "2"
			(uuid "5d3c829d-372d-4cac-bc36-604241702c9a")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R12")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 119.38 191.77 90)
		(mirror x)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005813035e")
		(property "Reference" "R13"
			(at 117.856 184.658 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "49.9R/1%/R0402"
			(at 118.364 194.564 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 121.158 191.77 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 119.38 191.77 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 119.38 191.77 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 119.38 191.77 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 119.38 191.77 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 119.38 191.77 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "4c51bbc2-64cf-4235-b479-4929d3ecef0b")
		)
		(pin "2"
			(uuid "6d3bbf5d-315d-4445-8e09-333836899486")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R13")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:P-MOS+DIOD")
		(at 167.64 60.96 0)
		(mirror x)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005813e337")
		(property "Reference" "FET2"
			(at 163.195 58.42 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify right)
			)
		)
		(property "Value" "WPM2015-3/TR"
			(at 161.925 62.865 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify right)
			)
		)
		(property "Footprint" "OLIMEX_Transistors-FP:SOT23"
			(at 167.64 60.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 167.64 60.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 167.64 60.96 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 167.64 60.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 167.64 60.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 167.64 60.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "3"
			(uuid "2bc04e01-3a2f-47f6-bdf0-5cbde6de4d3a")
		)
		(pin "2"
			(uuid "deacbc90-923e-4264-bcd5-21b8ce70b8c4")
		)
		(pin "1"
			(uuid "05b91a8f-a1ac-4a90-9cd6-d101f10b40a3")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "FET2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 144.78 193.04 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005813f14f")
		(property "Reference" "C18"
			(at 144.018 200.406 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "100nF/16V/10%/X7R/C0402"
			(at 147.32 205.74 90)
			(effects
				(font
					(size 0.7874 0.7874)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0402_5MIL_DWS"
			(at 144.78 193.04 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 144.78 193.04 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 144.78 193.04 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 144.78 193.04 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 144.78 193.04 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 144.78 193.04 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "8d1ea984-c224-4541-98ea-882f2d158c6b")
		)
		(pin "2"
			(uuid "6e4e68a8-1852-462b-8e62-15827d5ea175")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C18")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 139.7 193.04 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005813f219")
		(property "Reference" "C17"
			(at 138.684 200.406 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "2.2uF/6.3V/10%/X5R/C0603"
			(at 142.24 205.74 90)
			(effects
				(font
					(size 0.7874 0.7874)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0603_5MIL_DWS"
			(at 139.7 193.04 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 139.7 193.04 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 139.7 193.04 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 139.7 193.04 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 139.7 193.04 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 139.7 193.04 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "d64ca070-23a8-4501-923f-5d1a5122f332")
		)
		(pin "2"
			(uuid "d81675b3-725a-45da-8523-6b7df2469c03")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C17")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:BAT_CON")
		(at 162.56 90.17 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581425a7")
		(property "Reference" "BAT1"
			(at 159.766 84.836 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify left)
			)
		)
		(property "Value" "DW02S"
			(at 159.004 95.504 0)
			(effects
				(font
					(size 1.2954 1.2954)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Connectors-FP:LIPO_BAT_VERTICAL_DW02S"
			(at 162.56 90.17 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 162.56 90.17 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 162.56 90.17 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 162.56 90.17 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 162.56 90.17 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 162.56 90.17 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "8f9d6711-9003-4b84-ac02-a6e27fcaa885")
		)
		(pin "2"
			(uuid "17c1cb0c-67b0-42c2-b605-470e8f426e81")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "BAT1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 157.48 104.14 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058142b69")
		(property "Reference" "#PWR035"
			(at 157.48 110.49 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 157.48 107.95 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 157.48 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 157.48 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 157.48 104.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "871dce5e-81f9-40c8-a8da-321116c7394b")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR035")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 134.62 187.96 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058147148")
		(property "Reference" "C16"
			(at 133.858 187.198 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "100nF/16V/10%/X7R/C0402"
			(at 137.16 198.12 90)
			(effects
				(font
					(size 0.7874 0.7874)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0402_5MIL_DWS"
			(at 134.62 187.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 134.62 187.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 134.62 187.96 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 134.62 187.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 134.62 187.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 134.62 187.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "4a755e7c-8418-45e8-8a83-32ab0fca488f")
		)
		(pin "2"
			(uuid "2e6a3229-3bdc-447c-bf19-d35571a486f8")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C16")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 129.54 187.96 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058147214")
		(property "Reference" "C15"
			(at 128.778 187.198 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "100nF/16V/10%/X7R/C0402"
			(at 132.08 198.12 90)
			(effects
				(font
					(size 0.7874 0.7874)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0402_5MIL_DWS"
			(at 129.54 187.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 129.54 187.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 129.54 187.96 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 129.54 187.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 129.54 187.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 129.54 187.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "1aa27d12-d94c-43f7-baf9-4a5dce33babc")
		)
		(pin "2"
			(uuid "a24407f6-df31-4f78-b5b9-feffa5185e72")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C15")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 124.46 187.96 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058147339")
		(property "Reference" "C13"
			(at 123.444 187.198 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "22uF/6.3V/20%/X5R/C0603"
			(at 127 198.12 90)
			(effects
				(font
					(size 0.7874 0.7874)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0603_5MIL_DWS"
			(at 124.46 187.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 124.46 187.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 124.46 187.96 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 124.46 187.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 124.46 187.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 124.46 187.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "df474b76-ea91-4429-ab96-5b14614a4fe2")
		)
		(pin "2"
			(uuid "c3813b10-193e-4b05-b1a7-00480f4bc3b1")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C13")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+3.3V")
		(at 284.48 48.26 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005815346c")
		(property "Reference" "#PWR055"
			(at 284.48 52.07 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+3V3"
			(at 284.861 43.8658 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 284.48 48.26 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 284.48 48.26 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 284.48 48.26 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "1d555935-216e-4cf3-8a06-5ac305f6a6fe")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR055")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 284.48 50.8 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058153b20")
		(property "Reference" "#PWR056"
			(at 278.13 50.8 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 281.2288 50.927 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" ""
			(at 284.48 50.8 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 284.48 50.8 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 284.48 50.8 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "a0841ef7-b5bf-42db-8a32-6e240d5b00dd")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR056")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 284.48 63.5 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005815405b")
		(property "Reference" "#PWR057"
			(at 278.13 63.5 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 281.2288 63.627 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" ""
			(at 284.48 63.5 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 284.48 63.5 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 284.48 63.5 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "906e7bd2-bf57-4507-ac66-61d7df83a719")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR057")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 129.54 205.74 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058154b05")
		(property "Reference" "#PWR030"
			(at 129.54 212.09 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 129.667 210.1342 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 129.54 205.74 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 129.54 205.74 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 129.54 205.74 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "1a8c8fd7-6850-4ad6-bb46-fda8010a0384")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR030")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+3.3V")
		(at 266.7 63.5 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581571ab")
		(property "Reference" "#PWR053"
			(at 266.7 67.31 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+3V3"
			(at 264.16 59.69 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" ""
			(at 266.7 63.5 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 266.7 63.5 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 266.7 63.5 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "415f3d63-9993-410e-91c7-8efcebdc9674")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR053")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 121.92 242.57 90)
		(mirror x)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581578b5")
		(property "Reference" "R15"
			(at 120.65 241.3 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "2.2k/R0402"
			(at 120.65 243.84 90)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 123.698 242.57 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 121.92 242.57 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 121.92 242.57 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 121.92 242.57 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 121.92 242.57 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 121.92 242.57 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "34a613c2-4147-40d1-ae8a-97d441543e97")
		)
		(pin "2"
			(uuid "35ebf213-b235-4a4f-b78e-6fd9ecab2934")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R15")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 121.92 254 0)
		(mirror y)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058158ed7")
		(property "Reference" "#PWR031"
			(at 121.92 260.35 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 121.92 257.81 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 121.92 254 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 121.92 254 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 121.92 254 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "e6fb29c1-3d77-407c-a044-ed383ebf6c48")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR031")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:LAN8710A-EZC(QFN32)")
		(at 165.1 203.2 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058160809")
		(property "Reference" "U4"
			(at 174.752 166.116 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Value" "LAN8710A-EZC(QFN32)"
			(at 164.846 240.538 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Footprint" "OLIMEX_IC-FP:QFN32_EP(33)_5.00x5.00x0.90mm_Pitch_0.50mm"
			(at 175.26 203.2 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 175.26 203.2 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 165.1 203.2 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 165.1 203.2 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 165.1 203.2 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 165.1 203.2 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "12"
			(uuid "2fb14429-72c8-4a6c-8a3d-bbd7b03261e9")
		)
		(pin "27"
			(uuid "1c2fecab-141a-417b-b3ac-d0eaaa253cc1")
		)
		(pin "1"
			(uuid "66df136d-1c61-425e-bc9b-91754b504bac")
		)
		(pin "6"
			(uuid "6b690aa7-933c-4025-a4d4-c5e5aa97c06d")
		)
		(pin "33"
			(uuid "38b5f471-5c6e-46ca-b468-2656bb9e8291")
		)
		(pin "4"
			(uuid "3045c595-e7fb-4356-9834-113a5f2bcb56")
		)
		(pin "5"
			(uuid "bccaeaa9-b5b0-4442-8758-34bb1470db25")
		)
		(pin "2"
			(uuid "c675e4ee-53bb-4ec6-9dd6-e80b9a9d43fb")
		)
		(pin "3"
			(uuid "1afaec04-728b-4cc7-b2ca-4b999f73c8f1")
		)
		(pin "29"
			(uuid "f1a40157-7c98-4601-aaff-278aa232288a")
		)
		(pin "28"
			(uuid "84f95753-8a05-4ef8-8ff7-14e331f15438")
		)
		(pin "31"
			(uuid "b13d3c11-db77-4205-b7e7-caafdbb0a7ee")
		)
		(pin "30"
			(uuid "37b1723f-9a6e-49a4-8c7c-b0ae1b4f8710")
		)
		(pin "22"
			(uuid "97adae24-cd80-4e7e-9d85-3bb67ea9f212")
		)
		(pin "23"
			(uuid "190cc251-2129-452a-ac04-7d47035d75bb")
		)
		(pin "24"
			(uuid "efd8915b-0a89-4e9f-900d-e4c1ff859b26")
		)
		(pin "25"
			(uuid "25dbdb84-34fd-47ab-9c8b-d662de3b2be3")
		)
		(pin "21"
			(uuid "7ca0b8d9-9f1f-4574-840c-e74e7d719e8e")
		)
		(pin "20"
			(uuid "85a81e02-edd9-41f9-9f2b-91210ab5104c")
		)
		(pin "18"
			(uuid "a06ff0ae-4d1f-4366-bdad-3c9969a3f399")
		)
		(pin "11"
			(uuid "c127a19a-a78b-407b-a835-801765719d2a")
		)
		(pin "10"
			(uuid "1a1ecfab-5bf6-4be1-9e8f-ffcf6b2bc6b5")
		)
		(pin "9"
			(uuid "a3660b65-cb0b-40a5-bb63-4bab04caa62b")
		)
		(pin "8"
			(uuid "29f7eef3-99a8-42ba-898c-6fe0a9fa140f")
		)
		(pin "26"
			(uuid "62eea91f-ab9f-4290-bf14-4a3a5224d44c")
		)
		(pin "7"
			(uuid "478e2627-70b0-4829-9c06-ad3509f1a80d")
		)
		(pin "13"
			(uuid "5ebf92e3-f54d-45f0-b69a-3727acc54376")
		)
		(pin "17"
			(uuid "a3ff7fc7-0853-48a8-bc9b-cbd1ba0b36f0")
		)
		(pin "16"
			(uuid "0dcf6bda-7fb4-4a62-ab07-58b83778955c")
		)
		(pin "14"
			(uuid "4328b0b4-d34a-4a9e-8090-95e7aafaaebb")
		)
		(pin "15"
			(uuid "38baa15e-b7cd-4c82-b9f7-2cc6786a62c0")
		)
		(pin "19"
			(uuid "1ae5aeeb-0bac-46a6-95c6-79cf93c564c3")
		)
		(pin "32"
			(uuid "93751881-368f-4708-9dde-a120a8d4faf6")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "U4")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 187.96 175.26 90)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581809ae")
		(property "Reference" "#PWR042"
			(at 194.31 175.26 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 191.2112 175.133 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" ""
			(at 187.96 175.26 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 187.96 175.26 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 187.96 175.26 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "a7e481a9-ae99-40fe-9d1f-68f2bd9b6961")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR042")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:RA1206_(4x0603)_4B8_Smashed")
		(at 195.58 201.93 0)
		(mirror y)
		(unit 2)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005818206d")
		(property "Reference" "RM1"
			(at 188.214 197.104 0)
			(effects
				(font
					(size 1.1938 1.1938)
				)
			)
		)
		(property "Value" "RA1206_(4X0603)_4B8_2.2k"
			(at 210.82 197.104 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_MATRIX_4"
			(at 194.31 204.47 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 194.31 204.47 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 195.58 201.93 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1.1"
			(uuid "8852a8fd-98be-4613-a03d-723af3224838")
		)
		(pin "1.2"
			(uuid "685ad723-c713-4fcc-9e21-56b515301f74")
		)
		(pin "2.1"
			(uuid "56996e75-c5d5-4da1-baf9-707603196c2b")
		)
		(pin "2.2"
			(uuid "16c9f73a-a0ea-4315-90c8-02c018fc35ef")
		)
		(pin "3.1"
			(uuid "e91afa9f-5116-4644-bb66-26a379818ec4")
		)
		(pin "3.2"
			(uuid "6e1249bc-cba0-4ff5-bb0b-01cd0c67c704")
		)
		(pin "4.1"
			(uuid "16a2c550-f827-4ff3-b0b4-9a65958018a6")
		)
		(pin "4.2"
			(uuid "42415f97-7207-42e6-bb3b-83dfe4309495")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "RM1")
					(unit 2)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:RA1206_(4x0603)_4B8_Smashed")
		(at 195.58 209.55 0)
		(mirror y)
		(unit 3)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058182187")
		(property "Reference" "RM1"
			(at 188.214 204.724 0)
			(effects
				(font
					(size 1.1938 1.1938)
				)
			)
		)
		(property "Value" "RA1206_(4X0603)_4B8_2.2k"
			(at 210.566 204.724 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_MATRIX_4"
			(at 194.31 212.09 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 194.31 212.09 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 195.58 209.55 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1.1"
			(uuid "35e3b755-adbd-4d72-8254-caac00ac5a37")
		)
		(pin "1.2"
			(uuid "af587884-cf56-4cf0-b9fd-024b88f97167")
		)
		(pin "2.1"
			(uuid "6ea2d042-1d2b-4cbb-bf6e-b1271a1aab4a")
		)
		(pin "2.2"
			(uuid "7e5eb3f6-2c1e-4aa4-bfc3-925d23f4f973")
		)
		(pin "3.1"
			(uuid "d15fd578-41bc-4a31-bff3-e1474834947a")
		)
		(pin "3.2"
			(uuid "dde6ed7a-783d-4f4d-9e97-12c5d1207c27")
		)
		(pin "4.1"
			(uuid "29bb9cd8-bfa5-4a5b-ab70-b3c755c997fb")
		)
		(pin "4.2"
			(uuid "88a27bec-30db-46e1-a7ff-1614025b10aa")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "RM1")
					(unit 3)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:RA1206_(4x0603)_4B8_Smashed")
		(at 195.58 199.39 0)
		(mirror y)
		(unit 4)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058182312")
		(property "Reference" "RM1"
			(at 188.214 194.31 0)
			(effects
				(font
					(size 1.1938 1.1938)
				)
			)
		)
		(property "Value" "RA1206_(4X0603)_4B8_2.2k"
			(at 210.566 194.564 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_MATRIX_4"
			(at 194.31 201.93 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 194.31 201.93 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 195.58 199.39 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1.1"
			(uuid "638b4bfa-620a-4048-b3d0-5f13bd804830")
		)
		(pin "1.2"
			(uuid "1aaaf5c6-0416-4da0-b4eb-c8be842298cb")
		)
		(pin "2.1"
			(uuid "150b096e-8b14-4122-870a-6680c494df62")
		)
		(pin "2.2"
			(uuid "0879d67d-1b4e-4ede-9397-6dd3906f56b7")
		)
		(pin "3.1"
			(uuid "525fe34c-749e-40df-93c6-1d54ed01aa0c")
		)
		(pin "3.2"
			(uuid "6413a298-db04-4c03-b95e-2cd8cb1130c7")
		)
		(pin "4.1"
			(uuid "b8ba8dfc-3076-41c9-aa0d-30ef8420d3f8")
		)
		(pin "4.2"
			(uuid "109b3650-fb03-4eb1-919e-01475ba62bca")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "RM1")
					(unit 4)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:RA1206_(4x0603)_4B8_Smashed")
		(at 195.58 217.17 180)
		(unit 3)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058182428")
		(property "Reference" "RM2"
			(at 187.96 219.71 0)
			(effects
				(font
					(size 1.1938 1.1938)
				)
			)
		)
		(property "Value" "RA1206_(4X0603)_4B8_2.2k"
			(at 210.82 219.71 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_MATRIX_4"
			(at 194.31 214.63 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 194.31 214.63 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 195.58 217.17 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1.1"
			(uuid "5c8dd699-67c4-4cd5-855c-2db8668fe6ec")
		)
		(pin "1.2"
			(uuid "3e9d6a87-9d5f-4861-a313-8e84c4270094")
		)
		(pin "2.1"
			(uuid "95e5a5d9-87ed-4533-a6cc-dadb6fb22f80")
		)
		(pin "2.2"
			(uuid "2cc00fe8-8c01-4da9-b220-5752a75a513e")
		)
		(pin "3.1"
			(uuid "8f6ad564-be3d-48db-aea6-5ef210d31a0a")
		)
		(pin "3.2"
			(uuid "f37cd32e-5795-4196-9afc-c2b2533ff543")
		)
		(pin "4.1"
			(uuid "84e5d2bc-320b-49ba-9090-c515bf9be16d")
		)
		(pin "4.2"
			(uuid "2f2d844c-59c1-496d-b685-c100b73f44e8")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "RM2")
					(unit 3)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:RA1206_(4x0603)_4B8_Smashed")
		(at 195.58 181.61 180)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058191f56")
		(property "Reference" "RM2"
			(at 187.96 184.15 0)
			(effects
				(font
					(size 1.1938 1.1938)
				)
			)
		)
		(property "Value" "RA1206_(4X0603)_4B8_2.2k"
			(at 210.82 184.15 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_MATRIX_4"
			(at 194.31 179.07 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 194.31 179.07 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 195.58 181.61 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1.1"
			(uuid "992992c1-4a5d-4b87-929f-68988d4e6cbb")
		)
		(pin "1.2"
			(uuid "095288df-c72c-47c8-bfbf-9bcd297633d7")
		)
		(pin "2.1"
			(uuid "3f0be86a-75ca-48ed-9fcf-6265640c2468")
		)
		(pin "2.2"
			(uuid "ee29aafd-0ddc-42b1-a1eb-00841321bdf9")
		)
		(pin "3.1"
			(uuid "803373f1-ce7e-4ead-8768-275a5b6d3464")
		)
		(pin "3.2"
			(uuid "acd0542a-bc95-48d9-adea-f1cb16bb0fb9")
		)
		(pin "4.1"
			(uuid "5de2920e-4ab6-4b88-b1c4-29f67dc211aa")
		)
		(pin "4.2"
			(uuid "155798cc-a993-4341-8700-f437dcb31312")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "RM2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:RA1206_(4x0603)_4B8_Smashed")
		(at 195.58 184.15 180)
		(unit 2)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005819206c")
		(property "Reference" "RM2"
			(at 187.96 186.69 0)
			(effects
				(font
					(size 1.1938 1.1938)
				)
			)
		)
		(property "Value" "RA1206_(4X0603)_4B8_2.2k"
			(at 210.82 186.69 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_MATRIX_4"
			(at 194.31 181.61 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 194.31 181.61 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 195.58 184.15 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1.1"
			(uuid "263f5993-15d3-4ea9-8fc5-9d06566fe6a1")
		)
		(pin "1.2"
			(uuid "9e688f9d-9ca4-4475-ab7a-339d05ef54ce")
		)
		(pin "2.1"
			(uuid "7491e71b-fd65-45d4-aec9-59de764583dc")
		)
		(pin "2.2"
			(uuid "2a24b392-6830-4e75-87a9-c5aae71dc863")
		)
		(pin "3.1"
			(uuid "415bdb82-2239-4f27-b783-54773391bb18")
		)
		(pin "3.2"
			(uuid "ab3ddfcc-949b-4553-9f42-82cec5954a0d")
		)
		(pin "4.1"
			(uuid "de6ebdb3-b2b9-4613-af7e-a4c57053bb4c")
		)
		(pin "4.2"
			(uuid "0d940738-7797-4a79-8dfe-127cfbc03a05")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "RM2")
					(unit 2)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:RA1206_(4x0603)_4B8_Smashed")
		(at 195.58 214.63 180)
		(unit 4)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005819217a")
		(property "Reference" "RM2"
			(at 187.96 217.17 0)
			(effects
				(font
					(size 1.1938 1.1938)
				)
			)
		)
		(property "Value" "RA1206_(4X0603)_4B8_2.2k"
			(at 210.82 217.17 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_MATRIX_4"
			(at 194.31 212.09 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 194.31 212.09 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 195.58 214.63 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1.1"
			(uuid "178bd782-6482-45b3-a61d-602f1144460a")
		)
		(pin "1.2"
			(uuid "366ffaf3-1b7c-4cda-b8ed-1d1dc06491a3")
		)
		(pin "2.1"
			(uuid "a025c70b-dc63-4afe-8929-e09463f95004")
		)
		(pin "2.2"
			(uuid "51ef1c35-8074-4b79-a09c-5562d1e1dffe")
		)
		(pin "3.1"
			(uuid "d468b537-7458-4579-b803-b1a6067d391e")
		)
		(pin "3.2"
			(uuid "f2a95b5a-60a9-4691-98a3-7b6e8533f065")
		)
		(pin "4.1"
			(uuid "ebb692e2-4d55-4a53-ada2-60f6bc95a32b")
		)
		(pin "4.2"
			(uuid "80e4deca-e221-4ef0-bb7f-09666a7b0d27")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "RM2")
					(unit 4)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:RA1206_(4x0603)_4B8_Smashed")
		(at 195.58 207.01 0)
		(mirror y)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058192296")
		(property "Reference" "RM1"
			(at 187.96 201.93 0)
			(effects
				(font
					(size 1.1938 1.1938)
				)
			)
		)
		(property "Value" "RA1206_(4X0603)_4B8_2.2k"
			(at 210.82 201.93 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_MATRIX_4"
			(at 194.31 209.55 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 194.31 209.55 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 195.58 207.01 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 195.58 207.01 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 195.58 207.01 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 195.58 207.01 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1.1"
			(uuid "6578d418-98c8-4a89-9a57-573bef978152")
		)
		(pin "1.2"
			(uuid "71327502-4913-4360-8204-d0952e8d7c22")
		)
		(pin "2.1"
			(uuid "6e9954e5-bed8-4560-8246-e67b4bba5ab3")
		)
		(pin "2.2"
			(uuid "86d2ae41-2b7e-41f2-b91f-87ba13d46af7")
		)
		(pin "3.1"
			(uuid "29f07286-3079-4d8e-8f35-95a1da5d07de")
		)
		(pin "3.2"
			(uuid "2470f969-41d8-4883-80da-226acbc88469")
		)
		(pin "4.1"
			(uuid "ce485931-1fa1-4029-a19f-dd0d28e6d0ea")
		)
		(pin "4.2"
			(uuid "538cbb80-ca18-453a-8bca-1311e1a451dc")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "RM1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+3.3V")
		(at 485.14 88.9 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058194e17")
		(property "Reference" "#PWR059"
			(at 485.14 92.71 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+3V3"
			(at 485.521 84.5058 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 485.14 88.9 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 485.14 88.9 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 485.14 88.9 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "ace99f59-89e9-4f9f-bd54-064d22a8e9da")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR059")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 494.03 96.52 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058196627")
		(property "Reference" "R39"
			(at 487.934 95.504 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "10k/R0402"
			(at 502.666 95.504 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 494.03 98.298 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 494.03 96.52 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 494.03 96.52 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 494.03 96.52 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 494.03 96.52 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 494.03 96.52 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "2e805fc1-9d9a-48a9-8e90-24680c0f5a7a")
		)
		(pin "2"
			(uuid "6a729921-3a05-451e-8f81-492fa1f68bcd")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R39")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 511.81 109.22 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581b0269")
		(property "Reference" "R40"
			(at 511.81 109.22 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "10R/R0402"
			(at 520.954 108.204 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 511.81 110.998 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 511.81 109.22 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 511.81 109.22 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 511.81 109.22 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 511.81 109.22 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 511.81 109.22 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "36dd1e93-cd54-48fd-93c8-1f83a5f540f0")
		)
		(pin "2"
			(uuid "665dfc7e-8a25-4781-9aa1-f7302b825082")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R40")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 199.39 231.14 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581b5e6f")
		(property "Reference" "R25"
			(at 204.216 230.124 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "10k/R0402"
			(at 191.516 230.378 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 199.39 232.918 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 199.39 231.14 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 199.39 231.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 199.39 231.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 199.39 231.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 199.39 231.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "1b653ae8-4d66-433e-8db7-adb1609f1a03")
		)
		(pin "2"
			(uuid "d7e4da90-cdbb-46eb-9cdb-a625c1e5d28d")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R25")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 199.39 236.22 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581b5f19")
		(property "Reference" "R26"
			(at 204.216 235.458 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "12.1k/1%/R0402"
			(at 199.39 238.252 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 199.39 237.998 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 199.39 236.22 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 199.39 236.22 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 199.39 236.22 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 199.39 236.22 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 199.39 236.22 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "df93e089-08e9-4529-bb56-51170c51c586")
		)
		(pin "2"
			(uuid "ad1ce312-aad2-4c32-9e57-4550e69d868b")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R26")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 210.82 236.22 90)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581be755")
		(property "Reference" "#PWR043"
			(at 217.17 236.22 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 214.0712 236.093 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" ""
			(at 210.82 236.22 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 210.82 236.22 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 210.82 236.22 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "213ff5db-4de2-4771-90ba-d244592b4bc3")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR043")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 193.04 233.68 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581bf7f5")
		(property "Reference" "C21"
			(at 188.468 232.664 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "NA(10uF/6.3V/20%/X5R/C0603)"
			(at 203.962 232.918 90)
			(effects
				(font
					(size 0.7874 0.7874)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0603_5MIL_DWS"
			(at 193.04 233.68 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 193.04 233.68 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 193.04 233.68 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 193.04 233.68 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 193.04 233.68 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 193.04 233.68 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "cc79e8e7-f892-4d5d-bdc3-f776a40a2503")
		)
		(pin "2"
			(uuid "f1c5256c-4fb6-477b-a8bb-20c6bd2e81a3")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C21")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:L")
		(at 500.38 101.6 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581c8fde")
		(property "Reference" "L5"
			(at 494.284 100.584 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "FB0805/600R/2A"
			(at 510.794 100.838 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:L_0805_5MIL_DWS"
			(at 499.11 101.6 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 499.11 101.6 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 500.38 101.6 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 500.38 101.6 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 500.38 101.6 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 500.38 101.6 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "fba731c4-8689-49d2-875f-20139f4fb551")
		)
		(pin "2"
			(uuid "2876ea42-7f8f-4732-acf1-48d95eb221af")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "L5")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 500.38 104.14 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581d0018")
		(property "Reference" "C3"
			(at 496.062 103.124 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "47uF/6.3V/20%/X5R/C0805"
			(at 513.08 103.124 90)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0805_5MIL_DWS"
			(at 500.38 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 500.38 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 500.38 104.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 500.38 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 500.38 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 500.38 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "cb39e961-ae5f-41a5-9530-513a22620b19")
		)
		(pin "2"
			(uuid "7a8c19b9-76e9-4cc2-81f1-07cf45e3fddc")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C3")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+3.3V")
		(at 35.56 144.78 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581d6e1a")
		(property "Reference" "#PWR017"
			(at 35.56 148.59 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+3V3"
			(at 32.385 140.97 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" ""
			(at 35.56 144.78 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 35.56 144.78 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 35.56 144.78 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "5f0c4619-0daf-413a-8fc6-5afe9be20981")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR017")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 124.46 172.72 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581d7f72")
		(property "Reference" "C14"
			(at 120.904 171.704 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "100nF/16V/10%/X7R/C0402"
			(at 137.922 171.704 90)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0402_5MIL_DWS"
			(at 124.46 172.72 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 124.46 172.72 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 124.46 172.72 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 124.46 172.72 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 124.46 172.72 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 124.46 172.72 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "406cf9f5-ef49-47fa-b2f6-658b817c56b9")
		)
		(pin "2"
			(uuid "1de99fb6-52d5-4a23-b411-81b3b9c6c05a")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C14")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 492.76 104.14 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581d887c")
		(property "Reference" "#PWR060"
			(at 486.41 104.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 489.5088 104.267 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" ""
			(at 492.76 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 492.76 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 492.76 104.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "0d82f982-4327-4b4c-8584-52823e6d449b")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR060")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 116.84 172.72 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581de9a6")
		(property "Reference" "#PWR027"
			(at 110.49 172.72 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 113.5888 172.847 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" ""
			(at 116.84 172.72 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 116.84 172.72 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 116.84 172.72 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "097d9a23-4b80-4749-a688-f96e6b3cb039")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR027")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 78.74 177.8 270)
		(mirror x)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581e240d")
		(property "Reference" "C9"
			(at 73.914 176.53 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "22uF/6.3V/20%/X5R/C0603"
			(at 63.754 180.594 90)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0603_5MIL_DWS"
			(at 78.74 177.8 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 78.74 177.8 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 78.74 177.8 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 78.74 177.8 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 78.74 177.8 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 78.74 177.8 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "10e3ade4-4a52-4163-b404-7381cba42947")
		)
		(pin "2"
			(uuid "ae83e575-3000-4e5c-9511-a757687d9e3a")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C9")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 63.5 177.8 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581e5c3a")
		(property "Reference" "#PWR020"
			(at 57.15 177.8 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 59.1058 177.927 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 63.5 177.8 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 63.5 177.8 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 63.5 177.8 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "aa01351f-83f7-4d82-977d-26e1bc75867d")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR020")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:L")
		(at 101.6 177.8 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581e7670")
		(property "Reference" "L1"
			(at 101.6 172.339 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "FB0805/600R/2A"
			(at 101.6 174.6504 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:L_0805_5MIL_DWS"
			(at 100.33 177.8 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 100.33 177.8 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 101.6 177.8 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 101.6 177.8 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 101.6 177.8 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 101.6 177.8 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "e9358519-6eb9-41aa-b8a8-41d108f4246b")
		)
		(pin "2"
			(uuid "c0430c3f-4e5c-41ea-b793-3337132c6e29")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "L1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:RA1206_(4x0603)_4B8_Smashed")
		(at 500.38 90.17 180)
		(unit 2)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581e802f")
		(property "Reference" "RM3"
			(at 495.554 92.71 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify left)
			)
		)
		(property "Value" "RA1206_(4X0603)_4B8_2.2k"
			(at 523.24 118.11 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_MATRIX_4"
			(at 499.11 87.63 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 499.11 87.63 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 500.38 90.17 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 500.38 90.17 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 500.38 90.17 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 500.38 90.17 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1.1"
			(uuid "ee0e5058-1b26-4548-a1c3-7690ad9225b4")
		)
		(pin "1.2"
			(uuid "3beb9fb2-98f2-4431-8d8c-56607fad6cd1")
		)
		(pin "2.1"
			(uuid "aa6551ef-142b-4d35-85a5-77f9dda56bd0")
		)
		(pin "2.2"
			(uuid "2142ec97-b28e-4137-8ee2-31e51acc5fc5")
		)
		(pin "3.1"
			(uuid "a3d00286-d797-46de-8293-f166de163ef0")
		)
		(pin "3.2"
			(uuid "d7d1d355-3204-4901-a3b9-98938e0a6ef4")
		)
		(pin "4.1"
			(uuid "0198430e-bad1-437e-abc1-56ef7335b949")
		)
		(pin "4.2"
			(uuid "2b3f47cc-0e90-42f4-912b-46f326c1cd63")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "RM3")
					(unit 2)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:RA1206_(4x0603)_4B8_Smashed")
		(at 500.38 113.03 180)
		(unit 3)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581e8768")
		(property "Reference" "RM3"
			(at 495.808 115.824 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify left)
			)
		)
		(property "Value" "RA1206_(4X0603)_4B8_2.2k"
			(at 523.24 118.11 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_MATRIX_4"
			(at 499.11 110.49 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 499.11 110.49 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 500.38 113.03 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 500.38 113.03 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 500.38 113.03 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 500.38 113.03 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1.1"
			(uuid "150fb212-efef-4b4e-8ab2-c8d3f8ca04b5")
		)
		(pin "1.2"
			(uuid "e52337d8-82e9-4ad1-99b3-ff5402805209")
		)
		(pin "2.1"
			(uuid "3dbad0fc-d26f-4de4-b768-5006dffcbceb")
		)
		(pin "2.2"
			(uuid "b9a0dcea-77c0-47ff-b3f9-90cc1cfcd798")
		)
		(pin "3.1"
			(uuid "5e5762b6-4b70-4164-9feb-a820db4c2e5a")
		)
		(pin "3.2"
			(uuid "5fd0ee11-3860-4904-8cf5-861d12370829")
		)
		(pin "4.1"
			(uuid "b30b8d47-0150-4ad1-91c4-49f8c967456d")
		)
		(pin "4.2"
			(uuid "2ee59c02-801b-4856-a24c-480bc0686c83")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "RM3")
					(unit 3)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:RA1206_(4x0603)_4B8_Smashed")
		(at 500.38 110.49 180)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581e88db")
		(property "Reference" "RM3"
			(at 495.808 113.284 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify left)
			)
		)
		(property "Value" "RA1206_(4X0603)_4B8_2.2k"
			(at 523.24 118.11 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_MATRIX_4"
			(at 499.11 107.95 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 499.11 107.95 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 500.38 110.49 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 500.38 110.49 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 500.38 110.49 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 500.38 110.49 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1.1"
			(uuid "2f03d8bc-3b35-4607-b68b-d2f54169bc2f")
		)
		(pin "1.2"
			(uuid "aa66f9f5-0a7c-426f-84df-90bffa9d5974")
		)
		(pin "2.1"
			(uuid "cb35c227-162c-4e5c-bac0-43329393a186")
		)
		(pin "2.2"
			(uuid "60e96823-d767-4680-8f09-dae2ab62908e")
		)
		(pin "3.1"
			(uuid "f1194fbf-972b-45a3-805a-0913ccb351b9")
		)
		(pin "3.2"
			(uuid "d0dc6643-f6f6-418e-90d5-53ae2171e7b7")
		)
		(pin "4.1"
			(uuid "8b63b566-6805-401b-ad11-1b3d45c440f0")
		)
		(pin "4.2"
			(uuid "cb8395b0-9a19-45c5-8758-4b05f2d9bd67")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "RM3")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:RA1206_(4x0603)_4B8_Smashed")
		(at 500.38 107.95 180)
		(unit 4)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000581e8a47")
		(property "Reference" "RM3"
			(at 495.808 110.744 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify left)
			)
		)
		(property "Value" "RA1206_(4X0603)_4B8_2.2k"
			(at 523.24 118.11 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_MATRIX_4"
			(at 499.11 105.41 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 499.11 105.41 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 500.38 107.95 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 500.38 107.95 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 500.38 107.95 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 500.38 107.95 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1.1"
			(uuid "54344fdd-ef04-4087-9091-d5ae976d4a20")
		)
		(pin "1.2"
			(uuid "a05cf737-73fa-4270-989d-7359b6b8d0c2")
		)
		(pin "2.1"
			(uuid "6d0aff28-eebd-48fa-9968-3e97be633fcf")
		)
		(pin "2.2"
			(uuid "92e7340b-008d-4637-8b9b-2947c41c5820")
		)
		(pin "3.1"
			(uuid "ef2b6f13-6b03-4d41-b9f2-004d4bbfd369")
		)
		(pin "3.2"
			(uuid "aa3e3962-4e06-434e-b1bc-0f178fcee1c7")
		)
		(pin "4.1"
			(uuid "1001c8ac-8cf7-4464-bb5e-9266029f7105")
		)
		(pin "4.2"
			(uuid "c821709b-2b65-4db2-8bf3-6ebd2412d7fc")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "RM3")
					(unit 4)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:PWR_FLAG")
		(at 104.14 180.34 90)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058211fd0")
		(property "Reference" "#FLG06"
			(at 101.727 180.34 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "PWR_FLAG"
			(at 97.028 180.34 90)
			(effects
				(font
					(size 0.7874 0.7874)
				)
			)
		)
		(property "Footprint" ""
			(at 104.14 180.34 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 104.14 180.34 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 104.14 180.34 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "1a860ee8-d5cb-4ac6-bc99-cad61adbdf2d")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#FLG06")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:PWR_FLAG")
		(at 139.7 175.26 90)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000582123ac")
		(property "Reference" "#FLG07"
			(at 137.287 175.26 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "PWR_FLAG"
			(at 132.842 175.26 90)
			(effects
				(font
					(size 0.7874 0.7874)
				)
			)
		)
		(property "Footprint" ""
			(at 139.7 175.26 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 139.7 175.26 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 139.7 175.26 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "802c5958-6bfd-4842-8b80-27b937c40b9a")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#FLG07")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:PWR_FLAG")
		(at 546.1 93.98 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058216434")
		(property "Reference" "#FLG09"
			(at 546.1 91.567 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "PWR_FLAG"
			(at 546.1 89.408 0)
			(effects
				(font
					(size 0.7874 0.7874)
				)
			)
		)
		(property "Footprint" ""
			(at 546.1 93.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 546.1 93.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 546.1 93.98 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "f8083f11-41f4-418e-ad3d-686d0e9631db")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#FLG09")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:D_Schottky_Small")
		(at 530.86 271.78 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005825d356")
		(property "Reference" "D4"
			(at 531.114 267.716 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "1N5819S4/SOD123"
			(at 532.13 269.24 0)
			(effects
				(font
					(size 0.7874 0.7874)
				)
			)
		)
		(property "Footprint" "OLIMEX_Diodes-FP:SOD-123_1C-2A_KA"
			(at 530.86 271.78 90)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 530.86 271.78 90)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 530.86 271.78 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 530.86 271.78 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 530.86 271.78 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 530.86 271.78 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "cb230526-8f65-49d9-a200-26579914cdc6")
		)
		(pin "2"
			(uuid "51cd4f8d-f047-4cef-a434-804380fa109d")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "D4")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 88.9 238.76 270)
		(mirror x)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058265411")
		(property "Reference" "C2"
			(at 87.63 236.22 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "1nF/2000V/10%/X7R/C1206"
			(at 76.835 241.3 90)
			(effects
				(font
					(size 0.7874 0.7874)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_1206_5MIL_DWS_ISO"
			(at 88.9 238.76 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 88.9 238.76 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 88.9 238.76 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 88.9 238.76 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 88.9 238.76 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 88.9 238.76 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "9306ed54-62b4-4961-bf19-66a7cecb7b5b")
		)
		(pin "2"
			(uuid "657624e6-e790-4133-bc20-889f2cb0d23d")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 546.1 260.35 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000582660ef")
		(property "Reference" "R37"
			(at 545.338 263.652 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "10k/R0402"
			(at 545.592 248.158 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 544.322 260.35 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 546.1 260.35 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 546.1 260.35 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 546.1 260.35 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 546.1 260.35 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 546.1 260.35 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "752ac50f-3c39-47c6-bcd2-eb818503cd2a")
		)
		(pin "2"
			(uuid "99f5c8cf-1198-4858-bf72-1f76aa8faa5f")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R37")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 275.59 68.58 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058292085")
		(property "Reference" "R32"
			(at 270.256 67.564 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "10k/R0402"
			(at 275.59 70.866 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 275.59 70.358 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 275.59 68.58 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 275.59 68.58 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 275.59 68.58 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 275.59 68.58 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 275.59 68.58 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "f31a0e39-4637-42be-ae0f-206222657da0")
		)
		(pin "2"
			(uuid "e5ee1023-3b61-4d54-8742-4ff4efc62f2a")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R32")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 487.68 185.42 270)
		(mirror x)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000583373ec")
		(property "Reference" "#PWR069"
			(at 481.33 185.42 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 484.4288 185.293 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" ""
			(at 487.68 185.42 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 487.68 185.42 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 487.68 185.42 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "a7b2ac98-8ef7-4221-9064-3b88e1994f15")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR069")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+5V")
		(at 487.68 180.34 90)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005834e388")
		(property "Reference" "#PWR067"
			(at 491.49 180.34 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+5V"
			(at 484.4288 179.959 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" ""
			(at 487.68 180.34 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 487.68 180.34 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 487.68 180.34 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "f0422c36-08cb-4bfa-b93c-864200a42aae")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR067")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:CH340T(SSOP20W)")
		(at 119.38 347.98 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d41048")
		(property "Reference" "U1"
			(at 119.38 331.47 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Value" "CH340T(SSOP20W)"
			(at 119.38 365.76 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Footprint" "OLIMEX_IC-FP:SSOP-20W"
			(at 119.38 367.03 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 0 695.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 119.38 347.98 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "19"
			(uuid "f3041d58-3950-488c-9465-cde2af7be16e")
		)
		(pin "5"
			(uuid "8f0b1546-a90e-4e40-a641-fea0be3f1058")
		)
		(pin "8"
			(uuid "b8fb36b1-cde4-48d0-b688-48a371719c4a")
		)
		(pin "7"
			(uuid "ff8277a1-f7f3-4327-a67c-3d34ab86b068")
		)
		(pin "6"
			(uuid "02abbe1e-0797-4c35-bd30-5d33548a3915")
		)
		(pin "9"
			(uuid "7827ad66-5a24-467c-a966-36238abb0acd")
		)
		(pin "10"
			(uuid "3cda4896-4ffb-4537-9d05-cab10931293b")
		)
		(pin "3"
			(uuid "0583a1cc-1b00-49c4-9793-01f96668cb82")
		)
		(pin "4"
			(uuid "a87ea899-3d35-439d-9d19-b35173aaf175")
		)
		(pin "16"
			(uuid "2d98c5b6-0d9d-48a7-9457-ca4061678f81")
		)
		(pin "11"
			(uuid "2be0c10b-af94-4449-91c3-dd73bcdc20f8")
		)
		(pin "15"
			(uuid "d22a3974-3d94-40ca-81b3-300d3df0ffe0")
		)
		(pin "12"
			(uuid "fe4f6070-bd4c-4d90-a155-72da46683480")
		)
		(pin "14"
			(uuid "ac0727c1-b362-45e5-9505-133f20be9bc7")
		)
		(pin "13"
			(uuid "2882fd64-de69-4a45-9cec-b069ba68d20c")
		)
		(pin "20"
			(uuid "ba14243a-49cf-4927-bb7a-42af7f486745")
		)
		(pin "17"
			(uuid "a919ca38-977c-48b4-a3f4-35dfa628038b")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "U1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_name "USB-MINI_1")
		(lib_id "ESP32-PoE-ISO_Rev_K:USB-MINI")
		(at 30.48 350.52 0)
		(mirror y)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d440a7")
		(property "Reference" "USB-UART1"
			(at 40.64 332.74 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify left)
			)
		)
		(property "Value" "MISB-SWMM-5B-LF(USB_MICRO)"
			(at 65.405 335.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Connectors-FP:USB-MICRO_MISB-SWMM-5B_LF"
			(at 25.9588 353.2124 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify left)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 27.94 350.52 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 30.48 350.52 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "75e28835-0088-4bbd-a9bb-e03bb143f0e2")
		)
		(pin "2"
			(uuid "71333754-e7d5-45bd-8c22-9da9d44cbd04")
		)
		(pin "3"
			(uuid "5a2d086a-2887-4e08-b304-5a45c25c92f1")
		)
		(pin "4"
			(uuid "f87dbe96-8355-4fb3-8fb5-b683b28e0b67")
		)
		(pin "5"
			(uuid "2d083036-a7dc-4564-b91e-29f4726e906e")
		)
		(pin "0"
			(uuid "c297238a-1acb-4031-80f8-5f4fff21983a")
		)
		(pin "0"
			(uuid "f13882e8-e5e6-467c-a3aa-68f76a6165d7")
		)
		(pin "0"
			(uuid "acf40a36-e36d-40e1-9d35-1298f22f24d8")
		)
		(pin "0"
			(uuid "796562ca-8647-4e52-87ac-574e633006a4")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "USB-UART1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+3.3V")
		(at 568.96 35.56 0)
		(mirror y)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d45c48")
		(property "Reference" "#PWR073"
			(at 568.96 39.37 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+3V3"
			(at 571.5 31.75 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" ""
			(at 568.96 35.56 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 568.96 35.56 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 568.96 35.56 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "6c9ff3d9-41b3-4249-9a87-d953745a4ab0")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR073")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 544.83 43.18 0)
		(mirror y)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d45c51")
		(property "Reference" "R48"
			(at 550.164 42.164 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "10k/R0402"
			(at 535.94 41.91 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 544.83 44.958 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 544.83 43.18 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 544.83 43.18 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 544.83 43.18 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 544.83 43.18 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 544.83 43.18 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "a3d84048-6803-421e-ab14-c5b0c513022d")
		)
		(pin "2"
			(uuid "0f055558-3b58-43f3-9b68-43b75ebef20d")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R48")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 60.96 365.76 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d478c6")
		(property "Reference" "#PWR07"
			(at 60.96 372.11 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 60.96 369.57 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 60.96 365.76 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 60.96 365.76 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 60.96 365.76 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "5ebcc9d0-d409-486a-b064-981d3c14f33c")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR07")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 81.28 335.28 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d54432")
		(property "Reference" "C7"
			(at 75.565 334.01 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "22uF/6.3V/20%/X5R/C0603"
			(at 82.55 334.01 90)
			(effects
				(font
					(size 0.635 0.635)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0603_5MIL_DWS"
			(at 81.28 335.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 81.28 335.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 81.28 335.28 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 81.28 335.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 81.28 335.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 81.28 335.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "1e4e029b-5768-4bac-ad00-6887c7d33707")
		)
		(pin "2"
			(uuid "703daa4a-fe05-464a-8138-5cc9e5760793")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C7")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 76.2 342.9 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d54438")
		(property "Reference" "#PWR015"
			(at 69.85 342.9 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 71.8058 343.027 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 76.2 342.9 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 76.2 342.9 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 76.2 342.9 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "f772a64f-5735-4b98-89f0-0a191edb00c7")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR015")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 119.38 320.04 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d5af61")
		(property "Reference" "R18"
			(at 113.03 318.77 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "10k/R0402"
			(at 128.905 318.77 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 119.38 321.818 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 119.38 320.04 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 119.38 320.04 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 119.38 320.04 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 119.38 320.04 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 119.38 320.04 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "2c85c5f6-e1c5-461e-96af-a631f7e01a0f")
		)
		(pin "2"
			(uuid "05cdab76-5aca-4026-9551-560887496d39")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R18")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 119.38 325.12 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d5bb65")
		(property "Reference" "R19"
			(at 113.03 323.85 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "10k/R0402"
			(at 128.905 323.85 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 119.38 326.898 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 119.38 325.12 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 119.38 325.12 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 119.38 325.12 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 119.38 325.12 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 119.38 325.12 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "060acaeb-a9e7-4f08-bb97-98fc4a021151")
		)
		(pin "2"
			(uuid "6b0e0d96-f906-46f2-9652-a14b19ac1cb0")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R19")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 81.28 337.82 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d603a7")
		(property "Reference" "C8"
			(at 75.565 336.55 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "100nF/16V/10%/X7R/C0402"
			(at 82.55 336.55 90)
			(effects
				(font
					(size 0.635 0.635)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0402_5MIL_DWS"
			(at 81.28 337.82 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 81.28 337.82 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 81.28 337.82 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 81.28 337.82 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 81.28 337.82 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 81.28 337.82 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "85d3ea7d-4b79-4da8-931e-f9959a9ba697")
		)
		(pin "2"
			(uuid "63cb1972-05a8-4cbd-a30a-e86a9b56ba5a")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C8")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 76.2 335.28 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d65d8c")
		(property "Reference" "#PWR013"
			(at 69.85 335.28 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 71.8058 335.407 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 76.2 335.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 76.2 335.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 76.2 335.28 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "a61f2a75-14b2-4151-873d-a1079a7ca6c8")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR013")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 76.2 337.82 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d6665c")
		(property "Reference" "#PWR014"
			(at 69.85 337.82 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 71.8058 337.947 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 76.2 337.82 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 76.2 337.82 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 76.2 337.82 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "ebbb7b42-f39d-4727-8e4e-52f6dfb3df6c")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR014")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Q_NPN_BEC")
		(at 167.64 347.98 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d6b1bc")
		(property "Reference" "Q2"
			(at 172.4914 346.8116 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "BC817-40(SOT23)"
			(at 172.4914 349.123 0)
			(effects
				(font
					(size 1.016 1.016)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Transistors-FP:SOT23"
			(at 172.72 345.44 0)
			(effects
				(font
					(size 0.7366 0.7366)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 167.64 347.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 167.64 347.98 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "c7533a86-7936-47d5-8fca-e6ae156f8758")
		)
		(pin "3"
			(uuid "ebfa497f-34e1-47db-b992-82e77bede633")
		)
		(pin "2"
			(uuid "13b636cb-05d1-4301-9b65-7e6d7bfdc77c")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "Q2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 156.21 347.98 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d713ec")
		(property "Reference" "R20"
			(at 156.21 345.44 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "1k/R0402"
			(at 156.21 350.52 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 156.21 349.758 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 156.21 347.98 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 156.21 347.98 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 156.21 347.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 156.21 347.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 156.21 347.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "b0f9d0eb-b8d5-4d16-a191-6b23b6049679")
		)
		(pin "2"
			(uuid "e26b86ec-8455-45a4-ba26-dc5b97d3066d")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R20")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 81.28 355.6 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d7490c")
		(property "Reference" "C4"
			(at 75.565 354.33 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "27pF/50V/5%/C0G/C0402"
			(at 82.55 354.33 90)
			(effects
				(font
					(size 0.635 0.635)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0402_5MIL_DWS"
			(at 81.28 355.6 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 81.28 355.6 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 81.28 355.6 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 81.28 355.6 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 81.28 355.6 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 81.28 355.6 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "34b6fdba-4b22-46eb-8c98-d5e9d489acbd")
		)
		(pin "2"
			(uuid "abaab479-0213-4bc4-836b-d598010fe1af")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C4")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Q_NPN_BEC")
		(at 167.64 365.76 0)
		(mirror x)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d74bc0")
		(property "Reference" "Q3"
			(at 172.4914 364.5916 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "BC817-40(SOT23)"
			(at 172.4914 366.903 0)
			(effects
				(font
					(size 1.016 1.016)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Transistors-FP:SOT23"
			(at 172.72 368.3 0)
			(effects
				(font
					(size 0.7366 0.7366)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 167.64 365.76 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 167.64 365.76 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "7cdbcb92-1070-48ca-899a-447f0739a4fc")
		)
		(pin "3"
			(uuid "c8730f57-0d58-41b3-8664-4e0141519661")
		)
		(pin "2"
			(uuid "dd9510df-6b78-407c-adbc-7d8c90b9247c")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "Q3")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 156.21 365.76 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d74bc9")
		(property "Reference" "R21"
			(at 156.21 363.22 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "1k/R0402"
			(at 156.21 368.3 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 156.21 367.538 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 156.21 365.76 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 156.21 365.76 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 156.21 365.76 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 156.21 365.76 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 156.21 365.76 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "a6560669-8d17-41fb-88bf-1bf21ccc66e9")
		)
		(pin "2"
			(uuid "db60d90a-66f3-4c9c-827e-39e45da09ec2")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R21")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 81.28 360.68 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d751c0")
		(property "Reference" "C5"
			(at 75.565 359.41 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "27pF/50V/5%/C0G/C0402"
			(at 82.55 359.41 90)
			(effects
				(font
					(size 0.635 0.635)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0402_5MIL_DWS"
			(at 81.28 360.68 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 81.28 360.68 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 81.28 360.68 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 81.28 360.68 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 81.28 360.68 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 81.28 360.68 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "d67a0e8d-499c-4cf2-bf99-9456cdefe6bb")
		)
		(pin "2"
			(uuid "a8c15f5e-4ae6-492f-b775-7995a3a5b9f1")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C5")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 73.66 365.76 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d76952")
		(property "Reference" "#PWR011"
			(at 73.66 372.11 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 73.66 369.57 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 73.66 365.76 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 73.66 365.76 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 73.66 365.76 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "b1473782-d7b3-4b17-9ca1-ef13d5a490de")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR011")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:P-MOS+DIOD")
		(at 55.88 45.72 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058d9f018")
		(property "Reference" "FET1"
			(at 55.88 39.37 90)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Value" "WPM2015-3/TR"
			(at 55.88 52.07 90)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Footprint" "OLIMEX_Transistors-FP:SOT23"
			(at 52.5526 51.2064 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify left)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 55.88 45.72 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 55.88 45.72 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "3"
			(uuid "51a4fcc9-2ac9-4a80-a7bd-15d74f6ced9f")
		)
		(pin "2"
			(uuid "4caca49c-ea89-4be7-94ae-89fb5fa4c0da")
		)
		(pin "1"
			(uuid "29182f59-fa88-4558-b917-2789305c4af2")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "FET1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:D_Schottky")
		(at 54.61 60.96 0)
		(mirror y)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058da405c")
		(property "Reference" "D1"
			(at 54.61 58.42 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "1N5819S4/SOD123"
			(at 54.61 63.5 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "OLIMEX_Diodes-FP:SOD-123_1C-2A_KA"
			(at 54.61 57.6072 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 54.61 60.96 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 54.61 60.96 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "5a2c2822-1d21-4b3a-8509-835710fc9fac")
		)
		(pin "2"
			(uuid "177d5ea5-4c46-463e-9a85-6ecd0542c8c4")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "D1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 25.4 87.63 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058dc1a49")
		(property "Reference" "R1"
			(at 24.13 92.71 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "10k/R0402"
			(at 24.13 75.565 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 23.622 87.63 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 25.4 87.63 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 25.4 87.63 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 25.4 87.63 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 25.4 87.63 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 25.4 87.63 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "6ede5ed6-761e-4e1f-8738-2a3339580f0d")
		)
		(pin "2"
			(uuid "feda94b0-027c-49f5-9ad7-2b3b8515d705")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 25.4 104.14 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058dc3098")
		(property "Reference" "#PWR02"
			(at 25.4 110.49 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 25.4 107.95 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 25.4 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 25.4 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 25.4 104.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "b78c8bf7-e0de-447b-ba0b-fab803e4e6d7")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR02")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 181.61 378.46 0)
		(mirror x)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058eb833e")
		(property "Reference" "R24"
			(at 181.61 375.92 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "220R/R0402"
			(at 181.61 381 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 179.832 378.46 90)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 181.61 378.46 0)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 181.61 378.46 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "1416423b-fa66-4648-92fa-d60b01873226")
		)
		(pin "2"
			(uuid "3f352b9a-c1ee-49a9-a5e7-c3c33fb1fea9")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R24")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 544.83 111.76 0)
		(mirror x)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058f59dc8")
		(property "Reference" "R46"
			(at 549.275 110.49 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "220R/R0402"
			(at 544.83 115.57 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 543.052 111.76 90)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 544.83 111.76 0)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 544.83 111.76 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "6603d9bc-b4c8-49a1-8593-0cc65fc8deed")
		)
		(pin "2"
			(uuid "c987f7fe-4b4c-4ea0-afbb-25ec7ea4a983")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R46")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:BAT54C(SOT23-3)")
		(at 208.28 378.46 270)
		(mirror x)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000058f77bd8")
		(property "Reference" "D2"
			(at 211.455 377.19 90)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify left)
			)
		)
		(property "Value" "BAT54C(SOT23-3)"
			(at 211.455 379.73 90)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Diodes-FP:SOT23-3"
			(at 208.28 378.46 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 208.28 378.46 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 208.28 378.46 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "99de3341-d56b-49e0-bb5c-52a91114596b")
		)
		(pin "3"
			(uuid "60c0151b-eb70-40a8-84f7-50602d135280")
		)
		(pin "2"
			(uuid "44aae971-e419-4410-a075-0dc762f69fec")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "D2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 544.83 48.26 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000059031de1")
		(property "Reference" "R49"
			(at 549.91 46.99 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "NA/R0402"
			(at 536.575 46.99 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 544.83 50.038 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 544.83 48.26 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 544.83 48.26 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 544.83 48.26 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 544.83 48.26 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 544.83 48.26 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "c53061a0-0dba-4dd5-a4ff-a4589dbc48de")
		)
		(pin "2"
			(uuid "9278ce21-ae8c-468e-b959-8adaa16b2090")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R49")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:L")
		(at 391.16 218.44 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005ae1714e")
		(property "Reference" "L4"
			(at 391.16 214.63 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "33uH/2.1A/DCR=0.1R/20%/DBS135(PD3316MT330)"
			(at 394.335 215.9 0)
			(effects
				(font
					(size 0.508 0.508)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:DBS135"
			(at 389.89 218.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 389.89 218.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 391.16 218.44 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 391.16 218.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 391.16 218.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 391.16 218.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "da60c0a2-8fb5-460b-ae09-f1a5263776ac")
		)
		(pin "2"
			(uuid "19b5c8e3-e888-436a-b3c8-7c5392f550c4")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "L4")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:MICRO_SD(TFC-9P-1.xH(ATFFS150A01BR016))")
		(at 563.88 111.76 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005ae6629d")
		(property "Reference" "MICRO_SD1"
			(at 560.07 95.25 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "TFC-9P-1.7H(ATFFS150A01BR016)"
			(at 538.48 129.54 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Connectors-FP:uSD(TFC-9P-1.xH(ATFFS150A01BR016))"
			(at 569.722 105.41 0)
			(effects
				(font
					(size 0.508 0.508)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "http://www.globalsources.com/gsol/I/Memory-card/p/sm/1148705868.htm?pos_dd=prod_PrdtDDImage_1_24#1148705868"
			(at 572.7446 114.0714 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify left)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 563.88 111.76 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "2"
			(uuid "544d9147-5a2b-4f1e-b0a6-48ec84da6932")
		)
		(pin "3"
			(uuid "a7b5d1d5-908e-41ae-8c26-e3c2561963b2")
		)
		(pin "4"
			(uuid "7c67f4ed-e23d-45d8-9bd9-021073562c61")
		)
		(pin "6"
			(uuid "41fb8ebb-ddcd-4287-90c4-ba235c20411e")
		)
		(pin "5"
			(uuid "30c0858a-706e-48a3-ae91-df40380c5103")
		)
		(pin "7"
			(uuid "afa0b7d2-10eb-499a-b95f-23422e748a8f")
		)
		(pin "8"
			(uuid "4031738e-3fe3-46b0-9d59-83d49f128bef")
		)
		(pin "1"
			(uuid "d6cf8d07-06bd-4d61-b872-f5dfedceba5d")
		)
		(pin "CD1"
			(uuid "599559ac-34b4-4ba6-89df-6fc5d62c2216")
		)
		(pin "CH1"
			(uuid "64b1a928-ece1-4423-ad48-b9e580c3de57")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "MICRO_SD1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:LED")
		(at 139.7 223.52 0)
		(mirror x)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005ae89c85")
		(property "Reference" "ACT1"
			(at 148.59 224.79 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Value" "LED/YELLOW/0603"
			(at 148.59 227.33 0)
			(effects
				(font
					(size 0.889 0.889)
				)
				(justify right)
			)
		)
		(property "Footprint" "OLIMEX_LEDs-FP:LED_0603_KA"
			(at 139.7 223.52 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 139.7 223.52 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 139.7 223.52 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 139.7 223.52 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 139.7 223.52 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 139.7 223.52 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "20436a6d-92ba-4e48-9747-3bb4a8bc416c")
		)
		(pin "2"
			(uuid "bbebd6bd-de00-4656-9dc7-d049f64f179b")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "ACT1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:LED")
		(at 121.92 208.28 270)
		(mirror x)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005ae8b981")
		(property "Reference" "LNK1"
			(at 120.65 198.755 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Value" "LED/GREEN/0603"
			(at 123.19 189.865 0)
			(effects
				(font
					(size 1.016 1.016)
				)
				(justify right)
			)
		)
		(property "Footprint" "OLIMEX_LEDs-FP:LED_0603_KA"
			(at 121.92 208.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 121.92 208.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 121.92 208.28 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 121.92 208.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 121.92 208.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 121.92 208.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "ea807c29-4504-4879-a3a0-5e6790c3ce7b")
		)
		(pin "2"
			(uuid "3bdb0ccd-d0ca-4bce-b857-6e49be8af3b7")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "LNK1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Fiducial")
		(at 482.6 314.96 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005af57b2c")
		(property "Reference" "FID1"
			(at 485.8512 313.7916 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "Fiducial"
			(at 485.8512 316.103 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Other-FP:Fiducial1x3"
			(at 475.234 316.865 0)
			(effects
				(font
					(size 0.508 0.508)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 481.33 314.96 90)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 482.6 314.96 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "Fid1"
			(uuid "3818f5d1-0954-43e5-a503-180a312552f8")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "FID1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Fiducial")
		(at 518.16 314.96 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005af5872d")
		(property "Reference" "FID2"
			(at 521.4112 313.7916 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "Fiducial"
			(at 521.4112 316.103 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Other-FP:Fiducial1x3"
			(at 510.794 316.865 0)
			(effects
				(font
					(size 0.508 0.508)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 516.89 314.96 90)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 518.16 314.96 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "Fid1"
			(uuid "d80cbfa5-14ef-4fb4-9ac6-f43279f3b4d5")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "FID2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 96.52 91.44 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005af75f7f")
		(property "Reference" "C1"
			(at 97.155 89.535 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "22uF/6.3V/20%/X5R/C0603"
			(at 97.155 93.345 0)
			(effects
				(font
					(size 0.635 0.635)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0603_5MIL_DWS"
			(at 96.52 91.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 96.52 91.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 96.52 91.44 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 96.52 91.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 96.52 91.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 96.52 91.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "f7dda2f1-d16d-460d-ae60-022116177644")
		)
		(pin "2"
			(uuid "120d1528-ca3c-48e0-87a9-05529b587147")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Fiducial")
		(at 553.72 314.96 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005afc6f83")
		(property "Reference" "FID3"
			(at 556.9712 313.7916 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "Fiducial"
			(at 556.9712 316.103 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Other-FP:Fiducial1x3"
			(at 546.354 316.865 0)
			(effects
				(font
					(size 0.508 0.508)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 552.45 314.96 90)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 553.72 314.96 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "Fid1"
			(uuid "5fdafb70-f04d-484d-a7b0-8f4766240b87")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "FID3")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 177.8 88.9 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005afe3ee0")
		(property "Reference" "C6"
			(at 176.276 87.884 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "22uF/6.3V/20%/X5R/C0603"
			(at 180.34 106.68 90)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0603_5MIL_DWS"
			(at 177.8 88.9 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 177.8 88.9 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 177.8 88.9 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 177.8 88.9 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 177.8 88.9 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 177.8 88.9 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "56c3c331-8266-4df8-a5e1-53d03a2f88a4")
		)
		(pin "2"
			(uuid "4c6bedc7-f81f-4415-9fde-9fcbe3bc73e0")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C6")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:RJP-003TC1(LPJ4112CNL)")
		(at 48.26 231.14 0)
		(mirror y)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005b205ee4")
		(property "Reference" "LAN_CON1"
			(at 35.56 208.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Value" "RJP-003TC1(LPJ4112CNL)"
			(at 48.26 251.46 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Footprint" "OLIMEX_Connectors-FP:RJP-003TC1(LPJ4112CNL)"
			(at 45.72 231.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "https://www.dacomwest.de/images/Dateien/Taimag/Dokumente/RJ45/Tab-Down/RJP-003TC1-A1_20051226.pdf"
			(at 45.72 231.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 48.26 231.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "bb6f8b9f-2cfa-40a3-90cd-5d382f7e84aa")
		)
		(pin "4"
			(uuid "ca386203-3d32-4d04-9d66-333b9633b85a")
		)
		(pin "2"
			(uuid "04dba1e5-262b-47d1-997f-d43f9af447e3")
		)
		(pin "3"
			(uuid "6c27245e-cb30-4b19-af9b-e533fb55f8e6")
		)
		(pin "5"
			(uuid "b6ac93d0-966b-4644-a740-45a70599d9f7")
		)
		(pin "6"
			(uuid "6097bb2c-cad0-4e70-a62a-ba66f25ce56b")
		)
		(pin "7"
			(uuid "d81cbe1d-0126-4a45-b216-107a9c957cf6")
		)
		(pin "8"
			(uuid "b5d46d5f-633f-418d-a916-7e5ce412337e")
		)
		(pin "0"
			(uuid "c3bc8401-6d70-45ee-b4c1-11bc1c069e87")
		)
		(pin "9"
			(uuid "25631b23-db6f-4b19-aeda-fe0c05fcd244")
		)
		(pin "10"
			(uuid "933e56c0-9318-4c8c-9095-6655b400b533")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "LAN_CON1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 25.4 158.75 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005b6a4ab2")
		(property "Reference" "C10"
			(at 22.86 160.02 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "22uF/6.3V/20%/X5R/C0603"
			(at 27.94 167.64 90)
			(effects
				(font
					(size 0.7874 0.7874)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0603_5MIL_DWS"
			(at 25.4 158.75 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 25.4 158.75 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 25.4 158.75 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 25.4 158.75 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 25.4 158.75 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 25.4 158.75 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "1af1e838-0f45-4fff-9bf7-ef3a1d2acb16")
		)
		(pin "2"
			(uuid "e8709635-2df5-4c41-bfb2-1309c42f528f")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C10")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 43.18 176.53 90)
		(mirror x)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005b7b3037")
		(property "Reference" "R3"
			(at 40.64 175.26 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "1k/R0402"
			(at 45.72 172.72 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 44.958 176.53 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 43.18 176.53 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 43.18 176.53 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 43.18 176.53 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 43.18 176.53 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 43.18 176.53 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "2c88c1e6-d53e-4035-bb0b-e329e9f34589")
		)
		(pin "2"
			(uuid "c3bfa74d-ea45-47bd-9672-25150ba55b5e")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R3")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 441.96 246.38 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005b805d06")
		(property "Reference" "#PWR064"
			(at 441.96 252.73 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 441.96 249.936 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 441.96 246.38 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 441.96 246.38 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 441.96 246.38 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "4046bbcb-553c-48f8-80b3-5685236e8d23")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR064")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:L")
		(at 45.72 363.22 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005b980c23")
		(property "Reference" "L3"
			(at 45.72 360.68 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "FB0805/600R/2A"
			(at 45.72 364.49 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:L_0805_5MIL_DWS"
			(at 44.45 363.22 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 44.45 363.22 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 45.72 363.22 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 45.72 363.22 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 45.72 363.22 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 45.72 363.22 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "2400125f-5af3-4a7a-b9d8-cb6a447a55e6")
		)
		(pin "2"
			(uuid "973e3b30-9c04-44eb-a0cf-bd4688dafb5f")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "L3")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 535.94 132.08 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005b9c4f1e")
		(property "Reference" "#PWR0113"
			(at 535.94 138.43 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 535.94 135.89 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 535.94 132.08 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 535.94 132.08 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 535.94 132.08 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "7b85a4b6-252a-429d-b40c-f4e25480c66f")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR0113")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+5V")
		(at 220.98 27.94 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005ba26569")
		(property "Reference" "#PWR03"
			(at 220.98 31.75 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+5V"
			(at 220.98 24.13 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 220.98 27.94 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 220.98 27.94 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 220.98 27.94 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "7d97f91f-5a6b-47a2-a3c6-30f73bd17244")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR03")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 220.98 34.29 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005bb31fb4")
		(property "Reference" "R4"
			(at 222.25 33.02 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "47k/R0402"
			(at 222.25 35.56 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 219.202 34.29 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 220.98 34.29 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 220.98 34.29 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 220.98 34.29 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 220.98 34.29 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 220.98 34.29 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "fadb0194-65a9-4885-949c-b2b66ff150f0")
		)
		(pin "2"
			(uuid "7f4fc4b1-59e8-4ba8-8555-6c5b207e1e84")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R4")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 220.98 46.99 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005bb8b906")
		(property "Reference" "R9"
			(at 222.25 45.72 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "100k/R0402"
			(at 222.25 48.26 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 219.202 46.99 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 220.98 46.99 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 220.98 46.99 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 220.98 46.99 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 220.98 46.99 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 220.98 46.99 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "a87f5730-9779-4dc0-8079-9700e686e80f")
		)
		(pin "2"
			(uuid "07de92ab-a3e2-4404-9b8f-85d62808897c")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R9")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+5VP")
		(at 441.96 205.74 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005bbb341e")
		(property "Reference" "#PWR063"
			(at 441.96 209.55 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+5VP"
			(at 442.341 201.3458 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 441.96 205.74 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 441.96 205.74 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 441.96 205.74 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "d4afba0d-57a9-4cee-858c-3845bf5653ed")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR063")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 220.98 53.34 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005bbe4bc2")
		(property "Reference" "#PWR04"
			(at 220.98 59.69 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 220.98 57.15 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 220.98 53.34 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 220.98 53.34 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 220.98 53.34 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "693ab76c-34e0-4594-8003-c379b589ae1a")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR04")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+5VP")
		(at 25.4 30.48 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005bc2241a")
		(property "Reference" "#PWR01"
			(at 25.4 34.29 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+5VP"
			(at 25.4 26.67 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 25.4 30.48 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 25.4 30.48 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 25.4 30.48 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "fd20553e-2818-4cd4-a132-6fd8b391376e")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR01")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 88.9 104.14 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005bc6b860")
		(property "Reference" "#PWR0110"
			(at 88.9 110.49 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 88.9 107.95 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 88.9 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 88.9 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 88.9 104.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "1f8ed5e9-a4c1-4544-ab82-c3df5a60f3bd")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR0110")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 96.52 104.14 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005bc6b866")
		(property "Reference" "#PWR0111"
			(at 96.52 110.49 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 96.52 107.95 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 96.52 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 96.52 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 96.52 104.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "80636d31-f041-4c71-8673-a14e34a93d2e")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR0111")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:BL4054B-42TPRN(SOT23-5)")
		(at 119.38 91.44 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005bc6b942")
		(property "Reference" "U3"
			(at 119.38 83.185 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Value" "BL4054B-42TPRN(SOT23-5)"
			(at 119.38 102.87 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Footprint" "OLIMEX_IC-FP:SOT-23-5"
			(at 119.38 91.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "https://datasheet.lcsc.com/szlcsc/BL4054B-42TPRN_C83783.pdf"
			(at 119.38 91.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 119.38 91.44 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "4"
			(uuid "725acc44-f944-41ac-aa30-e6a3bcce673b")
		)
		(pin "2"
			(uuid "1fb90a87-e7ba-4b11-93ec-80aad5d2dacd")
		)
		(pin "3"
			(uuid "264ef339-c1d0-47b5-9725-c49b7859916d")
		)
		(pin "1"
			(uuid "d7d49f3f-68a2-4bf0-aed3-ac7c59c08e88")
		)
		(pin "5"
			(uuid "63f3f109-4bd9-45eb-9b6e-6503bc87ae18")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "U3")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 135.89 96.52 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005bc6b94d")
		(property "Reference" "R6"
			(at 135.89 93.98 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "10k/R0402"
			(at 135.89 99.06 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 135.89 98.298 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 135.89 96.52 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 135.89 96.52 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 135.89 96.52 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 135.89 96.52 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 135.89 96.52 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "9d9253f4-7180-4246-9d48-688b264eb2f3")
		)
		(pin "2"
			(uuid "df798c0a-315d-4c80-99ce-2c20a112c1cd")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R6")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 144.78 104.14 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005bc6b956")
		(property "Reference" "#PWR0112"
			(at 144.78 110.49 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 144.78 107.95 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 144.78 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 144.78 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 144.78 104.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "4fb051ba-e1fe-4e73-b833-c2413ed78408")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR0112")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:PWR_FLAG")
		(at 38.1 33.02 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005bd89886")
		(property "Reference" "#FLG01"
			(at 38.1 30.607 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "PWR_FLAG"
			(at 38.1 27.3304 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 38.1 33.02 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 38.1 33.02 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 38.1 33.02 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "38a6d251-2a43-4e42-9b48-e78bbd6d6cfb")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#FLG01")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:P-MOS+DIOD")
		(at 45.72 157.48 0)
		(mirror y)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005c017824")
		(property "Reference" "FET3"
			(at 45.72 144.78 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Value" "WPM2015-3/TR"
			(at 45.72 147.32 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Footprint" "OLIMEX_Transistors-FP:SOT23"
			(at 40.2336 160.8074 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify left)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 45.72 157.48 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 45.72 157.48 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "3"
			(uuid "165e2c8c-990c-4c42-97b3-248dd23a7e57")
		)
		(pin "2"
			(uuid "547f86d5-0fc5-4adc-947d-2028ae2e699d")
		)
		(pin "1"
			(uuid "9684f734-f4d3-4783-8cc6-b05b736ce864")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "FET3")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:F0505S-2WR2_AM1D-0505S-NZ(SIP-7_Universal)")
		(at 426.72 220.98 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005c1530de")
		(property "Reference" "DCDC1"
			(at 427.355 213.36 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "F0505S-2WR2(SIP-7)"
			(at 429.26 228.6 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "OLIMEX_Regulators-FP:SIP-7_Universal"
			(at 427.482 218.44 0)
			(effects
				(font
					(size 0.508 0.508)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 426.72 222.25 0)
			(effects
				(font
					(size 2.54 2.54)
				)
			)
		)
		(property "Description" ""
			(at 426.72 220.98 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "125e1933-4ea5-4ca3-9e9d-8516d69be0bd")
		)
		(pin "2"
			(uuid "c534da04-9cd5-42b8-8cae-e7f30566f9b1")
		)
		(pin "7"
			(uuid "350860fe-2673-4e75-8b9b-d89bf9026702")
		)
		(pin "5"
			(uuid "db6adb80-82db-4dfe-996d-26e65b279e8f")
		)
		(pin "6"
			(uuid "11118c4d-83fb-4387-8d21-a74559791da1")
		)
		(pin "4"
			(uuid "2e039ac4-51ec-49fe-9135-d60fe4c1960b")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "DCDC1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:CP")
		(at 325.12 213.36 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005c1538f7")
		(property "Reference" "C27"
			(at 319.405 213.36 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "15uF/100V/20%/RM2.5/6.3x11mm(Farnell:1281844)"
			(at 321.945 222.25 0)
			(effects
				(font
					(size 0.508 0.508)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:CPOL-RM2.5mm_6.3x11mm_PTH"
			(at 325.12 213.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 325.12 213.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 325.12 213.36 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "212ad9e0-5a13-43d0-8756-ebd155be3372")
		)
		(pin "2"
			(uuid "c79424b2-86cf-46aa-ad91-870d8365b60a")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C27")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 426.72 208.28 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005c19245d")
		(property "Reference" "C20"
			(at 423.164 207.264 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "NA(1.0nF/3kV/10%/X7R/SMD/1808(VISHAY-VJ1808Y102KBHAT4X_Farnell-2407291))"
			(at 429.26 210.82 90)
			(effects
				(font
					(size 0.381 0.381)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_1808(4520)_5MIL_DWS_ISO"
			(at 426.72 208.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 426.72 208.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 426.72 208.28 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 426.72 208.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 426.72 208.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 426.72 208.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "9aca5bc0-52b3-45b6-a5c8-bb729432ded0")
		)
		(pin "2"
			(uuid "f3f48f21-8aea-4ba6-843f-ada23286a766")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C20")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 43.18 198.12 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005c4696fd")
		(property "Reference" "#PWR0101"
			(at 43.18 204.47 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 43.307 202.5142 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 43.18 198.12 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 43.18 198.12 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 43.18 198.12 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "4622041d-f04b-45e2-b7b9-82611666ff13")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR0101")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 426.72 241.3 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005c47aa6b")
		(property "Reference" "C23"
			(at 429.895 240.03 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "1.0nF/3kV/10%/X7R/SMD/1808(VISHAY-VJ1808Y102KBHAT4X_Farnell-2407291)"
			(at 429.26 243.84 90)
			(effects
				(font
					(size 0.381 0.381)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_1808(4520)_5MIL_DWS_ISO"
			(at 426.72 241.3 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 426.72 241.3 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 426.72 241.3 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 426.72 241.3 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 426.72 241.3 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 426.72 241.3 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "2b3cf5d4-d358-4140-8840-ddffda9cc6de")
		)
		(pin "2"
			(uuid "224de724-d2ed-4583-9681-e7e1ed48e908")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C23")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 190.5 34.29 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005c50d7e9")
		(property "Reference" "R7"
			(at 191.77 33.02 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "470k/R0402"
			(at 191.77 35.56 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 188.722 34.29 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 190.5 34.29 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 190.5 34.29 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 190.5 34.29 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 190.5 34.29 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 190.5 34.29 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "0af4912e-e1e9-4a80-a13f-200368c173f6")
		)
		(pin "2"
			(uuid "8221c112-12fa-4869-a4cc-c99ef7a12851")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R7")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 190.5 46.99 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005c50d7f6")
		(property "Reference" "R16"
			(at 191.77 45.72 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "470k/R0402"
			(at 191.77 48.26 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 188.722 46.99 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 190.5 46.99 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 190.5 46.99 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 190.5 46.99 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 190.5 46.99 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 190.5 46.99 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "fb9c0149-d3a6-4187-99ac-94d2b47082f2")
		)
		(pin "2"
			(uuid "2f9ac0dc-51b8-4c29-95b1-68a566aa790e")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R16")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 441.96 220.98 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005c546775")
		(property "Reference" "C19"
			(at 440.69 219.964 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "22uF/6.3V/20%/X5R/C0603"
			(at 444.5 231.14 90)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0603_5MIL_DWS"
			(at 441.96 220.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 441.96 220.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 441.96 220.98 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 441.96 220.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 441.96 220.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 441.96 220.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "db93b56d-1c50-4a5b-ab16-ef195b6ffe76")
		)
		(pin "2"
			(uuid "c4db39a4-b0cc-4971-ba1b-2c8345893b82")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C19")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Earth")
		(at 411.48 246.38 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005c597e0b")
		(property "Reference" "#PWR0114"
			(at 411.48 252.73 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "Earth"
			(at 411.48 250.19 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Footprint" ""
			(at 411.48 246.38 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 411.48 246.38 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 411.48 246.38 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "508d616f-cd51-4dd9-855d-904bade9edae")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR0114")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 35.56 158.75 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005c5c6fac")
		(property "Reference" "R2"
			(at 33.02 157.48 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "10k/R0402"
			(at 38.1 152.4 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 33.782 158.75 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 35.56 158.75 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 35.56 158.75 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 35.56 158.75 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 35.56 158.75 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 35.56 158.75 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "509c47d0-39f7-4986-87f0-574bf94f9445")
		)
		(pin "2"
			(uuid "353de96c-aed7-47ba-9852-6c0c2d9696df")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 185.42 48.26 0)
		(mirror y)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005c7690bb")
		(property "Reference" "C28"
			(at 180.975 48.26 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "1nF/50V/10%/X7R/C0402"
			(at 182.88 45.085 90)
			(effects
				(font
					(size 0.889 0.889)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0402_5MIL_DWS"
			(at 185.42 48.26 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 185.42 48.26 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 185.42 48.26 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 185.42 48.26 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 185.42 48.26 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 185.42 48.26 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "59a8a731-d947-47f8-aa26-d14eeef4058c")
		)
		(pin "2"
			(uuid "0c4f861d-e8f2-4d43-98f8-3e0eabd38cdc")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C28")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:D_Schottky")
		(at 156.21 335.28 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005c84b827")
		(property "Reference" "D6"
			(at 157.48 332.74 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Value" "1N5819S4/SOD123"
			(at 179.07 334.01 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" "OLIMEX_Diodes-FP:SOD-123_1C-2A_KA"
			(at 156.21 335.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 156.21 335.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 156.21 335.28 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 156.21 335.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 156.21 335.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 156.21 335.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "e112dc73-cb86-46ec-8137-c073ed9bdf26")
		)
		(pin "2"
			(uuid "8fe6112e-d2c9-4241-a63f-cb7a3953d5a4")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "D6")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:D_Schottky")
		(at 156.21 337.82 180)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005c84cb00")
		(property "Reference" "D7"
			(at 154.94 340.36 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Value" "1N5819S4/SOD123"
			(at 160.02 339.09 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" "OLIMEX_Diodes-FP:SOD-123_1C-2A_KA"
			(at 156.21 337.82 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 156.21 337.82 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 156.21 337.82 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 156.21 337.82 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 156.21 337.82 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 156.21 337.82 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "1178bc47-e7c5-49e2-a8b3-8a70c7a35f2a")
		)
		(pin "2"
			(uuid "79a26e0e-a0d9-4d5b-a819-1cb619c070d9")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "D7")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 190.5 53.34 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005c88ef70")
		(property "Reference" "#PWR010"
			(at 190.5 59.69 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 190.5 57.15 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 190.5 53.34 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 190.5 53.34 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 190.5 53.34 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "6232fc09-2035-49ba-84a6-6d8bb2d4cf2e")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR010")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 185.42 53.34 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005c88f0be")
		(property "Reference" "#PWR06"
			(at 185.42 59.69 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 185.42 57.15 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 185.42 53.34 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 185.42 53.34 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 185.42 53.34 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "131eb9a5-66b9-475e-857c-5bd1a006635d")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR06")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 167.64 320.04 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005c93a47d")
		(property "Reference" "R17"
			(at 170.18 320.04 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "NA/R0402"
			(at 165.1 320.04 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 165.862 320.04 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 167.64 320.04 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 167.64 320.04 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 167.64 320.04 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 167.64 320.04 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 167.64 320.04 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "3b0e0717-13c5-4d12-a25c-28e8b97b2e26")
		)
		(pin "2"
			(uuid "e653e9fb-de00-46ed-9d32-68e41c7d9d1e")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R17")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+3.3V")
		(at 167.64 313.69 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005ca093ee")
		(property "Reference" "#PWR0115"
			(at 167.64 317.5 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+3V3"
			(at 164.465 309.88 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" ""
			(at 167.64 313.69 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 167.64 313.69 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 167.64 313.69 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "9e55c642-1ba2-4c6b-8895-1bc23d0ae435")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR0115")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+3.3VLAN")
		(at 88.9 165.1 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005cadaafe")
		(property "Reference" "#PWR0102"
			(at 88.9 168.91 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+3.3VLAN"
			(at 88.9 161.29 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 88.9 165.1 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 88.9 165.1 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 88.9 165.1 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "31e15584-31b3-4e45-992c-50c3af5e8f53")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR0102")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+3.3VLAN")
		(at 226.06 185.42 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005cb32987")
		(property "Reference" "#PWR0103"
			(at 222.25 185.42 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+3.3VLAN"
			(at 233.68 185.42 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 226.06 185.42 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 226.06 185.42 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 226.06 185.42 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "f2aa91ed-4052-422a-b10d-a5567c8e4c6f")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR0103")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+3.3VLAN")
		(at 226.06 218.44 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005cd98449")
		(property "Reference" "#PWR0104"
			(at 222.25 218.44 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+3.3VLAN"
			(at 233.68 218.44 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 226.06 218.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 226.06 218.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 226.06 218.44 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "030b6919-e8fa-4db4-9549-ef26425e9475")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR0104")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+3.3VLAN")
		(at 226.06 220.98 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005cd98a2e")
		(property "Reference" "#PWR0105"
			(at 222.25 220.98 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+3.3VLAN"
			(at 233.68 220.98 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 226.06 220.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 226.06 220.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 226.06 220.98 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "44d81823-1dc7-4a26-8250-1a1d7af9b7a1")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR0105")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+3.3VLAN")
		(at 226.06 231.14 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005cd98f08")
		(property "Reference" "#PWR0106"
			(at 222.25 231.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+3.3VLAN"
			(at 233.68 231.14 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 226.06 231.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 226.06 231.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 226.06 231.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "f4f189e7-f807-4305-acad-b92a446b39e5")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR0106")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:PWR_FLAG")
		(at 73.66 167.64 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005cd9ad58")
		(property "Reference" "#FLG0101"
			(at 73.66 165.227 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "PWR_FLAG"
			(at 73.66 162.56 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 73.66 167.64 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 73.66 167.64 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 73.66 167.64 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "7ae88f79-5b03-4c2a-8d6d-b0b093afb4f1")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#FLG0101")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+3.3VLAN")
		(at 226.06 195.58 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005cdf4e72")
		(property "Reference" "#PWR0107"
			(at 222.25 195.58 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+3.3VLAN"
			(at 233.68 195.58 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 226.06 195.58 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 226.06 195.58 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 226.06 195.58 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "d5367b3b-93f6-4862-960f-04677094c0ab")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR0107")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:PWR_FLAG")
		(at 101.6 317.5 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005cf7f041")
		(property "Reference" "#FLG0103"
			(at 101.6 315.087 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "PWR_FLAG"
			(at 101.6 311.8104 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 101.6 317.5 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 101.6 317.5 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 101.6 317.5 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "1f0306e5-2c7b-49e7-be27-8ff0c5d49019")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#FLG0103")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:PWR_FLAG")
		(at 99.06 340.36 90)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005d0563a5")
		(property "Reference" "#FLG0104"
			(at 96.647 340.36 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "PWR_FLAG"
			(at 88.9 340.36 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 99.06 340.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 99.06 340.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 99.06 340.36 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "5b85e779-d4c5-4db1-8cad-d6264c644d61")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#FLG0104")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+3.3V")
		(at 541.02 243.84 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005d0b798b")
		(property "Reference" "#PWR0108"
			(at 541.02 247.65 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+3V3"
			(at 541.401 239.4458 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 541.02 243.84 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 541.02 243.84 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 541.02 243.84 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "099a1a8b-e086-4267-89e6-6a8ee0b572c9")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR0108")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+3.3V")
		(at 487.68 182.88 90)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005ddff542")
		(property "Reference" "#PWR071"
			(at 491.49 182.88 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+3V3"
			(at 484.4288 182.499 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" ""
			(at 487.68 182.88 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 487.68 182.88 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 487.68 182.88 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "590e1bad-55d7-49ae-b69d-eec3e28099f5")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR071")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:PWR_FLAG")
		(at 416.56 205.74 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005de39224")
		(property "Reference" "#FLG0102"
			(at 416.56 203.327 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "PWR_FLAG"
			(at 416.56 200.0504 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 416.56 205.74 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 416.56 205.74 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 416.56 205.74 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "8cfb5012-0483-4343-b896-13f8e881d99f")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#FLG0102")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 226.06 198.12 90)
		(mirror x)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005df052b0")
		(property "Reference" "#PWR0109"
			(at 232.41 198.12 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 231.14 198.12 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 226.06 198.12 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 226.06 198.12 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 226.06 198.12 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "1b46195b-5e5a-47b5-83fc-14f93b614cf9")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR0109")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 284.48 104.14 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005df92edb")
		(property "Reference" "#PWR012"
			(at 284.48 110.49 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 284.48 107.696 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 284.48 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 284.48 104.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 284.48 104.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "904be167-c1aa-4b30-86a0-0fe1315493c1")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR012")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 284.48 86.36 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005df92eec")
		(property "Reference" "C31"
			(at 282.956 85.344 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "1uF/10V/20%/X5R/C0603"
			(at 287.02 104.14 90)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0603_5MIL_DWS"
			(at 284.48 86.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 284.48 86.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 284.48 86.36 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 284.48 86.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 284.48 86.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 284.48 86.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "de2e023c-d6f8-4f40-b1ab-316eef57adcb")
		)
		(pin "2"
			(uuid "310435b1-fd41-4ad1-b5fa-3cac1719c8b6")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C31")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 276.86 218.44 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005e2ce24b")
		(property "Reference" "C24"
			(at 275.59 217.17 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "100nF/100V/10%/X7R/C0603"
			(at 279.4 229.87 90)
			(effects
				(font
					(size 0.889 0.889)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0603_5MIL_DWS"
			(at 276.86 218.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 276.86 218.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 276.86 218.44 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 276.86 218.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 276.86 218.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 276.86 218.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "8591ca72-1546-41d1-81d1-c3a93a36147f")
		)
		(pin "2"
			(uuid "4518f87c-1cee-4aa1-8c1d-07305890b913")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C24")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:CON10")
		(at 502.92 190.5 0)
		(mirror y)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005e770e9a")
		(property "Reference" "EXT1"
			(at 504.19 176.53 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Value" "NS(HN1x10)"
			(at 500.38 207.01 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Footprint" "OLIMEX_Connectors-FP:HN1x10"
			(at 504.825 181.61 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 504.825 181.61 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 502.92 190.5 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "db9c6923-0513-47a4-87bf-07a1ad05ae83")
		)
		(pin "2"
			(uuid "5b764619-962a-4168-8817-5967bebdbefd")
		)
		(pin "3"
			(uuid "09908095-15ab-49c6-9f8d-14e58b3381be")
		)
		(pin "4"
			(uuid "d298e96c-8179-4687-bf0a-272bcad099ad")
		)
		(pin "5"
			(uuid "5c999abc-8eee-454b-b7d7-5addc16d9b35")
		)
		(pin "6"
			(uuid "f6985e18-37c4-4d89-a20b-84ef6a87747f")
		)
		(pin "7"
			(uuid "651ceced-054e-4ece-89fc-8ba90d96d9e1")
		)
		(pin "8"
			(uuid "94ee7165-b872-455c-a1a0-1abae456d904")
		)
		(pin "9"
			(uuid "f9f162b4-438f-4304-99e6-2fd39363a043")
		)
		(pin "10"
			(uuid "336d00a4-a647-4fec-90b7-0128a854c770")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "EXT1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:CON10")
		(at 543.56 190.5 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005e7ca00a")
		(property "Reference" "EXT2"
			(at 542.29 176.53 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Value" "NS(HN1x10)"
			(at 546.1 207.01 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Footprint" "OLIMEX_Connectors-FP:HN1x10"
			(at 541.655 181.61 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 541.655 181.61 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 543.56 190.5 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "c3c7b318-deb6-4fd9-8f56-cec6bba30731")
		)
		(pin "2"
			(uuid "ce6b4a33-bf3f-428a-ad67-b61df4edb2d1")
		)
		(pin "3"
			(uuid "19c67f07-3f45-497e-a8a2-53f28c8ab191")
		)
		(pin "4"
			(uuid "f34ca626-e6fa-4db0-a6c0-8ecb4b734a16")
		)
		(pin "5"
			(uuid "25b8eed5-5a5e-4446-8222-9a4d930657b1")
		)
		(pin "6"
			(uuid "fc11b7a6-79a7-49ac-9402-a689aececc09")
		)
		(pin "7"
			(uuid "a921b129-be8f-4104-ad69-46d6c42be09d")
		)
		(pin "8"
			(uuid "d721aa33-9afe-4ac9-a3c6-d16a7d049c76")
		)
		(pin "9"
			(uuid "4827f4d2-0b0f-4732-9d30-103990cf08ef")
		)
		(pin "10"
			(uuid "76e02ac9-ac82-4bc5-a1a5-fe09b79217e2")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "EXT2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Earth")
		(at 96.52 254 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005f12a4a0")
		(property "Reference" "#PWR023"
			(at 96.52 260.35 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "Earth"
			(at 96.52 257.81 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Footprint" ""
			(at 96.52 254 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 96.52 254 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 96.52 254 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "959aa849-124f-4d2e-bd65-8a1b4ebf4704")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR023")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Crystal_GND")
		(at 101.6 358.14 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005f6ff775")
		(property "Reference" "Q1"
			(at 102.87 358.14 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "Q12MHz/20pF/10ppm/4P/3.2x2.5mm"
			(at 73.66 363.22 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Crystal-FP:TSX-3.2x2.5mm_GND(3)"
			(at 103.7082 360.4514 90)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify left)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 101.6 358.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 101.6 358.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "5f476df7-1e1d-4706-b075-cb0eb1cd27ab")
		)
		(pin "3"
			(uuid "c55a0296-ad00-45e8-b4bc-016a63297a0b")
		)
		(pin "2"
			(uuid "790558fd-dddb-42c4-9daa-c40b50aa5260")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "Q1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Fiducial")
		(at 482.6 325.12 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005faaf1b6")
		(property "Reference" "FID4"
			(at 485.8512 323.9516 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "Fiducial"
			(at 485.8512 326.263 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Other-FP:Fiducial1x3"
			(at 475.234 327.025 0)
			(effects
				(font
					(size 0.508 0.508)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 481.33 325.12 90)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 482.6 325.12 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "Fid1"
			(uuid "0bb7d0e8-95e6-48d6-8001-949e89b8b2df")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "FID4")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Fiducial")
		(at 518.16 325.12 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005faaf1bc")
		(property "Reference" "FID5"
			(at 521.4112 323.9516 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "Fiducial"
			(at 521.4112 326.263 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Other-FP:Fiducial1x3"
			(at 510.794 327.025 0)
			(effects
				(font
					(size 0.508 0.508)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 516.89 325.12 90)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 518.16 325.12 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "Fid1"
			(uuid "960da29e-eaad-4d96-af0a-85008a3e9d48")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "FID5")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Fiducial")
		(at 553.72 325.12 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00005faaf1c2")
		(property "Reference" "FID6"
			(at 556.9712 323.9516 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "Fiducial"
			(at 556.9712 326.263 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Other-FP:Fiducial1x3"
			(at 546.354 327.025 0)
			(effects
				(font
					(size 0.508 0.508)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 552.45 325.12 90)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 553.72 325.12 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "Fid1"
			(uuid "55545ae5-2e85-41a0-8360-2ba64693eabf")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "FID6")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:SMBJ6.0A")
		(at 449.58 220.98 270)
		(mirror x)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000060ba028c")
		(property "Reference" "D8"
			(at 447.675 217.17 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left bottom)
			)
		)
		(property "Value" "NA(SMBJ6.0A)"
			(at 447.04 238.76 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left bottom)
			)
		)
		(property "Footprint" "OLIMEX_Diodes-FP:DO214AA_1(K)-2(A)"
			(at 453.39 220.218 0)
			(effects
				(font
					(size 0.508 0.508)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 449.58 220.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 449.58 220.98 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "2"
			(uuid "d2b54d81-eaf9-41d8-b726-64e3aebe7e8b")
		)
		(pin "1"
			(uuid "3135c454-edb9-4c9c-8a04-f0af2293be1b")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "D8")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:PWR_FLAG")
		(at 78.74 233.68 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000060dd0e15")
		(property "Reference" "#FLG0105"
			(at 81.153 233.68 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "PWR_FLAG"
			(at 85.598 233.68 90)
			(effects
				(font
					(size 0.7874 0.7874)
				)
			)
		)
		(property "Footprint" ""
			(at 78.74 233.68 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 78.74 233.68 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 78.74 233.68 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "efff51ff-f7b6-4829-b8d5-19c02681076d")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#FLG0105")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:D_Schottky")
		(at 184.15 340.36 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000060de5205")
		(property "Reference" "D9"
			(at 191.135 339.09 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Value" "1N5819S4/SOD123"
			(at 207.01 341.63 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" "OLIMEX_Diodes-FP:SOD-123_1C-2A_KA"
			(at 184.15 340.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 184.15 340.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 184.15 340.36 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 184.15 340.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 184.15 340.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 184.15 340.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "887c4c7c-ca4c-4039-af23-e949d6832cbe")
		)
		(pin "2"
			(uuid "a05c73ee-446e-4828-b296-f50684b6661b")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "D9")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GG0402052R542P")
		(at 132.08 246.38 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000060e22d35")
		(property "Reference" "TVS2"
			(at 130.175 243.84 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "NA(GG0402052R542P)"
			(at 133.985 238.76 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Diodes-FP:D_0402_5MIL_DWS"
			(at 133.8072 247.4214 90)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify left)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 132.08 245.745 90)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 132.08 246.38 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "dfa1a1d3-52ab-4974-9de0-85f51208045c")
		)
		(pin "2"
			(uuid "096260b3-511f-4526-9e84-cc8e1b0968bb")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "TVS2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GG0402052R542P")
		(at 142.24 246.38 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000060e9d90c")
		(property "Reference" "TVS3"
			(at 140.335 243.84 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "NA(GG0402052R542P)"
			(at 144.145 238.76 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Diodes-FP:D_0402_5MIL_DWS"
			(at 143.9672 247.4214 90)
			(effects
				(font
					(size 1.524 1.524)
				)
				(justify left)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 142.24 245.745 90)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 142.24 246.38 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "382194fc-501b-4dbb-8ee0-91b7fc44d185")
		)
		(pin "2"
			(uuid "706d9f3e-c9ba-4b17-8aac-364242246cab")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "TVS3")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:ESDS314DBVR(SOT-23-5)")
		(at 91.44 200.66 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000060eb404f")
		(property "Reference" "TVS1"
			(at 91.44 188.849 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "ESDS314DBVR(SOT-23-5)"
			(at 91.44 191.1604 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "OLIMEX_Diodes-FP:SOT-23-5"
			(at 91.44 188.2902 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "https://www.ti.com/lit/gpn/esds314"
			(at 91.44 190.9826 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 91.44 200.66 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "3111eb3a-2e45-414e-8512-98b4124646cb")
		)
		(pin "1"
			(uuid "315c53d4-b3d1-45dc-b581-1ee9e07b222f")
		)
		(pin "2"
			(uuid "90268ace-7239-4564-a784-c2577f964360")
		)
		(pin "3"
			(uuid "a0f3dbc0-1426-4789-b397-bfdd8f85782a")
		)
		(pin "5"
			(uuid "41ab086f-bc21-444f-879b-b7cdc1624ab9")
		)
		(pin "4"
			(uuid "3188cd47-2a7f-42ec-8cac-3a80ce910fde")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "TVS1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 78.74 205.74 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000060f8e240")
		(property "Reference" "#PWR0116"
			(at 78.74 212.09 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 78.867 210.1342 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 78.74 205.74 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 78.74 205.74 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 78.74 205.74 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "cc07152f-5e9c-435c-876a-da51f25412d4")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR0116")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:SMBJ6.0A")
		(at 269.24 218.44 90)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00006148a29d")
		(property "Reference" "D10"
			(at 266.065 217.17 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Value" "SMAJ58A/SMA"
			(at 272.415 212.09 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" "OLIMEX_Diodes-FP:SMA-KA"
			(at 265.43 217.678 0)
			(effects
				(font
					(size 0.508 0.508)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 269.24 218.44 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 269.24 218.44 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "2"
			(uuid "ff06e90c-e3bf-435e-b2b0-b7c1199f4511")
		)
		(pin "1"
			(uuid "7494e14a-f79e-4210-8779-4a220badb48f")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "D10")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 288.29 215.9 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00006148a2af")
		(property "Reference" "R22"
			(at 283.718 214.884 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "24.9k/1%/R0402"
			(at 289.052 213.36 0)
			(effects
				(font
					(size 1.016 1.016)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 288.29 217.678 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 288.29 215.9 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 288.29 215.9 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "1d9b3686-8994-45d5-8c34-36537d699a50")
		)
		(pin "2"
			(uuid "8f686b6c-434f-4ff0-b207-5b7e6117ab2f")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R22")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 288.29 223.52 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00006148a2ba")
		(property "Reference" "R27"
			(at 283.845 222.25 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "4.42k/1%/1/16W/R0402"
			(at 289.56 226.06 0)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 288.29 225.298 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 288.29 223.52 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 288.29 223.52 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "7ad011d9-2069-4365-86d5-6d0b41c91f48")
		)
		(pin "2"
			(uuid "f3c8bc7f-a2a8-4107-a331-0281be15a188")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R27")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 334.01 218.44 180)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00006148a2d6")
		(property "Reference" "R28"
			(at 335.915 216.535 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "0.03R/1%/R1206"
			(at 339.09 220.345 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_1206_5MIL_DWS"
			(at 334.01 216.662 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 334.01 218.44 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 334.01 218.44 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "f8763a24-bcb2-45e9-82d3-4171a3c23530")
		)
		(pin "2"
			(uuid "ff7eae9e-8a2c-4134-8b9a-8471b34600b2")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R28")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 378.46 213.36 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00006148a2e6")
		(property "Reference" "C12"
			(at 378.46 210.82 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "100nF/100V/10%/X7R/C0603"
			(at 373.38 217.17 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0603_5MIL_DWS"
			(at 378.46 213.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 378.46 213.36 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 378.46 213.36 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "58d81eb4-b1f3-4efa-b38c-731aa0472929")
		)
		(pin "2"
			(uuid "a208b61a-9043-405a-8e9d-2561843f4a3c")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C12")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 369.57 213.36 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00006148a2ec")
		(property "Reference" "R33"
			(at 369.57 210.82 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "4.7R/R0402"
			(at 369.57 215.265 0)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 369.57 215.138 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 369.57 213.36 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 369.57 213.36 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "41038f07-ad94-4ab9-8453-1da0c3945da7")
		)
		(pin "2"
			(uuid "94b2012f-8892-4ba6-8750-858b1d4d2f26")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R33")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:CP")
		(at 411.48 223.52 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00006148a2fa")
		(property "Reference" "C26"
			(at 413.385 221.615 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "470uF/10V/20%/Low_ESR/RM2.5/6.0x11mm"
			(at 408.94 233.68 90)
			(effects
				(font
					(size 0.635 0.635)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:CPOL-RM2.5mm_6.3x11mm_PTH"
			(at 411.48 223.52 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 411.48 223.52 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 411.48 223.52 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "b3039e00-5390-4ae2-bd42-b8dd47e6a8cc")
		)
		(pin "2"
			(uuid "1449fda8-8151-4b47-bdaf-74a5e7302121")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C26")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 403.86 223.52 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00006148a300")
		(property "Reference" "R38"
			(at 401.955 222.25 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "56.2k/1%/R0402"
			(at 406.4 219.71 0)
			(effects
				(font
					(size 1.016 1.016)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 402.082 223.52 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 403.86 223.52 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 403.86 223.52 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "5f9268a7-165b-46f9-b52e-f6a4db8198e3")
		)
		(pin "2"
			(uuid "25098557-5495-4e2c-bb88-ffa406ee5b16")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R38")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 382.27 231.14 180)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00006148a312")
		(property "Reference" "R34"
			(at 378.46 229.87 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "10.5k/1%/R0402"
			(at 398.145 229.87 0)
			(effects
				(font
					(size 1.016 1.016)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 382.27 229.362 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 382.27 231.14 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 382.27 231.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "12d0c09f-63b3-4e2a-b431-b04c80d0b902")
		)
		(pin "2"
			(uuid "6e9a8bef-2bf4-4d5b-8057-a10549ba1405")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R34")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 398.78 223.52 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00006148a322")
		(property "Reference" "C25"
			(at 394.335 221.615 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "12pF/50V/5%/COG/C0402"
			(at 384.81 225.425 0)
			(effects
				(font
					(size 0.635 0.635)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0402_5MIL_DWS"
			(at 398.78 223.52 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 398.78 223.52 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 398.78 223.52 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "8ec75e23-816e-4869-ba5b-0f8576a78645")
		)
		(pin "2"
			(uuid "be8f13a6-5dc1-4bbc-aaf3-f0d00fe1eb12")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C25")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:TX4138(ESOIC-8)")
		(at 353.06 218.44 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00006148a33c")
		(property "Reference" "U5"
			(at 353.06 206.629 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "TX4138(ESOIC-8)"
			(at 353.06 208.9404 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "OLIMEX_Regulators-FP:ESOIC-8"
			(at 353.06 231.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "https://datasheet.lcsc.com/lcsc/1811141153_XDS-TX4138_C329267.pdf"
			(at 354.33 218.44 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 353.06 218.44 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "3"
			(uuid "2ca97645-4816-443f-8aa8-bb45960141ea")
		)
		(pin "2"
			(uuid "d7b19e1e-15e6-4193-9372-f62e014b4f48")
		)
		(pin "9"
			(uuid "1478cf90-b764-4fda-bab9-65e1ef002128")
		)
		(pin "6"
			(uuid "91b51815-954f-4dec-b285-96ac5f8d3fd3")
		)
		(pin "7"
			(uuid "c8845f97-64ae-4cb4-ba5a-800682f25e39")
		)
		(pin "4"
			(uuid "4671173e-c1ba-4f0a-8f72-173cad977cbf")
		)
		(pin "8"
			(uuid "ae8788df-7f4a-4852-b7a6-25231cbf286c")
		)
		(pin "1"
			(uuid "9727e1ea-7823-4739-998d-c4d527d419cb")
		)
		(pin "5"
			(uuid "3e07d8ba-74f6-4e84-811c-f57fd0a70fe6")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "U5")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 288.29 218.44 0)
		(mirror y)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00006148a368")
		(property "Reference" "R23"
			(at 285.75 217.17 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "180k/1%/R0402"
			(at 295.275 220.345 0)
			(effects
				(font
					(size 1.016 1.016)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 288.29 220.218 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 288.29 218.44 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 288.29 218.44 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "56f52a57-a3cf-41af-89a4-eb73f483a623")
		)
		(pin "2"
			(uuid "31614d4c-b2b3-4b56-a5e4-325524863a5d")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R23")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:TPS2375PW(TSSOP-8)")
		(at 304.8 220.98 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-00006148a380")
		(property "Reference" "U2"
			(at 299.72 210.82 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "TPS2376PW(TSSOP-8)"
			(at 293.37 229.87 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "OLIMEX_IC-FP:TSSOP-8_Pitch-0.65mm_Dimensions-4.40x3.00x1.20mm"
			(at 304.8 233.68 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" "https://www.ti.com/lit/gpn/tps2375"
			(at 304.8 220.98 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 304.8 220.98 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "3"
			(uuid "60e26241-3636-437a-b127-063752dac975")
		)
		(pin "1"
			(uuid "571ad226-2170-4a92-9068-8b4b5751e512")
		)
		(pin "2"
			(uuid "cd83e27c-01cf-40d4-8366-8dbbe731eda3")
		)
		(pin "8"
			(uuid "8d3e206d-4065-4f5e-976e-f197ce95bd4e")
		)
		(pin "4"
			(uuid "15730f5a-058c-4d6a-8b43-910afd97fba1")
		)
		(pin "6"
			(uuid "2fbd5045-e3ee-45b6-97ea-981a7dea3d7a")
		)
		(pin "7"
			(uuid "36c32d30-a84a-4dfd-be07-fc466c41240d")
		)
		(pin "5"
			(uuid "77ffed32-a2b6-4e77-bc81-133a7b4c2d3b")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "U2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Earth")
		(at 325.12 217.17 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000614a5e01")
		(property "Reference" "#PWR0117"
			(at 325.12 223.52 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "Earth"
			(at 325.12 220.98 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Footprint" ""
			(at 325.12 217.17 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 325.12 217.17 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 325.12 217.17 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "575ee7b5-454b-4dd6-affb-11c1d16ca053")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR0117")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 316.23 203.2 0)
		(mirror y)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000618bbcff")
		(property "Reference" "R41"
			(at 317.5 200.66 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "4.7k/R2512"
			(at 320.04 205.74 0)
			(effects
				(font
					(size 0.9906 0.9906)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_2512_MM_DWS"
			(at 316.23 204.978 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 316.23 203.2 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 316.23 203.2 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 316.23 203.2 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 316.23 203.2 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 316.23 203.2 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "c5dde1fc-5007-4b47-bf7d-bac573b9fb79")
		)
		(pin "2"
			(uuid "b1d7bad5-124b-42de-a068-1c9f97713f22")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R41")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Earth")
		(at 307.34 203.2 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061a997c6")
		(property "Reference" "#PWR05"
			(at 300.99 203.2 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "Earth"
			(at 303.53 203.2 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Footprint" ""
			(at 307.34 203.2 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 307.34 203.2 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 307.34 203.2 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "46a5b6c3-2c8b-4aaf-b33c-f2f151f6af22")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR05")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:LMUN2211LT1G(SOT-23)")
		(at 45.72 190.5 0)
		(mirror y)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061b818fe")
		(property "Reference" "T1"
			(at 40.5638 189.5348 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "LMUN2211LT1G(SOT-23)"
			(at 40.5638 191.6684 0)
			(effects
				(font
					(size 1.016 1.016)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Transistors-FP:SOT23"
			(at 34.29 194.31 0)
			(effects
				(font
					(size 0.508 0.508)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 45.72 190.5 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 45.72 190.5 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "90f4a107-463b-4f0b-9303-315079ba9e79")
		)
		(pin "3"
			(uuid "842b57b7-2843-4f2d-a119-5c4fbab663d4")
		)
		(pin "2"
			(uuid "c8a24eaf-177f-49d3-8a56-61539da78e76")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "T1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Earth")
		(at 317.5 231.14 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061bb1b02")
		(property "Reference" "#PWR016"
			(at 317.5 237.49 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "Earth"
			(at 317.5 234.95 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Footprint" ""
			(at 317.5 231.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 317.5 231.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 317.5 231.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "910e8654-dd69-40e9-b4f2-a17979e17124")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR016")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Earth")
		(at 353.06 231.14 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061c4a1eb")
		(property "Reference" "#PWR021"
			(at 353.06 237.49 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "Earth"
			(at 353.06 234.95 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Footprint" ""
			(at 353.06 231.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 353.06 231.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 353.06 231.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "373b54a4-57d5-4635-b9b8-19e5ee794e39")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR021")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Earth")
		(at 370.84 231.14 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061d5c3f4")
		(property "Reference" "#PWR024"
			(at 364.49 231.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "Earth"
			(at 367.03 231.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Footprint" ""
			(at 370.84 231.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 370.84 231.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 370.84 231.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "8c2b23fe-9501-4b8f-b8b3-1f0037fc7c69")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR024")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Earth")
		(at 370.84 220.98 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061de61bf")
		(property "Reference" "#PWR022"
			(at 364.49 220.98 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "Earth"
			(at 367.03 220.98 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Footprint" ""
			(at 370.84 220.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 370.84 220.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 370.84 220.98 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "6116f5a1-e781-4878-a594-8d0cc4e4551c")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR022")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Earth")
		(at 411.48 231.14 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000061e6eef2")
		(property "Reference" "#PWR026"
			(at 411.48 237.49 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "Earth"
			(at 411.48 234.95 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Footprint" ""
			(at 411.48 231.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 411.48 231.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 411.48 231.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "5b0f8500-5a56-448d-a736-1bb3b089bebe")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR026")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Earth")
		(at 416.56 231.14 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000626ccbb3")
		(property "Reference" "#PWR028"
			(at 416.56 237.49 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "Earth"
			(at 416.56 234.95 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Footprint" ""
			(at 416.56 231.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 416.56 231.14 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 416.56 231.14 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "ab69c74e-d9d7-4f37-8158-246c8af40b69")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR028")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:D_Schottky_Small")
		(at 375.92 220.98 180)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000062851726")
		(property "Reference" "D5"
			(at 380.365 219.71 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "SS510/100V/5A/0.85V/DO214AB(SMC)"
			(at 377.825 223.52 0)
			(effects
				(font
					(size 0.635 0.635)
				)
			)
		)
		(property "Footprint" "OLIMEX_Diodes-FP:DO214AB(SMC)_1(K)-2(A)"
			(at 375.92 220.98 90)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 375.92 220.98 90)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 375.92 220.98 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 375.92 220.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 375.92 220.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 375.92 220.98 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "579eacb2-6b2d-4b46-ac06-ab1e7b4495d4")
		)
		(pin "2"
			(uuid "8323f261-b229-4a0f-959a-d3834745d64c")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "D5")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:ESP32-WROVER(WROOM)-UNIVERSAL")
		(at 337.82 86.36 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000629a8840")
		(property "Reference" "U6"
			(at 337.82 43.18 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Value" "ESP32-WROVER-E"
			(at 325.12 132.08 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Footprint" "OLIMEX_Cases-FP:ESP32-WROVER(WROOM)-UNIVERSAL_MODULE"
			(at 337.4898 43.6118 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 314.96 81.28 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 337.82 86.36 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "2"
			(uuid "8031943e-a1b3-4a80-a9e8-722a96453331")
		)
		(pin "1"
			(uuid "cacabd04-7c2b-4a17-924e-e9868f57e60f")
		)
		(pin "15"
			(uuid "a6deb5cd-ecfe-48b5-8509-ea9cd06c9ffe")
		)
		(pin "38"
			(uuid "e0e25775-e7a3-4410-aaa9-b616768c88b5")
		)
		(pin "39"
			(uuid "a27b7b65-db0d-4b78-9e53-868f6a108ef1")
		)
		(pin "3"
			(uuid "0b551658-1430-44f4-b8bc-d7864d15f37f")
		)
		(pin "32"
			(uuid "0c409b99-7a2a-4d1b-9b32-c111a24f0118")
		)
		(pin "25"
			(uuid "16f0860d-df36-4a79-a496-d38224f1fe57")
		)
		(pin "35"
			(uuid "7d100e41-18f3-4b2d-a84a-d45cae7e7c02")
		)
		(pin "24"
			(uuid "5440918a-d1d9-4a01-a87d-765e7d913aab")
		)
		(pin "34"
			(uuid "d720701b-e581-4e8c-9086-8cd94c722af3")
		)
		(pin "26"
			(uuid "200385e1-d6f1-47a6-b676-3c8990b6a6e0")
		)
		(pin "29"
			(uuid "452050cb-f5f6-4eed-b776-e88badd826d3")
		)
		(pin "20"
			(uuid "21f753e4-564b-4b06-aa6f-2ece29a0a435")
		)
		(pin "21"
			(uuid "6072ca6e-f20e-4d4c-974a-5ab1d1015957")
		)
		(pin "22"
			(uuid "24ed94c1-3a1c-498b-9f6c-311c3afc7b69")
		)
		(pin "17"
			(uuid "76f97412-a446-41fe-896b-ae37f7f3da73")
		)
		(pin "18"
			(uuid "fa15d24e-2382-45cd-82a5-10fdeb054812")
		)
		(pin "19"
			(uuid "85488520-1ec9-402e-ab1d-0b932856fbc2")
		)
		(pin "14"
			(uuid "624e17f1-fa2f-4911-92fe-476ce0d03e9e")
		)
		(pin "16"
			(uuid "008577bd-e69d-4dd5-95be-77f30915dbb6")
		)
		(pin "13"
			(uuid "f958910b-afda-4657-be8e-972efdae7691")
		)
		(pin "23"
			(uuid "d8ea6e36-929b-4025-8254-35594adb4876")
		)
		(pin "27"
			(uuid "016a779e-8e2c-4549-8127-5b70cc165336")
		)
		(pin "28"
			(uuid "ce1da42e-b729-4c49-812b-663cd431f3e9")
		)
		(pin "30"
			(uuid "3d7df109-22c2-4bd7-9a28-2571e62d4960")
		)
		(pin "31"
			(uuid "01b3daee-0e26-409f-9706-b531d82feb2f")
		)
		(pin "33"
			(uuid "b6e83f69-ad95-4b3b-adcd-ea0a7d8905df")
		)
		(pin "36"
			(uuid "31285761-948c-4730-b2f2-1d5c4178a96c")
		)
		(pin "37"
			(uuid "43143d65-cead-4d65-8b87-2667c10a4b10")
		)
		(pin "10"
			(uuid "be31b541-9860-4104-ab6f-1196230c93fc")
		)
		(pin "11"
			(uuid "8d8a651e-4d2f-44b8-9671-a46ca4525bc0")
		)
		(pin "12"
			(uuid "ee6691cd-5463-417f-87ab-c402cf7197a0")
		)
		(pin "8"
			(uuid "c3249492-4b3c-4b10-920f-b65b43eb88cb")
		)
		(pin "9"
			(uuid "a4865379-b925-48cd-9da5-17f73260bce7")
		)
		(pin "6"
			(uuid "61219894-d622-45a2-a8e1-dd71caa97051")
		)
		(pin "7"
			(uuid "72fcf6de-5b62-460d-b999-bf056df2d60a")
		)
		(pin "4"
			(uuid "fa4489fa-a28a-499d-a9b0-88754913b170")
		)
		(pin "5"
			(uuid "c3932224-50ec-4d96-af7e-32df3d4f641b")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "U6")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:SN74LVC1G04DBVR(SOT23-5)")
		(at 187.96 139.7 0)
		(mirror y)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000062b288b4")
		(property "Reference" "U8"
			(at 187.96 133.35 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "SN74LVC1G04DBVR(SOT23-5)"
			(at 187.96 146.05 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "OLIMEX_IC-FP:SOT-23-5"
			(at 187.96 148.59 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 187.96 139.7 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 187.96 139.7 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "2"
			(uuid "2d35a045-98c5-4463-84c8-ab4ba408b66f")
		)
		(pin "1"
			(uuid "db4d5057-0f65-4e32-a1f3-508832f40449")
		)
		(pin "3"
			(uuid "1c7f5d84-6a12-4112-84cb-dbf5a3417b64")
		)
		(pin "4"
			(uuid "a2017de3-b487-405e-a93c-30a785c68324")
		)
		(pin "5"
			(uuid "aac827a0-aa72-4754-aba6-eebbd872cc16")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "U8")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:GND")
		(at 213.36 142.24 90)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000062bdfd5a")
		(property "Reference" "#PWR019"
			(at 219.71 142.24 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "GND"
			(at 216.6112 142.113 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify right)
			)
		)
		(property "Footprint" ""
			(at 213.36 142.24 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 213.36 142.24 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 213.36 142.24 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "8efdf0ce-e2b4-45f6-8150-83acc85c37ec")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR019")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:C")
		(at 187.96 149.86 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000062d4179b")
		(property "Reference" "C29"
			(at 184.404 148.844 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "100nF/16V/10%/X7R/C0402"
			(at 187.96 152.4 90)
			(effects
				(font
					(size 0.9906 0.9906)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:C_0402_5MIL_DWS"
			(at 187.96 149.86 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 187.96 149.86 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 187.96 149.86 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 187.96 149.86 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 187.96 149.86 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 187.96 149.86 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "b4aa1d79-8432-4e57-a231-4180a0586fee")
		)
		(pin "2"
			(uuid "9e5277ea-3a2d-4915-9165-7b6d1bab8184")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "C29")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 281.94 245.11 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000633df51c")
		(property "Reference" "R43"
			(at 283.21 243.84 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "130k/R0402"
			(at 283.21 246.38 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 280.162 245.11 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 281.94 245.11 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 281.94 245.11 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 281.94 245.11 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 281.94 245.11 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 281.94 245.11 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "13cae884-bab9-4d53-a49b-9bc6452a25bf")
		)
		(pin "2"
			(uuid "7572aa6b-489f-4c59-bcc8-ec1125b51c6a")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R43")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 281.94 255.27 270)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-0000634674b4")
		(property "Reference" "R44"
			(at 283.21 254 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "10k/R0402"
			(at 283.21 256.54 90)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 280.162 255.27 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 281.94 255.27 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 281.94 255.27 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 281.94 255.27 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 281.94 255.27 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 281.94 255.27 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "4f4518fd-b161-41bc-ae1f-a18d8c6863c1")
		)
		(pin "2"
			(uuid "cb94ffd0-a4fb-426c-8605-9ad69c6884d7")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R44")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:+3.3VLAN")
		(at 165.1 142.24 90)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000063967d6c")
		(property "Reference" "#PWR09"
			(at 168.91 142.24 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Value" "+3.3VLAN"
			(at 157.48 142.24 90)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" ""
			(at 165.1 142.24 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Datasheet" ""
			(at 165.1 142.24 0)
			(effects
				(font
					(size 1.524 1.524)
				)
			)
		)
		(property "Description" ""
			(at 165.1 142.24 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(pin "1"
			(uuid "bae63824-be6a-47a6-adcf-a8284d406750")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "#PWR09")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:R")
		(at 186.69 157.48 0)
		(mirror y)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000063af013b")
		(property "Reference" "R42"
			(at 181.61 156.21 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Value" "10R/R0402"
			(at 195.58 156.21 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Footprint" "OLIMEX_RLC-FP:R_0402_5MIL_DWS"
			(at 186.69 159.258 0)
			(effects
				(font
					(size 0.762 0.762)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 186.69 157.48 90)
			(effects
				(font
					(size 0.762 0.762)
				)
			)
		)
		(property "Description" ""
			(at 186.69 157.48 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Fieldname 1" "Value 1"
			(at 186.69 157.48 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname2" "Value2"
			(at 186.69 157.48 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(property "Fieldname3" "Value3"
			(at 186.69 157.48 0)
			(effects
				(font
					(size 1.524 1.524)
				)
				(hide yes)
			)
		)
		(pin "1"
			(uuid "5b5042de-ea31-4776-a052-20932105c6f5")
		)
		(pin "2"
			(uuid "97f00088-6168-4825-8496-2a80f3433cf9")
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "R42")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Mounting_Hole_NPTH")
		(at 482.6 360.68 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000063d64adb")
		(property "Reference" "MH1"
			(at 480.695 355.6 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "Mounting_Hole_NPTH"
			(at 473.075 365.125 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Other-FP:NPTH_2.2mm"
			(at 481.33 360.68 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 481.33 360.68 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 482.6 360.68 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "MH1")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Mounting_Hole_NPTH")
		(at 518.16 360.68 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000063e59c7a")
		(property "Reference" "MH2"
			(at 516.255 355.6 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "Mounting_Hole_NPTH"
			(at 508.635 365.125 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Other-FP:NPTH_2.2mm"
			(at 516.89 360.68 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 516.89 360.68 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 518.16 360.68 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "MH2")
					(unit 1)
				)
			)
		)
	)
	(symbol
		(lib_id "ESP32-PoE-ISO_Rev_K:Mounting_Hole_NPTH")
		(at 553.72 360.68 0)
		(unit 1)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(dnp no)
		(uuid "00000000-0000-0000-0000-000063ed2510")
		(property "Reference" "MH3"
			(at 551.815 355.6 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "Mounting_Hole_NPTH"
			(at 544.195 365.125 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "OLIMEX_Other-FP:NPTH_2.2mm"
			(at 552.45 360.68 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Datasheet" ""
			(at 552.45 360.68 0)
			(effects
				(font
					(size 1.27 1.27)
				)
				(hide yes)
			)
		)
		(property "Description" ""
			(at 553.72 360.68 0)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(instances
			(project ""
				(path "/b0918c41-b461-44d3-bf5c-8abd0b2cc1d3"
					(reference "MH3")
					(unit 1)
				)
			)
		)
	)
	(sheet_instances
		(path "/"
			(page "1")
		)
	)
	(embedded_fonts no)
)
