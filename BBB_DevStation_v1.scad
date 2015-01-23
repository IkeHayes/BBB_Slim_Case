// ******************************************
// Beaglebone Black Dev Station
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


// STATION OPTIONS
// Set this variable to output the piece you want
// 0 - Visual Only render w/ Lid
// 1 - BBB w/ Built-in Case (For STL Export)
// 2 - BBB w/ Rails to secure external case (For STL Export)

   Station_Options = 1;


// ************************************
// Include Libraries
// ************************************

include <BBB_SlimCase_v2_Library.scad>
use <BBB_SlimCase_v2.scad>

// ************************************
// Dimensions and Locations Math(s)
// ************************************

// -All dimensions in millimeters
// -Origin at bottom left corner of PCB
// -Ethernet and power jack face left towards the origin
// -X and Y refer to position of lower left corner of compoenent from origin
// -Z refers to distance from top of component to the PCB
// -L and W are Lenght(X) and Width(Y) to specify component size

//Half Height Breadboard Dimensions
HHB_L = 85;
HHB_W = 60;
HHB_WT = 2.0;		//Retaining Wall Thickness
HHB_WZ = 3.0;		//Rataining Wall Height
HHB_Gap = 1.0;		//Gap from wall to Board
HHB_WL = HHB_L + HHB_Gap + HHB_WT;
HHB_WW = HHB_W + HHB_Gap + HHB_WT;

//Misc Dimensions
Edge_Gap = 5;
Board_Gap = 10;
Sled_L = BB_L + Case_Thickness*2 + Case_Gap*2 + Edge_Gap*2;
Sled_W = Edge_Gap + HHB_W + Board_Gap + BB_W + Case_Thickness*2 + Case_Gap*2 + Edge_Gap;
Sled_T = 2.0;

HHB_X = Sled_L/2 - HHB_L/2 - HHB_WT - HHB_Gap;
HHB_Y = Edge_Gap;

BBCase_X = Sled_L/2 - BB_L/2 - Case_Thickness - Case_Gap;
BBCase_Y = Edge_Gap + HHB_W + Board_Gap;
BBCase_Z = Sled_T;

//Set Case Options
DevRails_Options = 0;

// ************************************
// Sled
// ************************************

module BBB_Sled() {
	union() {
		//Sled Base
		//cube([Sled_L, Sled_W, Sled_T]);
		roundCornersCube(Sled_L, Sled_W, Sled_T, 6);
		//Breadboard retaining wall
		translate([HHB_X, HHB_Y, Sled_T]) {
			difference() {
				cube([HHB_WL, HHB_WW, HHB_WZ]);
				translate([HHB_WT, HHB_WT, 0]) cube([HHB_WL-(HHB_WT*2), HHB_WW-(HHB_WT*2),HHB_WZ]);
			}
		}
		
		if (Station_Options==1) {
			translate([BBCase_X, BBCase_Y, BBCase_Z]) Base();
		}
		if (Station_Options==2) {

		}
	}
}

module DevRailHolder(X, Y, Z)
{
	SH = Z * cos(45);
	difference() {
		cube([X,Y,Z]);
		translate([0,Y,0]) rotate([45,0,0]) cube([X,SH,SH]);
	}
}

// ************************************
// Output Renders
// ************************************

//color("Aqua"){
	render(convexity=4) {
		if (Station_Options == 0) {
			BBB_Sled();
		}
		if (Station_Options == 1) {
			BBB_Sled();
		}
		if (Station_Options == 2) {
			roundCornersCube(40,20,5,2);
		}
	}
//}