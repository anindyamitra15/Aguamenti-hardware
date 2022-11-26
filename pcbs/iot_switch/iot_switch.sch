EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Converter_ACDC:HLK-PM12 PS1
U 1 1 636E1249
P 2300 2600
F 0 "PS1" H 2450 2300 50  0000 C CNN
F 1 "HLK-PM12" H 2350 2400 50  0000 C CNN
F 2 "Converter_ACDC:Converter_ACDC_HiLink_HLK-PMxx" H 2300 2300 50  0001 C CNN
F 3 "http://www.hlktech.net/product_detail.php?ProId=56" H 2700 2250 50  0001 C CNN
	1    2300 2600
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U1
U 1 1 636E489E
P 3800 2500
F 0 "U1" H 3800 2742 50  0000 C CNN
F 1 "L7805" H 3800 2651 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 3825 2350 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 3800 2450 50  0001 C CNN
	1    3800 2500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 636E306F
P 3850 1250
F 0 "J1" V 3950 1300 50  0000 R CNN
F 1 "AC IN" V 3850 1050 50  0000 R CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 3850 1250 50  0001 C CNN
F 3 "~" H 3850 1250 50  0001 C CNN
	1    3850 1250
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 636E42A9
P 7450 1250
F 0 "J2" V 7550 1200 50  0000 L CNN
F 1 "LOAD OUT" V 7450 650 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 7450 1250 50  0001 C CNN
F 3 "~" H 7450 1250 50  0001 C CNN
	1    7450 1250
	0    -1   -1   0   
$EndComp
$Comp
L Triac_Thyristor:BT136-500 Q1
U 1 1 636E4FA8
P 7100 2250
F 0 "Q1" V 7228 2296 50  0000 L CNN
F 1 "BT136-500" V 6950 2250 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 7300 2175 50  0001 L CIN
F 3 "http://www.micropik.com/PDF/BT136-600.pdf" H 7100 2250 50  0001 L CNN
	1    7100 2250
	0    -1   -1   0   
$EndComp
$Comp
L Relay_SolidState:MOC3021M U3
U 1 1 636E8102
P 7100 3100
F 0 "U3" V 7100 3425 50  0000 C CNN
F 1 "MOC3021M" V 7000 3450 50  0000 C CNN
F 2 "Package_DIP:DIP-5-6_W7.62mm_Socket" H 6900 2900 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/MOC3023M-D.PDF" H 7100 3100 50  0001 L CNN
	1    7100 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2700 2500 3100 2500
$Comp
L power:+12V #PWR02
U 1 1 636F80E4
P 3100 2500
F 0 "#PWR02" H 3100 2350 50  0001 C CNN
F 1 "+12V" H 3115 2673 50  0000 C CNN
F 2 "" H 3100 2500 50  0001 C CNN
F 3 "" H 3100 2500 50  0001 C CNN
	1    3100 2500
	1    0    0    -1  
$EndComp
Connection ~ 3100 2500
$Comp
L power:GND #PWR01
U 1 1 636F98CD
P 2700 2700
F 0 "#PWR01" H 2700 2450 50  0001 C CNN
F 1 "GND" H 2705 2527 50  0000 C CNN
F 2 "" H 2700 2700 50  0001 C CNN
F 3 "" H 2700 2700 50  0001 C CNN
	1    2700 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 636FB84A
P 3800 2800
F 0 "#PWR06" H 3800 2550 50  0001 C CNN
F 1 "GND" H 3805 2627 50  0000 C CNN
F 2 "" H 3800 2800 50  0001 C CNN
F 3 "" H 3800 2800 50  0001 C CNN
	1    3800 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 636FD02B
P 4750 7050
F 0 "#PWR010" H 4750 6800 50  0001 C CNN
F 1 "GND" H 4755 6877 50  0000 C CNN
F 2 "" H 4750 7050 50  0001 C CNN
F 3 "" H 4750 7050 50  0001 C CNN
	1    4750 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 6370464F
P 3300 2650
F 0 "C2" H 3400 2650 50  0000 L CNN
F 1 "100nF" H 3350 2550 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3338 2500 50  0001 C CNN
F 3 "~" H 3300 2650 50  0001 C CNN
	1    3300 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 637061C8
P 4200 2650
F 0 "C3" H 4315 2696 50  0000 L CNN
F 1 "100nF" H 4315 2605 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 4238 2500 50  0001 C CNN
F 3 "~" H 4200 2650 50  0001 C CNN
	1    4200 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 63706659
P 3100 2650
F 0 "C1" H 2850 2650 50  0000 L CNN
F 1 "100uF" H 2850 2550 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 3138 2500 50  0001 C CNN
F 3 "~" H 3100 2650 50  0001 C CNN
	1    3100 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 6370A47A
P 3100 2800
F 0 "#PWR03" H 3100 2550 50  0001 C CNN
F 1 "GND" H 3105 2627 50  0000 C CNN
F 2 "" H 3100 2800 50  0001 C CNN
F 3 "" H 3100 2800 50  0001 C CNN
	1    3100 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2500 4200 2500
$Comp
L power:+5V #PWR07
U 1 1 6370B449
P 4200 2500
F 0 "#PWR07" H 4200 2350 50  0001 C CNN
F 1 "+5V" H 4215 2673 50  0000 C CNN
F 2 "" H 4200 2500 50  0001 C CNN
F 3 "" H 4200 2500 50  0001 C CNN
	1    4200 2500
	1    0    0    -1  
$EndComp
Connection ~ 4200 2500
$Comp
L power:GND #PWR08
U 1 1 6370C582
P 4200 2800
F 0 "#PWR08" H 4200 2550 50  0001 C CNN
F 1 "GND" H 4205 2627 50  0000 C CNN
F 2 "" H 4200 2800 50  0001 C CNN
F 3 "" H 4200 2800 50  0001 C CNN
	1    4200 2800
	1    0    0    -1  
$EndComp
Connection ~ 3300 2500
Wire Wire Line
	3300 2500 3500 2500
$Comp
L power:GND #PWR05
U 1 1 6370F24A
P 3300 2800
F 0 "#PWR05" H 3300 2550 50  0001 C CNN
F 1 "GND" H 3305 2627 50  0000 C CNN
F 2 "" H 3300 2800 50  0001 C CNN
F 3 "" H 3300 2800 50  0001 C CNN
	1    3300 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 2500 3300 2500
Wire Wire Line
	1750 1950 3950 1950
Wire Wire Line
	3950 1950 3950 1550
Wire Wire Line
	1600 1750 3850 1750
Wire Wire Line
	3850 1750 3850 1550
$Comp
L Device:R R2
U 1 1 63747A98
P 7200 2600
F 0 "R2" H 7270 2646 50  0000 L CNN
F 1 "330" H 7270 2555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7130 2600 50  0001 C CNN
F 3 "~" H 7200 2600 50  0001 C CNN
	1    7200 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 2400 7200 2450
Wire Wire Line
	7200 2750 7200 2800
Wire Wire Line
	6950 2250 6650 2250
Wire Wire Line
	6650 2250 6650 2800
Wire Wire Line
	6650 2800 7000 2800
$Comp
L power:GND #PWR013
U 1 1 63756C48
P 7200 3400
F 0 "#PWR013" H 7200 3150 50  0001 C CNN
F 1 "GND" H 7205 3227 50  0000 C CNN
F 2 "" H 7200 3400 50  0001 C CNN
F 3 "" H 7200 3400 50  0001 C CNN
	1    7200 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 63757450
P 8600 3400
F 0 "#PWR015" H 8600 3150 50  0001 C CNN
F 1 "GND" H 8605 3227 50  0000 C CNN
F 2 "" H 8600 3400 50  0001 C CNN
F 3 "" H 8600 3400 50  0001 C CNN
	1    8600 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 63758602
P 7000 3600
F 0 "R1" H 7070 3646 50  0000 L CNN
F 1 "1k" H 7070 3555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6930 3600 50  0001 C CNN
F 3 "~" H 7000 3600 50  0001 C CNN
	1    7000 3600
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 63758A9A
P 8200 3600
F 0 "R3" H 8350 3650 50  0000 R CNN
F 1 "1k" H 8350 3550 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8130 3600 50  0001 C CNN
F 3 "~" H 8200 3600 50  0001 C CNN
	1    8200 3600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7000 3400 7000 3450
Wire Wire Line
	4550 6950 4750 6950
Wire Wire Line
	4750 6950 4750 7050
$Comp
L power:+3.3V #PWR09
U 1 1 6375EF80
P 4700 4850
F 0 "#PWR09" H 4700 4700 50  0001 C CNN
F 1 "+3.3V" H 4715 5023 50  0000 C CNN
F 2 "" H 4700 4850 50  0001 C CNN
F 3 "" H 4700 4850 50  0001 C CNN
	1    4700 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 4850 4700 4950
Wire Wire Line
	4700 4950 4550 4950
$Comp
L power:+5V #PWR04
U 1 1 63762463
P 3150 4800
F 0 "#PWR04" H 3150 4650 50  0001 C CNN
F 1 "+5V" H 3165 4973 50  0000 C CNN
F 2 "" H 3150 4800 50  0001 C CNN
F 3 "" H 3150 4800 50  0001 C CNN
	1    3150 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 4800 3150 4950
Wire Wire Line
	3150 4950 3350 4950
Text GLabel 7000 3800 3    50   Input ~ 0
L1
Wire Wire Line
	7000 3800 7000 3750
Text GLabel 8200 3800 3    50   Input ~ 0
L2
Wire Wire Line
	8200 3800 8200 3750
Text GLabel 3150 6750 0    50   Input ~ 0
L1
Text GLabel 3150 6650 0    50   Input ~ 0
L2
Wire Wire Line
	3350 6650 3150 6650
Wire Wire Line
	3350 6750 3150 6750
Wire Wire Line
	7450 1450 7300 1450
Wire Wire Line
	7300 1450 7300 2250
Wire Wire Line
	7300 2250 7250 2250
Wire Wire Line
	7900 1800 6650 1800
Connection ~ 6650 2250
Wire Wire Line
	6650 1800 6650 2250
Text GLabel 3650 1550 0    50   Input ~ 0
Live
Wire Wire Line
	3650 1550 3850 1550
Connection ~ 3850 1550
Wire Wire Line
	3850 1550 3850 1450
Text GLabel 4050 1550 2    50   Input ~ 0
Neutral
Wire Wire Line
	4050 1550 3950 1550
Connection ~ 3950 1550
Wire Wire Line
	3950 1550 3950 1450
Wire Wire Line
	1600 1750 1600 2500
Wire Wire Line
	1600 2500 1900 2500
Wire Wire Line
	1750 1950 1750 2700
Wire Wire Line
	1750 2700 1900 2700
NoConn ~ 4550 5250
NoConn ~ 4550 5350
$Comp
L Transistor_BJT:BC547 Q2
U 1 1 637A5DA1
P 8500 3100
F 0 "Q2" H 8691 3146 50  0000 L CNN
F 1 "BC547" H 8691 3055 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8700 3025 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 8500 3100 50  0001 L CNN
	1    8500 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 3300 8600 3400
Wire Wire Line
	8200 3100 8300 3100
Wire Wire Line
	8200 3100 8200 3450
Wire Wire Line
	8500 1700 8600 1700
Wire Wire Line
	8600 1700 8600 1450
Wire Wire Line
	7550 1450 8600 1450
Wire Wire Line
	8500 2200 8600 2200
Wire Wire Line
	8600 2200 8600 2500
$Comp
L power:+12V #PWR014
U 1 1 637B22AD
P 7750 2100
F 0 "#PWR014" H 7750 1950 50  0001 C CNN
F 1 "+12V" H 7765 2273 50  0000 C CNN
F 2 "" H 7750 2100 50  0001 C CNN
F 3 "" H 7750 2100 50  0001 C CNN
	1    7750 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 2100 7750 2200
Wire Wire Line
	7750 2200 7900 2200
$Comp
L Diode:1N4007 D1
U 1 1 637B4925
P 8200 2500
F 0 "D1" H 8200 2300 50  0000 C CNN
F 1 "1N4007" H 8200 2400 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 8200 2325 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 8200 2500 50  0001 C CNN
	1    8200 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 2500 8600 2500
Connection ~ 8600 2500
Wire Wire Line
	8600 2500 8600 2900
Wire Wire Line
	8050 2500 7750 2500
Wire Wire Line
	7750 2500 7750 2200
Connection ~ 7750 2200
$Comp
L Relay:SANYOU_SRD_Form_C K1
U 1 1 637BDC7F
P 8200 2000
F 0 "K1" V 8767 2000 50  0000 C CNN
F 1 "SANYOU_SRD_Form_C" V 8676 2000 50  0000 C CNN
F 2 "Relay_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 8650 1950 50  0001 L CNN
F 3 "http://www.sanyourelay.ca/public/products/pdf/SRD.pdf" H 8200 2000 50  0001 C CNN
	1    8200 2000
	0    1    -1   0   
$EndComp
NoConn ~ 8500 1900
$Comp
L Switch:SW_Push SW1
U 1 1 637CCC37
P 5500 5350
F 0 "SW1" H 5500 5635 50  0000 C CNN
F 1 "L1 Switch" H 5500 5544 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 5500 5550 50  0001 C CNN
F 3 "~" H 5500 5550 50  0001 C CNN
	1    5500 5350
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 637CE5A2
P 5450 5900
F 0 "SW2" H 5450 6185 50  0000 C CNN
F 1 "L2 Switch" H 5450 6094 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 5450 6100 50  0001 C CNN
F 3 "~" H 5450 6100 50  0001 C CNN
	1    5450 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 637CF7C9
P 5800 5400
F 0 "#PWR011" H 5800 5150 50  0001 C CNN
F 1 "GND" H 5805 5227 50  0000 C CNN
F 2 "" H 5800 5400 50  0001 C CNN
F 3 "" H 5800 5400 50  0001 C CNN
	1    5800 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 637D0597
P 5800 5950
F 0 "#PWR012" H 5800 5700 50  0001 C CNN
F 1 "GND" H 5805 5777 50  0000 C CNN
F 2 "" H 5800 5950 50  0001 C CNN
F 3 "" H 5800 5950 50  0001 C CNN
	1    5800 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 5900 5800 5900
Wire Wire Line
	5800 5900 5800 5950
Wire Wire Line
	5700 5350 5800 5350
Wire Wire Line
	5800 5350 5800 5400
Wire Wire Line
	5050 5650 5050 5900
Wire Wire Line
	5050 5900 5250 5900
NoConn ~ 3350 5050
NoConn ~ 3350 5250
NoConn ~ 3350 5350
NoConn ~ 3350 5850
NoConn ~ 3350 5950
NoConn ~ 3350 6050
NoConn ~ 3350 6150
NoConn ~ 3350 6250
NoConn ~ 3350 6350
NoConn ~ 3350 6450
NoConn ~ 4550 6350
NoConn ~ 4550 6450
NoConn ~ 4550 6550
NoConn ~ 4550 6650
$Comp
L Diode_Bridge:W10G D2
U 1 1 637D3F4F
P 2250 3750
F 0 "D2" H 2594 3796 50  0000 L CNN
F 1 "W10G" H 2594 3705 50  0000 L CNN
F 2 "Diode_THT:Diode_Bridge_Round_D9.8mm" H 2400 3875 50  0001 L CNN
F 3 "https://www.vishay.com/docs/88769/woo5g.pdf" H 2250 3750 50  0001 C CNN
	1    2250 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 637D805E
P 1600 3400
F 0 "R4" H 1850 3450 50  0000 R CNN
F 1 "100k" H 1850 3350 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1530 3400 50  0001 C CNN
F 3 "~" H 1600 3400 50  0001 C CNN
	1    1600 3400
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 637D96B1
P 1600 4000
F 0 "R5" H 1850 4050 50  0000 R CNN
F 1 "100k" H 1850 3950 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1530 4000 50  0001 C CNN
F 3 "~" H 1600 4000 50  0001 C CNN
	1    1600 4000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1600 2500 1600 3250
Connection ~ 1600 2500
Wire Wire Line
	1600 3550 1600 3850
Wire Wire Line
	1600 4150 1600 4300
Wire Wire Line
	1600 4300 2250 4300
Wire Wire Line
	2250 4300 2250 4050
Wire Wire Line
	2250 3450 2250 3100
Wire Wire Line
	2250 3100 1750 3100
Wire Wire Line
	1750 3100 1750 2700
Connection ~ 1750 2700
$Comp
L Isolator:PC817 U4
U 1 1 637E6FDE
P 3200 3850
F 0 "U4" H 3200 4175 50  0000 C CNN
F 1 "PC817" H 3200 4084 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm" H 3000 3650 50  0001 L CIN
F 3 "http://www.soselectronic.cz/a_info/resource/d/pc817.pdf" H 3200 3850 50  0001 L CNN
	1    3200 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 3750 2900 3750
Wire Wire Line
	2900 3950 2800 3950
Wire Wire Line
	2800 3950 2800 4100
Wire Wire Line
	2800 4100 1850 4100
Wire Wire Line
	1850 4100 1850 3750
Wire Wire Line
	1850 3750 1950 3750
$Comp
L Device:R R6
U 1 1 637EBD6D
P 3600 3550
F 0 "R6" H 3550 3600 50  0000 R CNN
F 1 "10k" H 3550 3500 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3530 3550 50  0001 C CNN
F 3 "~" H 3600 3550 50  0001 C CNN
	1    3600 3550
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 637EDE52
P 3600 4000
F 0 "#PWR0101" H 3600 3750 50  0001 C CNN
F 1 "GND" H 3605 3827 50  0000 C CNN
F 2 "" H 3600 4000 50  0001 C CNN
F 3 "" H 3600 4000 50  0001 C CNN
	1    3600 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3750 3600 3750
Wire Wire Line
	3600 3750 3600 3700
Wire Wire Line
	3500 3950 3600 3950
Wire Wire Line
	3600 3950 3600 4000
$Comp
L power:+3.3V #PWR0102
U 1 1 637F7736
P 3600 3350
F 0 "#PWR0102" H 3600 3200 50  0001 C CNN
F 1 "+3.3V" H 3615 3523 50  0000 C CNN
F 2 "" H 3600 3350 50  0001 C CNN
F 3 "" H 3600 3350 50  0001 C CNN
	1    3600 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3400 3600 3350
Text GLabel 3750 3750 2    50   Input ~ 0
ZVD
Wire Wire Line
	3600 3750 3750 3750
Connection ~ 3600 3750
Text GLabel 4750 6250 2    50   Input ~ 0
ZVD
Wire Wire Line
	4750 6250 4550 6250
Wire Wire Line
	5050 5550 5050 5350
Wire Wire Line
	5050 5350 5300 5350
Text GLabel 6650 1600 1    50   Input ~ 0
Live
Wire Wire Line
	6650 1600 6650 1800
Connection ~ 6650 1800
$Comp
L ESP32-DEVKIT-V1:ESP32-DEVKIT-V1 U2
U 1 1 636DF128
P 3950 5950
F 0 "U2" H 3950 7217 50  0000 C CNN
F 1 "ESP32-DEVKIT-V1" H 3950 7126 50  0000 C CNN
F 2 "MODULE_ESP32_DEVKIT_V1:MODULE_ESP32_DEVKIT_V1" H 3950 5950 50  0001 L BNN
F 3 "" H 3950 5950 50  0001 L BNN
F 4 "N/A" H 3950 5950 50  0001 L BNN "PARTREV"
F 5 "6.8 mm" H 3950 5950 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 6 "DOIT" H 3950 5950 50  0001 L BNN "MANUFACTURER"
F 7 "Manufacturer Recommendations" H 3950 5950 50  0001 L BNN "STANDARD"
	1    3950 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 5550 5050 5550
Wire Wire Line
	4550 5650 5050 5650
NoConn ~ 4550 6150
NoConn ~ 4550 6050
NoConn ~ 4550 5950
NoConn ~ 4550 5850
NoConn ~ 3350 6550
$EndSCHEMATC
