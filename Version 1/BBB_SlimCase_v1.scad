// ******************************************
// Beaglebone Black Slim Case
// By Isaac Hayes
// Copyright 2014
// http://scuttlebots.com
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program; if not, write to the Free Software Foundation, Inc.,
// 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
// ******************************************

// ************************************
// Render Options
// ************************************


// RENDER OPTIONS
// Set this variable to output the piece you want
// 0 - Visual Only render
// 1 - Base Only
// 2 - Lid

   Render_Options = 1;

// LID OPTIONS
// Set this to select various lid Options
// 0 = Solid
// 1 = Pin Header Cut Outs

   Lid_Options = 1;

// ************************************
// Dimensions and Locations Math(s)
// ************************************

// -All dimensions in millimeters
// -Origin at bottom left corner of PCB
// -Ethernet and power jack face left closest to origin
// -X and Y refer to position of lower left corner of compoenent from origin
// -Z refers to distance from top of component to the PCB
// -L and W are Lenght(X) and Width(Y) to specify component size

//Board Dimensions
BB_L = 86.36;
BB_W = 54.61;
BB_Z = 1.65;
BB_SmCurve_R = 6.35;
BB_LgCurve_R = 12.70;

//Mounting Hole Locations (Clockwise from Bottom)
BB_Hole1X = 14.61;
BB_Hole1Y = 3.18;

BB_Hole2X = 14.61;
BB_Hole2Y = BB_Hole1Y + 48.39;

BB_Hole3X = BB_Hole1X + 66.10;
BB_Hole3Y = 6.35 + 41.91;

BB_Hole4X = BB_Hole1X + 66.10;
BB_Hole4Y = 6.35;

BB_Hole_ID = 2.75;
BB_Hole_OD = 4.45;

//Pin Headers
BB_P9_X = 18.415;
BB_P9_Y = 0.635;
BB_P9_Z = 8.60;
BB_P9_L = 58.42;
BB_P9_W = 5.08;

BB_P8_X = 18.415;
BB_P8_Y = 48.895;
BB_P8_Z = 8.60;
BB_P8_L = 58.42;
BB_P8_W = 5.08;

//Capacitor
BB_Cap_X = 65.00;
BB_Cap_Y = 8.00;
BB_Cap_Z = 11.00;
BB_Cap_L = 6.00;
BB_Cap_W = 6.00;

//Power jack
BB_PJack_X = -2.54;
BB_PJack_Y = 5.461;
BB_PJack_Z = 10.75;
BB_PJack_L = 14.15;
BB_PJack_W = 9.00;

//Ethernet jack
BB_Eth_X = -2.54;
BB_Eth_Y = 21.717;
BB_Eth_Z = 13.33;
BB_Eth_L = 21.00;
BB_Eth_W = 16.10;

//Usb Host Port
BB_USBH_X = BB_L - 14.05;
BB_USBH_Y = 10.287 - 0.5;
BB_USBH_Z = 6.95;
BB_USBH_L = 14.05;
BB_USBH_W = 14.45 - 1.50;

//USB Mini Device Port
BB_USBD_X = -0.635;
BB_USBD_Y = 40.005 + 0.60;
BB_USBD_Z = 4.00;
BB_USBD_L = 6.91;
BB_USBD_W = 7.747;

//Micro HDMI port
BB_HDMI_X = BB_L + 0.635 - 7.50;
BB_HDMI_Y = 21.59 + 0.1;
BB_HDMI_Z = 2.90;
BB_HDMI_L = 7.50;
BB_HDMI_W = 6.55;

//MicroSD Card Port (Slot only)
BB_SD_X = BB_L - 14.90;
BB_SD_Y = 30.607 + 0.5;
BB_SD_Z = 1.75 - 0.5;
BB_SD_L = 14.90;
BB_SD_W = 11.05;

//Case Dimensions
Case_Thickness = 1.00;		//Wall Thickness
Case_Gap = 0.25;	//Gap between case walls and board
Case_L = BB_L + Case_Thickness*2 + Case_Gap*2;
Case_W = BB_W + Case_Thickness*2 + Case_Gap*2;
Case_SmCurve_R = BB_SmCurve_R + Case_Thickness + Case_Gap;
Case_LgCurve_R = BB_LgCurve_R + Case_Thickness + Case_Gap;
Case_PCB_Z = BB_USBD_Z + 1.00;		//Height PCB is suspended above case floor
Case_Z = Case_Thickness + Case_PCB_Z + BB_Z + BB_P9_Z;		//Total height of case
Cmp_Gap = 0.25;		//Gap around components
Cmp_Gap2 = Cmp_Gap*2;	//Gap around components times two

CutOut_L = BB_L + Case_Gap*2;
CutOut_W = BB_W + Case_Gap*2;
CutOut_SmCurve_R = BB_SmCurve_R + Case_Gap;
CutOut_LgCurve_R = BB_LgCurve_R + Case_Gap;
CutOut_Z = Case_Z - Case_Thickness;

Lid_Thickness = 1.50;
Lid_Grip_Thickness = 1.00;
Lid_Grip_Z = 2.00;
Lid_Grip_SmR = Case_SmCurve_R - Case_Thickness;
Lid_Grip_LgR = Case_LgCurve_R - Case_Thickness;

// ************************************
// Components
// ************************************

module Base()
{
	union() {
	difference() {
		//Outer Shell of Case
		translate([-Case_Thickness-Case_Gap, -Case_Thickness-Case_Gap, -Case_Thickness]) {
		union() {
			translate([0,Case_SmCurve_R,0]) cube([Case_L-Case_LgCurve_R, Case_W-Case_SmCurve_R*2, Case_Z]);
			translate([Case_SmCurve_R,0,0]) cube([Case_L-Case_SmCurve_R-Case_LgCurve_R, Case_W, Case_Z]);
			translate([Case_L-Case_LgCurve_R,Case_LgCurve_R,0]) cube([Case_LgCurve_R, Case_W-Case_LgCurve_R*2, Case_Z]);
			translate([Case_SmCurve_R,Case_SmCurve_R,0]) cylinder(h=Case_Z,r=Case_SmCurve_R,$fn=50);
			translate([Case_SmCurve_R,Case_W-Case_SmCurve_R,0]) cylinder(h=Case_Z,r=Case_SmCurve_R,$fn=50);
			translate([Case_L-Case_LgCurve_R,Case_LgCurve_R,0]) cylinder(h=Case_Z,r=Case_LgCurve_R,$fn=50);
			translate([Case_L-Case_LgCurve_R,Case_W-Case_LgCurve_R,0]) cylinder(h=Case_Z,r=Case_LgCurve_R,$fn=50);
		}}
		
		//Hollow Inside of Case
		translate([-Case_Gap,-Case_Gap,0]) {
		union() {
			translate([0,CutOut_SmCurve_R,0]) cube([CutOut_L-CutOut_LgCurve_R, CutOut_W-CutOut_SmCurve_R*2, CutOut_Z]);
			translate([CutOut_SmCurve_R,0,0]) cube([CutOut_L-CutOut_SmCurve_R-CutOut_LgCurve_R, CutOut_W, CutOut_Z]);
			translate([CutOut_L-CutOut_LgCurve_R,CutOut_LgCurve_R,0]) cube([CutOut_LgCurve_R, CutOut_W-CutOut_LgCurve_R*2, CutOut_Z]);
			translate([CutOut_SmCurve_R,CutOut_SmCurve_R,0]) cylinder(h=CutOut_Z,r=CutOut_SmCurve_R,$fn=50);
			translate([CutOut_SmCurve_R,CutOut_W-CutOut_SmCurve_R,0]) cylinder(h=CutOut_Z,r=CutOut_SmCurve_R,$fn=50);
			translate([CutOut_L-CutOut_LgCurve_R,CutOut_LgCurve_R,0]) cylinder(h=CutOut_Z,r=CutOut_LgCurve_R,$fn=50);
			translate([CutOut_L-CutOut_LgCurve_R,CutOut_W-CutOut_LgCurve_R,0]) cylinder(h=CutOut_Z,r=CutOut_LgCurve_R,$fn=50);
		}}
		
		//Components Cutouts

		//Ethernet Jack
		translate([BB_Eth_X-Cmp_Gap-1.25, BB_Eth_Y-Cmp_Gap, Case_PCB_Z+BB_Z]) cube([BB_Eth_L+Cmp_Gap2+1.25, BB_Eth_W+Cmp_Gap2, BB_Eth_Z+Cmp_Gap]);
		//Power Jack
		translate([BB_PJack_X-Cmp_Gap-1.25, BB_PJack_Y-Cmp_Gap, Case_PCB_Z+BB_Z]) cube([BB_PJack_L+Cmp_Gap2+1.25, BB_PJack_W+Cmp_Gap2, BB_PJack_Z+Cmp_Gap]);
		//USB Device Port
		translate([BB_USBD_X-Cmp_Gap-1.25, BB_USBD_Y-Cmp_Gap, 0.75]) cube([BB_USBD_L+Cmp_Gap2+1.25, BB_USBD_W+Cmp_Gap2, BB_USBD_Z+Cmp_Gap]);
		//USB Host
		translate([BB_USBH_X-Cmp_Gap, BB_USBH_Y-Cmp_Gap, Case_PCB_Z+BB_Z]) cube([BB_USBH_L+Cmp_Gap2+1.25, BB_USBH_W+Cmp_Gap2, CutOut_Z]);//BB_USBH_Z+Cmp_Gap]);
		//SD Card
		translate([BB_SD_X-Cmp_Gap, BB_SD_Y-Cmp_Gap, Case_PCB_Z-BB_SD_Z]) cube([BB_SD_L+Cmp_Gap2+1.25, BB_SD_W+Cmp_Gap2, BB_SD_Z+Cmp_Gap2]);
		//HDMI
		translate([BB_HDMI_X-Cmp_Gap, BB_HDMI_Y-Cmp_Gap, Case_PCB_Z-BB_HDMI_Z]) cube([BB_HDMI_L+Cmp_Gap2+1.25, BB_HDMI_W+Cmp_Gap2, BB_HDMI_Z+Cmp_Gap2]);
	}
		//Mounting pegs
		translate([BB_Hole1X,BB_Hole1Y,0]) MountingPeg();
		translate([BB_Hole2X,BB_Hole2Y,0]) MountingPeg();
		translate([BB_Hole3X,BB_Hole3Y,0]) MountingPeg();
		translate([BB_Hole4X,BB_Hole4Y,0]) MountingPeg();

	}
}

module Lid()
{
	difference() {	
		translate([-Case_Thickness-Case_Gap, -Case_Thickness-Case_Gap, -Case_Thickness]) {
		union() {
			translate([0,Case_SmCurve_R,Case_Z]) cube([Case_L-Case_LgCurve_R, Case_W-Case_SmCurve_R*2, Lid_Thickness]);
			translate([Case_SmCurve_R,0,Case_Z]) cube([Case_L-Case_SmCurve_R-Case_LgCurve_R, Case_W, Lid_Thickness]);
			translate([Case_L-Case_LgCurve_R,Case_LgCurve_R,Case_Z]) cube([Case_LgCurve_R, Case_W-Case_LgCurve_R*2, Lid_Thickness]);
			translate([Case_SmCurve_R,Case_SmCurve_R,Case_Z]) cylinder(h=Lid_Thickness,r=Case_SmCurve_R,$fn=50);
			translate([Case_SmCurve_R,Case_W-Case_SmCurve_R,Case_Z]) cylinder(h=Lid_Thickness,r=Case_SmCurve_R,$fn=50);
			translate([Case_L-Case_LgCurve_R,Case_LgCurve_R,Case_Z]) cylinder(h=Lid_Thickness,r=Case_LgCurve_R,$fn=50);
			translate([Case_L-Case_LgCurve_R,Case_W-Case_LgCurve_R,Case_Z]) cylinder(h=Lid_Thickness,r=Case_LgCurve_R,$fn=50);

			//Lid Grips
			translate([Case_Thickness,Case_Thickness,Case_Z-Lid_Grip_Z]) CornerGrip(Lid_Grip_SmR,Lid_Grip_Thickness,Lid_Grip_Z,0,0);
			translate([Case_L-Case_Thickness,Case_Thickness,Case_Z-Lid_Grip_Z]) CornerGrip(Lid_Grip_LgR,Lid_Grip_Thickness,Lid_Grip_Z,90,4);
			translate([Case_L-Case_Thickness,Case_W-Case_Thickness,Case_Z-Lid_Grip_Z]) CornerGrip(Lid_Grip_LgR,Lid_Grip_Thickness,Lid_Grip_Z,180,4);
			translate([Case_Thickness,Case_W-Case_Thickness,Case_Z-Lid_Grip_Z]) CornerGrip(Lid_Grip_SmR,Lid_Grip_Thickness,Lid_Grip_Z,270,0);
			translate([Case_Thickness,BB_PJack_Y+Case_Thickness+Case_Gap,Case_Z-Lid_Grip_Z]) cube([Lid_Grip_Thickness, BB_Eth_Y-BB_PJack_Y, Lid_Grip_Z]);
		}}

		//Component Cutouts
		
		//Ethernet Jack
		translate([BB_Eth_X-Cmp_Gap-1.25, BB_Eth_Y-Cmp_Gap, Case_PCB_Z+BB_Z]) cube([BB_Eth_L+Cmp_Gap2+1.25, BB_Eth_W+Cmp_Gap2, BB_Eth_Z+Cmp_Gap]);
		//Power Jack
		translate([BB_PJack_X-Cmp_Gap-1.25, BB_PJack_Y-Cmp_Gap, Case_PCB_Z+BB_Z]) cube([BB_PJack_L+Cmp_Gap2+1.25, BB_PJack_W+Cmp_Gap2, BB_PJack_Z+Cmp_Gap]);
		//Pin Headers
		if (Lid_Options == 1) {
			translate([BB_P8_X-Cmp_Gap, BB_P8_Y-Cmp_Gap, 0]) cube([BB_P8_L+Cmp_Gap2, BB_P8_W +Cmp_Gap2, 75]);
			translate([BB_P9_X-Cmp_Gap, BB_P9_Y-Cmp_Gap, 0]) cube([BB_P9_L+Cmp_Gap2, BB_P9_W +Cmp_Gap2, 75]);
		}
		//Capacitor
		translate([BB_Cap_X, BB_Cap_Y, Case_PCB_Z+BB_Z]) cube([BB_Cap_L, BB_Cap_W, BB_Cap_Z]);

		
	}
}

module MountingPeg()
{
	union() {
		cylinder(h=Case_PCB_Z, d=BB_Hole_OD, $fn=25);
		translate([0,0,Case_PCB_Z]) cylinder(h=BB_Z/2,d=BB_Hole_ID, $fn=25);
		translate([0,0,Case_PCB_Z+BB_Z/2]) cylinder(h=BB_Z/2,d1=BB_Hole_ID, d2=BB_Hole_ID/2, $fn=25);
	}
}

module CornerGrip(R,T,Z,D,CutOff)
{
	rotate([0,0,D]) {
		difference() {
			translate([R,R,0]) cylinder(r=R, h=Z, $fn=50);
			translate([R,R,0]) cylinder(r=R-T, h=Z, $fn=50);
			translate([R-CutOff,0,0]) cube([R*2+CutOff,R*2+CutOff,Z]);
			translate([0,R-CutOff,0]) cube([R*2+CutOff,R*2+CutOff,Z]);
		}
	}
}

// ************************************
// Output Renders
// ************************************

color("Green"){
	render(convexity=4) {
		if (Render_Options == 0) {
			Base();
			translate([0,0,3]) Lid();
		}
		if (Render_Options == 1) {
			Base();
		}
		if (Render_Options == 2) {
			Lid();
		}
	}
}