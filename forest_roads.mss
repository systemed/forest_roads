Map {
	background-color: #FFFFFF;
	font-directory: url(./fonts); 
}
@sans_lt:           "Open Sans Regular","DejaVu Sans Book","unifont Medium";
@sans_lt_italic:    "Open Sans Italic","DejaVu Sans Italic","unifont Medium";

@ocean:				#AECAD0;
#ocean_lowres[zoom>=0][zoom<9],
#ocean[zoom>=9] { polygon-fill: @ocean; }

/* Forests */

#forest_boundaries[zoom>3] {
	polygon-fill: #E6F2C1;
}

#forest_boundaries::name[zoom>3][zoom<10] {
	text-face-name:@sans_lt_italic;
	text-wrap-width:60;
	text-fill: #442;
	[zoom<=6] { text-name: "[forestname].replace(' National Forests?','')"; text-line-spacing: -2; }
	[zoom>6] { 	text-name: [forestname]; text-character-spacing: 2; 	text-size:12; }
}

/* Roads */

#forest_roads::surface[zoom>11] {
	[surface_ty='AC - ASPHALT'],
	[surface_ty='P - PAVED'],
	[surface_ty='PC - PORTLAND CEMENT CONCRETE'],
	[surface_ty='BST - BITUMINOUS SURFACE TREATMENT'] { line-color: yellow; line-width: 10; }
	[surface_ty='AGG - CRUSHED AGGREGATE OR GRAVEL'],
	[surface_ty='AGG - LIMESTONE'],
	[surface_ty='AGG - SCORIA'] { line-color: #DDD; line-width: 10; }
}

#forest_roads::road[zoom=9][symbol_cod='518'],
#forest_roads::road[zoom=9][symbol_cod='100'],
#forest_roads::road[zoom=9][symbol_cod='101'],
#forest_roads::road[zoom=9][symbol_cod='517'],
#forest_roads::road[zoom>9] {
	line-width: 1;
	line-color: #BBB;
	/* gravel tracks */
	[symbol_cod='518'] { line-color: gray; line-dasharray: 4,1; line-width: 2; }
	/* main roads */
	[symbol_cod='100'],[symbol_cod='101'],[symbol_cod='517'] { line-color: black; line-width: 4; }
	/* dirt tracks */
	[symbol_cod='515'] { line-color: #994422; line-width: 2; line-dasharray: 2,3; }
	/* others */
	[symbol_cod='106'] { line-color: gray; line-dasharray: 1,4; [zoom>11] { line-width: 2; } }
}
#forest_roads::casing[zoom>8] {
	[symbol_cod='100'],[symbol_cod='101'],[symbol_cod='517'] { 
		line-color: #EEE; line-width: 3;
	}
}

#forest_roads::maintenance[zoom>11] {
	[oper_maint='2 - HIGH CLEARANCE VEHICLES'] { line-color: gray; line-dasharray: 2,20; line-width: 3; }
	[oper_maint='3 - SUITABLE FOR PASSENGER CARS'] { line-color: green; line-dasharray: 4,20; line-width: 4; }
	[oper_maint='4 - MODERATE DEGREE OF USER COMFORT'] { line-color: black; line-dasharray: 4,20; line-width: 4; }
	[oper_maint='5 - HIGH DEGREE OF USER COMFORT'] { line-color: black; line-dasharray: 4,10; line-width: 4; }
}

/* POIs
       257	Roadside Park √
-       46  [Lookout] √
       924	Campsite, Forest Service √
        63	Campground, F. S. √
        38	Forest Service Facility (work station)
-       37  [Ranger station]
        36  [Office]
       256	Picnic Area, Forest Service √
       926	Winter Recreation Area √
       921	Trailhead √
         0	N/A
*/

#forest_recreation[zoom>=10] {
	[fcsubtype=257] { marker-file: url('./forest_icons/roadside.svg'); }
	[fcsubtype=38 ] { marker-file: url('./forest_icons/forest_service.svg'); }
	[fcsubtype=37 ] { marker-file: url('./forest_icons/forest_service.svg'); }
	[fcsubtype=36 ] { marker-file: url('./forest_icons/forest_service.svg'); }
	[fcsubtype=46 ] { marker-file: url('./forest_icons/lookout.svg'); }
	[fcsubtype=924] { marker-file: url('./forest_icons/camping.svg'); }
	[fcsubtype=63 ] { marker-file: url('./forest_icons/camping.svg'); }
	[fcsubtype=256] { marker-file: url('./forest_icons/picnic.svg'); }
	[fcsubtype=926] { marker-file: url('./forest_icons/winter.svg'); }
	[fcsubtype=921] { marker-file: url('./forest_icons/trailhead.svg'); }
	marker-transform: scale(0.025, 0.025);
	[name!=''][zoom>=11] {
		text-face-name: @sans_lt;
		text-name: "[name]";
		text-fill: #680000;
		text-size: 9;
		text-dy: -12;
		text-wrap-width: 40;
		text-halo-fill: #E6F2C1;
		text-halo-radius: 2;
	}
}
