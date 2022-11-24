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
L ESP32-DEVKIT-V1:ESP32-DEVKIT-V1 U1
U 1 1 63748FCE
P 3550 5800
F 0 "U1" H 3550 7067 50  0000 C CNN
F 1 "ESP32-DEVKIT-V1" H 3550 6976 50  0000 C CNN
F 2 "MODULE_ESP32_DEVKIT_V1" H 3550 5800 50  0001 L BNN
F 3 "" H 3550 5800 50  0001 L BNN
F 4 "N/A" H 3550 5800 50  0001 L BNN "PARTREV"
F 5 "6.8 mm" H 3550 5800 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 6 "DOIT" H 3550 5800 50  0001 L BNN "MANUFACTURER"
F 7 "Manufacturer Recommendations" H 3550 5800 50  0001 L BNN "STANDARD"
	1    3550 5800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J2
U 1 1 6374B7FE
P 4750 5400
F 0 "J2" H 4778 5376 50  0000 L CNN
F 1 "Ultrasonic sensor" H 4778 5285 50  0000 L CNN
F 2 "Connector_PinSocket_1.27mm:PinSocket_1x04_P1.27mm_Vertical" H 4750 5400 50  0001 C CNN
F 3 "~" H 4750 5400 50  0001 C CNN
	1    4750 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 6374DAE1
P 2600 4950
F 0 "C1" H 2715 4996 50  0000 L CNN
F 1 "100nF" H 2715 4905 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2638 4800 50  0001 C CNN
F 3 "~" H 2600 4950 50  0001 C CNN
	1    2600 4950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 63750EB3
P 2300 4700
F 0 "#PWR04" H 2300 4550 50  0001 C CNN
F 1 "+5V" H 2315 4873 50  0000 C CNN
F 2 "" H 2300 4700 50  0001 C CNN
F 3 "" H 2300 4700 50  0001 C CNN
	1    2300 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR013
U 1 1 6375296D
P 4400 4650
F 0 "#PWR013" H 4400 4500 50  0001 C CNN
F 1 "+3.3V" H 4415 4823 50  0000 C CNN
F 2 "" H 4400 4650 50  0001 C CNN
F 3 "" H 4400 4650 50  0001 C CNN
	1    4400 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4800 4400 4800
Wire Wire Line
	4400 4800 4400 4650
Wire Wire Line
	2950 4800 2600 4800
Wire Wire Line
	2300 4800 2300 4700
Connection ~ 2600 4800
Wire Wire Line
	2600 4800 2300 4800
$Comp
L power:GND #PWR06
U 1 1 637561B6
P 2600 5200
F 0 "#PWR06" H 2600 4950 50  0001 C CNN
F 1 "GND" H 2605 5027 50  0000 C CNN
F 2 "" H 2600 5200 50  0001 C CNN
F 3 "" H 2600 5200 50  0001 C CNN
	1    2600 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 5100 2600 5200
$Comp
L power:GND #PWR012
U 1 1 6375747F
P 4300 6900
F 0 "#PWR012" H 4300 6650 50  0001 C CNN
F 1 "GND" H 4305 6727 50  0000 C CNN
F 2 "" H 4300 6900 50  0001 C CNN
F 3 "" H 4300 6900 50  0001 C CNN
	1    4300 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 6800 4300 6800
Wire Wire Line
	4300 6800 4300 6900
$Comp
L power:GND #PWR015
U 1 1 6375FC97
P 4500 5650
F 0 "#PWR015" H 4500 5400 50  0001 C CNN
F 1 "GND" H 4505 5477 50  0000 C CNN
F 2 "" H 4500 5650 50  0001 C CNN
F 3 "" H 4500 5650 50  0001 C CNN
	1    4500 5650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR014
U 1 1 637616BE
P 4500 5250
F 0 "#PWR014" H 4500 5100 50  0001 C CNN
F 1 "+5V" H 4515 5423 50  0000 C CNN
F 2 "" H 4500 5250 50  0001 C CNN
F 3 "" H 4500 5250 50  0001 C CNN
	1    4500 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 5500 4550 5500
Wire Wire Line
	4150 5400 4550 5400
$Comp
L Device:Battery BT1
U 1 1 6376E413
P 1350 2050
F 0 "BT1" H 1458 2096 50  0000 L CNN
F 1 "7.4V Li-ion" H 1458 2005 50  0000 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x02_P1.27mm_Vertical" V 1350 2110 50  0001 C CNN
F 3 "~" V 1350 2110 50  0001 C CNN
	1    1350 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 6376FE04
P 1350 2400
F 0 "#PWR02" H 1350 2150 50  0001 C CNN
F 1 "GND" H 1355 2227 50  0000 C CNN
F 2 "" H 1350 2400 50  0001 C CNN
F 3 "" H 1350 2400 50  0001 C CNN
	1    1350 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 2250 1350 2400
Wire Wire Line
	1350 1700 1350 1850
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 63794CE5
P 1800 6600
F 0 "J1" H 1500 6550 50  0000 C CNN
F 1 "Overflow detect" H 1700 6400 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x02_P1.27mm_Vertical" H 1800 6600 50  0001 C CNN
F 3 "~" H 1800 6600 50  0001 C CNN
	1    1800 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 637981DF
P 2000 6900
F 0 "#PWR03" H 2000 6650 50  0001 C CNN
F 1 "GND" H 2005 6727 50  0000 C CNN
F 2 "" H 2000 6900 50  0001 C CNN
F 3 "" H 2000 6900 50  0001 C CNN
	1    2000 6900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 6374E81E
P 2450 6800
F 0 "SW1" V 2350 7100 50  0000 R CNN
F 1 "Calibration mode" V 2450 6800 50  0000 R CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 2450 7000 50  0001 C CNN
F 3 "~" H 2450 7000 50  0001 C CNN
	1    2450 6800
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 6375026A
P 2450 7100
F 0 "#PWR05" H 2450 6850 50  0001 C CNN
F 1 "GND" H 2455 6927 50  0000 C CNN
F 2 "" H 2450 7100 50  0001 C CNN
F 3 "" H 2450 7100 50  0001 C CNN
	1    2450 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 6600 2450 6500
Wire Wire Line
	2000 6600 2000 6400
Wire Wire Line
	2000 6400 2950 6400
Wire Wire Line
	2000 6700 2000 6900
Wire Wire Line
	2450 6500 2950 6500
Wire Wire Line
	2450 7100 2450 7000
$Comp
L power:+VDC #PWR01
U 1 1 637A6D83
P 1350 1700
F 0 "#PWR01" H 1350 1600 50  0001 C CNN
F 1 "+VDC" H 1350 1975 50  0000 C CNN
F 2 "" H 1350 1700 50  0001 C CNN
F 3 "" H 1350 1700 50  0001 C CNN
	1    1350 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 5250 4500 5300
Wire Wire Line
	4500 5300 4550 5300
Wire Wire Line
	4500 5650 4500 5600
Wire Wire Line
	4500 5600 4550 5600
NoConn ~ 2950 4900
NoConn ~ 2950 5100
NoConn ~ 2950 5200
$Comp
L Regulator_Linear:LM7805_TO220 U2
U 1 1 637BAE9D
P 4450 1850
F 0 "U2" H 4450 2092 50  0000 C CNN
F 1 "LM7805_TO220" H 4450 2001 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 4450 2075 50  0001 C CIN
F 3 "https://www.onsemi.cn/PowerSolutions/document/MC7800-D.PDF" H 4450 1800 50  0001 C CNN
	1    4450 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 1850 4050 1850
$Comp
L power:+VDC #PWR07
U 1 1 637C8F07
P 3100 1750
F 0 "#PWR07" H 3100 1650 50  0001 C CNN
F 1 "+VDC" H 3100 2025 50  0000 C CNN
F 2 "" H 3100 1750 50  0001 C CNN
F 3 "" H 3100 1750 50  0001 C CNN
	1    3100 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 1850 4050 1850
Connection ~ 4050 1850
$Comp
L power:GND #PWR010
U 1 1 637D2B63
P 4450 2200
F 0 "#PWR010" H 4450 1950 50  0001 C CNN
F 1 "GND" H 4455 2027 50  0000 C CNN
F 2 "" H 4450 2200 50  0001 C CNN
F 3 "" H 4450 2200 50  0001 C CNN
	1    4450 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2150 4450 2200
$Comp
L power:+5V #PWR011
U 1 1 637D43E8
P 4850 1750
F 0 "#PWR011" H 4850 1600 50  0001 C CNN
F 1 "+5V" H 4865 1923 50  0000 C CNN
F 2 "" H 4850 1750 50  0001 C CNN
F 3 "" H 4850 1750 50  0001 C CNN
	1    4850 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 1750 4850 1850
NoConn ~ 2950 5700
NoConn ~ 2950 5800
NoConn ~ 2950 5900
NoConn ~ 2950 6000
NoConn ~ 2950 6100
NoConn ~ 2950 6200
NoConn ~ 2950 6300
NoConn ~ 2950 6600
NoConn ~ 4150 6500
NoConn ~ 4150 6400
NoConn ~ 4150 6300
NoConn ~ 4150 6200
NoConn ~ 4150 6100
NoConn ~ 4150 6000
NoConn ~ 4150 5900
NoConn ~ 4150 5800
NoConn ~ 4150 5700
NoConn ~ 4150 5200
NoConn ~ 4150 5100
$Comp
L Device:CP C2
U 1 1 637E89B9
P 3800 2150
F 0 "C2" H 3550 2200 50  0000 L CNN
F 1 "100uF" H 3450 2100 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 3838 2000 50  0001 C CNN
F 3 "~" H 3800 2150 50  0001 C CNN
	1    3800 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 637E89BF
P 3800 2400
F 0 "#PWR08" H 3800 2150 50  0001 C CNN
F 1 "GND" H 3805 2227 50  0000 C CNN
F 2 "" H 3800 2400 50  0001 C CNN
F 3 "" H 3800 2400 50  0001 C CNN
	1    3800 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 2300 3800 2400
Wire Wire Line
	4750 1850 4850 1850
$Comp
L power:GND #PWR09
U 1 1 637C331A
P 4050 2400
F 0 "#PWR09" H 4050 2150 50  0001 C CNN
F 1 "GND" H 4055 2227 50  0000 C CNN
F 2 "" H 4050 2400 50  0001 C CNN
F 3 "" H 4050 2400 50  0001 C CNN
	1    4050 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2300 4050 2400
Wire Wire Line
	4050 1850 4050 2000
$Comp
L Device:C C3
U 1 1 637C3314
P 4050 2150
F 0 "C3" H 4165 2196 50  0000 L CNN
F 1 "100nF" H 4165 2105 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 4088 2000 50  0001 C CNN
F 3 "~" H 4050 2150 50  0001 C CNN
	1    4050 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 2000 3800 1850
Connection ~ 3800 1850
Wire Notes Line
	2850 2750 5300 2750
Wire Notes Line
	5300 2750 5300 1250
Wire Notes Line
	5300 1250 2850 1250
Wire Notes Line
	2850 1250 2850 2750
Text Notes 4100 1350 0    50   ~ 0
Power section
Wire Notes Line
	1100 1250 1100 2700
Wire Notes Line
	1100 2700 2150 2700
Wire Notes Line
	2150 2700 2150 1250
Wire Notes Line
	2150 1250 1100 1250
Text Notes 1500 1350 0    50   ~ 0
Battery
Wire Notes Line
	800  3650 800  7550
Wire Notes Line
	800  7550 6150 7550
Wire Notes Line
	6150 7550 6150 3650
Wire Notes Line
	6150 3650 800  3650
Text Notes 3000 3800 0    50   ~ 0
Microcontroller connection
Wire Notes Line
	6600 950  6600 3400
Wire Notes Line
	10550 950  6600 950 
Text Notes 8050 1100 0    50   ~ 0
Solar Charging Circuitry
$Comp
L XL6009_symbol:XL6009 U3
U 1 1 637D124A
P 8750 2250
F 0 "U3" H 8750 2665 50  0000 C CNN
F 1 "XL6009" H 8750 2250 50  0000 C CNN
F 2 "XL6009:XL6009_module" H 8750 2250 50  0001 C CNN
F 3 "" H 8750 2250 50  0001 C CNN
	1    8750 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:Solar_Cells SC1
U 1 1 637D338D
P 7250 2250
F 0 "SC1" H 7358 2296 50  0000 L CNN
F 1 "Solar_Cells" H 7358 2205 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" V 7250 2310 50  0001 C CNN
F 3 "~" V 7250 2310 50  0001 C CNN
	1    7250 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 2100 8000 2100
Wire Wire Line
	8000 2100 8000 1750
Wire Wire Line
	8000 1750 7250 1750
Wire Wire Line
	7250 1750 7250 2050
Wire Wire Line
	7250 2450 7250 2750
Wire Wire Line
	7250 2750 8000 2750
Wire Wire Line
	8000 2750 8000 2400
Wire Wire Line
	8000 2400 8200 2400
$Comp
L power:+VDC #PWR016
U 1 1 637DC254
P 9650 1950
F 0 "#PWR016" H 9650 1850 50  0001 C CNN
F 1 "+VDC" H 9650 2225 50  0000 C CNN
F 2 "" H 9650 1950 50  0001 C CNN
F 3 "" H 9650 1950 50  0001 C CNN
	1    9650 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 637DE232
P 9650 2500
F 0 "#PWR017" H 9650 2250 50  0001 C CNN
F 1 "GND" H 9655 2327 50  0000 C CNN
F 2 "" H 9650 2500 50  0001 C CNN
F 3 "" H 9650 2500 50  0001 C CNN
	1    9650 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 2400 9650 2400
Wire Wire Line
	9650 2400 9650 2500
Wire Wire Line
	9650 1950 9650 2100
$Comp
L Device:D_Schottky D1
U 1 1 637E1E33
P 9500 2100
F 0 "D1" H 9300 2100 50  0000 C CNN
F 1 "D_Schottky" H 9500 2200 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P10.16mm_Horizontal" H 9500 2100 50  0001 C CNN
F 3 "~" H 9500 2100 50  0001 C CNN
	1    9500 2100
	-1   0    0    1   
$EndComp
Wire Wire Line
	9350 2100 9300 2100
Wire Notes Line
	6600 3400 10550 3400
Wire Notes Line
	10550 3400 10550 950 
$Comp
L Switch:SW_SPST SW2
U 1 1 637F09C7
P 3450 1850
F 0 "SW2" H 3450 2085 50  0000 C CNN
F 1 "SW_SPST" H 3450 1994 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx03_Slide_6.7x9.18mm_W7.62mm_P2.54mm_LowProfile" H 3450 1850 50  0001 C CNN
F 3 "~" H 3450 1850 50  0001 C CNN
	1    3450 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 1850 3100 1750
Wire Wire Line
	3100 1850 3250 1850
Wire Wire Line
	3650 1850 3800 1850
$EndSCHEMATC