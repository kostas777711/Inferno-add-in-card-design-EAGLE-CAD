//POVRay-File created by 3d41.ulp v1.05
//Z:/home/kostas777711/Eagle_Projects/Inferno_v1/external lcd power control/Primera/LCD_BiasSupply_Primera.brd
//5/31/2012 12:32:48 AM

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare environment = on;

#local cam_x = 0;
#local cam_y = 259;
#local cam_z = -139;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -6;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 18;
#local lgt1_pos_y = 34;
#local lgt1_pos_z = 32;
#local lgt1_intense = 0.741590;
#local lgt2_pos_x = -18;
#local lgt2_pos_y = 34;
#local lgt2_pos_z = 32;
#local lgt2_intense = 0.741590;
#local lgt3_pos_x = 18;
#local lgt3_pos_y = 34;
#local lgt3_pos_z = -21;
#local lgt3_intense = 0.741590;
#local lgt4_pos_x = -18;
#local lgt4_pos_y = 34;
#local lgt4_pos_z = -21;
#local lgt4_intense = 0.741590;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 48.158400;
#declare pcb_y_size = 60.452000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(643);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "tools.inc"
#include "user.inc"

global_settings{charset utf8}

#if(environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-24.079200,0,-30.226000>
}
#end

background{col_bgr}


//Axis uncomment to activate
//object{TOOLS_AXIS_XYZ(100,100,100 //texture{ pigment{rgb<1,0,0>} finish{diffuse 0.8 phong 1}}, //texture{ pigment{rgb<1,1,1>} finish{diffuse 0.8 phong 1}})}

light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro LCD_BIASSUPPLY_PRIMERA(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,-60.452000><0.000000,0.000000>
<0.000000,0.000000><48.158400,0.000000>
<48.158400,0.000000><48.158400,-60.452000>
<48.158400,-60.452000><0.000000,-60.452000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
//Holes(real)/Board
cylinder{<2.997200,1,-3.810000><2.997200,-5,-3.810000>1.400000 texture{col_hls}}
cylinder{<32.537400,1,-3.810000><32.537400,-5,-3.810000>1.400000 texture{col_hls}}
cylinder{<2.997200,1,-55.524400><2.997200,-5,-55.524400>1.400000 texture{col_hls}}
cylinder{<32.537400,1,-55.524400><32.537400,-5,-55.524400>1.400000 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {PH_1X11()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<3.632200,0.000000,-11.226800>}#end		//Header 2,54mm Grid 11Pin 1Row (jumper.lib) JP1 M11PTH 1X11
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {PH_1X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<13.208000,0.000000,-40.157400>}#end		//Header 2,54mm Grid 3Pin 1Row (jumper.lib) JP2 VLED+ 1X03
#ifndef(pack_JP3) #declare global_pack_JP3=yes; object {PH_1X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<9.448800,0.000000,-31.902400>}#end		//Header 2,54mm Grid 3Pin 1Row (jumper.lib) JP3 VLED- 1X03
#ifndef(pack_JP4) #declare global_pack_JP4=yes; object {PH_1X1()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<15.748000,0.000000,-42.697400>}#end		//Header 2,54mm Grid 1Pin 1Row (jumper.lib) JP4 M01PTH 1X01
#ifndef(pack_JP5) #declare global_pack_JP5=yes; object {PH_1X1()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<11.988800,0.000000,-34.417000>}#end		//Header 2,54mm Grid 1Pin 1Row (jumper.lib) JP5 M01PTH 1X01
#ifndef(pack_Q1) #declare global_pack_Q1=yes; object {IC_SMD_SOT23("PMBS3904","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<31.927800,0.000000,-31.851600>translate<0,0.035000,0> }#end		//SOT23 Q1 PMBS3904 SOT23
#ifndef(pack_Q2) #declare global_pack_Q2=yes; object {IC_SMD_SOT23("MMBT3906","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<31.699200,0.000000,-43.535600>translate<0,0.035000,0> }#end		//SOT23 Q2 MMBT3906 SOT23
#ifndef(pack_Q3) #declare global_pack_Q3=yes; object {IC_SMD_SOT23("PMBS3904","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<31.927800,0.000000,-27.686000>translate<0,0.035000,0> }#end		//SOT23 Q3 PMBS3904 SOT23
#ifndef(pack_Q4) #declare global_pack_Q4=yes; object {IC_SMD_SOT23("MMBT3906","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<31.699200,0.000000,-39.268400>translate<0,0.035000,0> }#end		//SOT23 Q4 MMBT3906 SOT23
#ifndef(pack_U3) #declare global_pack_U3=yes; object {IC_SMD_SOT23("BAV99","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<40.817800,0.000000,-32.334200>translate<0,0.035000,0> }#end		//SOT23 U3 BAV99 SOT23
#ifndef(pack_U4) #declare global_pack_U4=yes; object {IC_SMD_SOT23("BAV99","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<40.817800,0.000000,-27.711400>translate<0,0.035000,0> }#end		//SOT23 U4 BAV99 SOT23
#ifndef(pack_U5) #declare global_pack_U5=yes; object {IC_SMD_SOT23("BAV99","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<40.030400,0.000000,-43.637200>translate<0,0.035000,0> }#end		//SOT23 U5 BAV99 SOT23
#ifndef(pack_U6) #declare global_pack_U6=yes; object {IC_SMD_SOT23("BAV99","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<40.030400,0.000000,-39.268400>translate<0,0.035000,0> }#end		//SOT23 U6 BAV99 SOT23
#ifndef(pack_U7) #declare global_pack_U7=yes; object {IC_SMD_SOT23_5("TPS61040DBVR","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<37.566600,0.000000,-55.143400>translate<0,0.035000,0> }#end		//SOT23-5 U7 TPS61040DBVR SOT23-5
#ifndef(pack_U8) #declare global_pack_U8=yes; object {IC_SMD_SOT23_5("CAT4238","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<7.366000,0.000000,-46.024800>translate<0,0.035000,0> }#end		//SOT23-5 U8 CAT4238 SOT23-5
#ifndef(pack_U9) #declare global_pack_U9=yes; object {IC_SMD_SOT23_5("TPS61040DBVR","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<17.018000,0.000000,-54.737000>translate<0,0.035000,0> }#end		//SOT23-5 U9 TPS61040DBVR SOT23-5
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<31.331800,0.000000,-7.772400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<33.031800,0.000000,-7.772400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<31.331800,0.000000,-9.906000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<33.031800,0.000000,-9.906000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.004600,0.000000,-33.782000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<42.304600,0.000000,-33.782000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.131600,0.000000,-26.162000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<42.431600,0.000000,-26.162000>}
object{TOOLS_PCB_SMD(1.500000,2.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<41.204800,0.000000,-8.865400>}
object{TOOLS_PCB_SMD(1.500000,2.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.304800,0.000000,-8.865400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<43.230800,0.000000,-30.745800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<43.230800,0.000000,-29.045800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<38.442000,0.000000,-31.089600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.742000,0.000000,-31.089600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<29.018600,0.000000,-30.429200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.318600,0.000000,-30.429200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<29.018600,0.000000,-31.800800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.318600,0.000000,-31.800800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<31.103200,0.000000,-34.569400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<32.803200,0.000000,-34.569400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.157000,0.000000,-44.704000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<42.457000,0.000000,-44.704000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.004600,0.000000,-37.896800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<42.304600,0.000000,-37.896800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<42.443400,0.000000,-40.602800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<42.443400,0.000000,-42.302800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.654600,0.000000,-44.983400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.954600,0.000000,-44.983400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<27.471000,0.000000,-39.268400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.171000,0.000000,-39.268400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.979000,0.000000,-27.305000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.279000,0.000000,-27.305000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<27.471000,0.000000,-45.745400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.171000,0.000000,-45.745400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<10.654400,0.000000,-27.305000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.954400,0.000000,-27.305000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<10.603600,0.000000,-25.781000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.903600,0.000000,-25.781000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<17.729200,0.000000,-49.518200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<17.729200,0.000000,-51.218200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.946000,0.000000,-39.903400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<5.246000,0.000000,-39.903400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.046600,0.000000,-9.067800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<11.746600,0.000000,-9.067800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.072000,0.000000,-12.903200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<11.772000,0.000000,-12.903200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<10.046600,0.000000,-11.582400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<11.746600,0.000000,-11.582400>}
object{TOOLS_PCB_SMD(1.600000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<17.960800,0.000000,-21.310600>}
object{TOOLS_PCB_SMD(1.600000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.160800,0.000000,-21.310600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.803000,0.000000,-19.380200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.503000,0.000000,-19.380200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<33.731200,0.000000,-49.772200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<33.731200,0.000000,-51.472200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<40.030400,0.000000,-56.401600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<40.030400,0.000000,-58.101600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.216000,0.000000,-57.531000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.916000,0.000000,-57.531000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<8.292200,0.000000,-55.549800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<6.592200,0.000000,-55.549800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<32.258000,0.000000,-49.772200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<32.258000,0.000000,-51.472200>}
object{TOOLS_PCB_SMD(1.400000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<34.747200,0.000000,-34.361200>}
object{TOOLS_PCB_SMD(1.400000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<34.747200,0.000000,-30.561200>}
object{TOOLS_PCB_SMD(1.400000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<34.290000,0.000000,-41.244600>}
object{TOOLS_PCB_SMD(1.400000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<34.290000,0.000000,-37.444600>}
object{TOOLS_PCB_SMD(1.400000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.752800,0.000000,-16.454200>}
object{TOOLS_PCB_SMD(1.400000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.752800,0.000000,-12.654200>}
object{TOOLS_PCB_SMD(1.400000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<26.619200,0.000000,-53.157200>}
object{TOOLS_PCB_SMD(1.400000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<26.619200,0.000000,-49.357200>}
object{TOOLS_PCB_SMD(1.400000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.938200,0.000000,-52.319000>}
object{TOOLS_PCB_SMD(1.400000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.938200,0.000000,-48.519000>}
object{TOOLS_PCB_SMD(2.500000,2.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.707200,0.000000,-49.411200>}
object{TOOLS_PCB_SMD(2.500000,2.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.707200,0.000000,-53.611200>}
object{TOOLS_PCB_SMD(1.400000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.583400,0.000000,-53.436600>}
object{TOOLS_PCB_SMD(1.400000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.583400,0.000000,-49.636600>}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.632200,0,-11.226800> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.632200,0,-13.766800> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.632200,0,-16.306800> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.632200,0,-18.846800> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.632200,0,-21.386800> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.632200,0,-23.926800> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.632200,0,-26.466800> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.632200,0,-29.006800> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.632200,0,-31.546800> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.632200,0,-34.086800> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<3.632200,0,-36.626800> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<13.208000,0,-40.157400> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<13.208000,0,-42.697400> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<13.208000,0,-45.237400> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<9.448800,0,-31.902400> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<9.448800,0,-34.442400> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<9.448800,0,-36.982400> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<15.748000,0,-42.697400> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<11.988800,0,-34.417000> texture{col_thl}}
object{TOOLS_PCB_SMD(2.000000,5.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<41.196600,0.000000,-17.908600>}
object{TOOLS_PCB_SMD(2.000000,5.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<31.696600,0.000000,-17.908600>}
object{TOOLS_PCB_SMD(1.500000,1.400000,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<24.437800,0.000000,-50.492200>}
object{TOOLS_PCB_SMD(1.500000,1.400000,0.037000,0) rotate<0,-315.000000,0> texture{col_pds} translate<21.637800,0.000000,-53.292200>}
object{TOOLS_PCB_SMD(1.700000,3.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<46.842000,0.000000,-50.393600>}
object{TOOLS_PCB_SMD(1.700000,3.800000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<41.042000,0.000000,-50.393600>}
object{TOOLS_PCB_SMD(1.700000,3.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<3.988600,0.000000,-42.910400>}
object{TOOLS_PCB_SMD(1.700000,3.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<3.988600,0.000000,-47.310400>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<32.877800,0.000000,-30.751600>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<30.977800,0.000000,-30.751600>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<31.927800,0.000000,-32.951600>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<32.649200,0.000000,-42.435600>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<30.749200,0.000000,-42.435600>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<31.699200,0.000000,-44.635600>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<30.977800,0.000000,-28.786000>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<32.877800,0.000000,-28.786000>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<31.927800,0.000000,-26.586000>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<30.749200,0.000000,-40.368400>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<32.649200,0.000000,-40.368400>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<31.699200,0.000000,-38.168400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.503000,0.000000,-18.084800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.803000,0.000000,-18.084800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.803000,0.000000,-16.814800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.503000,0.000000,-16.814800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<36.742000,0.000000,-27.609800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<38.442000,0.000000,-27.609800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<36.742000,0.000000,-29.032200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<38.442000,0.000000,-29.032200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<36.742000,0.000000,-33.756600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<38.442000,0.000000,-33.756600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<36.742000,0.000000,-32.435800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<38.442000,0.000000,-32.435800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<27.318600,0.000000,-29.108400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.018600,0.000000,-29.108400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<29.018600,0.000000,-27.736800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.318600,0.000000,-27.736800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.755000,0.000000,-19.380200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.455000,0.000000,-19.380200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<27.318600,0.000000,-34.569400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.018600,0.000000,-34.569400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<27.318600,0.000000,-26.416000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.018600,0.000000,-26.416000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<27.318600,0.000000,-33.197800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.018600,0.000000,-33.197800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<27.471000,0.000000,-43.154600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.171000,0.000000,-43.154600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.954600,0.000000,-40.436800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<37.654600,0.000000,-40.436800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.954600,0.000000,-42.087800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<37.654600,0.000000,-42.087800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.954600,0.000000,-43.535600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<37.654600,0.000000,-43.535600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.102800,0.000000,-51.446800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.102800,0.000000,-49.746800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<29.171000,0.000000,-40.589200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.471000,0.000000,-40.589200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<27.471000,0.000000,-44.475400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.171000,0.000000,-44.475400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<27.471000,0.000000,-37.998400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.171000,0.000000,-37.998400>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.479400,0.000000,-27.305000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<20.179400,0.000000,-27.305000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.279000,0.000000,-25.781000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<16.979000,0.000000,-25.781000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.829400,0.000000,-25.781000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<12.129400,0.000000,-25.781000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<12.129400,0.000000,-27.305000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.829400,0.000000,-27.305000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<14.820000,0.000000,-57.531000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<13.120000,0.000000,-57.531000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.868000,0.000000,-57.531000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.168000,0.000000,-57.531000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.077400,0.000000,-54.647200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.077400,0.000000,-52.947200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<27.471000,0.000000,-41.884600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<29.171000,0.000000,-41.884600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<9.448800,0.000000,-48.273600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<9.448800,0.000000,-49.973600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<5.246000,0.000000,-41.325800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.946000,0.000000,-41.325800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<8.305800,0.000000,-41.491800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<8.305800,0.000000,-43.191800>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<11.760200,0.000000,-5.855600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<11.760200,0.000000,-7.555600>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<14.884400,0.000000,-52.869200>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<14.884400,0.000000,-51.169200>}
object{TOOLS_PCB_SMD(0.800000,0.510000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.782000,0.000000,-18.404800>}
object{TOOLS_PCB_SMD(0.800000,0.510000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.782000,0.000000,-19.354800>}
object{TOOLS_PCB_SMD(0.800000,0.510000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.782000,0.000000,-20.304800>}
object{TOOLS_PCB_SMD(0.800000,0.510000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.382000,0.000000,-20.304800>}
object{TOOLS_PCB_SMD(0.800000,0.510000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.382000,0.000000,-19.354800>}
object{TOOLS_PCB_SMD(0.800000,0.510000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.382000,0.000000,-18.404800>}
object{TOOLS_PCB_SMD(1.000000,0.700000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.962400,0.000000,-18.128800>}
object{TOOLS_PCB_SMD(1.000000,0.700000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.012400,0.000000,-18.128800>}
object{TOOLS_PCB_SMD(1.000000,0.700000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.062400,0.000000,-18.128800>}
object{TOOLS_PCB_SMD(1.000000,0.700000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<27.062400,0.000000,-20.928800>}
object{TOOLS_PCB_SMD(1.000000,0.700000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.012400,0.000000,-20.928800>}
object{TOOLS_PCB_SMD(1.000000,0.700000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.962400,0.000000,-20.928800>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<41.767800,0.000000,-31.234200>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.867800,0.000000,-31.234200>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<40.817800,0.000000,-33.434200>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<39.867800,0.000000,-28.811400>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<41.767800,0.000000,-28.811400>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<40.817800,0.000000,-26.611400>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<40.980400,0.000000,-42.537200>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<39.080400,0.000000,-42.537200>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<40.030400,0.000000,-44.737200>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<39.080400,0.000000,-40.368400>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<40.980400,0.000000,-40.368400>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<40.030400,0.000000,-38.168400>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<38.516600,0.000000,-53.843400>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<37.566600,0.000000,-53.843400>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.616600,0.000000,-53.843400>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.616600,0.000000,-56.443400>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<38.516600,0.000000,-56.443400>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.416000,0.000000,-47.324800>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<7.366000,0.000000,-47.324800>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<8.316000,0.000000,-47.324800>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<8.316000,0.000000,-44.724800>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<6.416000,0.000000,-44.724800>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.968000,0.000000,-53.437000>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.018000,0.000000,-53.437000>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.068000,0.000000,-53.437000>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<16.068000,0.000000,-56.037000>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.968000,0.000000,-56.037000>}
object{TOOLS_PCB_SMD(0.650000,0.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.452000,0.000000,-3.970600>}
object{TOOLS_PCB_SMD(0.650000,0.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<14.502000,0.000000,-3.970600>}
object{TOOLS_PCB_SMD(0.650000,0.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<13.552000,0.000000,-3.970600>}
object{TOOLS_PCB_SMD(0.650000,0.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.452000,0.000000,-6.420600>}
object{TOOLS_PCB_SMD(0.650000,0.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<13.552000,0.000000,-6.420600>}
object{TOOLS_PCB_SMD(1.800000,0.650000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.591600,0.000000,-7.804000>}
object{TOOLS_PCB_SMD(1.800000,0.650000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.591600,0.000000,-9.078600>}
object{TOOLS_PCB_SMD(1.800000,0.650000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.617000,0.000000,-10.327800>}
object{TOOLS_PCB_SMD(1.800000,0.650000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.617000,0.000000,-11.629400>}
object{TOOLS_PCB_SMD(1.800000,0.650000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.617000,0.000000,-12.878600>}
object{TOOLS_PCB_SMD(3.700000,1.700000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.660800,0.000000,-10.364800>}
//Pads/Vias
object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,1,0) translate<36.626800,0,-26.238200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,1,0) translate<30.048200,0,-14.147800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,1,0) translate<39.649400,0,-8.991600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,1,0) translate<14.757400,0,-17.881600> texture{col_thl}}
object{TOOLS_PCB_VIA(0.965200,0.609600,1,16,1,0) translate<10.490200,0,-6.680200> texture{col_thl}}
object{TOOLS_PCB_VIA(0.965200,0.609600,1,16,1,0) translate<5.511800,0,-45.618400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.965200,0.609600,1,16,1,0) translate<19.024600,0,-55.397400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.762000,0.406400,1,16,1,0) translate<6.400800,0,-42.418000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.762000,0.406400,1,16,1,0) translate<30.403800,0,-43.840400> texture{col_thl}}
object{TOOLS_PCB_VIA(0.762000,0.406400,1,16,1,0) translate<37.338000,0,-46.151800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,1,0) translate<28.092400,0,-35.839400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,1,0) translate<14.935200,0,-29.438600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,1,0) translate<8.178800,0,-51.841400> texture{col_thl}}
object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,1,0) translate<9.423400,0,-46.863000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.219200,0.812800,1,16,1,0) translate<16.357600,0,-52.019200> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<1.422400,-1.535000,-21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<1.422400,-1.535000,-37.439600>}
box{<0,0,-0.088900><16.357600,0.035000,0.088900> rotate<0,-90.000000,0> translate<1.422400,-1.535000,-37.439600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<1.422400,-1.535000,-21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<3.556000,-1.535000,-18.948400>}
box{<0,0,-0.088900><3.017366,0.035000,0.088900> rotate<0,-44.997030,0> translate<1.422400,-1.535000,-21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<3.556000,-1.535000,-18.948400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<3.632200,-1.535000,-18.846800>}
box{<0,0,-0.088900><0.127000,0.035000,0.088900> rotate<0,-53.126596,0> translate<3.556000,-1.535000,-18.948400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.632200,0.000000,-34.086800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.733800,0.000000,-34.061400>}
box{<0,0,-0.406400><0.104727,0.035000,0.406400> rotate<0,-14.035317,0> translate<3.632200,0.000000,-34.086800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.632200,0.000000,-31.546800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.733800,0.000000,-31.394400>}
box{<0,0,-0.406400><0.183162,0.035000,0.406400> rotate<0,-56.306216,0> translate<3.632200,0.000000,-31.546800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.632200,0.000000,-29.006800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.733800,0.000000,-28.905200>}
box{<0,0,-0.406400><0.143684,0.035000,0.406400> rotate<0,-44.997030,0> translate<3.632200,0.000000,-29.006800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.632200,-1.535000,-26.466800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.733800,-1.535000,-26.416000>}
box{<0,0,-0.406400><0.113592,0.035000,0.406400> rotate<0,-26.563298,0> translate<3.632200,-1.535000,-26.466800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.632200,-1.535000,-23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.733800,-1.535000,-23.926800>}
box{<0,0,-0.406400><0.101600,0.035000,0.406400> rotate<0,0.000000,0> translate<3.632200,-1.535000,-23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.632200,0.000000,-21.386800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.733800,0.000000,-21.437600>}
box{<0,0,-0.406400><0.113592,0.035000,0.406400> rotate<0,26.563298,0> translate<3.632200,0.000000,-21.386800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.632200,0.000000,-16.306800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.733800,0.000000,-16.281400>}
box{<0,0,-0.203200><0.104727,0.035000,0.203200> rotate<0,-14.035317,0> translate<3.632200,0.000000,-16.306800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<3.632200,0.000000,-13.766800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<3.733800,0.000000,-13.614400>}
box{<0,0,-0.088900><0.183162,0.035000,0.088900> rotate<0,-56.306216,0> translate<3.632200,0.000000,-13.766800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.733800,-1.535000,-26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.911600,-1.535000,-26.238200>}
box{<0,0,-0.406400><0.251447,0.035000,0.406400> rotate<0,-44.997030,0> translate<3.733800,-1.535000,-26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.733800,-1.535000,-23.926800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.911600,-1.535000,-24.104600>}
box{<0,0,-0.406400><0.251447,0.035000,0.406400> rotate<0,44.997030,0> translate<3.733800,-1.535000,-23.926800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<3.988600,0.000000,-47.310400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<4.089400,0.000000,-47.396400>}
box{<0,0,-0.088900><0.132501,0.035000,0.088900> rotate<0,40.467298,0> translate<3.988600,0.000000,-47.310400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.988600,0.000000,-42.910400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.089400,0.000000,-42.951400>}
box{<0,0,-0.304800><0.108819,0.035000,0.304800> rotate<0,22.132378,0> translate<3.988600,0.000000,-42.910400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<3.733800,0.000000,-16.281400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.089400,0.000000,-15.925800>}
box{<0,0,-0.203200><0.502894,0.035000,0.203200> rotate<0,-44.997030,0> translate<3.733800,0.000000,-16.281400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.733800,0.000000,-34.061400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.267200,0.000000,-34.061400>}
box{<0,0,-0.406400><0.533400,0.035000,0.406400> rotate<0,0.000000,0> translate<3.733800,0.000000,-34.061400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.733800,0.000000,-31.394400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.267200,0.000000,-31.394400>}
box{<0,0,-0.406400><0.533400,0.035000,0.406400> rotate<0,0.000000,0> translate<3.733800,0.000000,-31.394400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.733800,0.000000,-28.905200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.267200,0.000000,-28.905200>}
box{<0,0,-0.406400><0.533400,0.035000,0.406400> rotate<0,0.000000,0> translate<3.733800,0.000000,-28.905200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.733800,0.000000,-21.437600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.267200,0.000000,-21.437600>}
box{<0,0,-0.406400><0.533400,0.035000,0.406400> rotate<0,0.000000,0> translate<3.733800,0.000000,-21.437600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<3.733800,0.000000,-13.614400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<4.267200,0.000000,-13.614400>}
box{<0,0,-0.088900><0.533400,0.035000,0.088900> rotate<0,0.000000,0> translate<3.733800,0.000000,-13.614400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.089400,0.000000,-42.951400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.800600,0.000000,-42.951400>}
box{<0,0,-0.304800><0.711200,0.035000,0.304800> rotate<0,0.000000,0> translate<4.089400,0.000000,-42.951400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.267200,0.000000,-28.905200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.800600,0.000000,-29.438600>}
box{<0,0,-0.406400><0.754342,0.035000,0.406400> rotate<0,44.997030,0> translate<4.267200,0.000000,-28.905200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.988600,0.000000,-42.910400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.156200,0.000000,-42.951400>}
box{<0,0,-0.304800><1.168320,0.035000,0.304800> rotate<0,2.010969,0> translate<3.988600,0.000000,-42.910400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.156200,0.000000,-42.951400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.156200,0.000000,-41.529000>}
box{<0,0,-0.304800><1.422400,0.035000,0.304800> rotate<0,90.000000,0> translate<5.156200,0.000000,-41.529000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.156200,0.000000,-41.529000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.246000,0.000000,-41.325800>}
box{<0,0,-0.304800><0.222158,0.035000,0.304800> rotate<0,-66.153602,0> translate<5.156200,0.000000,-41.529000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.246000,0.000000,-41.325800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.334000,0.000000,-41.173400>}
box{<0,0,-0.304800><0.175982,0.035000,0.304800> rotate<0,-59.992708,0> translate<5.246000,0.000000,-41.325800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.246000,0.000000,-39.903400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.334000,0.000000,-39.928800>}
box{<0,0,-0.304800><0.091592,0.035000,0.304800> rotate<0,16.099001,0> translate<5.246000,0.000000,-39.903400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.334000,0.000000,-41.173400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.334000,0.000000,-39.928800>}
box{<0,0,-0.304800><1.244600,0.035000,0.304800> rotate<0,90.000000,0> translate<5.334000,0.000000,-39.928800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.511800,-1.535000,-51.485800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.511800,-1.535000,-45.618400>}
box{<0,0,-0.304800><5.867400,0.035000,0.304800> rotate<0,90.000000,0> translate<5.511800,-1.535000,-45.618400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<4.267200,0.000000,-13.614400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<5.689600,0.000000,-12.192000>}
box{<0,0,-0.088900><2.011577,0.035000,0.088900> rotate<0,-44.997030,0> translate<4.267200,0.000000,-13.614400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<5.689600,0.000000,-9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<5.689600,0.000000,-12.192000>}
box{<0,0,-0.088900><2.844800,0.035000,0.088900> rotate<0,-90.000000,0> translate<5.689600,0.000000,-12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.511800,0.000000,-45.618400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.223000,0.000000,-44.907200>}
box{<0,0,-0.304800><1.005789,0.035000,0.304800> rotate<0,-44.997030,0> translate<5.511800,0.000000,-45.618400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<4.089400,0.000000,-47.396400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<6.400800,0.000000,-47.396400>}
box{<0,0,-0.088900><2.311400,0.035000,0.088900> rotate<0,0.000000,0> translate<4.089400,0.000000,-47.396400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.800600,0.000000,-42.951400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.400800,0.000000,-44.551600>}
box{<0,0,-0.304800><2.263025,0.035000,0.304800> rotate<0,44.997030,0> translate<4.800600,0.000000,-42.951400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<1.422400,-1.535000,-37.439600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<6.400800,-1.535000,-42.418000>}
box{<0,0,-0.088900><7.040521,0.035000,0.088900> rotate<0,44.997030,0> translate<1.422400,-1.535000,-37.439600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<6.400800,0.000000,-47.396400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<6.416000,0.000000,-47.324800>}
box{<0,0,-0.088900><0.073196,0.035000,0.088900> rotate<0,-78.009437,0> translate<6.400800,0.000000,-47.396400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.223000,0.000000,-44.907200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.416000,0.000000,-44.724800>}
box{<0,0,-0.304800><0.265554,0.035000,0.304800> rotate<0,-43.379732,0> translate<6.223000,0.000000,-44.907200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.400800,0.000000,-44.551600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.416000,0.000000,-44.724800>}
box{<0,0,-0.304800><0.173866,0.035000,0.304800> rotate<0,84.978974,0> translate<6.400800,0.000000,-44.551600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.578600,0.000000,-53.619400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.578600,0.000000,-55.397400>}
box{<0,0,-0.406400><1.778000,0.035000,0.406400> rotate<0,-90.000000,0> translate<6.578600,0.000000,-55.397400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<6.578600,0.000000,-47.396400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<6.578600,0.000000,-49.352200>}
box{<0,0,-0.088900><1.955800,0.035000,0.088900> rotate<0,-90.000000,0> translate<6.578600,0.000000,-49.352200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<6.416000,0.000000,-47.324800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<6.578600,0.000000,-47.396400>}
box{<0,0,-0.088900><0.177666,0.035000,0.088900> rotate<0,23.764456,0> translate<6.416000,0.000000,-47.324800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.578600,0.000000,-55.397400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.592200,0.000000,-55.549800>}
box{<0,0,-0.406400><0.153006,0.035000,0.406400> rotate<0,84.894896,0> translate<6.578600,0.000000,-55.397400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.578600,0.000000,-53.619400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.707200,0.000000,-53.611200>}
box{<0,0,-0.406400><0.128861,0.035000,0.406400> rotate<0,-3.648206,0> translate<6.578600,0.000000,-53.619400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<6.578600,0.000000,-49.352200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<6.707200,0.000000,-49.411200>}
box{<0,0,-0.088900><0.141488,0.035000,0.088900> rotate<0,24.643412,0> translate<6.578600,0.000000,-49.352200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.707200,0.000000,-53.611200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.756400,0.000000,-53.263800>}
box{<0,0,-0.406400><0.350867,0.035000,0.406400> rotate<0,-81.933771,0> translate<6.707200,0.000000,-53.611200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<6.946000,0.000000,-41.325800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<7.112000,0.000000,-41.351200>}
box{<0,0,-0.088900><0.167932,0.035000,0.088900> rotate<0,8.698897,0> translate<6.946000,0.000000,-41.325800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.267200,0.000000,-31.394400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.289800,0.000000,-34.417000>}
box{<0,0,-0.406400><4.274602,0.035000,0.406400> rotate<0,44.997030,0> translate<4.267200,0.000000,-31.394400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.911600,-1.535000,-26.238200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.289800,-1.535000,-26.238200>}
box{<0,0,-0.406400><3.378200,0.035000,0.406400> rotate<0,0.000000,0> translate<3.911600,-1.535000,-26.238200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<6.400800,0.000000,-42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<7.467600,0.000000,-41.351200>}
box{<0,0,-0.088900><1.508683,0.035000,0.088900> rotate<0,-44.997030,0> translate<6.400800,0.000000,-42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<6.946000,0.000000,-41.325800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<7.467600,0.000000,-41.351200>}
box{<0,0,-0.088900><0.522218,0.035000,0.088900> rotate<0,2.787707,0> translate<6.946000,0.000000,-41.325800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<7.112000,0.000000,-41.351200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<7.467600,0.000000,-41.351200>}
box{<0,0,-0.088900><0.355600,0.035000,0.088900> rotate<0,0.000000,0> translate<7.112000,0.000000,-41.351200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<6.756400,0.000000,-53.263800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.178800,0.000000,-51.841400>}
box{<0,0,-0.406400><2.011577,0.035000,0.406400> rotate<0,-44.997030,0> translate<6.756400,0.000000,-53.263800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.178800,-1.535000,-50.596800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.178800,-1.535000,-51.841400>}
box{<0,0,-0.406400><1.244600,0.035000,0.406400> rotate<0,-90.000000,0> translate<8.178800,-1.535000,-51.841400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<7.467600,0.000000,-41.351200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<8.178800,0.000000,-41.351200>}
box{<0,0,-0.088900><0.711200,0.035000,0.088900> rotate<0,0.000000,0> translate<7.467600,0.000000,-41.351200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.632200,-1.535000,-11.226800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.178800,-1.535000,-6.680200>}
box{<0,0,-0.304800><6.429863,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.632200,-1.535000,-11.226800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<8.178800,0.000000,-41.529000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<8.305800,0.000000,-41.491800>}
box{<0,0,-0.088900><0.132336,0.035000,0.088900> rotate<0,-16.324937,0> translate<8.178800,0.000000,-41.529000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<8.178800,0.000000,-41.351200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<8.305800,0.000000,-41.491800>}
box{<0,0,-0.088900><0.189466,0.035000,0.088900> rotate<0,47.906228,0> translate<8.178800,0.000000,-41.351200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.316000,0.000000,-47.324800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.356600,0.000000,-47.396400>}
box{<0,0,-0.406400><0.082310,0.035000,0.406400> rotate<0,60.441079,0> translate<8.316000,0.000000,-47.324800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<8.316000,0.000000,-44.724800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<8.356600,0.000000,-44.551600>}
box{<0,0,-0.088900><0.177895,0.035000,0.088900> rotate<0,-76.802360,0> translate<8.316000,0.000000,-44.724800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<8.305800,0.000000,-43.191800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<8.356600,0.000000,-43.307000>}
box{<0,0,-0.088900><0.125903,0.035000,0.088900> rotate<0,66.199484,0> translate<8.305800,0.000000,-43.191800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<8.356600,0.000000,-44.551600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<8.356600,0.000000,-43.307000>}
box{<0,0,-0.088900><1.244600,0.035000,0.088900> rotate<0,90.000000,0> translate<8.356600,0.000000,-43.307000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.267200,0.000000,-21.437600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.356600,0.000000,-17.348200>}
box{<0,0,-0.406400><5.783285,0.035000,0.406400> rotate<0,-44.997030,0> translate<4.267200,0.000000,-21.437600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.356600,0.000000,-47.396400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.623300,0.000000,-47.663100>}
box{<0,0,-0.406400><0.377171,0.035000,0.406400> rotate<0,44.997030,0> translate<8.356600,0.000000,-47.396400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.267200,0.000000,-34.061400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.712200,0.000000,-38.506400>}
box{<0,0,-0.406400><6.286179,0.035000,0.406400> rotate<0,44.997030,0> translate<4.267200,0.000000,-34.061400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.623300,0.000000,-47.663100>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.067800,0.000000,-48.107600>}
box{<0,0,-0.406400><0.628618,0.035000,0.406400> rotate<0,44.997030,0> translate<8.623300,0.000000,-47.663100> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.712200,0.000000,-38.506400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.067800,0.000000,-38.506400>}
box{<0,0,-0.406400><0.355600,0.035000,0.406400> rotate<0,0.000000,0> translate<8.712200,0.000000,-38.506400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<3.911600,-1.535000,-24.104600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.245600,-1.535000,-24.104600>}
box{<0,0,-0.406400><5.334000,0.035000,0.406400> rotate<0,0.000000,0> translate<3.911600,-1.535000,-24.104600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.511800,-1.535000,-51.485800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.423400,-1.535000,-55.397400>}
box{<0,0,-0.304800><5.531838,0.035000,0.304800> rotate<0,44.997030,0> translate<5.511800,-1.535000,-51.485800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.067800,0.000000,-48.107600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.423400,0.000000,-48.107600>}
box{<0,0,-0.406400><0.355600,0.035000,0.406400> rotate<0,0.000000,0> translate<9.067800,0.000000,-48.107600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.623300,0.000000,-47.663100>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.423400,0.000000,-46.863000>}
box{<0,0,-0.406400><1.131512,0.035000,0.406400> rotate<0,-44.997030,0> translate<8.623300,0.000000,-47.663100> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.423400,-1.535000,-37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.423400,-1.535000,-46.863000>}
box{<0,0,-0.406400><9.779000,0.035000,0.406400> rotate<0,-90.000000,0> translate<9.423400,-1.535000,-46.863000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.289800,0.000000,-34.417000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.423400,0.000000,-34.417000>}
box{<0,0,-0.406400><2.133600,0.035000,0.406400> rotate<0,0.000000,0> translate<7.289800,0.000000,-34.417000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.423400,0.000000,-48.107600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.448800,0.000000,-48.273600>}
box{<0,0,-0.406400><0.167932,0.035000,0.406400> rotate<0,81.295164,0> translate<9.423400,0.000000,-48.107600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.423400,-1.535000,-37.084000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.448800,-1.535000,-36.982400>}
box{<0,0,-0.406400><0.104727,0.035000,0.406400> rotate<0,-75.958743,0> translate<9.423400,-1.535000,-37.084000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.423400,0.000000,-34.417000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.448800,0.000000,-34.442400>}
box{<0,0,-0.406400><0.035921,0.035000,0.406400> rotate<0,44.997030,0> translate<9.423400,0.000000,-34.417000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<4.800600,0.000000,-29.438600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.956800,0.000000,-29.438600>}
box{<0,0,-0.406400><5.156200,0.035000,0.406400> rotate<0,0.000000,0> translate<4.800600,0.000000,-29.438600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.178800,-1.535000,-6.680200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.490200,-1.535000,-6.680200>}
box{<0,0,-0.304800><2.311400,0.035000,0.304800> rotate<0,0.000000,0> translate<8.178800,-1.535000,-6.680200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.654400,0.000000,-27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.668000,0.000000,-27.305000>}
box{<0,0,-0.406400><0.013600,0.035000,0.406400> rotate<0,0.000000,0> translate<10.654400,0.000000,-27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.668000,0.000000,-25.882600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.668000,0.000000,-27.305000>}
box{<0,0,-0.406400><1.422400,0.035000,0.406400> rotate<0,-90.000000,0> translate<10.668000,0.000000,-27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.603600,0.000000,-25.781000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.668000,0.000000,-25.882600>}
box{<0,0,-0.406400><0.120291,0.035000,0.406400> rotate<0,57.627292,0> translate<10.603600,0.000000,-25.781000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.956800,0.000000,-29.438600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.845800,0.000000,-28.549600>}
box{<0,0,-0.406400><1.257236,0.035000,0.406400> rotate<0,-44.997030,0> translate<9.956800,0.000000,-29.438600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.845800,0.000000,-27.660600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.845800,0.000000,-28.549600>}
box{<0,0,-0.406400><0.889000,0.035000,0.406400> rotate<0,-90.000000,0> translate<10.845800,0.000000,-28.549600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.654400,0.000000,-27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.845800,0.000000,-27.660600>}
box{<0,0,-0.406400><0.403838,0.035000,0.406400> rotate<0,61.704781,0> translate<10.654400,0.000000,-27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<11.201400,0.000000,-44.551600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<11.201400,0.000000,-51.841400>}
box{<0,0,-0.088900><7.289800,0.035000,0.088900> rotate<0,-90.000000,0> translate<11.201400,0.000000,-51.841400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<8.178800,0.000000,-41.529000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<11.201400,0.000000,-44.551600>}
box{<0,0,-0.088900><4.274602,0.035000,0.088900> rotate<0,44.997030,0> translate<8.178800,0.000000,-41.529000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.490200,0.000000,-6.680200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.557000,0.000000,-5.613400>}
box{<0,0,-0.304800><1.508683,0.035000,0.304800> rotate<0,-44.997030,0> translate<10.490200,0.000000,-6.680200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.557000,0.000000,-5.613400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.760200,0.000000,-5.855600>}
box{<0,0,-0.304800><0.316150,0.035000,0.304800> rotate<0,50.000855,0> translate<11.557000,0.000000,-5.613400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.746600,0.000000,-11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.912600,0.000000,-11.480800>}
box{<0,0,-0.203200><0.194624,0.035000,0.203200> rotate<0,-31.466564,0> translate<11.746600,0.000000,-11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.746600,0.000000,-9.067800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.912600,0.000000,-8.991600>}
box{<0,0,-0.304800><0.182654,0.035000,0.304800> rotate<0,-24.655206,0> translate<11.746600,0.000000,-9.067800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<11.760200,0.000000,-7.555600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<11.912600,0.000000,-7.569200>}
box{<0,0,-0.088900><0.153006,0.035000,0.088900> rotate<0,5.099165,0> translate<11.760200,0.000000,-7.555600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.760200,0.000000,-5.855600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.912600,0.000000,-5.791200>}
box{<0,0,-0.304800><0.165448,0.035000,0.304800> rotate<0,-22.906055,0> translate<11.760200,0.000000,-5.855600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.090400,-1.535000,-34.417000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.090400,-1.535000,-34.950400>}
box{<0,0,-0.406400><0.533400,0.035000,0.406400> rotate<0,-90.000000,0> translate<12.090400,-1.535000,-34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.988800,-1.535000,-34.417000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.090400,-1.535000,-34.417000>}
box{<0,0,-0.406400><0.101600,0.035000,0.406400> rotate<0,0.000000,0> translate<11.988800,-1.535000,-34.417000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.654400,0.000000,-27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.129400,0.000000,-27.305000>}
box{<0,0,-0.406400><1.475000,0.035000,0.406400> rotate<0,0.000000,0> translate<10.654400,0.000000,-27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.268200,0.000000,-20.904200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.268200,0.000000,-22.148800>}
box{<0,0,-0.406400><1.244600,0.035000,0.406400> rotate<0,-90.000000,0> translate<12.268200,0.000000,-22.148800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.089400,0.000000,-15.925800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.446000,0.000000,-15.925800>}
box{<0,0,-0.203200><8.356600,0.035000,0.203200> rotate<0,0.000000,0> translate<4.089400,0.000000,-15.925800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<5.689600,0.000000,-9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<12.446000,0.000000,-2.590800>}
box{<0,0,-0.088900><9.554993,0.035000,0.088900> rotate<0,-44.997030,0> translate<5.689600,0.000000,-9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.912600,0.000000,-5.791200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.801600,0.000000,-5.791200>}
box{<0,0,-0.304800><0.889000,0.035000,0.304800> rotate<0,0.000000,0> translate<11.912600,0.000000,-5.791200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<12.979400,0.000000,-53.619400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<12.979400,0.000000,-57.531000>}
box{<0,0,-0.088900><3.911600,0.035000,0.088900> rotate<0,-90.000000,0> translate<12.979400,0.000000,-57.531000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<11.201400,0.000000,-51.841400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<12.979400,0.000000,-53.619400>}
box{<0,0,-0.088900><2.514472,0.035000,0.088900> rotate<0,44.997030,0> translate<11.201400,0.000000,-51.841400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<12.979400,0.000000,-57.531000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.120000,0.000000,-57.531000>}
box{<0,0,-0.088900><0.140600,0.035000,0.088900> rotate<0,0.000000,0> translate<12.979400,0.000000,-57.531000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.178800,-1.535000,-50.596800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.157200,-1.535000,-45.618400>}
box{<0,0,-0.406400><7.040521,0.035000,0.406400> rotate<0,-44.997030,0> translate<8.178800,-1.535000,-50.596800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.157200,-1.535000,-45.262800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.157200,-1.535000,-45.618400>}
box{<0,0,-0.406400><0.355600,0.035000,0.406400> rotate<0,-90.000000,0> translate<13.157200,-1.535000,-45.618400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.067800,0.000000,-38.506400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.157200,0.000000,-42.595800>}
box{<0,0,-0.406400><5.783285,0.035000,0.406400> rotate<0,44.997030,0> translate<9.067800,0.000000,-38.506400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.801600,0.000000,-5.791200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,0.000000,-5.435600>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<12.801600,0.000000,-5.791200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<12.446000,0.000000,-2.590800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.157200,0.000000,-2.590800>}
box{<0,0,-0.088900><0.711200,0.035000,0.088900> rotate<0,0.000000,0> translate<12.446000,0.000000,-2.590800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.157200,-1.535000,-45.262800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.208000,-1.535000,-45.237400>}
box{<0,0,-0.406400><0.056796,0.035000,0.406400> rotate<0,-26.563298,0> translate<13.157200,-1.535000,-45.262800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.157200,0.000000,-42.595800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.208000,0.000000,-42.697400>}
box{<0,0,-0.406400><0.113592,0.035000,0.406400> rotate<0,63.430762,0> translate<13.157200,0.000000,-42.595800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.208000,0.000000,-40.157400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.335000,0.000000,-40.284400>}
box{<0,0,-0.406400><0.179605,0.035000,0.406400> rotate<0,44.997030,0> translate<13.208000,0.000000,-40.157400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.912600,0.000000,-8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,0.000000,-8.991600>}
box{<0,0,-0.304800><1.422400,0.035000,0.304800> rotate<0,0.000000,0> translate<11.912600,0.000000,-8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<11.772000,0.000000,-12.903200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.512800,0.000000,-12.903200>}
box{<0,0,-0.088900><1.740800,0.035000,0.088900> rotate<0,0.000000,0> translate<11.772000,0.000000,-12.903200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.912600,0.000000,-11.480800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.512800,0.000000,-11.480800>}
box{<0,0,-0.203200><1.600200,0.035000,0.203200> rotate<0,0.000000,0> translate<11.912600,0.000000,-11.480800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.512800,0.000000,-7.569200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.512800,0.000000,-7.747000>}
box{<0,0,-0.088900><0.177800,0.035000,0.088900> rotate<0,-90.000000,0> translate<13.512800,0.000000,-7.747000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<11.912600,0.000000,-7.569200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.512800,0.000000,-7.569200>}
box{<0,0,-0.088900><1.600200,0.035000,0.088900> rotate<0,0.000000,0> translate<11.912600,0.000000,-7.569200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.512800,0.000000,-7.569200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.512800,0.000000,-6.502400>}
box{<0,0,-0.088900><1.066800,0.035000,0.088900> rotate<0,90.000000,0> translate<13.512800,0.000000,-6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.512800,0.000000,-6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.552000,0.000000,-6.420600>}
box{<0,0,-0.088900><0.090708,0.035000,0.088900> rotate<0,-64.391189,0> translate<13.512800,0.000000,-6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,0.000000,-8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.591600,0.000000,-9.078600>}
box{<0,0,-0.304800><0.270948,0.035000,0.304800> rotate<0,18.727946,0> translate<13.335000,0.000000,-8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.512800,0.000000,-7.747000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.591600,0.000000,-7.804000>}
box{<0,0,-0.088900><0.097255,0.035000,0.088900> rotate<0,35.877738,0> translate<13.512800,0.000000,-7.747000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.512800,0.000000,-7.569200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.591600,0.000000,-7.804000>}
box{<0,0,-0.088900><0.247670,0.035000,0.088900> rotate<0,71.443286,0> translate<13.512800,0.000000,-7.569200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.512800,0.000000,-12.903200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.617000,0.000000,-12.878600>}
box{<0,0,-0.088900><0.107064,0.035000,0.088900> rotate<0,-13.282543,0> translate<13.512800,0.000000,-12.903200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.512800,0.000000,-11.480800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.617000,0.000000,-11.629400>}
box{<0,0,-0.203200><0.181493,0.035000,0.203200> rotate<0,54.957800,0> translate<13.512800,0.000000,-11.480800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.268200,0.000000,-20.904200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.690600,0.000000,-19.481800>}
box{<0,0,-0.406400><2.011577,0.035000,0.406400> rotate<0,-44.997030,0> translate<12.268200,0.000000,-20.904200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.356600,0.000000,-17.348200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.690600,0.000000,-17.348200>}
box{<0,0,-0.406400><5.334000,0.035000,0.406400> rotate<0,0.000000,0> translate<8.356600,0.000000,-17.348200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.617000,0.000000,-11.629400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.690600,0.000000,-11.658600>}
box{<0,0,-0.203200><0.079181,0.035000,0.203200> rotate<0,21.638737,0> translate<13.617000,0.000000,-11.629400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.591600,0.000000,-9.078600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.690600,0.000000,-9.169400>}
box{<0,0,-0.304800><0.134334,0.035000,0.304800> rotate<0,42.523361,0> translate<13.591600,0.000000,-9.078600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.690600,0.000000,-19.481800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.755000,0.000000,-19.380200>}
box{<0,0,-0.406400><0.120291,0.035000,0.406400> rotate<0,-57.627292,0> translate<13.690600,0.000000,-19.481800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.829400,0.000000,-27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.868400,0.000000,-27.305000>}
box{<0,0,-0.088900><0.039000,0.035000,0.088900> rotate<0,0.000000,0> translate<13.829400,0.000000,-27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.868400,0.000000,-25.882600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.868400,0.000000,-27.305000>}
box{<0,0,-0.088900><1.422400,0.035000,0.088900> rotate<0,-90.000000,0> translate<13.868400,0.000000,-27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.829400,0.000000,-25.781000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.868400,0.000000,-25.882600>}
box{<0,0,-0.088900><0.108828,0.035000,0.088900> rotate<0,68.995734,0> translate<13.829400,0.000000,-25.781000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.829400,0.000000,-25.781000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.868400,0.000000,-25.704800>}
box{<0,0,-0.088900><0.085600,0.035000,0.088900> rotate<0,-62.891982,0> translate<13.829400,0.000000,-25.781000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.268200,0.000000,-22.148800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.868400,0.000000,-23.749000>}
box{<0,0,-0.406400><2.263025,0.035000,0.406400> rotate<0,44.997030,0> translate<12.268200,0.000000,-22.148800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.690600,0.000000,-11.658600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.224000,0.000000,-11.658600>}
box{<0,0,-0.203200><0.533400,0.035000,0.203200> rotate<0,0.000000,0> translate<13.690600,0.000000,-11.658600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.690600,0.000000,-9.169400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.224000,0.000000,-9.169400>}
box{<0,0,-0.304800><0.533400,0.035000,0.304800> rotate<0,0.000000,0> translate<13.690600,0.000000,-9.169400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,0.000000,-5.435600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.224000,0.000000,-5.435600>}
box{<0,0,-0.304800><1.066800,0.035000,0.304800> rotate<0,0.000000,0> translate<13.157200,0.000000,-5.435600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.157200,0.000000,-2.590800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<14.401800,0.000000,-3.835400>}
box{<0,0,-0.088900><1.760130,0.035000,0.088900> rotate<0,44.997030,0> translate<13.157200,0.000000,-2.590800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.690600,0.000000,-17.348200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.490700,0.000000,-18.148300>}
box{<0,0,-0.406400><1.131512,0.035000,0.406400> rotate<0,44.997030,0> translate<13.690600,0.000000,-17.348200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<14.401800,0.000000,-3.835400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<14.502000,0.000000,-3.970600>}
box{<0,0,-0.088900><0.168283,0.035000,0.088900> rotate<0,53.453431,0> translate<14.401800,0.000000,-3.835400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.245600,-1.535000,-24.104600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.579600,-1.535000,-29.438600>}
box{<0,0,-0.406400><7.543415,0.035000,0.406400> rotate<0,44.997030,0> translate<9.245600,-1.535000,-24.104600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.490700,0.000000,-18.148300>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.757400,0.000000,-17.881600>}
box{<0,0,-0.406400><0.377171,0.035000,0.406400> rotate<0,-44.997030,0> translate<14.490700,0.000000,-18.148300> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.884400,0.000000,-52.869200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.935200,0.000000,-52.908200>}
box{<0,0,-0.406400><0.064044,0.035000,0.406400> rotate<0,37.511570,0> translate<14.884400,0.000000,-52.869200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.935200,0.000000,-29.438600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.935200,0.000000,-32.639000>}
box{<0,0,-0.406400><3.200400,0.035000,0.406400> rotate<0,-90.000000,0> translate<14.935200,0.000000,-32.639000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.579600,-1.535000,-29.438600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.935200,-1.535000,-29.438600>}
box{<0,0,-0.406400><0.355600,0.035000,0.406400> rotate<0,0.000000,0> translate<14.579600,-1.535000,-29.438600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.446000,0.000000,-15.925800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.935200,0.000000,-13.436600>}
box{<0,0,-0.203200><3.520260,0.035000,0.203200> rotate<0,-44.997030,0> translate<12.446000,0.000000,-15.925800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.935200,0.000000,-12.369800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.935200,0.000000,-13.436600>}
box{<0,0,-0.203200><1.066800,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.935200,0.000000,-13.436600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.224000,0.000000,-11.658600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.935200,0.000000,-12.369800>}
box{<0,0,-0.203200><1.005789,0.035000,0.203200> rotate<0,44.997030,0> translate<14.224000,0.000000,-11.658600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.224000,0.000000,-5.435600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.935200,0.000000,-6.146800>}
box{<0,0,-0.304800><1.005789,0.035000,0.304800> rotate<0,44.997030,0> translate<14.224000,0.000000,-5.435600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<13.868400,0.000000,-25.704800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<15.113000,0.000000,-25.704800>}
box{<0,0,-0.088900><1.244600,0.035000,0.088900> rotate<0,0.000000,0> translate<13.868400,0.000000,-25.704800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<15.113000,0.000000,-25.704800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<15.279000,0.000000,-25.781000>}
box{<0,0,-0.088900><0.182654,0.035000,0.088900> rotate<0,24.655206,0> translate<15.113000,0.000000,-25.704800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.490700,0.000000,-18.148300>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.290800,0.000000,-18.948400>}
box{<0,0,-0.406400><1.131512,0.035000,0.406400> rotate<0,44.997030,0> translate<14.490700,0.000000,-18.148300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.935200,0.000000,-6.146800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.290800,0.000000,-6.146800>}
box{<0,0,-0.304800><0.355600,0.035000,0.304800> rotate<0,0.000000,0> translate<14.935200,0.000000,-6.146800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.290800,0.000000,-6.146800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.452000,0.000000,-6.420600>}
box{<0,0,-0.304800><0.317729,0.035000,0.304800> rotate<0,59.508584,0> translate<15.290800,0.000000,-6.146800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.290800,0.000000,-18.948400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.455000,0.000000,-19.380200>}
box{<0,0,-0.406400><0.461966,0.035000,0.406400> rotate<0,69.175195,0> translate<15.290800,0.000000,-18.948400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.455000,0.000000,-19.380200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.468600,0.000000,-19.304000>}
box{<0,0,-0.406400><0.077404,0.035000,0.406400> rotate<0,-79.875261,0> translate<15.455000,0.000000,-19.380200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.224000,0.000000,-9.169400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.468600,0.000000,-7.924800>}
box{<0,0,-0.304800><1.760130,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.224000,0.000000,-9.169400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.452000,0.000000,-6.420600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.468600,0.000000,-6.502400>}
box{<0,0,-0.304800><0.083467,0.035000,0.304800> rotate<0,78.523337,0> translate<15.452000,0.000000,-6.420600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.935200,0.000000,-52.908200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.646400,0.000000,-52.908200>}
box{<0,0,-0.406400><0.711200,0.035000,0.406400> rotate<0,0.000000,0> translate<14.935200,0.000000,-52.908200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.646400,0.000000,-52.908200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.824200,0.000000,-52.552600>}
box{<0,0,-0.406400><0.397573,0.035000,0.406400> rotate<0,-63.430762,0> translate<15.646400,0.000000,-52.908200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.468600,0.000000,-7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.824200,0.000000,-7.569200>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<15.468600,0.000000,-7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.468600,0.000000,-6.502400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.824200,0.000000,-6.858000>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<15.468600,0.000000,-6.502400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.824200,0.000000,-7.569200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.824200,0.000000,-6.858000>}
box{<0,0,-0.304800><0.711200,0.035000,0.304800> rotate<0,90.000000,0> translate<15.824200,0.000000,-6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<14.820000,0.000000,-57.531000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<16.002000,0.000000,-57.531000>}
box{<0,0,-0.088900><1.182000,0.035000,0.088900> rotate<0,0.000000,0> translate<14.820000,0.000000,-57.531000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<16.002000,0.000000,-57.531000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<16.002000,0.000000,-56.108600>}
box{<0,0,-0.088900><1.422400,0.035000,0.088900> rotate<0,90.000000,0> translate<16.002000,0.000000,-56.108600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.646400,0.000000,-52.908200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.002000,0.000000,-53.263800>}
box{<0,0,-0.406400><0.502894,0.035000,0.406400> rotate<0,44.997030,0> translate<15.646400,0.000000,-52.908200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.468600,0.000000,-7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.002000,0.000000,-8.458200>}
box{<0,0,-0.304800><0.754342,0.035000,0.304800> rotate<0,44.997030,0> translate<15.468600,0.000000,-7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.002000,0.000000,-11.303000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.002000,0.000000,-8.458200>}
box{<0,0,-0.304800><2.844800,0.035000,0.304800> rotate<0,90.000000,0> translate<16.002000,0.000000,-8.458200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<16.002000,0.000000,-56.108600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<16.068000,0.000000,-56.037000>}
box{<0,0,-0.088900><0.097378,0.035000,0.088900> rotate<0,-47.327395,0> translate<16.002000,0.000000,-56.108600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.002000,0.000000,-53.263800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.068000,0.000000,-53.437000>}
box{<0,0,-0.406400><0.185349,0.035000,0.406400> rotate<0,69.135477,0> translate<16.002000,0.000000,-53.263800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<16.002000,0.000000,-57.531000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<16.168000,0.000000,-57.531000>}
box{<0,0,-0.088900><0.166000,0.035000,0.088900> rotate<0,0.000000,0> translate<16.002000,0.000000,-57.531000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.824200,0.000000,-52.552600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.357600,0.000000,-52.019200>}
box{<0,0,-0.406400><0.754342,0.035000,0.406400> rotate<0,-44.997030,0> translate<15.824200,0.000000,-52.552600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.357600,-1.535000,-45.440600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.357600,-1.535000,-52.019200>}
box{<0,0,-0.406400><6.578600,0.035000,0.406400> rotate<0,-90.000000,0> translate<16.357600,-1.535000,-52.019200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.468600,0.000000,-19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.713200,0.000000,-19.304000>}
box{<0,0,-0.406400><1.244600,0.035000,0.406400> rotate<0,0.000000,0> translate<15.468600,0.000000,-19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.713200,0.000000,-19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.803000,0.000000,-19.380200>}
box{<0,0,-0.406400><0.117773,0.035000,0.406400> rotate<0,40.313688,0> translate<16.713200,0.000000,-19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.289800,-1.535000,-26.238200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.891000,-1.535000,-35.839400>}
box{<0,0,-0.406400><13.578147,0.035000,0.406400> rotate<0,44.997030,0> translate<7.289800,-1.535000,-26.238200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.803000,0.000000,-19.380200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.891000,0.000000,-18.948400>}
box{<0,0,-0.406400><0.440676,0.035000,0.406400> rotate<0,-78.475799,0> translate<16.803000,0.000000,-19.380200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.803000,0.000000,-18.084800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.891000,0.000000,-18.237200>}
box{<0,0,-0.406400><0.175982,0.035000,0.406400> rotate<0,59.992708,0> translate<16.803000,0.000000,-18.084800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.891000,0.000000,-18.948400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.891000,0.000000,-18.237200>}
box{<0,0,-0.406400><0.711200,0.035000,0.406400> rotate<0,90.000000,0> translate<16.891000,0.000000,-18.237200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<16.979000,0.000000,-27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<17.068800,0.000000,-27.305000>}
box{<0,0,-0.088900><0.089800,0.035000,0.088900> rotate<0,0.000000,0> translate<16.979000,0.000000,-27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<16.979000,0.000000,-25.781000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<17.068800,0.000000,-25.882600>}
box{<0,0,-0.088900><0.135597,0.035000,0.088900> rotate<0,48.524674,0> translate<16.979000,0.000000,-25.781000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<17.068800,0.000000,-27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<17.068800,0.000000,-25.882600>}
box{<0,0,-0.088900><1.422400,0.035000,0.088900> rotate<0,90.000000,0> translate<17.068800,0.000000,-25.882600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.729200,0.000000,-49.518200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.780000,0.000000,-49.530000>}
box{<0,0,-0.406400><0.052152,0.035000,0.406400> rotate<0,13.076099,0> translate<17.729200,0.000000,-49.518200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.868400,0.000000,-23.749000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.957800,0.000000,-23.749000>}
box{<0,0,-0.406400><4.089400,0.035000,0.406400> rotate<0,0.000000,0> translate<13.868400,0.000000,-23.749000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.868000,0.000000,-57.531000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.135600,0.000000,-57.353200>}
box{<0,0,-0.304800><0.321283,0.035000,0.304800> rotate<0,-33.598820,0> translate<17.868000,0.000000,-57.531000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.135600,0.000000,-56.108600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.135600,0.000000,-57.353200>}
box{<0,0,-0.304800><1.244600,0.035000,0.304800> rotate<0,-90.000000,0> translate<18.135600,0.000000,-57.353200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.968000,0.000000,-56.037000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.135600,0.000000,-56.108600>}
box{<0,0,-0.304800><0.182253,0.035000,0.304800> rotate<0,23.131017,0> translate<17.968000,0.000000,-56.037000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<17.968000,0.000000,-53.437000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.135600,0.000000,-53.441600>}
box{<0,0,-0.088900><0.167663,0.035000,0.088900> rotate<0,1.572059,0> translate<17.968000,0.000000,-53.437000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.357600,-1.535000,-45.440600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.135600,-1.535000,-43.662600>}
box{<0,0,-0.406400><2.514472,0.035000,0.406400> rotate<0,-44.997030,0> translate<16.357600,-1.535000,-45.440600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.135600,-1.535000,-40.995600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.135600,-1.535000,-43.662600>}
box{<0,0,-0.406400><2.667000,0.035000,0.406400> rotate<0,-90.000000,0> translate<18.135600,-1.535000,-43.662600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.090400,-1.535000,-34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.135600,-1.535000,-40.995600>}
box{<0,0,-0.406400><8.549204,0.035000,0.406400> rotate<0,44.997030,0> translate<12.090400,-1.535000,-34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<17.960800,0.000000,-21.310600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.135600,0.000000,-21.259800>}
box{<0,0,-0.088900><0.182032,0.035000,0.088900> rotate<0,-16.203738,0> translate<17.960800,0.000000,-21.310600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.135600,0.000000,-19.837400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.135600,0.000000,-21.259800>}
box{<0,0,-0.088900><1.422400,0.035000,0.088900> rotate<0,-90.000000,0> translate<18.135600,0.000000,-21.259800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<17.068800,0.000000,-27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.479400,0.000000,-27.305000>}
box{<0,0,-0.088900><1.410600,0.035000,0.088900> rotate<0,0.000000,0> translate<17.068800,0.000000,-27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.135600,0.000000,-19.837400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.491200,0.000000,-19.481800>}
box{<0,0,-0.088900><0.502894,0.035000,0.088900> rotate<0,-44.997030,0> translate<18.135600,0.000000,-19.837400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.491200,0.000000,-19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.491200,0.000000,-18.237200>}
box{<0,0,-0.088900><1.066800,0.035000,0.088900> rotate<0,90.000000,0> translate<18.491200,0.000000,-18.237200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.491200,0.000000,-18.059400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.491200,0.000000,-16.814800>}
box{<0,0,-0.088900><1.244600,0.035000,0.088900> rotate<0,90.000000,0> translate<18.491200,0.000000,-16.814800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.491200,0.000000,-19.481800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.503000,0.000000,-19.380200>}
box{<0,0,-0.088900><0.102283,0.035000,0.088900> rotate<0,-83.369747,0> translate<18.491200,0.000000,-19.481800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.491200,0.000000,-19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.503000,0.000000,-19.380200>}
box{<0,0,-0.088900><0.077108,0.035000,0.088900> rotate<0,81.191985,0> translate<18.491200,0.000000,-19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.491200,0.000000,-18.237200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.503000,0.000000,-18.084800>}
box{<0,0,-0.088900><0.152856,0.035000,0.088900> rotate<0,-85.566899,0> translate<18.491200,0.000000,-18.237200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.491200,0.000000,-18.059400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.503000,0.000000,-18.084800>}
box{<0,0,-0.088900><0.028007,0.035000,0.088900> rotate<0,65.077682,0> translate<18.491200,0.000000,-18.059400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.491200,0.000000,-16.814800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.503000,0.000000,-16.814800>}
box{<0,0,-0.088900><0.011800,0.035000,0.088900> rotate<0,0.000000,0> translate<18.491200,0.000000,-16.814800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.135600,0.000000,-56.108600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.669000,0.000000,-55.575200>}
box{<0,0,-0.304800><0.754342,0.035000,0.304800> rotate<0,-44.997030,0> translate<18.135600,0.000000,-56.108600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.503000,0.000000,-19.380200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.669000,0.000000,-19.304000>}
box{<0,0,-0.088900><0.182654,0.035000,0.088900> rotate<0,-24.655206,0> translate<18.503000,0.000000,-19.380200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.669000,0.000000,-55.575200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.024600,0.000000,-55.575200>}
box{<0,0,-0.304800><0.355600,0.035000,0.304800> rotate<0,0.000000,0> translate<18.669000,0.000000,-55.575200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.423400,-1.535000,-55.397400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.024600,-1.535000,-55.397400>}
box{<0,0,-0.304800><9.601200,0.035000,0.304800> rotate<0,0.000000,0> translate<9.423400,-1.535000,-55.397400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.024600,0.000000,-55.575200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.024600,0.000000,-55.397400>}
box{<0,0,-0.304800><0.177800,0.035000,0.304800> rotate<0,90.000000,0> translate<19.024600,0.000000,-55.397400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.868000,0.000000,-57.531000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.216000,0.000000,-57.531000>}
box{<0,0,-0.304800><1.348000,0.035000,0.304800> rotate<0,0.000000,0> translate<17.868000,0.000000,-57.531000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.135600,0.000000,-53.441600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<19.558000,0.000000,-53.441600>}
box{<0,0,-0.088900><1.422400,0.035000,0.088900> rotate<0,0.000000,0> translate<18.135600,0.000000,-53.441600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.780000,0.000000,-49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.558000,0.000000,-49.530000>}
box{<0,0,-0.406400><1.778000,0.035000,0.406400> rotate<0,0.000000,0> translate<17.780000,0.000000,-49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<19.558000,0.000000,-53.441600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<19.583400,0.000000,-53.436600>}
box{<0,0,-0.088900><0.025887,0.035000,0.088900> rotate<0,-11.135574,0> translate<19.558000,0.000000,-53.441600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.558000,0.000000,-49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.583400,0.000000,-49.636600>}
box{<0,0,-0.406400><0.109584,0.035000,0.406400> rotate<0,76.592759,0> translate<19.558000,0.000000,-49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<19.583400,0.000000,-53.436600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<19.735800,0.000000,-53.263800>}
box{<0,0,-0.088900><0.230403,0.035000,0.088900> rotate<0,-48.586290,0> translate<19.583400,0.000000,-53.436600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<18.669000,0.000000,-19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<19.735800,0.000000,-19.304000>}
box{<0,0,-0.088900><1.066800,0.035000,0.088900> rotate<0,0.000000,0> translate<18.669000,0.000000,-19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<19.735800,0.000000,-19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<19.782000,0.000000,-19.354800>}
box{<0,0,-0.088900><0.068666,0.035000,0.088900> rotate<0,47.711936,0> translate<19.735800,0.000000,-19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.583400,0.000000,-49.636600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.913600,0.000000,-49.707800>}
box{<0,0,-0.406400><0.337789,0.035000,0.406400> rotate<0,12.167404,0> translate<19.583400,0.000000,-49.636600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.782000,0.000000,-20.304800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.913600,0.000000,-20.370800>}
box{<0,0,-0.304800><0.147223,0.035000,0.304800> rotate<0,26.632912,0> translate<19.782000,0.000000,-20.304800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.335000,0.000000,-40.284400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.091400,0.000000,-40.284400>}
box{<0,0,-0.406400><6.756400,0.035000,0.406400> rotate<0,0.000000,0> translate<13.335000,0.000000,-40.284400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.179400,0.000000,-27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.269200,0.000000,-27.305000>}
box{<0,0,-0.406400><0.089800,0.035000,0.406400> rotate<0,0.000000,0> translate<20.179400,0.000000,-27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.269200,0.000000,-26.060400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.269200,0.000000,-27.305000>}
box{<0,0,-0.406400><1.244600,0.035000,0.406400> rotate<0,-90.000000,0> translate<20.269200,0.000000,-27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.957800,0.000000,-23.749000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.269200,0.000000,-26.060400>}
box{<0,0,-0.406400><3.268813,0.035000,0.406400> rotate<0,44.997030,0> translate<17.957800,0.000000,-23.749000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.913600,0.000000,-20.370800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.269200,0.000000,-20.726400>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,44.997030,0> translate<19.913600,0.000000,-20.370800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.748000,0.000000,-42.697400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.624800,0.000000,-47.574200>}
box{<0,0,-0.406400><6.896837,0.035000,0.406400> rotate<0,44.997030,0> translate<15.748000,0.000000,-42.697400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.336000,0.000000,-19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.336000,0.000000,-18.948400>}
box{<0,0,-0.304800><0.711200,0.035000,0.304800> rotate<0,90.000000,0> translate<21.336000,0.000000,-18.948400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.002000,0.000000,-11.303000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.336000,0.000000,-16.637000>}
box{<0,0,-0.304800><7.543415,0.035000,0.304800> rotate<0,44.997030,0> translate<16.002000,0.000000,-11.303000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<19.735800,0.000000,-53.263800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<21.513800,0.000000,-53.263800>}
box{<0,0,-0.088900><1.778000,0.035000,0.088900> rotate<0,0.000000,0> translate<19.735800,0.000000,-53.263800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.624800,0.000000,-47.574200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.513800,0.000000,-47.574200>}
box{<0,0,-0.406400><0.889000,0.035000,0.406400> rotate<0,0.000000,0> translate<20.624800,0.000000,-47.574200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<21.513800,0.000000,-53.263800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<21.637800,0.000000,-53.292200>}
box{<0,0,-0.088900><0.127211,0.035000,0.088900> rotate<0,12.899240,0> translate<21.513800,0.000000,-53.263800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.336000,0.000000,-18.948400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.691600,0.000000,-18.592800>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.336000,0.000000,-18.948400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.913600,0.000000,-49.707800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.869400,0.000000,-47.752000>}
box{<0,0,-0.406400><2.765919,0.035000,0.406400> rotate<0,-44.997030,0> translate<19.913600,0.000000,-49.707800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.513800,0.000000,-47.574200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.869400,0.000000,-47.752000>}
box{<0,0,-0.406400><0.397573,0.035000,0.406400> rotate<0,26.563298,0> translate<21.513800,0.000000,-47.574200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.269200,0.000000,-20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.869400,0.000000,-20.726400>}
box{<0,0,-0.304800><1.600200,0.035000,0.304800> rotate<0,0.000000,0> translate<20.269200,0.000000,-20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.336000,0.000000,-19.659600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.047200,0.000000,-20.370800>}
box{<0,0,-0.304800><1.005789,0.035000,0.304800> rotate<0,44.997030,0> translate<21.336000,0.000000,-19.659600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.691600,0.000000,-18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.047200,0.000000,-18.592800>}
box{<0,0,-0.304800><0.355600,0.035000,0.304800> rotate<0,0.000000,0> translate<21.691600,0.000000,-18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.336000,0.000000,-16.637000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.047200,0.000000,-17.348200>}
box{<0,0,-0.304800><1.005789,0.035000,0.304800> rotate<0,44.997030,0> translate<21.336000,0.000000,-16.637000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.047200,0.000000,-18.237200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.047200,0.000000,-17.348200>}
box{<0,0,-0.304800><0.889000,0.035000,0.304800> rotate<0,90.000000,0> translate<22.047200,0.000000,-17.348200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.869400,0.000000,-20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.225000,0.000000,-20.370800>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.869400,0.000000,-20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.047200,0.000000,-18.592800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.225000,0.000000,-18.415000>}
box{<0,0,-0.304800><0.251447,0.035000,0.304800> rotate<0,-44.997030,0> translate<22.047200,0.000000,-18.592800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.047200,0.000000,-20.370800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.382000,0.000000,-20.304800>}
box{<0,0,-0.304800><0.341243,0.035000,0.304800> rotate<0,-11.151140,0> translate<22.047200,0.000000,-20.370800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.225000,0.000000,-20.370800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.382000,0.000000,-20.304800>}
box{<0,0,-0.304800><0.170309,0.035000,0.304800> rotate<0,-22.799512,0> translate<22.225000,0.000000,-20.370800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.047200,0.000000,-18.237200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.382000,0.000000,-18.404800>}
box{<0,0,-0.304800><0.374407,0.035000,0.304800> rotate<0,26.590671,0> translate<22.047200,0.000000,-18.237200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.225000,0.000000,-18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.382000,0.000000,-18.404800>}
box{<0,0,-0.304800><0.157331,0.035000,0.304800> rotate<0,-3.716932,0> translate<22.225000,0.000000,-18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.024600,0.000000,-55.575200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.402800,0.000000,-55.575200>}
box{<0,0,-0.304800><3.378200,0.035000,0.304800> rotate<0,0.000000,0> translate<19.024600,0.000000,-55.575200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<22.382000,0.000000,-19.354800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<22.402800,0.000000,-19.481800>}
box{<0,0,-0.088900><0.128692,0.035000,0.088900> rotate<0,80.693377,0> translate<22.382000,0.000000,-19.354800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.402800,0.000000,-55.575200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.003000,0.000000,-53.975000>}
box{<0,0,-0.304800><2.263025,0.035000,0.304800> rotate<0,-44.997030,0> translate<22.402800,0.000000,-55.575200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.003000,0.000000,-53.975000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.358600,0.000000,-53.619400>}
box{<0,0,-0.304800><0.502894,0.035000,0.304800> rotate<0,-44.997030,0> translate<24.003000,0.000000,-53.975000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.358600,0.000000,-53.619400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.358600,0.000000,-50.596800>}
box{<0,0,-0.304800><3.022600,0.035000,0.304800> rotate<0,90.000000,0> translate<24.358600,0.000000,-50.596800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.358600,0.000000,-50.596800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.437800,0.000000,-50.492200>}
box{<0,0,-0.304800><0.131201,0.035000,0.304800> rotate<0,-52.864592,0> translate<24.358600,0.000000,-50.596800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.869400,0.000000,-47.752000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.892000,0.000000,-47.752000>}
box{<0,0,-0.406400><3.022600,0.035000,0.406400> rotate<0,0.000000,0> translate<21.869400,0.000000,-47.752000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<22.402800,0.000000,-19.481800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<25.603200,0.000000,-19.481800>}
box{<0,0,-0.088900><3.200400,0.035000,0.088900> rotate<0,0.000000,0> translate<22.402800,0.000000,-19.481800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.757400,-1.535000,-17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.136600,-1.535000,-17.881600>}
box{<0,0,-0.406400><11.379200,0.035000,0.406400> rotate<0,0.000000,0> translate<14.757400,-1.535000,-17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.892000,0.000000,-47.752000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.492200,0.000000,-49.352200>}
box{<0,0,-0.406400><2.263025,0.035000,0.406400> rotate<0,44.997030,0> translate<24.892000,0.000000,-47.752000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<26.492200,0.000000,-40.106600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<26.492200,0.000000,-42.418000>}
box{<0,0,-0.088900><2.311400,0.035000,0.088900> rotate<0,-90.000000,0> translate<26.492200,0.000000,-42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.492200,0.000000,-49.352200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.619200,0.000000,-49.357200>}
box{<0,0,-0.406400><0.127098,0.035000,0.406400> rotate<0,2.254426,0> translate<26.492200,0.000000,-49.352200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.935200,0.000000,-32.639000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,0.000000,-44.373800>}
box{<0,0,-0.406400><16.595513,0.035000,0.406400> rotate<0,44.997030,0> translate<14.935200,0.000000,-32.639000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<26.492200,0.000000,-42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<26.847800,0.000000,-42.773600>}
box{<0,0,-0.088900><0.502894,0.035000,0.088900> rotate<0,44.997030,0> translate<26.492200,0.000000,-42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<26.847800,0.000000,-42.773600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.025600,0.000000,-42.773600>}
box{<0,0,-0.088900><0.177800,0.035000,0.088900> rotate<0,0.000000,0> translate<26.847800,0.000000,-42.773600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<25.603200,0.000000,-19.481800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.025600,0.000000,-18.059400>}
box{<0,0,-0.088900><2.011577,0.035000,0.088900> rotate<0,-44.997030,0> translate<25.603200,0.000000,-19.481800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.025600,0.000000,-18.059400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.062400,0.000000,-18.128800>}
box{<0,0,-0.088900><0.078553,0.035000,0.088900> rotate<0,62.060714,0> translate<27.025600,0.000000,-18.059400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.670000,0.000000,-44.373800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.203400,0.000000,-44.373800>}
box{<0,0,-0.406400><0.533400,0.035000,0.406400> rotate<0,0.000000,0> translate<26.670000,0.000000,-44.373800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.025600,0.000000,-42.773600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.381200,0.000000,-43.129200>}
box{<0,0,-0.088900><0.502894,0.035000,0.088900> rotate<0,44.997030,0> translate<27.025600,0.000000,-42.773600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<26.492200,0.000000,-40.106600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.381200,0.000000,-39.217600>}
box{<0,0,-0.088900><1.257236,0.035000,0.088900> rotate<0,-44.997030,0> translate<26.492200,0.000000,-40.106600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.318600,0.000000,-34.569400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.381200,0.000000,-34.594800>}
box{<0,0,-0.406400><0.067557,0.035000,0.406400> rotate<0,22.083436,0> translate<27.318600,0.000000,-34.569400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.381200,0.000000,-34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.381200,0.000000,-34.594800>}
box{<0,0,-0.406400><0.355600,0.035000,0.406400> rotate<0,90.000000,0> translate<27.381200,0.000000,-34.594800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.318600,0.000000,-29.108400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.381200,0.000000,-29.083000>}
box{<0,0,-0.088900><0.067557,0.035000,0.088900> rotate<0,-22.083436,0> translate<27.318600,0.000000,-29.108400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.381200,0.000000,-27.838400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.381200,0.000000,-29.083000>}
box{<0,0,-0.088900><1.244600,0.035000,0.088900> rotate<0,-90.000000,0> translate<27.381200,0.000000,-29.083000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.318600,0.000000,-27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.381200,0.000000,-27.838400>}
box{<0,0,-0.088900><0.119337,0.035000,0.088900> rotate<0,58.357193,0> translate<27.318600,0.000000,-27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.336000,0.000000,-16.637000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.381200,0.000000,-10.591800>}
box{<0,0,-0.304800><8.549204,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.336000,0.000000,-16.637000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.203400,0.000000,-44.373800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.471000,0.000000,-44.475400>}
box{<0,0,-0.406400><0.286238,0.035000,0.406400> rotate<0,20.788953,0> translate<27.203400,0.000000,-44.373800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.381200,0.000000,-43.129200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.471000,0.000000,-43.154600>}
box{<0,0,-0.088900><0.093323,0.035000,0.088900> rotate<0,15.792555,0> translate<27.381200,0.000000,-43.129200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.381200,0.000000,-39.217600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.471000,0.000000,-39.268400>}
box{<0,0,-0.088900><0.103173,0.035000,0.088900> rotate<0,29.494962,0> translate<27.381200,0.000000,-39.217600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.471000,0.000000,-45.745400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.559000,0.000000,-45.618400>}
box{<0,0,-0.406400><0.154509,0.035000,0.406400> rotate<0,-55.277745,0> translate<27.471000,0.000000,-45.745400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.559000,0.000000,-44.551600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.559000,0.000000,-45.618400>}
box{<0,0,-0.406400><1.066800,0.035000,0.406400> rotate<0,-90.000000,0> translate<27.559000,0.000000,-45.618400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.471000,0.000000,-44.475400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.559000,0.000000,-44.551600>}
box{<0,0,-0.406400><0.116406,0.035000,0.406400> rotate<0,40.886888,0> translate<27.471000,0.000000,-44.475400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.471000,0.000000,-41.884600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.559000,0.000000,-41.884600>}
box{<0,0,-0.088900><0.088000,0.035000,0.088900> rotate<0,0.000000,0> translate<27.471000,0.000000,-41.884600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.559000,0.000000,-40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.559000,0.000000,-41.884600>}
box{<0,0,-0.088900><1.244600,0.035000,0.088900> rotate<0,-90.000000,0> translate<27.559000,0.000000,-41.884600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.471000,0.000000,-40.589200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<27.559000,0.000000,-40.640000>}
box{<0,0,-0.088900><0.101610,0.035000,0.088900> rotate<0,29.994688,0> translate<27.471000,0.000000,-40.589200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.891000,-1.535000,-35.839400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.092400,-1.535000,-35.839400>}
box{<0,0,-0.406400><11.201400,0.035000,0.406400> rotate<0,0.000000,0> translate<16.891000,-1.535000,-35.839400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.092400,0.000000,-35.661600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.092400,0.000000,-35.839400>}
box{<0,0,-0.406400><0.177800,0.035000,0.406400> rotate<0,-90.000000,0> translate<28.092400,0.000000,-35.839400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.381200,0.000000,-34.950400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.092400,0.000000,-35.661600>}
box{<0,0,-0.406400><1.005789,0.035000,0.406400> rotate<0,44.997030,0> translate<27.381200,0.000000,-34.950400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.003000,0.000000,-53.975000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.448000,0.000000,-58.420000>}
box{<0,0,-0.304800><6.286179,0.035000,0.304800> rotate<0,44.997030,0> translate<24.003000,0.000000,-53.975000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.625800,0.000000,-12.725400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.752800,0.000000,-12.654200>}
box{<0,0,-0.406400><0.145597,0.035000,0.406400> rotate<0,-29.274362,0> translate<28.625800,0.000000,-12.725400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<28.752800,0.000000,-16.454200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<28.803600,0.000000,-16.459200>}
box{<0,0,-0.088900><0.051045,0.035000,0.088900> rotate<0,5.620872,0> translate<28.752800,0.000000,-16.454200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<28.803600,0.000000,-18.059400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<28.803600,0.000000,-16.459200>}
box{<0,0,-0.088900><1.600200,0.035000,0.088900> rotate<0,90.000000,0> translate<28.803600,0.000000,-16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<28.803600,0.000000,-18.059400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<28.962400,0.000000,-18.128800>}
box{<0,0,-0.088900><0.173303,0.035000,0.088900> rotate<0,23.605103,0> translate<28.803600,0.000000,-18.059400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<28.962400,0.000000,-18.128800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<28.981400,0.000000,-18.059400>}
box{<0,0,-0.088900><0.071954,0.035000,0.088900> rotate<0,-74.684081,0> translate<28.962400,0.000000,-18.128800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-40.462200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-39.395400>}
box{<0,0,-0.088900><1.066800,0.035000,0.088900> rotate<0,90.000000,0> translate<29.159200,0.000000,-39.395400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-39.217600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-38.150800>}
box{<0,0,-0.088900><1.066800,0.035000,0.088900> rotate<0,90.000000,0> translate<29.159200,0.000000,-38.150800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.018600,0.000000,-34.569400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-34.417000>}
box{<0,0,-0.088900><0.207350,0.035000,0.088900> rotate<0,-47.303107,0> translate<29.018600,0.000000,-34.569400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-33.350200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-34.417000>}
box{<0,0,-0.088900><1.066800,0.035000,0.088900> rotate<0,-90.000000,0> translate<29.159200,0.000000,-34.417000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.018600,0.000000,-33.197800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-33.350200>}
box{<0,0,-0.088900><0.207350,0.035000,0.088900> rotate<0,47.303107,0> translate<29.018600,0.000000,-33.197800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.018600,0.000000,-33.197800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-33.172400>}
box{<0,0,-0.088900><0.142876,0.035000,0.088900> rotate<0,-10.239608,0> translate<29.018600,0.000000,-33.197800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-31.927800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-33.172400>}
box{<0,0,-0.088900><1.244600,0.035000,0.088900> rotate<0,-90.000000,0> translate<29.159200,0.000000,-33.172400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.018600,0.000000,-31.800800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-31.927800>}
box{<0,0,-0.088900><0.189466,0.035000,0.088900> rotate<0,42.087832,0> translate<29.018600,0.000000,-31.800800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.018600,0.000000,-31.800800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-31.750000>}
box{<0,0,-0.088900><0.149496,0.035000,0.088900> rotate<0,-19.863917,0> translate<29.018600,0.000000,-31.800800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-30.683200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-31.750000>}
box{<0,0,-0.088900><1.066800,0.035000,0.088900> rotate<0,-90.000000,0> translate<29.159200,0.000000,-31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.018600,0.000000,-30.429200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-30.683200>}
box{<0,0,-0.088900><0.290318,0.035000,0.088900> rotate<0,61.029545,0> translate<29.018600,0.000000,-30.429200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-30.505400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-30.683200>}
box{<0,0,-0.088900><0.177800,0.035000,0.088900> rotate<0,-90.000000,0> translate<29.159200,0.000000,-30.683200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.018600,0.000000,-30.429200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-30.505400>}
box{<0,0,-0.088900><0.159921,0.035000,0.088900> rotate<0,28.454177,0> translate<29.018600,0.000000,-30.429200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.018600,0.000000,-30.429200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-30.327600>}
box{<0,0,-0.088900><0.173467,0.035000,0.088900> rotate<0,-35.850163,0> translate<29.018600,0.000000,-30.429200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.018600,0.000000,-29.108400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-29.260800>}
box{<0,0,-0.088900><0.207350,0.035000,0.088900> rotate<0,47.303107,0> translate<29.018600,0.000000,-29.108400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-30.327600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-29.260800>}
box{<0,0,-0.088900><1.066800,0.035000,0.088900> rotate<0,90.000000,0> translate<29.159200,0.000000,-29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.018600,0.000000,-27.736800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-27.660600>}
box{<0,0,-0.088900><0.159921,0.035000,0.088900> rotate<0,-28.454177,0> translate<29.018600,0.000000,-27.736800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.018600,0.000000,-26.416000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-26.416000>}
box{<0,0,-0.088900><0.140600,0.035000,0.088900> rotate<0,0.000000,0> translate<29.018600,0.000000,-26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-27.660600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-26.416000>}
box{<0,0,-0.088900><1.244600,0.035000,0.088900> rotate<0,90.000000,0> translate<29.159200,0.000000,-26.416000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-40.462200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.171000,0.000000,-40.589200>}
box{<0,0,-0.088900><0.127547,0.035000,0.088900> rotate<0,84.686106,0> translate<29.159200,0.000000,-40.462200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-39.395400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.171000,0.000000,-39.268400>}
box{<0,0,-0.088900><0.127547,0.035000,0.088900> rotate<0,-84.686106,0> translate<29.159200,0.000000,-39.395400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-39.217600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.171000,0.000000,-39.268400>}
box{<0,0,-0.088900><0.052152,0.035000,0.088900> rotate<0,76.917961,0> translate<29.159200,0.000000,-39.217600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-38.150800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.171000,0.000000,-37.998400>}
box{<0,0,-0.088900><0.152856,0.035000,0.088900> rotate<0,-85.566899,0> translate<29.159200,0.000000,-38.150800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.091400,0.000000,-40.284400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.337000,0.000000,-49.530000>}
box{<0,0,-0.406400><13.075253,0.035000,0.406400> rotate<0,44.997030,0> translate<20.091400,0.000000,-40.284400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.171000,0.000000,-44.475400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.337000,0.000000,-44.551600>}
box{<0,0,-0.088900><0.182654,0.035000,0.088900> rotate<0,24.655206,0> translate<29.171000,0.000000,-44.475400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.171000,0.000000,-43.154600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.337000,0.000000,-43.307000>}
box{<0,0,-0.088900><0.225348,0.035000,0.088900> rotate<0,42.551371,0> translate<29.171000,0.000000,-43.154600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.171000,0.000000,-40.589200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.337000,0.000000,-40.462200>}
box{<0,0,-0.088900><0.209010,0.035000,0.088900> rotate<0,-37.415696,0> translate<29.171000,0.000000,-40.589200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.337000,0.000000,-44.551600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.692600,0.000000,-44.551600>}
box{<0,0,-0.088900><0.355600,0.035000,0.088900> rotate<0,0.000000,0> translate<29.337000,0.000000,-44.551600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.136600,-1.535000,-17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.692600,-1.535000,-14.325600>}
box{<0,0,-0.406400><5.028943,0.035000,0.406400> rotate<0,-44.997030,0> translate<26.136600,-1.535000,-17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.337000,0.000000,-43.307000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.870400,0.000000,-43.307000>}
box{<0,0,-0.088900><0.533400,0.035000,0.088900> rotate<0,0.000000,0> translate<29.337000,0.000000,-43.307000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.171000,0.000000,-41.884600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.048200,0.000000,-41.884600>}
box{<0,0,-0.088900><0.877200,0.035000,0.088900> rotate<0,0.000000,0> translate<29.171000,0.000000,-41.884600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.092400,0.000000,-35.661600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.048200,0.000000,-35.661600>}
box{<0,0,-0.406400><1.955800,0.035000,0.406400> rotate<0,0.000000,0> translate<28.092400,0.000000,-35.661600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.625800,0.000000,-12.725400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.048200,0.000000,-14.147800>}
box{<0,0,-0.406400><2.011577,0.035000,0.406400> rotate<0,44.997030,0> translate<28.625800,0.000000,-12.725400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.692600,-1.535000,-14.325600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.048200,-1.535000,-14.147800>}
box{<0,0,-0.406400><0.397573,0.035000,0.406400> rotate<0,-26.563298,0> translate<29.692600,-1.535000,-14.325600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-27.660600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.226000,0.000000,-28.727400>}
box{<0,0,-0.088900><1.508683,0.035000,0.088900> rotate<0,44.997030,0> translate<29.159200,0.000000,-27.660600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.870400,0.000000,-43.307000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.403800,0.000000,-43.840400>}
box{<0,0,-0.088900><0.754342,0.035000,0.088900> rotate<0,44.997030,0> translate<29.870400,0.000000,-43.307000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.048200,0.000000,-41.884600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.581600,0.000000,-42.418000>}
box{<0,0,-0.088900><0.754342,0.035000,0.088900> rotate<0,44.997030,0> translate<30.048200,0.000000,-41.884600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.337000,0.000000,-40.462200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.581600,0.000000,-40.462200>}
box{<0,0,-0.088900><1.244600,0.035000,0.088900> rotate<0,0.000000,0> translate<29.337000,0.000000,-40.462200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.581600,0.000000,-42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.749200,0.000000,-42.435600>}
box{<0,0,-0.088900><0.168522,0.035000,0.088900> rotate<0,5.994374,0> translate<30.581600,0.000000,-42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.581600,0.000000,-40.462200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.749200,0.000000,-40.368400>}
box{<0,0,-0.088900><0.192063,0.035000,0.088900> rotate<0,-29.232321,0> translate<30.581600,0.000000,-40.462200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.692600,0.000000,-44.551600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.759400,0.000000,-45.618400>}
box{<0,0,-0.088900><1.508683,0.035000,0.088900> rotate<0,44.997030,0> translate<29.692600,0.000000,-44.551600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.749200,0.000000,-42.435600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.759400,0.000000,-42.595800>}
box{<0,0,-0.088900><0.160524,0.035000,0.088900> rotate<0,86.351173,0> translate<30.749200,0.000000,-42.435600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<29.159200,0.000000,-30.683200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.937200,0.000000,-30.683200>}
box{<0,0,-0.088900><1.778000,0.035000,0.088900> rotate<0,0.000000,0> translate<29.159200,0.000000,-30.683200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.226000,0.000000,-28.727400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.937200,0.000000,-28.727400>}
box{<0,0,-0.088900><0.711200,0.035000,0.088900> rotate<0,0.000000,0> translate<30.226000,0.000000,-28.727400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.937200,0.000000,-30.683200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.977800,0.000000,-30.751600>}
box{<0,0,-0.088900><0.079542,0.035000,0.088900> rotate<0,59.304106,0> translate<30.937200,0.000000,-30.683200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.937200,0.000000,-28.727400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.977800,0.000000,-28.786000>}
box{<0,0,-0.088900><0.071290,0.035000,0.088900> rotate<0,55.280866,0> translate<30.937200,0.000000,-28.727400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.403800,0.000000,-43.840400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.115000,0.000000,-44.551600>}
box{<0,0,-0.088900><1.005789,0.035000,0.088900> rotate<0,44.997030,0> translate<30.403800,0.000000,-43.840400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.048200,0.000000,-35.661600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.115000,0.000000,-34.594800>}
box{<0,0,-0.406400><1.508683,0.035000,0.406400> rotate<0,-44.997030,0> translate<30.048200,0.000000,-35.661600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.103200,0.000000,-34.569400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.115000,0.000000,-34.594800>}
box{<0,0,-0.406400><0.028007,0.035000,0.406400> rotate<0,65.077682,0> translate<31.103200,0.000000,-34.569400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.292800,0.000000,-10.591800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.292800,0.000000,-11.303000>}
box{<0,0,-0.304800><0.711200,0.035000,0.304800> rotate<0,-90.000000,0> translate<31.292800,0.000000,-11.303000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.381200,0.000000,-10.591800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.292800,0.000000,-10.591800>}
box{<0,0,-0.304800><3.911600,0.035000,0.304800> rotate<0,0.000000,0> translate<27.381200,0.000000,-10.591800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.292800,0.000000,-10.591800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.292800,0.000000,-10.058400>}
box{<0,0,-0.304800><0.533400,0.035000,0.304800> rotate<0,90.000000,0> translate<31.292800,0.000000,-10.058400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.292800,0.000000,-9.880600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.292800,0.000000,-7.924800>}
box{<0,0,-0.304800><1.955800,0.035000,0.304800> rotate<0,90.000000,0> translate<31.292800,0.000000,-7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.292800,0.000000,-10.058400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.331800,0.000000,-9.906000>}
box{<0,0,-0.304800><0.157311,0.035000,0.304800> rotate<0,-75.640752,0> translate<31.292800,0.000000,-10.058400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.292800,0.000000,-9.880600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.331800,0.000000,-9.906000>}
box{<0,0,-0.304800><0.046542,0.035000,0.304800> rotate<0,33.073293,0> translate<31.292800,0.000000,-9.880600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.292800,0.000000,-7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.331800,0.000000,-7.772400>}
box{<0,0,-0.304800><0.157311,0.035000,0.304800> rotate<0,-75.640752,0> translate<31.292800,0.000000,-7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.115000,0.000000,-44.551600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.648400,0.000000,-44.551600>}
box{<0,0,-0.088900><0.533400,0.035000,0.088900> rotate<0,0.000000,0> translate<31.115000,0.000000,-44.551600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.759400,0.000000,-42.595800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.648400,0.000000,-43.484800>}
box{<0,0,-0.088900><1.257236,0.035000,0.088900> rotate<0,44.997030,0> translate<30.759400,0.000000,-42.595800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<28.981400,0.000000,-18.059400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.648400,0.000000,-18.059400>}
box{<0,0,-0.088900><2.667000,0.035000,0.088900> rotate<0,0.000000,0> translate<28.981400,0.000000,-18.059400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.648400,0.000000,-18.059400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.696600,0.000000,-17.908600>}
box{<0,0,-0.088900><0.158316,0.035000,0.088900> rotate<0,-72.269861,0> translate<31.648400,0.000000,-18.059400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.648400,0.000000,-44.551600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.699200,0.000000,-44.635600>}
box{<0,0,-0.088900><0.098166,0.035000,0.088900> rotate<0,58.832166,0> translate<31.648400,0.000000,-44.551600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.826200,0.000000,-38.328600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.826200,0.000000,-41.706800>}
box{<0,0,-0.088900><3.378200,0.035000,0.088900> rotate<0,-90.000000,0> translate<31.826200,0.000000,-41.706800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.699200,0.000000,-38.168400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.826200,0.000000,-38.328600>}
box{<0,0,-0.088900><0.204433,0.035000,0.088900> rotate<0,51.590655,0> translate<31.699200,0.000000,-38.168400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.696600,0.000000,-17.908600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.826200,0.000000,-18.059400>}
box{<0,0,-0.088900><0.198839,0.035000,0.088900> rotate<0,49.320439,0> translate<31.696600,0.000000,-17.908600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.337000,0.000000,-49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.004000,0.000000,-49.530000>}
box{<0,0,-0.406400><2.667000,0.035000,0.406400> rotate<0,0.000000,0> translate<29.337000,0.000000,-49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.927800,0.000000,-32.951600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.004000,0.000000,-32.816800>}
box{<0,0,-0.088900><0.154847,0.035000,0.088900> rotate<0,-60.517316,0> translate<31.927800,0.000000,-32.951600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.927800,0.000000,-26.586000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.004000,0.000000,-26.593800>}
box{<0,0,-0.088900><0.076598,0.035000,0.088900> rotate<0,5.844180,0> translate<31.927800,0.000000,-26.586000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.004000,0.000000,-29.616400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.004000,0.000000,-26.593800>}
box{<0,0,-0.088900><3.022600,0.035000,0.088900> rotate<0,90.000000,0> translate<32.004000,0.000000,-26.593800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.648400,0.000000,-43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.181800,0.000000,-43.484800>}
box{<0,0,-0.088900><0.533400,0.035000,0.088900> rotate<0,0.000000,0> translate<31.648400,0.000000,-43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.004000,0.000000,-49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.258000,0.000000,-49.772200>}
box{<0,0,-0.406400><0.350966,0.035000,0.406400> rotate<0,43.634841,0> translate<32.004000,0.000000,-49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.048200,-1.535000,-14.147800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.270700,-1.535000,-16.370300>}
box{<0,0,-0.406400><3.143090,0.035000,0.406400> rotate<0,44.997030,0> translate<30.048200,-1.535000,-14.147800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.258000,0.000000,-49.772200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.359600,0.000000,-49.707800>}
box{<0,0,-0.406400><0.120291,0.035000,0.406400> rotate<0,-32.366768,0> translate<32.258000,0.000000,-49.772200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.759400,0.000000,-45.618400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.359600,0.000000,-45.618400>}
box{<0,0,-0.088900><1.600200,0.035000,0.088900> rotate<0,0.000000,0> translate<30.759400,0.000000,-45.618400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.359600,0.000000,-45.618400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.537400,0.000000,-45.440600>}
box{<0,0,-0.088900><0.251447,0.035000,0.088900> rotate<0,-44.997030,0> translate<32.359600,0.000000,-45.618400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.537400,0.000000,-43.840400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.537400,0.000000,-45.440600>}
box{<0,0,-0.088900><1.600200,0.035000,0.088900> rotate<0,-90.000000,0> translate<32.537400,0.000000,-45.440600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.181800,0.000000,-43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.537400,0.000000,-43.840400>}
box{<0,0,-0.088900><0.502894,0.035000,0.088900> rotate<0,44.997030,0> translate<32.181800,0.000000,-43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.826200,0.000000,-41.706800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.537400,0.000000,-42.418000>}
box{<0,0,-0.088900><1.005789,0.035000,0.088900> rotate<0,44.997030,0> translate<31.826200,0.000000,-41.706800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.537400,0.000000,-42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.649200,0.000000,-42.435600>}
box{<0,0,-0.088900><0.113177,0.035000,0.088900> rotate<0,8.945718,0> translate<32.537400,0.000000,-42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.649200,0.000000,-42.435600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.715200,0.000000,-42.418000>}
box{<0,0,-0.088900><0.068306,0.035000,0.088900> rotate<0,-14.930432,0> translate<32.649200,0.000000,-42.435600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.649200,0.000000,-40.368400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.715200,0.000000,-40.462200>}
box{<0,0,-0.088900><0.114693,0.035000,0.088900> rotate<0,54.865212,0> translate<32.649200,0.000000,-40.368400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.004000,0.000000,-29.616400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.715200,0.000000,-30.327600>}
box{<0,0,-0.088900><1.005789,0.035000,0.088900> rotate<0,44.997030,0> translate<32.004000,0.000000,-29.616400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.715200,0.000000,-30.683200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.715200,0.000000,-30.327600>}
box{<0,0,-0.088900><0.355600,0.035000,0.088900> rotate<0,90.000000,0> translate<32.715200,0.000000,-30.327600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.004000,0.000000,-26.593800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.715200,0.000000,-26.593800>}
box{<0,0,-0.088900><0.711200,0.035000,0.088900> rotate<0,0.000000,0> translate<32.004000,0.000000,-26.593800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.715200,0.000000,-30.683200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.877800,0.000000,-30.751600>}
box{<0,0,-0.088900><0.176401,0.035000,0.088900> rotate<0,22.813242,0> translate<32.715200,0.000000,-30.683200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.877800,0.000000,-28.786000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.893000,0.000000,-28.905200>}
box{<0,0,-0.088900><0.120165,0.035000,0.088900> rotate<0,82.727586,0> translate<32.877800,0.000000,-28.786000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.715200,0.000000,-40.462200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<33.248600,0.000000,-40.462200>}
box{<0,0,-0.088900><0.533400,0.035000,0.088900> rotate<0,0.000000,0> translate<32.715200,0.000000,-40.462200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.004000,0.000000,-32.816800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<33.248600,0.000000,-32.816800>}
box{<0,0,-0.088900><1.244600,0.035000,0.088900> rotate<0,0.000000,0> translate<32.004000,0.000000,-32.816800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.448000,0.000000,-58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.604200,0.000000,-58.420000>}
box{<0,0,-0.304800><5.156200,0.035000,0.304800> rotate<0,0.000000,0> translate<28.448000,0.000000,-58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.359600,0.000000,-49.707800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.604200,0.000000,-49.707800>}
box{<0,0,-0.406400><1.244600,0.035000,0.406400> rotate<0,0.000000,0> translate<32.359600,0.000000,-49.707800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<33.248600,0.000000,-32.816800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<33.604200,0.000000,-32.461200>}
box{<0,0,-0.088900><0.502894,0.035000,0.088900> rotate<0,-44.997030,0> translate<33.248600,0.000000,-32.816800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.604200,0.000000,-49.707800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.731200,0.000000,-49.772200>}
box{<0,0,-0.406400><0.142395,0.035000,0.406400> rotate<0,26.887181,0> translate<33.604200,0.000000,-49.707800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<33.731200,0.000000,-51.472200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<33.782000,0.000000,-51.485800>}
box{<0,0,-0.088900><0.052589,0.035000,0.088900> rotate<0,14.986573,0> translate<33.731200,0.000000,-51.472200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.715200,0.000000,-42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<33.782000,0.000000,-43.484800>}
box{<0,0,-0.088900><1.508683,0.035000,0.088900> rotate<0,44.997030,0> translate<32.715200,0.000000,-42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.731200,0.000000,-49.772200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.959800,0.000000,-49.707800>}
box{<0,0,-0.406400><0.237498,0.035000,0.406400> rotate<0,-15.732275,0> translate<33.731200,0.000000,-49.772200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<33.248600,0.000000,-40.462200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<34.137600,0.000000,-41.351200>}
box{<0,0,-0.088900><1.257236,0.035000,0.088900> rotate<0,44.997030,0> translate<33.248600,0.000000,-40.462200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<34.137600,0.000000,-41.351200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<34.290000,0.000000,-41.244600>}
box{<0,0,-0.088900><0.185982,0.035000,0.088900> rotate<0,-34.969522,0> translate<34.137600,0.000000,-41.351200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<34.290000,0.000000,-41.244600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<34.315400,0.000000,-41.351200>}
box{<0,0,-0.088900><0.109584,0.035000,0.088900> rotate<0,76.592759,0> translate<34.290000,0.000000,-41.244600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<34.315400,0.000000,-41.351200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<34.671000,0.000000,-41.351200>}
box{<0,0,-0.088900><0.355600,0.035000,0.088900> rotate<0,0.000000,0> translate<34.315400,0.000000,-41.351200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<33.604200,0.000000,-32.461200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<34.671000,0.000000,-32.461200>}
box{<0,0,-0.088900><1.066800,0.035000,0.088900> rotate<0,0.000000,0> translate<33.604200,0.000000,-32.461200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.893000,0.000000,-28.905200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<34.671000,0.000000,-30.683200>}
box{<0,0,-0.088900><2.514472,0.035000,0.088900> rotate<0,44.997030,0> translate<32.893000,0.000000,-28.905200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<34.671000,0.000000,-30.683200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<34.747200,0.000000,-30.561200>}
box{<0,0,-0.088900><0.143842,0.035000,0.088900> rotate<0,-58.007677,0> translate<34.671000,0.000000,-30.683200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<34.848800,0.000000,-30.683200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<34.848800,0.000000,-32.105600>}
box{<0,0,-0.088900><1.422400,0.035000,0.088900> rotate<0,-90.000000,0> translate<34.848800,0.000000,-32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<34.747200,0.000000,-30.561200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<34.848800,0.000000,-30.683200>}
box{<0,0,-0.088900><0.158766,0.035000,0.088900> rotate<0,50.209598,0> translate<34.747200,0.000000,-30.561200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<33.782000,0.000000,-51.485800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.026600,0.000000,-51.485800>}
box{<0,0,-0.088900><1.244600,0.035000,0.088900> rotate<0,0.000000,0> translate<33.782000,0.000000,-51.485800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.959800,0.000000,-49.707800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.026600,0.000000,-49.707800>}
box{<0,0,-0.406400><1.066800,0.035000,0.406400> rotate<0,0.000000,0> translate<33.959800,0.000000,-49.707800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<30.403800,-1.535000,-43.840400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.026600,-1.535000,-43.840400>}
box{<0,0,-0.088900><4.622800,0.035000,0.088900> rotate<0,0.000000,0> translate<30.403800,-1.535000,-43.840400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.026600,0.000000,-51.485800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.102800,0.000000,-51.446800>}
box{<0,0,-0.088900><0.085600,0.035000,0.088900> rotate<0,-27.102078,0> translate<35.026600,0.000000,-51.485800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.026600,0.000000,-49.707800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.102800,0.000000,-49.746800>}
box{<0,0,-0.406400><0.085600,0.035000,0.406400> rotate<0,27.102078,0> translate<35.026600,0.000000,-49.707800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.077400,0.000000,-52.947200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.204400,0.000000,-53.086000>}
box{<0,0,-0.088900><0.188134,0.035000,0.088900> rotate<0,47.538798,0> translate<35.077400,0.000000,-52.947200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.077400,0.000000,-52.947200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.204400,0.000000,-52.908200>}
box{<0,0,-0.088900><0.132853,0.035000,0.088900> rotate<0,-17.069895,0> translate<35.077400,0.000000,-52.947200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.102800,0.000000,-51.446800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.204400,0.000000,-51.485800>}
box{<0,0,-0.088900><0.108828,0.035000,0.088900> rotate<0,20.998326,0> translate<35.102800,0.000000,-51.446800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.204400,0.000000,-52.908200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.204400,0.000000,-51.485800>}
box{<0,0,-0.088900><1.422400,0.035000,0.088900> rotate<0,90.000000,0> translate<35.204400,0.000000,-51.485800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.604200,0.000000,-58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.382200,0.000000,-56.642000>}
box{<0,0,-0.304800><2.514472,0.035000,0.304800> rotate<0,-44.997030,0> translate<33.604200,0.000000,-58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.102800,0.000000,-49.746800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.382200,0.000000,-49.885600>}
box{<0,0,-0.406400><0.311977,0.035000,0.406400> rotate<0,26.415469,0> translate<35.102800,0.000000,-49.746800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<34.671000,0.000000,-41.351200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.382200,0.000000,-42.062400>}
box{<0,0,-0.088900><1.005789,0.035000,0.088900> rotate<0,44.997030,0> translate<34.671000,0.000000,-41.351200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.204400,0.000000,-53.086000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.915600,0.000000,-53.797200>}
box{<0,0,-0.088900><1.005789,0.035000,0.088900> rotate<0,44.997030,0> translate<35.204400,0.000000,-53.086000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<33.782000,0.000000,-43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.915600,0.000000,-43.484800>}
box{<0,0,-0.088900><2.133600,0.035000,0.088900> rotate<0,0.000000,0> translate<33.782000,0.000000,-43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.382200,0.000000,-42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.915600,0.000000,-42.062400>}
box{<0,0,-0.088900><0.533400,0.035000,0.088900> rotate<0,0.000000,0> translate<35.382200,0.000000,-42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.915600,0.000000,-33.705800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.915600,0.000000,-34.417000>}
box{<0,0,-0.088900><0.711200,0.035000,0.088900> rotate<0,-90.000000,0> translate<35.915600,0.000000,-34.417000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<34.671000,0.000000,-32.461200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.915600,0.000000,-33.705800>}
box{<0,0,-0.088900><1.760130,0.035000,0.088900> rotate<0,44.997030,0> translate<34.671000,0.000000,-32.461200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.915600,0.000000,-29.794200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.915600,0.000000,-31.750000>}
box{<0,0,-0.088900><1.955800,0.035000,0.088900> rotate<0,-90.000000,0> translate<35.915600,0.000000,-31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<32.715200,0.000000,-26.593800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.915600,0.000000,-29.794200>}
box{<0,0,-0.088900><4.526049,0.035000,0.088900> rotate<0,44.997030,0> translate<32.715200,0.000000,-26.593800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<31.826200,0.000000,-18.059400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.915600,0.000000,-18.059400>}
box{<0,0,-0.088900><4.089400,0.035000,0.088900> rotate<0,0.000000,0> translate<31.826200,0.000000,-18.059400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.915600,0.000000,-43.484800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.954600,0.000000,-43.535600>}
box{<0,0,-0.088900><0.064044,0.035000,0.088900> rotate<0,52.482491,0> translate<35.915600,0.000000,-43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.915600,0.000000,-42.062400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.954600,0.000000,-42.087800>}
box{<0,0,-0.088900><0.046542,0.035000,0.088900> rotate<0,33.073293,0> translate<35.915600,0.000000,-42.062400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.915600,0.000000,-34.417000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<36.093400,0.000000,-34.594800>}
box{<0,0,-0.088900><0.251447,0.035000,0.088900> rotate<0,44.997030,0> translate<35.915600,0.000000,-34.417000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.382200,0.000000,-56.642000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.449000,0.000000,-56.642000>}
box{<0,0,-0.304800><1.066800,0.035000,0.304800> rotate<0,0.000000,0> translate<35.382200,0.000000,-56.642000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.915600,0.000000,-53.797200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<36.449000,0.000000,-53.797200>}
box{<0,0,-0.088900><0.533400,0.035000,0.088900> rotate<0,0.000000,0> translate<35.915600,0.000000,-53.797200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<34.848800,0.000000,-32.105600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<36.449000,0.000000,-33.705800>}
box{<0,0,-0.088900><2.263025,0.035000,0.088900> rotate<0,44.997030,0> translate<34.848800,0.000000,-32.105600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.915600,0.000000,-31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<36.449000,0.000000,-32.283400>}
box{<0,0,-0.088900><0.754342,0.035000,0.088900> rotate<0,44.997030,0> translate<35.915600,0.000000,-31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.449000,0.000000,-56.642000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.616600,0.000000,-56.443400>}
box{<0,0,-0.304800><0.259869,0.035000,0.304800> rotate<0,-49.835445,0> translate<36.449000,0.000000,-56.642000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<36.449000,0.000000,-53.797200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<36.616600,0.000000,-53.843400>}
box{<0,0,-0.088900><0.173851,0.035000,0.088900> rotate<0,15.410189,0> translate<36.449000,0.000000,-53.797200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.616600,0.000000,-56.443400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.626800,0.000000,-56.464200>}
box{<0,0,-0.304800><0.023166,0.035000,0.304800> rotate<0,63.873163,0> translate<36.616600,0.000000,-56.443400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.382200,0.000000,-49.885600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.626800,0.000000,-48.641000>}
box{<0,0,-0.406400><1.760130,0.035000,0.406400> rotate<0,-44.997030,0> translate<35.382200,0.000000,-49.885600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<36.449000,0.000000,-33.705800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<36.626800,0.000000,-33.705800>}
box{<0,0,-0.088900><0.177800,0.035000,0.088900> rotate<0,0.000000,0> translate<36.449000,0.000000,-33.705800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<36.449000,0.000000,-32.283400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<36.626800,0.000000,-32.283400>}
box{<0,0,-0.088900><0.177800,0.035000,0.088900> rotate<0,0.000000,0> translate<36.449000,0.000000,-32.283400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.626800,0.000000,-26.238200>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.626800,0.000000,-27.482800>}
box{<0,0,-0.406400><1.244600,0.035000,0.406400> rotate<0,-90.000000,0> translate<36.626800,0.000000,-27.482800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.626800,-1.535000,-20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.626800,-1.535000,-26.238200>}
box{<0,0,-0.406400><5.511800,0.035000,0.406400> rotate<0,-90.000000,0> translate<36.626800,-1.535000,-26.238200> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.270700,-1.535000,-16.370300>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.626800,-1.535000,-20.726400>}
box{<0,0,-0.406400><6.160456,0.035000,0.406400> rotate<0,44.997030,0> translate<32.270700,-1.535000,-16.370300> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<36.626800,0.000000,-33.705800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<36.742000,0.000000,-33.756600>}
box{<0,0,-0.088900><0.125903,0.035000,0.088900> rotate<0,23.794576,0> translate<36.626800,0.000000,-33.705800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<36.626800,0.000000,-32.283400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<36.742000,0.000000,-32.435800>}
box{<0,0,-0.088900><0.191041,0.035000,0.088900> rotate<0,52.910672,0> translate<36.626800,0.000000,-32.283400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.626800,0.000000,-27.482800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.742000,0.000000,-27.609800>}
box{<0,0,-0.406400><0.171464,0.035000,0.406400> rotate<0,47.786095,0> translate<36.626800,0.000000,-27.482800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.026600,-1.535000,-43.840400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.338000,-1.535000,-46.151800>}
box{<0,0,-0.088900><3.268813,0.035000,0.088900> rotate<0,44.997030,0> translate<35.026600,-1.535000,-43.840400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<36.093400,0.000000,-34.594800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.338000,0.000000,-34.594800>}
box{<0,0,-0.088900><1.244600,0.035000,0.088900> rotate<0,0.000000,0> translate<36.093400,0.000000,-34.594800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.338000,0.000000,-46.151800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.515800,0.000000,-45.974000>}
box{<0,0,-0.088900><0.251447,0.035000,0.088900> rotate<0,-44.997030,0> translate<37.338000,0.000000,-46.151800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.515800,0.000000,-45.085000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.515800,0.000000,-45.974000>}
box{<0,0,-0.088900><0.889000,0.035000,0.088900> rotate<0,-90.000000,0> translate<37.515800,0.000000,-45.974000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.515800,0.000000,-45.085000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.654600,0.000000,-44.983400>}
box{<0,0,-0.088900><0.172012,0.035000,0.088900> rotate<0,-36.201308,0> translate<37.515800,0.000000,-45.085000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.654600,0.000000,-44.983400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.693600,0.000000,-44.907200>}
box{<0,0,-0.088900><0.085600,0.035000,0.088900> rotate<0,-62.891982,0> translate<37.654600,0.000000,-44.983400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.693600,0.000000,-43.662600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.693600,0.000000,-44.907200>}
box{<0,0,-0.088900><1.244600,0.035000,0.088900> rotate<0,-90.000000,0> translate<37.693600,0.000000,-44.907200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.654600,0.000000,-43.535600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.693600,0.000000,-43.662600>}
box{<0,0,-0.088900><0.132853,0.035000,0.088900> rotate<0,72.924166,0> translate<37.654600,0.000000,-43.535600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.654600,0.000000,-43.535600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.693600,0.000000,-43.484800>}
box{<0,0,-0.088900><0.064044,0.035000,0.088900> rotate<0,-52.482491,0> translate<37.654600,0.000000,-43.535600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.693600,0.000000,-42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.693600,0.000000,-43.484800>}
box{<0,0,-0.088900><1.066800,0.035000,0.088900> rotate<0,-90.000000,0> translate<37.693600,0.000000,-43.484800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.654600,0.000000,-42.087800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.693600,0.000000,-42.418000>}
box{<0,0,-0.088900><0.332495,0.035000,0.088900> rotate<0,83.258494,0> translate<37.654600,0.000000,-42.087800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.654600,0.000000,-42.087800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.693600,0.000000,-42.240200>}
box{<0,0,-0.088900><0.157311,0.035000,0.088900> rotate<0,75.640752,0> translate<37.654600,0.000000,-42.087800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.693600,0.000000,-42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.693600,0.000000,-42.240200>}
box{<0,0,-0.088900><0.177800,0.035000,0.088900> rotate<0,90.000000,0> translate<37.693600,0.000000,-42.240200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.654600,0.000000,-40.436800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.693600,0.000000,-40.284400>}
box{<0,0,-0.088900><0.157311,0.035000,0.088900> rotate<0,-75.640752,0> translate<37.654600,0.000000,-40.436800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.292800,0.000000,-11.303000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.871400,0.000000,-17.881600>}
box{<0,0,-0.304800><9.303545,0.035000,0.304800> rotate<0,44.997030,0> translate<31.292800,0.000000,-11.303000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.626800,0.000000,-56.464200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.227000,0.000000,-56.464200>}
box{<0,0,-0.304800><1.600200,0.035000,0.304800> rotate<0,0.000000,0> translate<36.626800,0.000000,-56.464200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.227000,0.000000,-56.464200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.516600,0.000000,-56.443400>}
box{<0,0,-0.304800><0.290346,0.035000,0.304800> rotate<0,-4.107841,0> translate<38.227000,0.000000,-56.464200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.516600,0.000000,-56.443400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.582600,0.000000,-56.464200>}
box{<0,0,-0.304800><0.069200,0.035000,0.304800> rotate<0,17.491170,0> translate<38.516600,0.000000,-56.443400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.516600,0.000000,-53.843400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-53.797200>}
box{<0,0,-0.088900><0.080563,0.035000,0.088900> rotate<0,-34.989711,0> translate<38.516600,0.000000,-53.843400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-52.730400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-53.797200>}
box{<0,0,-0.088900><1.066800,0.035000,0.088900> rotate<0,-90.000000,0> translate<38.582600,0.000000,-53.797200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.442000,0.000000,-33.756600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-33.705800>}
box{<0,0,-0.088900><0.149496,0.035000,0.088900> rotate<0,-19.863917,0> translate<38.442000,0.000000,-33.756600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-33.350200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-33.705800>}
box{<0,0,-0.088900><0.355600,0.035000,0.088900> rotate<0,-90.000000,0> translate<38.582600,0.000000,-33.705800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.338000,0.000000,-34.594800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-33.350200>}
box{<0,0,-0.088900><1.760130,0.035000,0.088900> rotate<0,-44.997030,0> translate<37.338000,0.000000,-34.594800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.442000,0.000000,-33.756600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-33.350200>}
box{<0,0,-0.088900><0.430034,0.035000,0.088900> rotate<0,-70.911513,0> translate<38.442000,0.000000,-33.756600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.442000,0.000000,-32.435800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-32.461200>}
box{<0,0,-0.088900><0.142876,0.035000,0.088900> rotate<0,10.239608,0> translate<38.442000,0.000000,-32.435800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-33.350200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-32.461200>}
box{<0,0,-0.088900><0.889000,0.035000,0.088900> rotate<0,90.000000,0> translate<38.582600,0.000000,-32.461200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.442000,0.000000,-32.435800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-32.283400>}
box{<0,0,-0.088900><0.207350,0.035000,0.088900> rotate<0,-47.303107,0> translate<38.442000,0.000000,-32.435800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.442000,0.000000,-31.089600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-31.216600>}
box{<0,0,-0.088900><0.189466,0.035000,0.088900> rotate<0,42.087832,0> translate<38.442000,0.000000,-31.089600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-32.283400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-31.216600>}
box{<0,0,-0.088900><1.066800,0.035000,0.088900> rotate<0,90.000000,0> translate<38.582600,0.000000,-31.216600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.442000,0.000000,-29.032200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-28.905200>}
box{<0,0,-0.088900><0.189466,0.035000,0.088900> rotate<0,-42.087832,0> translate<38.442000,0.000000,-29.032200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.442000,0.000000,-29.032200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-28.727400>}
box{<0,0,-0.088900><0.335666,0.035000,0.088900> rotate<0,-65.232476,0> translate<38.442000,0.000000,-29.032200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-28.905200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-28.727400>}
box{<0,0,-0.088900><0.177800,0.035000,0.088900> rotate<0,90.000000,0> translate<38.582600,0.000000,-28.727400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.442000,0.000000,-27.609800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-27.660600>}
box{<0,0,-0.088900><0.149496,0.035000,0.088900> rotate<0,19.863917,0> translate<38.442000,0.000000,-27.609800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-28.727400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-27.660600>}
box{<0,0,-0.088900><1.066800,0.035000,0.088900> rotate<0,90.000000,0> translate<38.582600,0.000000,-27.660600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-52.730400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.938200,0.000000,-52.374800>}
box{<0,0,-0.088900><0.502894,0.035000,0.088900> rotate<0,-44.997030,0> translate<38.582600,0.000000,-52.730400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.938200,0.000000,-52.319000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.938200,0.000000,-52.374800>}
box{<0,0,-0.088900><0.055800,0.035000,0.088900> rotate<0,-90.000000,0> translate<38.938200,0.000000,-52.374800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.938200,0.000000,-52.197000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.938200,0.000000,-52.319000>}
box{<0,0,-0.088900><0.122000,0.035000,0.088900> rotate<0,-90.000000,0> translate<38.938200,0.000000,-52.319000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.626800,0.000000,-48.641000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.938200,0.000000,-48.641000>}
box{<0,0,-0.406400><2.311400,0.035000,0.406400> rotate<0,0.000000,0> translate<36.626800,0.000000,-48.641000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.938200,0.000000,-48.519000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.938200,0.000000,-48.641000>}
box{<0,0,-0.406400><0.122000,0.035000,0.406400> rotate<0,-90.000000,0> translate<38.938200,0.000000,-48.641000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.693600,0.000000,-42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.938200,0.000000,-42.418000>}
box{<0,0,-0.088900><1.244600,0.035000,0.088900> rotate<0,0.000000,0> translate<37.693600,0.000000,-42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<37.693600,0.000000,-40.284400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.938200,0.000000,-40.284400>}
box{<0,0,-0.088900><1.244600,0.035000,0.088900> rotate<0,0.000000,0> translate<37.693600,0.000000,-40.284400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.938200,0.000000,-42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<39.080400,0.000000,-42.537200>}
box{<0,0,-0.088900><0.185552,0.035000,0.088900> rotate<0,39.968984,0> translate<38.938200,0.000000,-42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.938200,0.000000,-40.284400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<39.080400,0.000000,-40.368400>}
box{<0,0,-0.088900><0.165157,0.035000,0.088900> rotate<0,30.569064,0> translate<38.938200,0.000000,-40.284400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.270700,-1.535000,-16.370300>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.649400,-1.535000,-8.991600>}
box{<0,0,-0.406400><10.435058,0.035000,0.406400> rotate<0,-44.997030,0> translate<32.270700,-1.535000,-16.370300> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-31.216600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<39.827200,0.000000,-31.216600>}
box{<0,0,-0.088900><1.244600,0.035000,0.088900> rotate<0,0.000000,0> translate<38.582600,0.000000,-31.216600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.582600,0.000000,-28.727400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<39.827200,0.000000,-28.727400>}
box{<0,0,-0.088900><1.244600,0.035000,0.088900> rotate<0,0.000000,0> translate<38.582600,0.000000,-28.727400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<39.827200,0.000000,-31.216600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<39.867800,0.000000,-31.234200>}
box{<0,0,-0.088900><0.044251,0.035000,0.088900> rotate<0,23.435066,0> translate<39.827200,0.000000,-31.216600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<39.827200,0.000000,-28.727400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<39.867800,0.000000,-28.811400>}
box{<0,0,-0.088900><0.093297,0.035000,0.088900> rotate<0,64.199736,0> translate<39.827200,0.000000,-28.727400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.582600,0.000000,-56.464200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.005000,0.000000,-56.464200>}
box{<0,0,-0.304800><1.422400,0.035000,0.304800> rotate<0,0.000000,0> translate<38.582600,0.000000,-56.464200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.005000,0.000000,-56.464200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.030400,0.000000,-56.401600>}
box{<0,0,-0.304800><0.067557,0.035000,0.304800> rotate<0,-67.910624,0> translate<40.005000,0.000000,-56.464200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.030400,0.000000,-56.401600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.182800,0.000000,-56.286400>}
box{<0,0,-0.304800><0.191041,0.035000,0.304800> rotate<0,-37.083388,0> translate<40.030400,0.000000,-56.401600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<40.030400,0.000000,-44.737200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<40.182800,0.000000,-44.729400>}
box{<0,0,-0.088900><0.152599,0.035000,0.088900> rotate<0,-2.929711,0> translate<40.030400,0.000000,-44.737200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<40.030400,0.000000,-38.168400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<40.182800,0.000000,-38.150800>}
box{<0,0,-0.088900><0.153413,0.035000,0.088900> rotate<0,-6.587218,0> translate<40.030400,0.000000,-38.168400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<40.182800,0.000000,-38.150800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<40.360600,0.000000,-37.973000>}
box{<0,0,-0.088900><0.251447,0.035000,0.088900> rotate<0,-44.997030,0> translate<40.182800,0.000000,-38.150800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<38.938200,0.000000,-52.197000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<40.894000,0.000000,-50.241200>}
box{<0,0,-0.088900><2.765919,0.035000,0.088900> rotate<0,-44.997030,0> translate<38.938200,0.000000,-52.197000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<40.817800,0.000000,-33.434200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<40.894000,0.000000,-33.528000>}
box{<0,0,-0.088900><0.120851,0.035000,0.088900> rotate<0,50.907381,0> translate<40.817800,0.000000,-33.434200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<40.817800,0.000000,-26.611400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<40.894000,0.000000,-26.593800>}
box{<0,0,-0.088900><0.078206,0.035000,0.088900> rotate<0,-13.004741,0> translate<40.817800,0.000000,-26.611400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<40.894000,0.000000,-50.241200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<41.042000,0.000000,-50.393600>}
box{<0,0,-0.088900><0.212438,0.035000,0.088900> rotate<0,45.836134,0> translate<40.894000,0.000000,-50.241200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<40.980400,0.000000,-42.537200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<41.071800,0.000000,-42.418000>}
box{<0,0,-0.088900><0.150209,0.035000,0.088900> rotate<0,-52.516318,0> translate<40.980400,0.000000,-42.537200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<40.980400,0.000000,-40.368400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<41.071800,0.000000,-40.462200>}
box{<0,0,-0.088900><0.130967,0.035000,0.088900> rotate<0,45.739434,0> translate<40.980400,0.000000,-40.368400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<41.071800,0.000000,-42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<41.071800,0.000000,-40.462200>}
box{<0,0,-0.088900><1.955800,0.035000,0.088900> rotate<0,90.000000,0> translate<41.071800,0.000000,-40.462200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<40.894000,0.000000,-33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<41.071800,0.000000,-33.705800>}
box{<0,0,-0.088900><0.251447,0.035000,0.088900> rotate<0,44.997030,0> translate<40.894000,0.000000,-33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.871400,0.000000,-17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.071800,0.000000,-17.881600>}
box{<0,0,-0.304800><3.200400,0.035000,0.304800> rotate<0,0.000000,0> translate<37.871400,0.000000,-17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.649400,0.000000,-8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.071800,0.000000,-8.991600>}
box{<0,0,-0.406400><1.422400,0.035000,0.406400> rotate<0,0.000000,0> translate<39.649400,0.000000,-8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.071800,0.000000,-17.881600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.196600,0.000000,-17.908600>}
box{<0,0,-0.304800><0.127687,0.035000,0.304800> rotate<0,12.206775,0> translate<41.071800,0.000000,-17.881600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.071800,0.000000,-8.991600>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.204800,0.000000,-8.865400>}
box{<0,0,-0.406400><0.183345,0.035000,0.406400> rotate<0,-43.494344,0> translate<41.071800,0.000000,-8.991600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<40.894000,0.000000,-26.593800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<41.249600,0.000000,-26.238200>}
box{<0,0,-0.088900><0.502894,0.035000,0.088900> rotate<0,-44.997030,0> translate<40.894000,0.000000,-26.593800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.427400,0.000000,-18.059400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.427400,0.000000,-20.548600>}
box{<0,0,-0.304800><2.489200,0.035000,0.304800> rotate<0,-90.000000,0> translate<41.427400,0.000000,-20.548600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.196600,0.000000,-17.908600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.427400,0.000000,-18.059400>}
box{<0,0,-0.304800><0.275698,0.035000,0.304800> rotate<0,33.157591,0> translate<41.196600,0.000000,-17.908600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<41.767800,0.000000,-31.234200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<41.783000,0.000000,-31.216600>}
box{<0,0,-0.088900><0.023255,0.035000,0.088900> rotate<0,-49.181670,0> translate<41.767800,0.000000,-31.234200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<41.767800,0.000000,-28.811400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<41.783000,0.000000,-28.905200>}
box{<0,0,-0.088900><0.095024,0.035000,0.088900> rotate<0,80.790076,0> translate<41.767800,0.000000,-28.811400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<41.783000,0.000000,-31.216600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<41.783000,0.000000,-28.905200>}
box{<0,0,-0.088900><2.311400,0.035000,0.088900> rotate<0,90.000000,0> translate<41.783000,0.000000,-28.905200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<40.360600,0.000000,-37.973000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<42.138600,0.000000,-37.973000>}
box{<0,0,-0.088900><1.778000,0.035000,0.088900> rotate<0,0.000000,0> translate<40.360600,0.000000,-37.973000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<41.071800,0.000000,-33.705800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<42.138600,0.000000,-33.705800>}
box{<0,0,-0.088900><1.066800,0.035000,0.088900> rotate<0,0.000000,0> translate<41.071800,0.000000,-33.705800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<41.783000,0.000000,-31.216600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<42.138600,0.000000,-30.861000>}
box{<0,0,-0.088900><0.502894,0.035000,0.088900> rotate<0,-44.997030,0> translate<41.783000,0.000000,-31.216600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<42.138600,0.000000,-37.973000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<42.304600,0.000000,-37.896800>}
box{<0,0,-0.088900><0.182654,0.035000,0.088900> rotate<0,-24.655206,0> translate<42.138600,0.000000,-37.973000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<42.138600,0.000000,-33.705800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<42.304600,0.000000,-33.782000>}
box{<0,0,-0.088900><0.182654,0.035000,0.088900> rotate<0,24.655206,0> translate<42.138600,0.000000,-33.705800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<40.182800,0.000000,-44.729400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<42.316400,0.000000,-44.729400>}
box{<0,0,-0.088900><2.133600,0.035000,0.088900> rotate<0,0.000000,0> translate<40.182800,0.000000,-44.729400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<41.071800,0.000000,-40.462200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<42.316400,0.000000,-40.462200>}
box{<0,0,-0.088900><1.244600,0.035000,0.088900> rotate<0,0.000000,0> translate<41.071800,0.000000,-40.462200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<41.249600,0.000000,-26.238200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<42.316400,0.000000,-26.238200>}
box{<0,0,-0.088900><1.066800,0.035000,0.088900> rotate<0,0.000000,0> translate<41.249600,0.000000,-26.238200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<42.316400,0.000000,-26.238200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<42.431600,0.000000,-26.162000>}
box{<0,0,-0.088900><0.138121,0.035000,0.088900> rotate<0,-33.480766,0> translate<42.316400,0.000000,-26.238200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<42.316400,0.000000,-40.462200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<42.443400,0.000000,-40.602800>}
box{<0,0,-0.088900><0.189466,0.035000,0.088900> rotate<0,47.906228,0> translate<42.316400,0.000000,-40.462200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<42.316400,0.000000,-44.729400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<42.457000,0.000000,-44.704000>}
box{<0,0,-0.088900><0.142876,0.035000,0.088900> rotate<0,-10.239608,0> translate<42.316400,0.000000,-44.729400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<42.138600,0.000000,-30.861000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<43.205400,0.000000,-30.861000>}
box{<0,0,-0.088900><1.066800,0.035000,0.088900> rotate<0,0.000000,0> translate<42.138600,0.000000,-30.861000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<43.205400,0.000000,-30.861000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<43.230800,0.000000,-30.745800>}
box{<0,0,-0.088900><0.117967,0.035000,0.088900> rotate<0,-77.560899,0> translate<43.205400,0.000000,-30.861000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<43.916600,0.000000,-33.705800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.004600,0.000000,-33.782000>}
box{<0,0,-0.088900><0.116406,0.035000,0.088900> rotate<0,40.886888,0> translate<43.916600,0.000000,-33.705800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.004600,0.000000,-37.896800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.094400,0.000000,-37.973000>}
box{<0,0,-0.088900><0.117773,0.035000,0.088900> rotate<0,40.313688,0> translate<44.004600,0.000000,-37.896800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.004600,0.000000,-37.896800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.094400,0.000000,-37.795200>}
box{<0,0,-0.088900><0.135597,0.035000,0.088900> rotate<0,-48.524674,0> translate<44.004600,0.000000,-37.896800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.004600,0.000000,-33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.094400,0.000000,-33.883600>}
box{<0,0,-0.088900><0.135597,0.035000,0.088900> rotate<0,48.524674,0> translate<44.004600,0.000000,-33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.094400,0.000000,-37.795200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.094400,0.000000,-33.883600>}
box{<0,0,-0.088900><3.911600,0.035000,0.088900> rotate<0,90.000000,0> translate<44.094400,0.000000,-33.883600> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<35.915600,0.000000,-18.059400>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.094400,0.000000,-26.238200>}
box{<0,0,-0.088900><11.566570,0.035000,0.088900> rotate<0,44.997030,0> translate<35.915600,0.000000,-18.059400> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.094400,0.000000,-26.238200>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.131600,0.000000,-26.162000>}
box{<0,0,-0.088900><0.084796,0.035000,0.088900> rotate<0,-63.974657,0> translate<44.094400,0.000000,-26.238200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.157000,0.000000,-44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.272200,0.000000,-44.551600>}
box{<0,0,-0.088900><0.191041,0.035000,0.088900> rotate<0,-52.910672,0> translate<44.157000,0.000000,-44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.094400,0.000000,-37.973000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.272200,0.000000,-38.150800>}
box{<0,0,-0.088900><0.251447,0.035000,0.088900> rotate<0,44.997030,0> translate<44.094400,0.000000,-37.973000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.272200,0.000000,-44.551600>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.272200,0.000000,-38.150800>}
box{<0,0,-0.088900><6.400800,0.035000,0.088900> rotate<0,90.000000,0> translate<44.272200,0.000000,-38.150800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.131600,0.000000,-26.162000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.272200,0.000000,-26.238200>}
box{<0,0,-0.088900><0.159921,0.035000,0.088900> rotate<0,28.454177,0> translate<44.131600,0.000000,-26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.272200,0.000000,-27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.272200,0.000000,-26.238200>}
box{<0,0,-0.088900><1.066800,0.035000,0.088900> rotate<0,90.000000,0> translate<44.272200,0.000000,-26.238200> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<43.916600,0.000000,-33.705800>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.983400,0.000000,-32.639000>}
box{<0,0,-0.088900><1.508683,0.035000,0.088900> rotate<0,-44.997030,0> translate<43.916600,0.000000,-33.705800> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.272200,0.000000,-27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.983400,0.000000,-28.016200>}
box{<0,0,-0.088900><1.005789,0.035000,0.088900> rotate<0,44.997030,0> translate<44.272200,0.000000,-27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.983400,0.000000,-32.639000>}
cylinder{<0,0,0><0,0.035000,0>0.088900 translate<44.983400,0.000000,-28.016200>}
box{<0,0,-0.088900><4.622800,0.035000,0.088900> rotate<0,90.000000,0> translate<44.983400,0.000000,-28.016200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.182800,0.000000,-56.286400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.228000,0.000000,-50.241200>}
box{<0,0,-0.304800><8.549204,0.035000,0.304800> rotate<0,-44.997030,0> translate<40.182800,0.000000,-56.286400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.228000,0.000000,-50.241200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.761400,0.000000,-50.241200>}
box{<0,0,-0.304800><0.533400,0.035000,0.304800> rotate<0,0.000000,0> translate<46.228000,0.000000,-50.241200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.761400,0.000000,-25.882600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.761400,0.000000,-50.063400>}
box{<0,0,-0.304800><24.180800,0.035000,0.304800> rotate<0,-90.000000,0> translate<46.761400,0.000000,-50.063400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.427400,0.000000,-20.548600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.761400,0.000000,-25.882600>}
box{<0,0,-0.304800><7.543415,0.035000,0.304800> rotate<0,44.997030,0> translate<41.427400,0.000000,-20.548600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.761400,0.000000,-50.241200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.842000,0.000000,-50.393600>}
box{<0,0,-0.304800><0.172401,0.035000,0.304800> rotate<0,62.122817,0> translate<46.761400,0.000000,-50.241200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.761400,0.000000,-50.063400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.842000,0.000000,-50.393600>}
box{<0,0,-0.304800><0.339895,0.035000,0.304800> rotate<0,76.277619,0> translate<46.761400,0.000000,-50.063400> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<0.000000,0.000000,-60.452000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<0.000000,0.000000,0.000000>}
box{<0,0,-0.317500><60.452000,0.035000,0.317500> rotate<0,90.000000,0> translate<0.000000,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<0.000000,-1.535000,-60.452000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<0.000000,-1.535000,0.000000>}
box{<0,0,-0.317500><60.452000,0.035000,0.317500> rotate<0,90.000000,0> translate<0.000000,-1.535000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<0.000000,0.000000,-60.452000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<48.158400,0.000000,-60.452000>}
box{<0,0,-0.317500><48.158400,0.035000,0.317500> rotate<0,0.000000,0> translate<0.000000,0.000000,-60.452000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<0.000000,-1.535000,-60.452000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<48.158400,-1.535000,-60.452000>}
box{<0,0,-0.317500><48.158400,0.035000,0.317500> rotate<0,0.000000,0> translate<0.000000,-1.535000,-60.452000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<0.000000,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<48.158400,0.000000,0.000000>}
box{<0,0,-0.317500><48.158400,0.035000,0.317500> rotate<0,0.000000,0> translate<0.000000,0.000000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<0.000000,-1.535000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<48.158400,-1.535000,0.000000>}
box{<0,0,-0.317500><48.158400,0.035000,0.317500> rotate<0,0.000000,0> translate<0.000000,-1.535000,0.000000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<48.158400,0.000000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<48.158400,0.000000,-60.452000>}
box{<0,0,-0.317500><60.452000,0.035000,0.317500> rotate<0,-90.000000,0> translate<48.158400,0.000000,-60.452000> }
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<48.158400,-1.535000,0.000000>}
cylinder{<0,0,0><0,0.035000,0>0.317500 translate<48.158400,-1.535000,-60.452000>}
box{<0,0,-0.317500><60.452000,0.035000,0.317500> rotate<0,-90.000000,0> translate<48.158400,-1.535000,-60.452000> }
texture{col_pol}
}
#end
union{
cylinder{<3.632200,0.038000,-11.226800><3.632200,-1.538000,-11.226800>0.508000}
cylinder{<3.632200,0.038000,-13.766800><3.632200,-1.538000,-13.766800>0.508000}
cylinder{<3.632200,0.038000,-16.306800><3.632200,-1.538000,-16.306800>0.508000}
cylinder{<3.632200,0.038000,-18.846800><3.632200,-1.538000,-18.846800>0.508000}
cylinder{<3.632200,0.038000,-21.386800><3.632200,-1.538000,-21.386800>0.508000}
cylinder{<3.632200,0.038000,-23.926800><3.632200,-1.538000,-23.926800>0.508000}
cylinder{<3.632200,0.038000,-26.466800><3.632200,-1.538000,-26.466800>0.508000}
cylinder{<3.632200,0.038000,-29.006800><3.632200,-1.538000,-29.006800>0.508000}
cylinder{<3.632200,0.038000,-31.546800><3.632200,-1.538000,-31.546800>0.508000}
cylinder{<3.632200,0.038000,-34.086800><3.632200,-1.538000,-34.086800>0.508000}
cylinder{<3.632200,0.038000,-36.626800><3.632200,-1.538000,-36.626800>0.508000}
cylinder{<13.208000,0.038000,-40.157400><13.208000,-1.538000,-40.157400>0.508000}
cylinder{<13.208000,0.038000,-42.697400><13.208000,-1.538000,-42.697400>0.508000}
cylinder{<13.208000,0.038000,-45.237400><13.208000,-1.538000,-45.237400>0.508000}
cylinder{<9.448800,0.038000,-31.902400><9.448800,-1.538000,-31.902400>0.508000}
cylinder{<9.448800,0.038000,-34.442400><9.448800,-1.538000,-34.442400>0.508000}
cylinder{<9.448800,0.038000,-36.982400><9.448800,-1.538000,-36.982400>0.508000}
cylinder{<15.748000,0.038000,-42.697400><15.748000,-1.538000,-42.697400>0.508000}
cylinder{<11.988800,0.038000,-34.417000><11.988800,-1.538000,-34.417000>0.508000}
//Holes(fast)/Vias
cylinder{<36.626800,0.038000,-26.238200><36.626800,-1.538000,-26.238200>0.406400 }
cylinder{<30.048200,0.038000,-14.147800><30.048200,-1.538000,-14.147800>0.406400 }
cylinder{<39.649400,0.038000,-8.991600><39.649400,-1.538000,-8.991600>0.406400 }
cylinder{<14.757400,0.038000,-17.881600><14.757400,-1.538000,-17.881600>0.406400 }
cylinder{<10.490200,0.038000,-6.680200><10.490200,-1.538000,-6.680200>0.304800 }
cylinder{<5.511800,0.038000,-45.618400><5.511800,-1.538000,-45.618400>0.304800 }
cylinder{<19.024600,0.038000,-55.397400><19.024600,-1.538000,-55.397400>0.304800 }
cylinder{<6.400800,0.038000,-42.418000><6.400800,-1.538000,-42.418000>0.203200 }
cylinder{<30.403800,0.038000,-43.840400><30.403800,-1.538000,-43.840400>0.203200 }
cylinder{<37.338000,0.038000,-46.151800><37.338000,-1.538000,-46.151800>0.203200 }
cylinder{<28.092400,0.038000,-35.839400><28.092400,-1.538000,-35.839400>0.406400 }
cylinder{<14.935200,0.038000,-29.438600><14.935200,-1.538000,-29.438600>0.406400 }
cylinder{<8.178800,0.038000,-51.841400><8.178800,-1.538000,-51.841400>0.406400 }
cylinder{<9.423400,0.038000,-46.863000><9.423400,-1.538000,-46.863000>0.406400 }
cylinder{<16.357600,0.038000,-52.019200><16.357600,-1.538000,-52.019200>0.406400 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.825800,0.000000,-7.340400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.537800,0.000000,-7.340400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<31.825800,0.000000,-7.340400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.825800,0.000000,-8.191400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.537800,0.000000,-8.191400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<31.825800,0.000000,-8.191400> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<32.181800,0.000000,-7.741900>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<32.181800,0.000000,-7.802900>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,-90.000000,0> translate<32.181800,0.000000,-7.802900> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<31.593600,0.000000,-7.767300>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<32.762000,0.000000,-7.767300>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.825800,0.000000,-9.474000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.537800,0.000000,-9.474000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<31.825800,0.000000,-9.474000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.825800,0.000000,-10.325000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.537800,0.000000,-10.325000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<31.825800,0.000000,-10.325000> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<32.181800,0.000000,-9.875500>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<32.181800,0.000000,-9.936500>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,-90.000000,0> translate<32.181800,0.000000,-9.936500> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<31.593600,0.000000,-9.900900>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<32.762000,0.000000,-9.900900>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.510600,0.000000,-34.214000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.798600,0.000000,-34.214000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<42.798600,0.000000,-34.214000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.510600,0.000000,-33.363000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.798600,0.000000,-33.363000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<42.798600,0.000000,-33.363000> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<43.154600,0.000000,-33.812500>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<43.154600,0.000000,-33.751500>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,90.000000,0> translate<43.154600,0.000000,-33.751500> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<43.742600,0.000000,-33.787100>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<42.574400,0.000000,-33.787100>}
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.637600,0.000000,-26.594000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.925600,0.000000,-26.594000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<42.925600,0.000000,-26.594000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.637600,0.000000,-25.743000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.925600,0.000000,-25.743000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<42.925600,0.000000,-25.743000> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<43.281600,0.000000,-26.192500>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<43.281600,0.000000,-26.131500>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,90.000000,0> translate<43.281600,0.000000,-26.131500> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<43.869600,0.000000,-26.167100>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<42.701400,0.000000,-26.167100>}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<41.904800,0.000000,-11.015400>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<34.604800,0.000000,-11.015400>}
box{<0,0,0.000000><7.300000,0.036000,0.000000> rotate<0,0.000000,0> translate<34.604800,0.000000,-11.015400> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<34.604800,0.000000,-11.015400>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<34.604800,0.000000,-6.715400>}
box{<0,0,0.000000><4.300000,0.036000,0.000000> rotate<0,90.000000,0> translate<34.604800,0.000000,-6.715400> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<34.604800,0.000000,-6.715400>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<41.904800,0.000000,-6.715400>}
box{<0,0,0.000000><7.300000,0.036000,0.000000> rotate<0,0.000000,0> translate<34.604800,0.000000,-6.715400> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<41.904800,0.000000,-6.715400>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<41.904800,0.000000,-11.015400>}
box{<0,0,0.000000><4.300000,0.036000,0.000000> rotate<0,-90.000000,0> translate<41.904800,0.000000,-11.015400> }
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.798800,0.000000,-30.251800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.798800,0.000000,-29.539800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<42.798800,0.000000,-29.539800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.649800,0.000000,-30.251800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.649800,0.000000,-29.539800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<43.649800,0.000000,-29.539800> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<43.200300,0.000000,-29.895800>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<43.261300,0.000000,-29.895800>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,0.000000,0> translate<43.200300,0.000000,-29.895800> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-90.000000,0> translate<43.225600,0.000000,-30.483900>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-90.000000,0> translate<43.225700,0.000000,-29.315600>}
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.948000,0.000000,-31.521600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.236000,0.000000,-31.521600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<37.236000,0.000000,-31.521600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.948000,0.000000,-30.670600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.236000,0.000000,-30.670600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<37.236000,0.000000,-30.670600> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<37.592000,0.000000,-31.120100>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<37.592000,0.000000,-31.059100>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,90.000000,0> translate<37.592000,0.000000,-31.059100> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<38.180000,0.000000,-31.094700>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<37.011800,0.000000,-31.094700>}
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.524600,0.000000,-30.861200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.812600,0.000000,-30.861200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.812600,0.000000,-30.861200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.524600,0.000000,-30.010200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.812600,0.000000,-30.010200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.812600,0.000000,-30.010200> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<28.168600,0.000000,-30.459700>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<28.168600,0.000000,-30.398700>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,90.000000,0> translate<28.168600,0.000000,-30.398700> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<28.756600,0.000000,-30.434300>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<27.588400,0.000000,-30.434300>}
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.524600,0.000000,-32.232800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.812600,0.000000,-32.232800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.812600,0.000000,-32.232800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.524600,0.000000,-31.381800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.812600,0.000000,-31.381800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.812600,0.000000,-31.381800> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<28.168600,0.000000,-31.831300>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<28.168600,0.000000,-31.770300>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,90.000000,0> translate<28.168600,0.000000,-31.770300> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<28.756600,0.000000,-31.805900>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<27.588400,0.000000,-31.805900>}
//C10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.597200,0.000000,-34.137400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.309200,0.000000,-34.137400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<31.597200,0.000000,-34.137400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.597200,0.000000,-34.988400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.309200,0.000000,-34.988400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<31.597200,0.000000,-34.988400> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<31.953200,0.000000,-34.538900>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<31.953200,0.000000,-34.599900>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,-90.000000,0> translate<31.953200,0.000000,-34.599900> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<31.365000,0.000000,-34.564300>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<32.533400,0.000000,-34.564300>}
//C11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.663000,0.000000,-45.136000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.951000,0.000000,-45.136000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<42.951000,0.000000,-45.136000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.663000,0.000000,-44.285000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.951000,0.000000,-44.285000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<42.951000,0.000000,-44.285000> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<43.307000,0.000000,-44.734500>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<43.307000,0.000000,-44.673500>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,90.000000,0> translate<43.307000,0.000000,-44.673500> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<43.895000,0.000000,-44.709100>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<42.726800,0.000000,-44.709100>}
//C12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.510600,0.000000,-38.328800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.798600,0.000000,-38.328800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<42.798600,0.000000,-38.328800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.510600,0.000000,-37.477800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.798600,0.000000,-37.477800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<42.798600,0.000000,-37.477800> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<43.154600,0.000000,-37.927300>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<43.154600,0.000000,-37.866300>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,90.000000,0> translate<43.154600,0.000000,-37.866300> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<43.742600,0.000000,-37.901900>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<42.574400,0.000000,-37.901900>}
//C13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.875400,0.000000,-41.096800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.875400,0.000000,-41.808800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<42.875400,0.000000,-41.808800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.024400,0.000000,-41.096800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.024400,0.000000,-41.808800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<42.024400,0.000000,-41.808800> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<42.473900,0.000000,-41.452800>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<42.412900,0.000000,-41.452800>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,0.000000,0> translate<42.412900,0.000000,-41.452800> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-270.000000,0> translate<42.448400,0.000000,-40.864700>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-270.000000,0> translate<42.448500,0.000000,-42.033000>}
//C14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.160600,0.000000,-45.415400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.448600,0.000000,-45.415400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<36.448600,0.000000,-45.415400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.160600,0.000000,-44.564400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.448600,0.000000,-44.564400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<36.448600,0.000000,-44.564400> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<36.804600,0.000000,-45.013900>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<36.804600,0.000000,-44.952900>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,90.000000,0> translate<36.804600,0.000000,-44.952900> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<37.392600,0.000000,-44.988500>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<36.224400,0.000000,-44.988500>}
//C15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.965000,0.000000,-38.836400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.677000,0.000000,-38.836400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.965000,0.000000,-38.836400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.965000,0.000000,-39.687400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.677000,0.000000,-39.687400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.965000,0.000000,-39.687400> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<28.321000,0.000000,-39.237900>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<28.321000,0.000000,-39.298900>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,-90.000000,0> translate<28.321000,0.000000,-39.298900> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<27.732800,0.000000,-39.263300>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<28.901200,0.000000,-39.263300>}
//C16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.485000,0.000000,-27.737000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.773000,0.000000,-27.737000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<15.773000,0.000000,-27.737000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.485000,0.000000,-26.886000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.773000,0.000000,-26.886000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<15.773000,0.000000,-26.886000> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<16.129000,0.000000,-27.335500>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<16.129000,0.000000,-27.274500>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,90.000000,0> translate<16.129000,0.000000,-27.274500> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<16.717000,0.000000,-27.310100>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<15.548800,0.000000,-27.310100>}
//C17 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.965000,0.000000,-45.313400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.677000,0.000000,-45.313400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.965000,0.000000,-45.313400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.965000,0.000000,-46.164400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.677000,0.000000,-46.164400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.965000,0.000000,-46.164400> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<28.321000,0.000000,-45.714900>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<28.321000,0.000000,-45.775900>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,-90.000000,0> translate<28.321000,0.000000,-45.775900> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<27.732800,0.000000,-45.740300>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<28.901200,0.000000,-45.740300>}
//C18 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.160400,0.000000,-27.737000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.448400,0.000000,-27.737000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<9.448400,0.000000,-27.737000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.160400,0.000000,-26.886000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.448400,0.000000,-26.886000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<9.448400,0.000000,-26.886000> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<9.804400,0.000000,-27.335500>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<9.804400,0.000000,-27.274500>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,90.000000,0> translate<9.804400,0.000000,-27.274500> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<10.392400,0.000000,-27.310100>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<9.224200,0.000000,-27.310100>}
//C19 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.109600,0.000000,-26.213000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.397600,0.000000,-26.213000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<9.397600,0.000000,-26.213000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.109600,0.000000,-25.362000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.397600,0.000000,-25.362000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<9.397600,0.000000,-25.362000> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<9.753600,0.000000,-25.811500>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<9.753600,0.000000,-25.750500>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,90.000000,0> translate<9.753600,0.000000,-25.750500> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<10.341600,0.000000,-25.786100>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<9.173400,0.000000,-25.786100>}
//C40 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.161200,0.000000,-50.012200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.161200,0.000000,-50.724200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<18.161200,0.000000,-50.724200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.310200,0.000000,-50.012200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.310200,0.000000,-50.724200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<17.310200,0.000000,-50.724200> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<17.759700,0.000000,-50.368200>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<17.698700,0.000000,-50.368200>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,0.000000,0> translate<17.698700,0.000000,-50.368200> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-270.000000,0> translate<17.734200,0.000000,-49.780100>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-270.000000,0> translate<17.734300,0.000000,-50.948400>}
//C41 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.452000,0.000000,-40.335400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.740000,0.000000,-40.335400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<5.740000,0.000000,-40.335400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.452000,0.000000,-39.484400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.740000,0.000000,-39.484400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<5.740000,0.000000,-39.484400> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<6.096000,0.000000,-39.933900>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<6.096000,0.000000,-39.872900>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,90.000000,0> translate<6.096000,0.000000,-39.872900> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<6.684000,0.000000,-39.908500>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<5.515800,0.000000,-39.908500>}
//C96 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.540600,0.000000,-8.635800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.252600,0.000000,-8.635800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<10.540600,0.000000,-8.635800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.540600,0.000000,-9.486800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.252600,0.000000,-9.486800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<10.540600,0.000000,-9.486800> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<10.896600,0.000000,-9.037300>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<10.896600,0.000000,-9.098300>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,-90.000000,0> translate<10.896600,0.000000,-9.098300> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<10.308400,0.000000,-9.062700>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<11.476800,0.000000,-9.062700>}
//C98 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.566000,0.000000,-12.471200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.278000,0.000000,-12.471200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<10.566000,0.000000,-12.471200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.566000,0.000000,-13.322200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.278000,0.000000,-13.322200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<10.566000,0.000000,-13.322200> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<10.922000,0.000000,-12.872700>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<10.922000,0.000000,-12.933700>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,-90.000000,0> translate<10.922000,0.000000,-12.933700> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<10.333800,0.000000,-12.898100>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<11.502200,0.000000,-12.898100>}
//C99 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.540600,0.000000,-11.150400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.252600,0.000000,-11.150400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<10.540600,0.000000,-11.150400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.540600,0.000000,-12.001400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.252600,0.000000,-12.001400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<10.540600,0.000000,-12.001400> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<10.896600,0.000000,-11.551900>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<10.896600,0.000000,-11.612900>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,-90.000000,0> translate<10.896600,0.000000,-11.612900> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<10.308400,0.000000,-11.577300>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<11.476800,0.000000,-11.577300>}
//CFB1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.560800,0.000000,-22.510600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.060800,0.000000,-22.510600>}
box{<0,0,-0.101600><1.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<14.060800,0.000000,-22.510600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.060800,0.000000,-22.510600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.060800,0.000000,-20.110600>}
box{<0,0,-0.101600><2.400000,0.036000,0.101600> rotate<0,90.000000,0> translate<14.060800,0.000000,-20.110600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.060800,0.000000,-20.110600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.560800,0.000000,-20.110600>}
box{<0,0,-0.101600><1.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<14.060800,0.000000,-20.110600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.560800,0.000000,-22.510600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.660800,0.000000,-22.510600>}
box{<0,0,-0.101600><1.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<17.560800,0.000000,-22.510600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.660800,0.000000,-22.510600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.060800,0.000000,-22.110600>}
box{<0,0,-0.101600><0.565685,0.036000,0.101600> rotate<0,-44.997030,0> translate<18.660800,0.000000,-22.510600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.060800,0.000000,-22.110600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.060800,0.000000,-20.510600>}
box{<0,0,-0.101600><1.600000,0.036000,0.101600> rotate<0,90.000000,0> translate<19.060800,0.000000,-20.510600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.060800,0.000000,-20.510600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.660800,0.000000,-20.110600>}
box{<0,0,-0.101600><0.565685,0.036000,0.101600> rotate<0,44.997030,0> translate<18.660800,0.000000,-20.110600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.660800,0.000000,-20.110600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.560800,0.000000,-20.110600>}
box{<0,0,-0.101600><1.100000,0.036000,0.101600> rotate<0,0.000000,0> translate<17.560800,0.000000,-20.110600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.941800,0.000000,-20.294600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.941800,0.000000,-22.326600>}
box{<0,0,-0.063500><2.032000,0.036000,0.063500> rotate<0,-90.000000,0> translate<16.941800,0.000000,-22.326600> }
//CFF1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.297000,0.000000,-18.948200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.009000,0.000000,-18.948200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<17.297000,0.000000,-18.948200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.297000,0.000000,-19.799200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.009000,0.000000,-19.799200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<17.297000,0.000000,-19.799200> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<17.653000,0.000000,-19.349700>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<17.653000,0.000000,-19.410700>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,-90.000000,0> translate<17.653000,0.000000,-19.410700> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<17.064800,0.000000,-19.375100>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<18.233200,0.000000,-19.375100>}
//CFF7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.163200,0.000000,-50.266200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.163200,0.000000,-50.978200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<34.163200,0.000000,-50.978200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.312200,0.000000,-50.266200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.312200,0.000000,-50.978200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<33.312200,0.000000,-50.978200> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<33.761700,0.000000,-50.622200>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<33.700700,0.000000,-50.622200>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,0.000000,0> translate<33.700700,0.000000,-50.622200> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-270.000000,0> translate<33.736200,0.000000,-50.034100>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-270.000000,0> translate<33.736300,0.000000,-51.202400>}
//CIN7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.462400,0.000000,-56.895600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.462400,0.000000,-57.607600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<40.462400,0.000000,-57.607600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.611400,0.000000,-56.895600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.611400,0.000000,-57.607600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<39.611400,0.000000,-57.607600> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<40.060900,0.000000,-57.251600>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<39.999900,0.000000,-57.251600>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,0.000000,0> translate<39.999900,0.000000,-57.251600> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-270.000000,0> translate<40.035400,0.000000,-56.663500>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-270.000000,0> translate<40.035500,0.000000,-57.831800>}
//CIN9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.710000,0.000000,-57.099000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.422000,0.000000,-57.099000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<19.710000,0.000000,-57.099000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.710000,0.000000,-57.950000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.422000,0.000000,-57.950000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<19.710000,0.000000,-57.950000> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<20.066000,0.000000,-57.500500>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<20.066000,0.000000,-57.561500>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,-90.000000,0> translate<20.066000,0.000000,-57.561500> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<19.477800,0.000000,-57.525900>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<20.646200,0.000000,-57.525900>}
//CO8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.798200,0.000000,-55.981800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.086200,0.000000,-55.981800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<7.086200,0.000000,-55.981800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.798200,0.000000,-55.130800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.086200,0.000000,-55.130800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<7.086200,0.000000,-55.130800> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<7.442200,0.000000,-55.580300>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<7.442200,0.000000,-55.519300>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,90.000000,0> translate<7.442200,0.000000,-55.519300> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<8.030200,0.000000,-55.554900>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<6.862000,0.000000,-55.554900>}
//COUT silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.690000,0.000000,-50.266200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.690000,0.000000,-50.978200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<32.690000,0.000000,-50.978200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.839000,0.000000,-50.266200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.839000,0.000000,-50.978200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<31.839000,0.000000,-50.978200> }
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<32.288500,0.000000,-50.622200>}
cylinder{<0,0,0><0,0.036000,0>0.279400 translate<32.227500,0.000000,-50.622200>}
box{<0,0,-0.279400><0.061000,0.036000,0.279400> rotate<0,0.000000,0> translate<32.227500,0.000000,-50.622200> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-270.000000,0> translate<32.263000,0.000000,-50.034100>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-270.000000,0> translate<32.263100,0.000000,-51.202400>}
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.447200,0.000000,-31.361200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.447200,0.000000,-33.561200>}
box{<0,0,-0.127000><2.200000,0.036000,0.127000> rotate<0,-90.000000,0> translate<35.447200,0.000000,-33.561200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.447200,0.000000,-33.561200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.047200,0.000000,-33.561200>}
box{<0,0,-0.127000><1.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<34.047200,0.000000,-33.561200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.047200,0.000000,-33.561200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.047200,0.000000,-31.361200>}
box{<0,0,-0.127000><2.200000,0.036000,0.127000> rotate<0,90.000000,0> translate<34.047200,0.000000,-31.361200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.047200,0.000000,-31.361200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.447200,0.000000,-31.361200>}
box{<0,0,-0.127000><1.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<34.047200,0.000000,-31.361200> }
box{<-0.375000,0,-0.425000><0.375000,0.036000,0.425000> rotate<0,-270.000000,0> translate<34.722200,0.000000,-30.886200>}
box{<-0.375000,0,-0.425000><0.375000,0.036000,0.425000> rotate<0,-270.000000,0> translate<34.722200,0.000000,-34.036200>}
box{<-0.450000,0,-0.675000><0.450000,0.036000,0.675000> rotate<0,-270.000000,0> translate<34.772200,0.000000,-31.861200>}
//D2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.990000,0.000000,-38.244600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.990000,0.000000,-40.444600>}
box{<0,0,-0.127000><2.200000,0.036000,0.127000> rotate<0,-90.000000,0> translate<34.990000,0.000000,-40.444600> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.990000,0.000000,-40.444600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.590000,0.000000,-40.444600>}
box{<0,0,-0.127000><1.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<33.590000,0.000000,-40.444600> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.590000,0.000000,-40.444600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.590000,0.000000,-38.244600>}
box{<0,0,-0.127000><2.200000,0.036000,0.127000> rotate<0,90.000000,0> translate<33.590000,0.000000,-38.244600> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.590000,0.000000,-38.244600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.990000,0.000000,-38.244600>}
box{<0,0,-0.127000><1.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<33.590000,0.000000,-38.244600> }
box{<-0.375000,0,-0.425000><0.375000,0.036000,0.425000> rotate<0,-270.000000,0> translate<34.265000,0.000000,-37.769600>}
box{<-0.375000,0,-0.425000><0.375000,0.036000,0.425000> rotate<0,-270.000000,0> translate<34.265000,0.000000,-40.919600>}
box{<-0.450000,0,-0.675000><0.450000,0.036000,0.675000> rotate<0,-270.000000,0> translate<34.315000,0.000000,-38.744600>}
//D4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.452800,0.000000,-13.454200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.452800,0.000000,-15.654200>}
box{<0,0,-0.127000><2.200000,0.036000,0.127000> rotate<0,-90.000000,0> translate<29.452800,0.000000,-15.654200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.452800,0.000000,-15.654200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.052800,0.000000,-15.654200>}
box{<0,0,-0.127000><1.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<28.052800,0.000000,-15.654200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.052800,0.000000,-15.654200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.052800,0.000000,-13.454200>}
box{<0,0,-0.127000><2.200000,0.036000,0.127000> rotate<0,90.000000,0> translate<28.052800,0.000000,-13.454200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<28.052800,0.000000,-13.454200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<29.452800,0.000000,-13.454200>}
box{<0,0,-0.127000><1.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<28.052800,0.000000,-13.454200> }
box{<-0.375000,0,-0.425000><0.375000,0.036000,0.425000> rotate<0,-270.000000,0> translate<28.727800,0.000000,-12.979200>}
box{<-0.375000,0,-0.425000><0.375000,0.036000,0.425000> rotate<0,-270.000000,0> translate<28.727800,0.000000,-16.129200>}
box{<-0.450000,0,-0.675000><0.450000,0.036000,0.675000> rotate<0,-270.000000,0> translate<28.777800,0.000000,-13.954200>}
//D6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.319200,0.000000,-50.157200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.319200,0.000000,-52.357200>}
box{<0,0,-0.127000><2.200000,0.036000,0.127000> rotate<0,-90.000000,0> translate<27.319200,0.000000,-52.357200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.319200,0.000000,-52.357200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.919200,0.000000,-52.357200>}
box{<0,0,-0.127000><1.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<25.919200,0.000000,-52.357200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.919200,0.000000,-52.357200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.919200,0.000000,-50.157200>}
box{<0,0,-0.127000><2.200000,0.036000,0.127000> rotate<0,90.000000,0> translate<25.919200,0.000000,-50.157200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<25.919200,0.000000,-50.157200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<27.319200,0.000000,-50.157200>}
box{<0,0,-0.127000><1.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<25.919200,0.000000,-50.157200> }
box{<-0.375000,0,-0.425000><0.375000,0.036000,0.425000> rotate<0,-270.000000,0> translate<26.594200,0.000000,-49.682200>}
box{<-0.375000,0,-0.425000><0.375000,0.036000,0.425000> rotate<0,-270.000000,0> translate<26.594200,0.000000,-52.832200>}
box{<-0.450000,0,-0.675000><0.450000,0.036000,0.675000> rotate<0,-270.000000,0> translate<26.644200,0.000000,-50.657200>}
//D7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.638200,0.000000,-49.319000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.638200,0.000000,-51.519000>}
box{<0,0,-0.127000><2.200000,0.036000,0.127000> rotate<0,-90.000000,0> translate<39.638200,0.000000,-51.519000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.638200,0.000000,-51.519000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.238200,0.000000,-51.519000>}
box{<0,0,-0.127000><1.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<38.238200,0.000000,-51.519000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.238200,0.000000,-51.519000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.238200,0.000000,-49.319000>}
box{<0,0,-0.127000><2.200000,0.036000,0.127000> rotate<0,90.000000,0> translate<38.238200,0.000000,-49.319000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.238200,0.000000,-49.319000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.638200,0.000000,-49.319000>}
box{<0,0,-0.127000><1.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<38.238200,0.000000,-49.319000> }
box{<-0.375000,0,-0.425000><0.375000,0.036000,0.425000> rotate<0,-270.000000,0> translate<38.913200,0.000000,-48.844000>}
box{<-0.375000,0,-0.425000><0.375000,0.036000,0.425000> rotate<0,-270.000000,0> translate<38.913200,0.000000,-51.994000>}
box{<-0.450000,0,-0.675000><0.450000,0.036000,0.675000> rotate<0,-270.000000,0> translate<38.963200,0.000000,-49.819000>}
//D8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<4.807200,0.000000,-49.211200>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<4.807200,0.000000,-53.911200>}
box{<0,0,0.000000><4.700000,0.036000,0.000000> rotate<0,-90.000000,0> translate<4.807200,0.000000,-53.911200> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<4.807200,0.000000,-53.911200>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<8.607200,0.000000,-53.911200>}
box{<0,0,0.000000><3.800000,0.036000,0.000000> rotate<0,0.000000,0> translate<4.807200,0.000000,-53.911200> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<8.607200,0.000000,-53.911200>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<8.607200,0.000000,-49.211200>}
box{<0,0,0.000000><4.700000,0.036000,0.000000> rotate<0,90.000000,0> translate<8.607200,0.000000,-49.211200> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<8.607200,0.000000,-49.211200>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<4.807200,0.000000,-49.211200>}
box{<0,0,0.000000><3.800000,0.036000,0.000000> rotate<0,0.000000,0> translate<4.807200,0.000000,-49.211200> }
//D9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.283400,0.000000,-50.436600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.283400,0.000000,-52.636600>}
box{<0,0,-0.127000><2.200000,0.036000,0.127000> rotate<0,-90.000000,0> translate<20.283400,0.000000,-52.636600> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.283400,0.000000,-52.636600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.883400,0.000000,-52.636600>}
box{<0,0,-0.127000><1.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<18.883400,0.000000,-52.636600> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.883400,0.000000,-52.636600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.883400,0.000000,-50.436600>}
box{<0,0,-0.127000><2.200000,0.036000,0.127000> rotate<0,90.000000,0> translate<18.883400,0.000000,-50.436600> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.883400,0.000000,-50.436600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.283400,0.000000,-50.436600>}
box{<0,0,-0.127000><1.400000,0.036000,0.127000> rotate<0,0.000000,0> translate<18.883400,0.000000,-50.436600> }
box{<-0.375000,0,-0.425000><0.375000,0.036000,0.425000> rotate<0,-270.000000,0> translate<19.558400,0.000000,-49.961600>}
box{<-0.375000,0,-0.425000><0.375000,0.036000,0.425000> rotate<0,-270.000000,0> translate<19.558400,0.000000,-53.111600>}
box{<-0.450000,0,-0.675000><0.450000,0.036000,0.675000> rotate<0,-270.000000,0> translate<19.608400,0.000000,-50.936600>}
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-25.831800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-27.101800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.902200,0.000000,-27.101800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-27.101800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-27.736800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.267200,0.000000,-27.736800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-27.736800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-27.101800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.362200,0.000000,-27.101800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-22.656800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-23.291800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<4.267200,0.000000,-22.656800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-23.291800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-24.561800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.902200,0.000000,-24.561800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-24.561800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-25.196800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.267200,0.000000,-25.196800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-25.196800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-24.561800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.362200,0.000000,-24.561800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-24.561800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-23.291800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.362200,0.000000,-23.291800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-23.291800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-22.656800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.362200,0.000000,-23.291800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-25.831800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-25.196800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<4.267200,0.000000,-25.196800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-25.196800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-25.831800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.362200,0.000000,-25.831800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-27.101800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-25.831800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.362200,0.000000,-25.831800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-18.211800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-19.481800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.902200,0.000000,-19.481800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-19.481800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-20.116800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.267200,0.000000,-20.116800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-20.116800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-19.481800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.362200,0.000000,-19.481800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-20.116800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-20.751800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<4.267200,0.000000,-20.116800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-20.751800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-22.021800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.902200,0.000000,-22.021800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-22.021800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-22.656800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.267200,0.000000,-22.656800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-22.656800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-22.021800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.362200,0.000000,-22.021800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-22.021800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-20.751800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.362200,0.000000,-20.751800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-20.751800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-20.116800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.362200,0.000000,-20.751800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-15.036800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-15.671800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<4.267200,0.000000,-15.036800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-15.671800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-16.941800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.902200,0.000000,-16.941800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-16.941800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-17.576800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.267200,0.000000,-17.576800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-17.576800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-16.941800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.362200,0.000000,-16.941800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-16.941800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-15.671800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.362200,0.000000,-15.671800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-15.671800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-15.036800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.362200,0.000000,-15.671800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-18.211800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-17.576800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<4.267200,0.000000,-17.576800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-17.576800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-18.211800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.362200,0.000000,-18.211800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-19.481800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-18.211800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.362200,0.000000,-18.211800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-10.591800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-11.861800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.902200,0.000000,-11.861800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-11.861800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-12.496800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.267200,0.000000,-12.496800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-12.496800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-11.861800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.362200,0.000000,-11.861800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-12.496800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-13.131800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<4.267200,0.000000,-12.496800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-14.401800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.902200,0.000000,-14.401800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-14.401800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-15.036800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.267200,0.000000,-15.036800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-15.036800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-14.401800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.362200,0.000000,-14.401800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-14.401800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-13.131800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.362200,0.000000,-13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-13.131800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-12.496800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.362200,0.000000,-13.131800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-9.956800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-9.956800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.997200,0.000000,-9.956800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-10.591800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-9.956800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<4.267200,0.000000,-9.956800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-9.956800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-10.591800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.362200,0.000000,-10.591800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-11.861800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-10.591800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.362200,0.000000,-10.591800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-28.371800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-29.641800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.902200,0.000000,-29.641800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-29.641800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-30.276800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.267200,0.000000,-30.276800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-30.276800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-29.641800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.362200,0.000000,-29.641800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-28.371800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-27.736800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<4.267200,0.000000,-27.736800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-27.736800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-28.371800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.362200,0.000000,-28.371800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-29.641800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-28.371800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.362200,0.000000,-28.371800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-30.911800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-32.181800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.902200,0.000000,-32.181800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-32.181800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-32.816800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.267200,0.000000,-32.816800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-32.816800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-32.181800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.362200,0.000000,-32.181800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-30.911800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-30.276800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<4.267200,0.000000,-30.276800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-30.276800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-30.911800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.362200,0.000000,-30.911800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-32.181800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-30.911800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.362200,0.000000,-30.911800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-33.451800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-34.721800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.902200,0.000000,-34.721800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-34.721800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-35.356800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.267200,0.000000,-35.356800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-35.356800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-34.721800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.362200,0.000000,-34.721800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-33.451800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-32.816800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<4.267200,0.000000,-32.816800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-32.816800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-33.451800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.362200,0.000000,-33.451800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-34.721800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-33.451800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.362200,0.000000,-33.451800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-35.991800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-37.261800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.902200,0.000000,-37.261800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-37.261800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-37.896800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.267200,0.000000,-37.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-37.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-37.896800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<2.997200,0.000000,-37.896800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-37.896800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-37.261800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.362200,0.000000,-37.261800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.902200,0.000000,-35.991800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.267200,0.000000,-35.356800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<4.267200,0.000000,-35.356800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.997200,0.000000,-35.356800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-35.991800>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.362200,0.000000,-35.991800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-37.261800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.362200,0.000000,-35.991800>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<2.362200,0.000000,-35.991800> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.632200,0.000000,-26.466800>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.632200,0.000000,-23.926800>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.632200,0.000000,-21.386800>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.632200,0.000000,-18.846800>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.632200,0.000000,-16.306800>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.632200,0.000000,-13.766800>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.632200,0.000000,-11.226800>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.632200,0.000000,-29.006800>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.632200,0.000000,-31.546800>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.632200,0.000000,-34.086800>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<3.632200,0.000000,-36.626800>}
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.843000,0.000000,-43.967400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,-44.602400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<13.843000,0.000000,-43.967400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,-44.602400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,-45.872400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<14.478000,0.000000,-45.872400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,-45.872400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.843000,0.000000,-46.507400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<13.843000,0.000000,-46.507400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.573000,0.000000,-46.507400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.938000,0.000000,-45.872400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<11.938000,0.000000,-45.872400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.938000,0.000000,-45.872400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.938000,0.000000,-44.602400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<11.938000,0.000000,-44.602400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.938000,0.000000,-44.602400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.573000,0.000000,-43.967400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<11.938000,0.000000,-44.602400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,-39.522400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,-40.792400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<14.478000,0.000000,-40.792400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,-40.792400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.843000,0.000000,-41.427400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<13.843000,0.000000,-41.427400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.573000,0.000000,-41.427400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.938000,0.000000,-40.792400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<11.938000,0.000000,-40.792400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.843000,0.000000,-41.427400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,-42.062400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<13.843000,0.000000,-41.427400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,-42.062400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,-43.332400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<14.478000,0.000000,-43.332400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,-43.332400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.843000,0.000000,-43.967400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<13.843000,0.000000,-43.967400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.573000,0.000000,-43.967400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.938000,0.000000,-43.332400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<11.938000,0.000000,-43.332400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.938000,0.000000,-43.332400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.938000,0.000000,-42.062400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<11.938000,0.000000,-42.062400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.938000,0.000000,-42.062400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.573000,0.000000,-41.427400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<11.938000,0.000000,-42.062400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.843000,0.000000,-38.887400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.573000,0.000000,-38.887400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<12.573000,0.000000,-38.887400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,-39.522400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.843000,0.000000,-38.887400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<13.843000,0.000000,-38.887400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.573000,0.000000,-38.887400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.938000,0.000000,-39.522400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<11.938000,0.000000,-39.522400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.938000,0.000000,-40.792400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.938000,0.000000,-39.522400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<11.938000,0.000000,-39.522400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.843000,0.000000,-46.507400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.573000,0.000000,-46.507400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<12.573000,0.000000,-46.507400> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<13.208000,0.000000,-45.237400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<13.208000,0.000000,-42.697400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<13.208000,0.000000,-40.157400>}
//JP3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.083800,0.000000,-35.712400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.718800,0.000000,-36.347400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<10.083800,0.000000,-35.712400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.718800,0.000000,-36.347400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.718800,0.000000,-37.617400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<10.718800,0.000000,-37.617400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.718800,0.000000,-37.617400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.083800,0.000000,-38.252400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<10.083800,0.000000,-38.252400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.813800,0.000000,-38.252400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.178800,0.000000,-37.617400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<8.178800,0.000000,-37.617400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.178800,0.000000,-37.617400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.178800,0.000000,-36.347400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<8.178800,0.000000,-36.347400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.178800,0.000000,-36.347400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.813800,0.000000,-35.712400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<8.178800,0.000000,-36.347400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.718800,0.000000,-31.267400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.718800,0.000000,-32.537400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<10.718800,0.000000,-32.537400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.718800,0.000000,-32.537400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.083800,0.000000,-33.172400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<10.083800,0.000000,-33.172400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.813800,0.000000,-33.172400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.178800,0.000000,-32.537400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<8.178800,0.000000,-32.537400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.083800,0.000000,-33.172400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.718800,0.000000,-33.807400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<10.083800,0.000000,-33.172400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.718800,0.000000,-33.807400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.718800,0.000000,-35.077400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<10.718800,0.000000,-35.077400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.718800,0.000000,-35.077400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.083800,0.000000,-35.712400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<10.083800,0.000000,-35.712400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.813800,0.000000,-35.712400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.178800,0.000000,-35.077400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<8.178800,0.000000,-35.077400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.178800,0.000000,-35.077400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.178800,0.000000,-33.807400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<8.178800,0.000000,-33.807400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.178800,0.000000,-33.807400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.813800,0.000000,-33.172400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<8.178800,0.000000,-33.807400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.083800,0.000000,-30.632400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.813800,0.000000,-30.632400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<8.813800,0.000000,-30.632400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.718800,0.000000,-31.267400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.083800,0.000000,-30.632400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<10.083800,0.000000,-30.632400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.813800,0.000000,-30.632400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.178800,0.000000,-31.267400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<8.178800,0.000000,-31.267400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.178800,0.000000,-32.537400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.178800,0.000000,-31.267400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<8.178800,0.000000,-31.267400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.083800,0.000000,-38.252400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.813800,0.000000,-38.252400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<8.813800,0.000000,-38.252400> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<9.448800,0.000000,-36.982400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<9.448800,0.000000,-34.442400>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<9.448800,0.000000,-31.902400>}
//JP4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.383000,0.000000,-43.967400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.018000,0.000000,-43.332400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<16.383000,0.000000,-43.967400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.018000,0.000000,-43.332400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.018000,0.000000,-42.062400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<17.018000,0.000000,-42.062400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.018000,0.000000,-42.062400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.383000,0.000000,-41.427400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<16.383000,0.000000,-41.427400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.383000,0.000000,-41.427400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.113000,0.000000,-41.427400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.113000,0.000000,-41.427400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.113000,0.000000,-41.427400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,-42.062400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<14.478000,0.000000,-42.062400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,-42.062400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,-43.332400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<14.478000,0.000000,-43.332400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.478000,0.000000,-43.332400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.113000,0.000000,-43.967400>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<14.478000,0.000000,-43.332400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.113000,0.000000,-43.967400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.383000,0.000000,-43.967400>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.113000,0.000000,-43.967400> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<15.748000,0.000000,-42.697400>}
//JP5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.623800,0.000000,-35.687000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.258800,0.000000,-35.052000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<12.623800,0.000000,-35.687000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.258800,0.000000,-35.052000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.258800,0.000000,-33.782000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<13.258800,0.000000,-33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.258800,0.000000,-33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.623800,0.000000,-33.147000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<12.623800,0.000000,-33.147000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.623800,0.000000,-33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.353800,0.000000,-33.147000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<11.353800,0.000000,-33.147000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.353800,0.000000,-33.147000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.718800,0.000000,-33.782000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<10.718800,0.000000,-33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.718800,0.000000,-33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.718800,0.000000,-35.052000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<10.718800,0.000000,-35.052000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.718800,0.000000,-35.052000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.353800,0.000000,-35.687000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<10.718800,0.000000,-35.052000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.353800,0.000000,-35.687000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.623800,0.000000,-35.687000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<11.353800,0.000000,-35.687000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<11.988800,0.000000,-34.417000>}
//L1 silk screen
object{ARC(2.000000,0.100000,180.000000,270.000000,0.036000) translate<32.496600,0.000000,-21.908600>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<30.496600,0.000000,-21.908600>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<30.496600,0.000000,-13.908600>}
box{<0,0,-0.050000><8.000000,0.036000,0.050000> rotate<0,90.000000,0> translate<30.496600,0.000000,-13.908600> }
object{ARC(2.000000,0.100000,90.000000,180.000000,0.036000) translate<32.496600,0.000000,-13.908600>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<40.496600,0.000000,-11.908600>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<32.496600,0.000000,-11.908600>}
box{<0,0,-0.050000><8.000000,0.036000,0.050000> rotate<0,0.000000,0> translate<32.496600,0.000000,-11.908600> }
object{ARC(2.000000,0.100000,0.000000,90.000000,0.036000) translate<40.496600,0.000000,-13.908600>}
object{ARC(2.000000,0.100000,270.000000,360.000000,0.036000) translate<40.496600,0.000000,-21.908600>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<40.496600,0.000000,-23.908600>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<32.496600,0.000000,-23.908600>}
box{<0,0,-0.050000><8.000000,0.036000,0.050000> rotate<0,0.000000,0> translate<32.496600,0.000000,-23.908600> }
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<42.496600,0.000000,-21.908600>}
cylinder{<0,0,0><0,0.036000,0>0.050000 translate<42.496600,0.000000,-13.908600>}
box{<0,0,-0.050000><8.000000,0.036000,0.050000> rotate<0,90.000000,0> translate<42.496600,0.000000,-13.908600> }
//L2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<24.937800,0.000000,-50.992200>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<24.937800,0.000000,-52.792200>}
box{<0,0,0.000000><1.800000,0.036000,0.000000> rotate<0,-90.000000,0> translate<24.937800,0.000000,-52.792200> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<21.137800,0.000000,-52.792200>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<21.137800,0.000000,-49.992200>}
box{<0,0,0.000000><2.800000,0.036000,0.000000> rotate<0,90.000000,0> translate<21.137800,0.000000,-49.992200> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<21.137800,0.000000,-49.992200>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<23.937800,0.000000,-49.992200>}
box{<0,0,0.000000><2.800000,0.036000,0.000000> rotate<0,0.000000,0> translate<21.137800,0.000000,-49.992200> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<23.937800,0.000000,-49.992200>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<24.937800,0.000000,-50.992200>}
box{<0,0,0.000000><1.414214,0.036000,0.000000> rotate<0,44.997030,0> translate<23.937800,0.000000,-49.992200> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<24.937800,0.000000,-52.792200>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<23.937800,0.000000,-53.792200>}
box{<0,0,0.000000><1.414214,0.036000,0.000000> rotate<0,-44.997030,0> translate<23.937800,0.000000,-53.792200> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<21.137800,0.000000,-52.792200>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<22.137800,0.000000,-53.792200>}
box{<0,0,0.000000><1.414214,0.036000,0.000000> rotate<0,44.997030,0> translate<21.137800,0.000000,-52.792200> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<22.137800,0.000000,-53.792200>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<23.937800,0.000000,-53.792200>}
box{<0,0,0.000000><1.800000,0.036000,0.000000> rotate<0,0.000000,0> translate<22.137800,0.000000,-53.792200> }
//L7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.942000,0.000000,-52.393600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.942000,0.000000,-47.393600>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<40.942000,0.000000,-47.393600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.942000,0.000000,-47.393600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.942000,0.000000,-47.393600>}
box{<0,0,-0.063500><6.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<40.942000,0.000000,-47.393600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.942000,0.000000,-47.393600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.942000,0.000000,-52.393600>}
box{<0,0,-0.063500><5.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<46.942000,0.000000,-52.393600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.942000,0.000000,-52.393600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.942000,0.000000,-53.393600>}
box{<0,0,-0.063500><1.414214,0.036000,0.063500> rotate<0,-44.997030,0> translate<45.942000,0.000000,-53.393600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<45.942000,0.000000,-53.393600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.942000,0.000000,-53.393600>}
box{<0,0,-0.063500><4.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<41.942000,0.000000,-53.393600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.942000,0.000000,-53.393600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.942000,0.000000,-52.393600>}
box{<0,0,-0.063500><1.414214,0.036000,0.063500> rotate<0,44.997030,0> translate<40.942000,0.000000,-52.393600> }
//L8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<4.038600,0.000000,-42.860400>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<5.338600,0.000000,-42.860400>}
box{<0,0,0.000000><1.300000,0.036000,0.000000> rotate<0,0.000000,0> translate<4.038600,0.000000,-42.860400> }
object{ARC(0.300000,0.000000,0.000000,90.000000,0.036000) translate<5.338600,0.000000,-43.160400>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<5.638600,0.000000,-43.160400>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<5.638600,0.000000,-46.960400>}
box{<0,0,0.000000><3.800000,0.036000,0.000000> rotate<0,-90.000000,0> translate<5.638600,0.000000,-46.960400> }
object{ARC(0.400000,0.000000,270.000000,360.000000,0.036000) translate<5.238600,0.000000,-46.960400>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<5.238600,0.000000,-47.360400>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<4.038600,0.000000,-47.360400>}
box{<0,0,0.000000><1.200000,0.036000,0.000000> rotate<0,0.000000,0> translate<4.038600,0.000000,-47.360400> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<4.038600,0.000000,-47.360400>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<2.738600,0.000000,-47.360400>}
box{<0,0,0.000000><1.300000,0.036000,0.000000> rotate<0,0.000000,0> translate<2.738600,0.000000,-47.360400> }
object{ARC(0.300000,0.000000,180.000000,270.000000,0.036000) translate<2.738600,0.000000,-47.060400>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<2.438600,0.000000,-47.060400>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<2.438600,0.000000,-43.160400>}
box{<0,0,0.000000><3.900000,0.036000,0.000000> rotate<0,90.000000,0> translate<2.438600,0.000000,-43.160400> }
object{ARC(0.300000,0.000000,90.000000,180.000000,0.036000) translate<2.738600,0.000000,-43.160400>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<2.738600,0.000000,-42.860400>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<4.038600,0.000000,-42.860400>}
box{<0,0,0.000000><1.300000,0.036000,0.000000> rotate<0,0.000000,0> translate<2.738600,0.000000,-42.860400> }
//Q1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.505400,0.000000,-32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.505400,0.000000,-31.191200>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,90.000000,0> translate<30.505400,0.000000,-31.191200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.505400,0.000000,-31.191200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.350200,0.000000,-31.191200>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<30.505400,0.000000,-31.191200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.350200,0.000000,-31.191200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.350200,0.000000,-32.512000>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.350200,0.000000,-32.512000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.350200,0.000000,-32.512000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.505400,0.000000,-32.512000>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<30.505400,0.000000,-32.512000> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-180.000000,0> translate<31.927800,0.000000,-32.854900>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-180.000000,0> translate<30.988000,0.000000,-30.848300>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-180.000000,0> translate<32.867600,0.000000,-30.848300>}
//Q2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.276800,0.000000,-44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.276800,0.000000,-42.875200>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,90.000000,0> translate<30.276800,0.000000,-42.875200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.276800,0.000000,-42.875200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.121600,0.000000,-42.875200>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<30.276800,0.000000,-42.875200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.121600,0.000000,-42.875200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.121600,0.000000,-44.196000>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.121600,0.000000,-44.196000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.121600,0.000000,-44.196000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.276800,0.000000,-44.196000>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<30.276800,0.000000,-44.196000> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-180.000000,0> translate<31.699200,0.000000,-44.538900>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-180.000000,0> translate<30.759400,0.000000,-42.532300>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-180.000000,0> translate<32.639000,0.000000,-42.532300>}
//Q3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.350200,0.000000,-27.025600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.350200,0.000000,-28.346400>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.350200,0.000000,-28.346400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.350200,0.000000,-28.346400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.505400,0.000000,-28.346400>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<30.505400,0.000000,-28.346400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.505400,0.000000,-28.346400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.505400,0.000000,-27.025600>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,90.000000,0> translate<30.505400,0.000000,-27.025600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.505400,0.000000,-27.025600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.350200,0.000000,-27.025600>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<30.505400,0.000000,-27.025600> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-0.000000,0> translate<31.927800,0.000000,-26.682700>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-0.000000,0> translate<32.867600,0.000000,-28.689300>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-0.000000,0> translate<30.988000,0.000000,-28.689300>}
//Q4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.121600,0.000000,-38.608000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.121600,0.000000,-39.928800>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.121600,0.000000,-39.928800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.121600,0.000000,-39.928800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.276800,0.000000,-39.928800>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<30.276800,0.000000,-39.928800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.276800,0.000000,-39.928800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.276800,0.000000,-38.608000>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,90.000000,0> translate<30.276800,0.000000,-38.608000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.276800,0.000000,-38.608000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.121600,0.000000,-38.608000>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<30.276800,0.000000,-38.608000> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-0.000000,0> translate<31.699200,0.000000,-38.265100>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-0.000000,0> translate<32.639000,0.000000,-40.271700>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-0.000000,0> translate<30.759400,0.000000,-40.271700>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.009000,0.000000,-18.516800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.297000,0.000000,-18.516800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<17.297000,0.000000,-18.516800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.009000,0.000000,-17.665800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.297000,0.000000,-17.665800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<17.297000,0.000000,-17.665800> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<18.241000,0.000000,-18.089900>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<17.072800,0.000000,-18.089900>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-180.000000,0> translate<17.653000,0.000000,-18.084800>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.297000,0.000000,-16.382800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.009000,0.000000,-16.382800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<17.297000,0.000000,-16.382800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.297000,0.000000,-17.233800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.009000,0.000000,-17.233800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<17.297000,0.000000,-17.233800> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<17.064800,0.000000,-16.809700>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<18.233200,0.000000,-16.809700>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<17.653000,0.000000,-16.814800>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.236000,0.000000,-27.177800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.948000,0.000000,-27.177800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<37.236000,0.000000,-27.177800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.236000,0.000000,-28.028800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.948000,0.000000,-28.028800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<37.236000,0.000000,-28.028800> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<37.003800,0.000000,-27.604700>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<38.172200,0.000000,-27.604700>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<37.592000,0.000000,-27.609800>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.236000,0.000000,-28.600200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.948000,0.000000,-28.600200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<37.236000,0.000000,-28.600200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.236000,0.000000,-29.451200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.948000,0.000000,-29.451200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<37.236000,0.000000,-29.451200> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<37.003800,0.000000,-29.027100>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<38.172200,0.000000,-29.027100>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<37.592000,0.000000,-29.032200>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.236000,0.000000,-33.324600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.948000,0.000000,-33.324600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<37.236000,0.000000,-33.324600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.236000,0.000000,-34.175600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.948000,0.000000,-34.175600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<37.236000,0.000000,-34.175600> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<37.003800,0.000000,-33.751500>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<38.172200,0.000000,-33.751500>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<37.592000,0.000000,-33.756600>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.236000,0.000000,-32.003800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.948000,0.000000,-32.003800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<37.236000,0.000000,-32.003800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.236000,0.000000,-32.854800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.948000,0.000000,-32.854800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<37.236000,0.000000,-32.854800> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<37.003800,0.000000,-32.430700>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<38.172200,0.000000,-32.430700>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<37.592000,0.000000,-32.435800>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.812600,0.000000,-28.676400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.524600,0.000000,-28.676400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.812600,0.000000,-28.676400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.812600,0.000000,-29.527400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.524600,0.000000,-29.527400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.812600,0.000000,-29.527400> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<27.580400,0.000000,-29.103300>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<28.748800,0.000000,-29.103300>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<28.168600,0.000000,-29.108400>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.524600,0.000000,-28.168800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.812600,0.000000,-28.168800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.812600,0.000000,-28.168800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.524600,0.000000,-27.317800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.812600,0.000000,-27.317800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.812600,0.000000,-27.317800> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<28.756600,0.000000,-27.741900>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<27.588400,0.000000,-27.741900>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-180.000000,0> translate<28.168600,0.000000,-27.736800>}
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.249000,0.000000,-18.948200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.961000,0.000000,-18.948200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<14.249000,0.000000,-18.948200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.249000,0.000000,-19.799200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.961000,0.000000,-19.799200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<14.249000,0.000000,-19.799200> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<14.016800,0.000000,-19.375100>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<15.185200,0.000000,-19.375100>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<14.605000,0.000000,-19.380200>}
//R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.812600,0.000000,-34.137400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.524600,0.000000,-34.137400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.812600,0.000000,-34.137400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.812600,0.000000,-34.988400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.524600,0.000000,-34.988400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.812600,0.000000,-34.988400> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<27.580400,0.000000,-34.564300>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<28.748800,0.000000,-34.564300>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<28.168600,0.000000,-34.569400>}
//R11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.812600,0.000000,-25.984000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.524600,0.000000,-25.984000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.812600,0.000000,-25.984000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.812600,0.000000,-26.835000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.524600,0.000000,-26.835000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.812600,0.000000,-26.835000> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<27.580400,0.000000,-26.410900>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<28.748800,0.000000,-26.410900>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<28.168600,0.000000,-26.416000>}
//R12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.812600,0.000000,-32.765800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.524600,0.000000,-32.765800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.812600,0.000000,-32.765800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.812600,0.000000,-33.616800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.524600,0.000000,-33.616800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.812600,0.000000,-33.616800> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<27.580400,0.000000,-33.192700>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<28.748800,0.000000,-33.192700>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<28.168600,0.000000,-33.197800>}
//R13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.965000,0.000000,-42.722600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.677000,0.000000,-42.722600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.965000,0.000000,-42.722600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.965000,0.000000,-43.573600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.677000,0.000000,-43.573600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.965000,0.000000,-43.573600> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<27.732800,0.000000,-43.149500>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<28.901200,0.000000,-43.149500>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<28.321000,0.000000,-43.154600>}
//R14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.448600,0.000000,-40.004800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.160600,0.000000,-40.004800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<36.448600,0.000000,-40.004800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.448600,0.000000,-40.855800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.160600,0.000000,-40.855800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<36.448600,0.000000,-40.855800> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<36.216400,0.000000,-40.431700>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<37.384800,0.000000,-40.431700>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<36.804600,0.000000,-40.436800>}
//R15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.448600,0.000000,-41.655800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.160600,0.000000,-41.655800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<36.448600,0.000000,-41.655800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.448600,0.000000,-42.506800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.160600,0.000000,-42.506800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<36.448600,0.000000,-42.506800> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<36.216400,0.000000,-42.082700>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<37.384800,0.000000,-42.082700>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<36.804600,0.000000,-42.087800>}
//R16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.448600,0.000000,-43.103600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.160600,0.000000,-43.103600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<36.448600,0.000000,-43.103600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.448600,0.000000,-43.954600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.160600,0.000000,-43.954600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<36.448600,0.000000,-43.954600> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<36.216400,0.000000,-43.530500>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<37.384800,0.000000,-43.530500>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<36.804600,0.000000,-43.535600>}
//R17 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.670800,0.000000,-50.952800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.670800,0.000000,-50.240800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<34.670800,0.000000,-50.240800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.521800,0.000000,-50.952800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.521800,0.000000,-50.240800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<35.521800,0.000000,-50.240800> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-90.000000,0> translate<35.097600,0.000000,-51.184900>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-90.000000,0> translate<35.097700,0.000000,-50.016600>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-90.000000,0> translate<35.102800,0.000000,-50.596800>}
//R18 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.677000,0.000000,-41.021200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.965000,0.000000,-41.021200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.965000,0.000000,-41.021200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.677000,0.000000,-40.170200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.965000,0.000000,-40.170200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.965000,0.000000,-40.170200> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<28.909000,0.000000,-40.594300>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<27.740800,0.000000,-40.594300>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-180.000000,0> translate<28.321000,0.000000,-40.589200>}
//R19 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.965000,0.000000,-44.043400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.677000,0.000000,-44.043400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.965000,0.000000,-44.043400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.965000,0.000000,-44.894400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.677000,0.000000,-44.894400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.965000,0.000000,-44.894400> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<27.732800,0.000000,-44.470300>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<28.901200,0.000000,-44.470300>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<28.321000,0.000000,-44.475400>}
//R20 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.965000,0.000000,-37.566400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.677000,0.000000,-37.566400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.965000,0.000000,-37.566400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.965000,0.000000,-38.417400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.677000,0.000000,-38.417400>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.965000,0.000000,-38.417400> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<27.732800,0.000000,-37.993300>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<28.901200,0.000000,-37.993300>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<28.321000,0.000000,-37.998400>}
//R21 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.973400,0.000000,-26.873000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.685400,0.000000,-26.873000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<18.973400,0.000000,-26.873000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.973400,0.000000,-27.724000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.685400,0.000000,-27.724000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<18.973400,0.000000,-27.724000> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<18.741200,0.000000,-27.299900>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<19.909600,0.000000,-27.299900>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<19.329400,0.000000,-27.305000>}
//R22 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.773000,0.000000,-25.349000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.485000,0.000000,-25.349000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<15.773000,0.000000,-25.349000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.773000,0.000000,-26.200000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.485000,0.000000,-26.200000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<15.773000,0.000000,-26.200000> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<15.540800,0.000000,-25.775900>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<16.709200,0.000000,-25.775900>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<16.129000,0.000000,-25.781000>}
//R23 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.335400,0.000000,-26.213000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.623400,0.000000,-26.213000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<12.623400,0.000000,-26.213000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.335400,0.000000,-25.362000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.623400,0.000000,-25.362000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<12.623400,0.000000,-25.362000> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<13.567400,0.000000,-25.786100>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<12.399200,0.000000,-25.786100>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-180.000000,0> translate<12.979400,0.000000,-25.781000>}
//R24 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.623400,0.000000,-26.873000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.335400,0.000000,-26.873000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<12.623400,0.000000,-26.873000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.623400,0.000000,-27.724000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.335400,0.000000,-27.724000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<12.623400,0.000000,-27.724000> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<12.391200,0.000000,-27.299900>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<13.559600,0.000000,-27.299900>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<12.979400,0.000000,-27.305000>}
//R25 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.326000,0.000000,-57.963000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.614000,0.000000,-57.963000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<13.614000,0.000000,-57.963000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.326000,0.000000,-57.112000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.614000,0.000000,-57.112000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<13.614000,0.000000,-57.112000> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<14.558000,0.000000,-57.536100>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<13.389800,0.000000,-57.536100>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-180.000000,0> translate<13.970000,0.000000,-57.531000>}
//R26 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.374000,0.000000,-57.963000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.662000,0.000000,-57.963000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<16.662000,0.000000,-57.963000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.374000,0.000000,-57.112000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.662000,0.000000,-57.112000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<16.662000,0.000000,-57.112000> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<17.606000,0.000000,-57.536100>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-180.000000,0> translate<16.437800,0.000000,-57.536100>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-180.000000,0> translate<17.018000,0.000000,-57.531000>}
//R27 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.645400,0.000000,-54.153200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.645400,0.000000,-53.441200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<34.645400,0.000000,-53.441200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.496400,0.000000,-54.153200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.496400,0.000000,-53.441200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<35.496400,0.000000,-53.441200> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-90.000000,0> translate<35.072200,0.000000,-54.385300>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-90.000000,0> translate<35.072300,0.000000,-53.217000>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-90.000000,0> translate<35.077400,0.000000,-53.797200>}
//R37 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.965000,0.000000,-41.452600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.677000,0.000000,-41.452600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.965000,0.000000,-41.452600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.965000,0.000000,-42.303600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.677000,0.000000,-42.303600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<27.965000,0.000000,-42.303600> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<27.732800,0.000000,-41.879500>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<28.901200,0.000000,-41.879500>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<28.321000,0.000000,-41.884600>}
//R47 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.880800,0.000000,-48.767600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.880800,0.000000,-49.479600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.880800,0.000000,-49.479600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.029800,0.000000,-48.767600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.029800,0.000000,-49.479600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.029800,0.000000,-49.479600> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-270.000000,0> translate<9.453800,0.000000,-48.535500>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-270.000000,0> translate<9.453900,0.000000,-49.703800>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-270.000000,0> translate<9.448800,0.000000,-49.123600>}
//R49 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.740000,0.000000,-40.893800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.452000,0.000000,-40.893800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<5.740000,0.000000,-40.893800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.740000,0.000000,-41.744800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.452000,0.000000,-41.744800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<5.740000,0.000000,-41.744800> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<5.507800,0.000000,-41.320700>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-0.000000,0> translate<6.676200,0.000000,-41.320700>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-0.000000,0> translate<6.096000,0.000000,-41.325800>}
//R50 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.737800,0.000000,-41.985800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.737800,0.000000,-42.697800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<8.737800,0.000000,-42.697800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.886800,0.000000,-41.985800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.886800,0.000000,-42.697800>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.886800,0.000000,-42.697800> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-270.000000,0> translate<8.310800,0.000000,-41.753700>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-270.000000,0> translate<8.310900,0.000000,-42.922000>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-270.000000,0> translate<8.305800,0.000000,-42.341800>}
//R100 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.192200,0.000000,-6.349600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.192200,0.000000,-7.061600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<12.192200,0.000000,-7.061600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.341200,0.000000,-6.349600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.341200,0.000000,-7.061600>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<11.341200,0.000000,-7.061600> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-270.000000,0> translate<11.765200,0.000000,-6.117500>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-270.000000,0> translate<11.765300,0.000000,-7.285800>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-270.000000,0> translate<11.760200,0.000000,-6.705600>}
//RS silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.452400,0.000000,-52.375200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.452400,0.000000,-51.663200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<14.452400,0.000000,-51.663200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.303400,0.000000,-52.375200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.303400,0.000000,-51.663200>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<15.303400,0.000000,-51.663200> }
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-90.000000,0> translate<14.879200,0.000000,-52.607300>}
box{<-0.250000,0,-0.475000><0.250000,0.036000,0.475000> rotate<0,-90.000000,0> translate<14.879300,0.000000,-51.439000>}
box{<-0.228600,0,-0.381000><0.228600,0.036000,0.381000> rotate<0,-90.000000,0> translate<14.884400,0.000000,-52.019200>}
//U1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.032000,0.000000,-20.904800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.032000,0.000000,-17.804800>}
box{<0,0,-0.063500><3.100000,0.036000,0.063500> rotate<0,90.000000,0> translate<22.032000,0.000000,-17.804800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.032000,0.000000,-17.804800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.132000,0.000000,-17.804800>}
box{<0,0,-0.063500><1.900000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.132000,0.000000,-17.804800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.132000,0.000000,-17.804800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.132000,0.000000,-20.904800>}
box{<0,0,-0.063500><3.100000,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.132000,0.000000,-20.904800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.132000,0.000000,-20.904800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.032000,0.000000,-20.904800>}
box{<0,0,-0.063500><1.900000,0.036000,0.063500> rotate<0,0.000000,0> translate<20.132000,0.000000,-20.904800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.082000,0.000000,-18.054800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.082000,0.000000,-17.754800>}
box{<0,0,-0.101600><0.300000,0.036000,0.101600> rotate<0,90.000000,0> translate<22.082000,0.000000,-17.754800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.082000,0.000000,-17.754800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.782000,0.000000,-17.754800>}
box{<0,0,-0.101600><0.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<21.782000,0.000000,-17.754800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.082000,0.000000,-20.654800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.082000,0.000000,-20.954800>}
box{<0,0,-0.101600><0.300000,0.036000,0.101600> rotate<0,-90.000000,0> translate<22.082000,0.000000,-20.954800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.082000,0.000000,-20.954800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.782000,0.000000,-20.954800>}
box{<0,0,-0.101600><0.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<21.782000,0.000000,-20.954800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.382000,0.000000,-20.954800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.082000,0.000000,-20.954800>}
box{<0,0,-0.101600><0.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<20.082000,0.000000,-20.954800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.082000,0.000000,-20.954800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.082000,0.000000,-20.654800>}
box{<0,0,-0.101600><0.300000,0.036000,0.101600> rotate<0,90.000000,0> translate<20.082000,0.000000,-20.654800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.382000,0.000000,-17.754800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.082000,0.000000,-17.754800>}
box{<0,0,-0.101600><0.300000,0.036000,0.101600> rotate<0,0.000000,0> translate<20.082000,0.000000,-17.754800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.082000,0.000000,-17.754800>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.082000,0.000000,-18.054800>}
box{<0,0,-0.101600><0.300000,0.036000,0.101600> rotate<0,-90.000000,0> translate<20.082000,0.000000,-18.054800> }
difference{
cylinder{<20.582000,0,-18.354800><20.582000,0.036000,-18.354800>0.325200 translate<0,0.000000,0>}
cylinder{<20.582000,-0.1,-18.354800><20.582000,0.135000,-18.354800>0.122000 translate<0,0.000000,0>}}
//U2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<29.512400,0.000000,-20.378800>}
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<29.212400,0.000000,-20.378800>}
box{<0,0,-0.010000><0.300000,0.036000,0.010000> rotate<0,0.000000,0> translate<29.212400,0.000000,-20.378800> }
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<29.212400,0.000000,-20.378800>}
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<28.712400,0.000000,-20.378800>}
box{<0,0,-0.010000><0.500000,0.036000,0.010000> rotate<0,0.000000,0> translate<28.712400,0.000000,-20.378800> }
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<28.712400,0.000000,-20.378800>}
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<28.262400,0.000000,-20.378800>}
box{<0,0,-0.010000><0.450000,0.036000,0.010000> rotate<0,0.000000,0> translate<28.262400,0.000000,-20.378800> }
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<28.262400,0.000000,-20.378800>}
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<27.762400,0.000000,-20.378800>}
box{<0,0,-0.010000><0.500000,0.036000,0.010000> rotate<0,0.000000,0> translate<27.762400,0.000000,-20.378800> }
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<27.762400,0.000000,-20.378800>}
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<27.312400,0.000000,-20.378800>}
box{<0,0,-0.010000><0.450000,0.036000,0.010000> rotate<0,0.000000,0> translate<27.312400,0.000000,-20.378800> }
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<27.312400,0.000000,-20.378800>}
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<26.812400,0.000000,-20.378800>}
box{<0,0,-0.010000><0.500000,0.036000,0.010000> rotate<0,0.000000,0> translate<26.812400,0.000000,-20.378800> }
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<26.812400,0.000000,-20.378800>}
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<26.512400,0.000000,-20.378800>}
box{<0,0,-0.010000><0.300000,0.036000,0.010000> rotate<0,0.000000,0> translate<26.512400,0.000000,-20.378800> }
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<26.512400,0.000000,-20.378800>}
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<26.512400,0.000000,-18.678800>}
box{<0,0,-0.010000><1.700000,0.036000,0.010000> rotate<0,90.000000,0> translate<26.512400,0.000000,-18.678800> }
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<26.512400,0.000000,-18.678800>}
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<26.812400,0.000000,-18.678800>}
box{<0,0,-0.010000><0.300000,0.036000,0.010000> rotate<0,0.000000,0> translate<26.512400,0.000000,-18.678800> }
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<26.812400,0.000000,-18.678800>}
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<27.312400,0.000000,-18.678800>}
box{<0,0,-0.010000><0.500000,0.036000,0.010000> rotate<0,0.000000,0> translate<26.812400,0.000000,-18.678800> }
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<27.312400,0.000000,-18.678800>}
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<27.762400,0.000000,-18.678800>}
box{<0,0,-0.010000><0.450000,0.036000,0.010000> rotate<0,0.000000,0> translate<27.312400,0.000000,-18.678800> }
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<27.762400,0.000000,-18.678800>}
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<28.262400,0.000000,-18.678800>}
box{<0,0,-0.010000><0.500000,0.036000,0.010000> rotate<0,0.000000,0> translate<27.762400,0.000000,-18.678800> }
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<28.262400,0.000000,-18.678800>}
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<28.712400,0.000000,-18.678800>}
box{<0,0,-0.010000><0.450000,0.036000,0.010000> rotate<0,0.000000,0> translate<28.262400,0.000000,-18.678800> }
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<28.712400,0.000000,-18.678800>}
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<29.212400,0.000000,-18.678800>}
box{<0,0,-0.010000><0.500000,0.036000,0.010000> rotate<0,0.000000,0> translate<28.712400,0.000000,-18.678800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.012400,0.000000,-20.278800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.012400,0.000000,-20.478800>}
box{<0,0,0.000000><0.200000,0.036000,0.000000> rotate<0,-90.000000,0> translate<28.012400,0.000000,-20.478800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.012400,0.000000,-18.578800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.012400,0.000000,-18.778800>}
box{<0,0,0.000000><0.200000,0.036000,0.000000> rotate<0,-90.000000,0> translate<28.012400,0.000000,-18.778800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<29.212400,0.000000,-20.278800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<29.212400,0.000000,-20.378800>}
box{<0,0,0.000000><0.100000,0.036000,0.000000> rotate<0,-90.000000,0> translate<29.212400,0.000000,-20.378800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<29.212400,0.000000,-18.678800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<29.212400,0.000000,-18.778800>}
box{<0,0,0.000000><0.100000,0.036000,0.000000> rotate<0,-90.000000,0> translate<29.212400,0.000000,-18.778800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<26.812400,0.000000,-20.278800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<26.812400,0.000000,-20.378800>}
box{<0,0,0.000000><0.100000,0.036000,0.000000> rotate<0,-90.000000,0> translate<26.812400,0.000000,-20.378800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<26.812400,0.000000,-18.678800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<26.812400,0.000000,-18.778800>}
box{<0,0,0.000000><0.100000,0.036000,0.000000> rotate<0,-90.000000,0> translate<26.812400,0.000000,-18.778800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.312400,0.000000,-20.278800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.312400,0.000000,-20.378800>}
box{<0,0,0.000000><0.100000,0.036000,0.000000> rotate<0,-90.000000,0> translate<27.312400,0.000000,-20.378800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.312400,0.000000,-18.678800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.312400,0.000000,-18.778800>}
box{<0,0,0.000000><0.100000,0.036000,0.000000> rotate<0,-90.000000,0> translate<27.312400,0.000000,-18.778800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.712400,0.000000,-18.678800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.712400,0.000000,-18.778800>}
box{<0,0,0.000000><0.100000,0.036000,0.000000> rotate<0,-90.000000,0> translate<28.712400,0.000000,-18.778800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.712400,0.000000,-20.278800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.712400,0.000000,-20.378800>}
box{<0,0,0.000000><0.100000,0.036000,0.000000> rotate<0,-90.000000,0> translate<28.712400,0.000000,-20.378800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.262400,0.000000,-20.278800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.262400,0.000000,-20.378800>}
box{<0,0,0.000000><0.100000,0.036000,0.000000> rotate<0,-90.000000,0> translate<28.262400,0.000000,-20.378800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.762400,0.000000,-20.278800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.762400,0.000000,-20.378800>}
box{<0,0,0.000000><0.100000,0.036000,0.000000> rotate<0,-90.000000,0> translate<27.762400,0.000000,-20.378800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.262400,0.000000,-18.678800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.262400,0.000000,-18.778800>}
box{<0,0,0.000000><0.100000,0.036000,0.000000> rotate<0,-90.000000,0> translate<28.262400,0.000000,-18.778800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.762400,0.000000,-18.678800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.762400,0.000000,-18.778800>}
box{<0,0,0.000000><0.100000,0.036000,0.000000> rotate<0,-90.000000,0> translate<27.762400,0.000000,-18.778800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<29.212400,0.000000,-20.378800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<29.212400,0.000000,-21.028800>}
box{<0,0,0.000000><0.650000,0.036000,0.000000> rotate<0,-90.000000,0> translate<29.212400,0.000000,-21.028800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<29.212400,0.000000,-21.028800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.712400,0.000000,-21.028800>}
box{<0,0,0.000000><0.500000,0.036000,0.000000> rotate<0,0.000000,0> translate<28.712400,0.000000,-21.028800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.712400,0.000000,-21.028800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.712400,0.000000,-20.378800>}
box{<0,0,0.000000><0.650000,0.036000,0.000000> rotate<0,90.000000,0> translate<28.712400,0.000000,-20.378800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.262400,0.000000,-20.378800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.262400,0.000000,-21.028800>}
box{<0,0,0.000000><0.650000,0.036000,0.000000> rotate<0,-90.000000,0> translate<28.262400,0.000000,-21.028800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.262400,0.000000,-21.028800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.762400,0.000000,-21.028800>}
box{<0,0,0.000000><0.500000,0.036000,0.000000> rotate<0,0.000000,0> translate<27.762400,0.000000,-21.028800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.762400,0.000000,-21.028800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.762400,0.000000,-20.378800>}
box{<0,0,0.000000><0.650000,0.036000,0.000000> rotate<0,90.000000,0> translate<27.762400,0.000000,-20.378800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.312400,0.000000,-20.378800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.312400,0.000000,-21.028800>}
box{<0,0,0.000000><0.650000,0.036000,0.000000> rotate<0,-90.000000,0> translate<27.312400,0.000000,-21.028800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.312400,0.000000,-21.028800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<26.812400,0.000000,-21.028800>}
box{<0,0,0.000000><0.500000,0.036000,0.000000> rotate<0,0.000000,0> translate<26.812400,0.000000,-21.028800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<26.812400,0.000000,-21.028800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<26.812400,0.000000,-20.378800>}
box{<0,0,0.000000><0.650000,0.036000,0.000000> rotate<0,90.000000,0> translate<26.812400,0.000000,-20.378800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.762400,0.000000,-18.678800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.762400,0.000000,-18.028800>}
box{<0,0,0.000000><0.650000,0.036000,0.000000> rotate<0,90.000000,0> translate<27.762400,0.000000,-18.028800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.762400,0.000000,-18.028800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.262400,0.000000,-18.028800>}
box{<0,0,0.000000><0.500000,0.036000,0.000000> rotate<0,0.000000,0> translate<27.762400,0.000000,-18.028800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.262400,0.000000,-18.028800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.262400,0.000000,-18.678800>}
box{<0,0,0.000000><0.650000,0.036000,0.000000> rotate<0,-90.000000,0> translate<28.262400,0.000000,-18.678800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.712400,0.000000,-18.678800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.712400,0.000000,-18.028800>}
box{<0,0,0.000000><0.650000,0.036000,0.000000> rotate<0,90.000000,0> translate<28.712400,0.000000,-18.028800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<28.712400,0.000000,-18.028800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<29.212400,0.000000,-18.028800>}
box{<0,0,0.000000><0.500000,0.036000,0.000000> rotate<0,0.000000,0> translate<28.712400,0.000000,-18.028800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<29.212400,0.000000,-18.028800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<29.212400,0.000000,-18.678800>}
box{<0,0,0.000000><0.650000,0.036000,0.000000> rotate<0,-90.000000,0> translate<29.212400,0.000000,-18.678800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.312400,0.000000,-18.678800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.312400,0.000000,-18.028800>}
box{<0,0,0.000000><0.650000,0.036000,0.000000> rotate<0,90.000000,0> translate<27.312400,0.000000,-18.028800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<27.312400,0.000000,-18.028800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<26.812400,0.000000,-18.028800>}
box{<0,0,0.000000><0.500000,0.036000,0.000000> rotate<0,0.000000,0> translate<26.812400,0.000000,-18.028800> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<26.812400,0.000000,-18.028800>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<26.812400,0.000000,-18.678800>}
box{<0,0,0.000000><0.650000,0.036000,0.000000> rotate<0,-90.000000,0> translate<26.812400,0.000000,-18.678800> }
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<29.212400,0.000000,-18.678800>}
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<29.312400,0.000000,-18.678800>}
box{<0,0,-0.010000><0.100000,0.036000,0.010000> rotate<0,0.000000,0> translate<29.212400,0.000000,-18.678800> }
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<29.312400,0.000000,-18.678800>}
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<29.512400,0.000000,-18.878800>}
box{<0,0,-0.010000><0.282843,0.036000,0.010000> rotate<0,44.997030,0> translate<29.312400,0.000000,-18.678800> }
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<29.512400,0.000000,-18.878800>}
cylinder{<0,0,0><0,0.036000,0>0.010000 translate<29.512400,0.000000,-20.378800>}
box{<0,0,-0.010000><1.500000,0.036000,0.010000> rotate<0,-90.000000,0> translate<29.512400,0.000000,-20.378800> }
//U3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.395400,0.000000,-32.994600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.395400,0.000000,-31.673800>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,90.000000,0> translate<39.395400,0.000000,-31.673800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.395400,0.000000,-31.673800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.240200,0.000000,-31.673800>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<39.395400,0.000000,-31.673800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.240200,0.000000,-31.673800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.240200,0.000000,-32.994600>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.240200,0.000000,-32.994600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.240200,0.000000,-32.994600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.395400,0.000000,-32.994600>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<39.395400,0.000000,-32.994600> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-180.000000,0> translate<40.817800,0.000000,-33.337500>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-180.000000,0> translate<39.878000,0.000000,-31.330900>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-180.000000,0> translate<41.757600,0.000000,-31.330900>}
//U4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.240200,0.000000,-27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.240200,0.000000,-28.371800>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.240200,0.000000,-28.371800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.240200,0.000000,-28.371800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.395400,0.000000,-28.371800>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<39.395400,0.000000,-28.371800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.395400,0.000000,-28.371800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.395400,0.000000,-27.051000>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,90.000000,0> translate<39.395400,0.000000,-27.051000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.395400,0.000000,-27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.240200,0.000000,-27.051000>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<39.395400,0.000000,-27.051000> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-0.000000,0> translate<40.817800,0.000000,-26.708100>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-0.000000,0> translate<41.757600,0.000000,-28.714700>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-0.000000,0> translate<39.878000,0.000000,-28.714700>}
//U5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,-44.297600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,-42.976800>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,90.000000,0> translate<38.608000,0.000000,-42.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,-42.976800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.452800,0.000000,-42.976800>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<38.608000,0.000000,-42.976800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.452800,0.000000,-42.976800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.452800,0.000000,-44.297600>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.452800,0.000000,-44.297600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.452800,0.000000,-44.297600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,-44.297600>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<38.608000,0.000000,-44.297600> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-180.000000,0> translate<40.030400,0.000000,-44.640500>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-180.000000,0> translate<39.090600,0.000000,-42.633900>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-180.000000,0> translate<40.970200,0.000000,-42.633900>}
//U6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.452800,0.000000,-38.608000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.452800,0.000000,-39.928800>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.452800,0.000000,-39.928800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.452800,0.000000,-39.928800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,-39.928800>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<38.608000,0.000000,-39.928800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,-39.928800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,-38.608000>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,90.000000,0> translate<38.608000,0.000000,-38.608000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.608000,0.000000,-38.608000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.452800,0.000000,-38.608000>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,0.000000,0> translate<38.608000,0.000000,-38.608000> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-0.000000,0> translate<40.030400,0.000000,-38.265100>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-0.000000,0> translate<40.970200,0.000000,-40.271700>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-0.000000,0> translate<39.090600,0.000000,-40.271700>}
//U7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.194600,0.000000,-55.878400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.194600,0.000000,-54.408400>}
box{<0,0,-0.076200><1.470000,0.036000,0.076200> rotate<0,90.000000,0> translate<36.194600,0.000000,-54.408400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.194600,0.000000,-54.408400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.938600,0.000000,-54.408400>}
box{<0,0,-0.076200><2.744000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.194600,0.000000,-54.408400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.938600,0.000000,-54.408400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.938600,0.000000,-55.878400>}
box{<0,0,-0.076200><1.470000,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.938600,0.000000,-55.878400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.938600,0.000000,-55.878400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.194600,0.000000,-55.878400>}
box{<0,0,-0.076200><2.744000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.194600,0.000000,-55.878400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.088600,0.000000,-55.878400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.044600,0.000000,-55.878400>}
box{<0,0,-0.076200><1.044000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.044600,0.000000,-55.878400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.994600,0.000000,-54.408400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.088600,0.000000,-54.408400>}
box{<0,0,-0.076200><0.094000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.994600,0.000000,-54.408400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.044600,0.000000,-54.408400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.138600,0.000000,-54.408400>}
box{<0,0,-0.076200><0.094000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.044600,0.000000,-54.408400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.894600,0.000000,-54.408400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.938600,0.000000,-54.408400>}
box{<0,0,-0.076200><0.044000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.894600,0.000000,-54.408400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.194600,0.000000,-54.408400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.238600,0.000000,-54.408400>}
box{<0,0,-0.076200><0.044000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.194600,0.000000,-54.408400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.238600,0.000000,-55.878400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.194600,0.000000,-55.878400>}
box{<0,0,-0.076200><0.044000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.194600,0.000000,-55.878400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.938600,0.000000,-55.878400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.894600,0.000000,-55.878400>}
box{<0,0,-0.076200><0.044000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.894600,0.000000,-55.878400> }
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-180.000000,0> translate<38.516600,0.000000,-54.043400>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-180.000000,0> translate<37.566600,0.000000,-54.043400>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-180.000000,0> translate<36.616600,0.000000,-54.043400>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-180.000000,0> translate<36.616600,0.000000,-56.243400>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-180.000000,0> translate<38.516600,0.000000,-56.243400>}
//U8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.738000,0.000000,-45.289800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.738000,0.000000,-46.759800>}
box{<0,0,-0.076200><1.470000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.738000,0.000000,-46.759800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.738000,0.000000,-46.759800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.994000,0.000000,-46.759800>}
box{<0,0,-0.076200><2.744000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.994000,0.000000,-46.759800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.994000,0.000000,-46.759800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.994000,0.000000,-45.289800>}
box{<0,0,-0.076200><1.470000,0.036000,0.076200> rotate<0,90.000000,0> translate<5.994000,0.000000,-45.289800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.994000,0.000000,-45.289800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.738000,0.000000,-45.289800>}
box{<0,0,-0.076200><2.744000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.994000,0.000000,-45.289800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.844000,0.000000,-45.289800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.888000,0.000000,-45.289800>}
box{<0,0,-0.076200><1.044000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.844000,0.000000,-45.289800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.938000,0.000000,-46.759800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.844000,0.000000,-46.759800>}
box{<0,0,-0.076200><0.094000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.844000,0.000000,-46.759800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.888000,0.000000,-46.759800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.794000,0.000000,-46.759800>}
box{<0,0,-0.076200><0.094000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.794000,0.000000,-46.759800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.038000,0.000000,-46.759800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.994000,0.000000,-46.759800>}
box{<0,0,-0.076200><0.044000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.994000,0.000000,-46.759800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.738000,0.000000,-46.759800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.694000,0.000000,-46.759800>}
box{<0,0,-0.076200><0.044000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.694000,0.000000,-46.759800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.694000,0.000000,-45.289800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.738000,0.000000,-45.289800>}
box{<0,0,-0.076200><0.044000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.694000,0.000000,-45.289800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.994000,0.000000,-45.289800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.038000,0.000000,-45.289800>}
box{<0,0,-0.076200><0.044000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.994000,0.000000,-45.289800> }
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-0.000000,0> translate<6.416000,0.000000,-47.124800>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-0.000000,0> translate<7.366000,0.000000,-47.124800>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-0.000000,0> translate<8.316000,0.000000,-47.124800>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-0.000000,0> translate<8.316000,0.000000,-44.924800>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-0.000000,0> translate<6.416000,0.000000,-44.924800>}
//U9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.646000,0.000000,-55.472000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.646000,0.000000,-54.002000>}
box{<0,0,-0.076200><1.470000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.646000,0.000000,-54.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.646000,0.000000,-54.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.390000,0.000000,-54.002000>}
box{<0,0,-0.076200><2.744000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.646000,0.000000,-54.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.390000,0.000000,-54.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.390000,0.000000,-55.472000>}
box{<0,0,-0.076200><1.470000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.390000,0.000000,-55.472000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.390000,0.000000,-55.472000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.646000,0.000000,-55.472000>}
box{<0,0,-0.076200><2.744000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.646000,0.000000,-55.472000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.540000,0.000000,-55.472000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.496000,0.000000,-55.472000>}
box{<0,0,-0.076200><1.044000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.496000,0.000000,-55.472000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.446000,0.000000,-54.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.540000,0.000000,-54.002000>}
box{<0,0,-0.076200><0.094000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.446000,0.000000,-54.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.496000,0.000000,-54.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.590000,0.000000,-54.002000>}
box{<0,0,-0.076200><0.094000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.496000,0.000000,-54.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.346000,0.000000,-54.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.390000,0.000000,-54.002000>}
box{<0,0,-0.076200><0.044000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.346000,0.000000,-54.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.646000,0.000000,-54.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.690000,0.000000,-54.002000>}
box{<0,0,-0.076200><0.044000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.646000,0.000000,-54.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.690000,0.000000,-55.472000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.646000,0.000000,-55.472000>}
box{<0,0,-0.076200><0.044000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.646000,0.000000,-55.472000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.390000,0.000000,-55.472000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.346000,0.000000,-55.472000>}
box{<0,0,-0.076200><0.044000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.346000,0.000000,-55.472000> }
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-180.000000,0> translate<17.968000,0.000000,-53.637000>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-180.000000,0> translate<17.018000,0.000000,-53.637000>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-180.000000,0> translate<16.068000,0.000000,-53.637000>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-180.000000,0> translate<16.068000,0.000000,-55.837000>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-180.000000,0> translate<17.968000,0.000000,-55.837000>}
//U10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.014000 translate<16.002000,0.000000,-6.070600>}
cylinder{<0,0,0><0,0.036000,0>0.014000 translate<13.002000,0.000000,-6.070600>}
box{<0,0,-0.014000><3.000000,0.036000,0.014000> rotate<0,0.000000,0> translate<13.002000,0.000000,-6.070600> }
cylinder{<0,0,0><0,0.036000,0>0.014000 translate<13.002000,0.000000,-6.070600>}
cylinder{<0,0,0><0,0.036000,0>0.014000 translate<13.002000,0.000000,-4.320600>}
box{<0,0,-0.014000><1.750000,0.036000,0.014000> rotate<0,90.000000,0> translate<13.002000,0.000000,-4.320600> }
cylinder{<0,0,0><0,0.036000,0>0.014000 translate<13.002000,0.000000,-4.320600>}
cylinder{<0,0,0><0,0.036000,0>0.014000 translate<16.002000,0.000000,-4.320600>}
box{<0,0,-0.014000><3.000000,0.036000,0.014000> rotate<0,0.000000,0> translate<13.002000,0.000000,-4.320600> }
cylinder{<0,0,0><0,0.036000,0>0.014000 translate<16.002000,0.000000,-4.320600>}
cylinder{<0,0,0><0,0.036000,0>0.014000 translate<16.002000,0.000000,-6.070600>}
box{<0,0,-0.014000><1.750000,0.036000,0.014000> rotate<0,-90.000000,0> translate<16.002000,0.000000,-6.070600> }
cylinder{<0,0,0><0,0.036000,0>0.004000 translate<15.602000,0.000000,-4.570600>}
cylinder{<0,0,0><0,0.036000,0>0.004000 translate<13.402000,0.000000,-4.570600>}
box{<0,0,-0.004000><2.200000,0.036000,0.004000> rotate<0,0.000000,0> translate<13.402000,0.000000,-4.570600> }
cylinder{<0,0,0><0,0.036000,0>0.004000 translate<13.402000,0.000000,-4.570600>}
cylinder{<0,0,0><0,0.036000,0>0.004000 translate<13.202000,0.000000,-4.770600>}
box{<0,0,-0.004000><0.282843,0.036000,0.004000> rotate<0,-44.997030,0> translate<13.202000,0.000000,-4.770600> }
cylinder{<0,0,0><0,0.036000,0>0.004000 translate<13.202000,0.000000,-4.770600>}
cylinder{<0,0,0><0,0.036000,0>0.004000 translate<13.202000,0.000000,-5.670600>}
box{<0,0,-0.004000><0.900000,0.036000,0.004000> rotate<0,-90.000000,0> translate<13.202000,0.000000,-5.670600> }
cylinder{<0,0,0><0,0.036000,0>0.004000 translate<13.202000,0.000000,-5.670600>}
cylinder{<0,0,0><0,0.036000,0>0.004000 translate<13.402000,0.000000,-5.870600>}
box{<0,0,-0.004000><0.282843,0.036000,0.004000> rotate<0,44.997030,0> translate<13.202000,0.000000,-5.670600> }
cylinder{<0,0,0><0,0.036000,0>0.004000 translate<13.402000,0.000000,-5.870600>}
cylinder{<0,0,0><0,0.036000,0>0.004000 translate<15.602000,0.000000,-5.870600>}
box{<0,0,-0.004000><2.200000,0.036000,0.004000> rotate<0,0.000000,0> translate<13.402000,0.000000,-5.870600> }
cylinder{<0,0,0><0,0.036000,0>0.004000 translate<15.602000,0.000000,-5.870600>}
cylinder{<0,0,0><0,0.036000,0>0.004000 translate<15.802000,0.000000,-5.670600>}
box{<0,0,-0.004000><0.282843,0.036000,0.004000> rotate<0,-44.997030,0> translate<15.602000,0.000000,-5.870600> }
cylinder{<0,0,0><0,0.036000,0>0.004000 translate<15.802000,0.000000,-5.670600>}
cylinder{<0,0,0><0,0.036000,0>0.004000 translate<15.802000,0.000000,-4.770600>}
box{<0,0,-0.004000><0.900000,0.036000,0.004000> rotate<0,90.000000,0> translate<15.802000,0.000000,-4.770600> }
cylinder{<0,0,0><0,0.036000,0>0.004000 translate<15.802000,0.000000,-4.770600>}
cylinder{<0,0,0><0,0.036000,0>0.004000 translate<15.602000,0.000000,-4.570600>}
box{<0,0,-0.004000><0.282843,0.036000,0.004000> rotate<0,44.997030,0> translate<15.602000,0.000000,-4.570600> }
box{<-0.150000,0,-0.300000><0.150000,0.036000,0.300000> rotate<0,-180.000000,0> translate<15.452000,0.000000,-6.370600>}
box{<-0.150000,0,-0.300000><0.150000,0.036000,0.300000> rotate<0,-180.000000,0> translate<13.552000,0.000000,-6.370600>}
box{<-0.150000,0,-0.300000><0.150000,0.036000,0.300000> rotate<0,-0.000000,0> translate<15.452000,0.000000,-4.010600>}
box{<-0.150000,0,-0.300000><0.150000,0.036000,0.300000> rotate<0,-0.000000,0> translate<14.502000,0.000000,-4.010600>}
box{<-0.150000,0,-0.300000><0.150000,0.036000,0.300000> rotate<0,-0.000000,0> translate<13.552000,0.000000,-4.010600>}
//U11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.386200,0.000000,-7.088600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.386200,0.000000,-8.838600>}
box{<0,0,-0.063500><1.750000,0.036000,0.063500> rotate<0,-90.000000,0> translate<18.386200,0.000000,-8.838600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.386200,0.000000,-8.838600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.386200,0.000000,-11.838600>}
box{<0,0,-0.063500><3.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<18.386200,0.000000,-11.838600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.386200,0.000000,-11.838600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.386200,0.000000,-13.588600>}
box{<0,0,-0.063500><1.750000,0.036000,0.063500> rotate<0,-90.000000,0> translate<18.386200,0.000000,-13.588600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.386200,0.000000,-13.588600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.886200,0.000000,-13.588600>}
box{<0,0,-0.063500><3.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<14.886200,0.000000,-13.588600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.886200,0.000000,-13.588600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.886200,0.000000,-10.588600>}
box{<0,0,-0.063500><3.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<14.886200,0.000000,-10.588600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.886200,0.000000,-10.088600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.886200,0.000000,-7.088600>}
box{<0,0,-0.063500><3.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<14.886200,0.000000,-7.088600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.886200,0.000000,-7.088600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.386200,0.000000,-7.088600>}
box{<0,0,-0.063500><3.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<14.886200,0.000000,-7.088600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.386200,0.000000,-8.838600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.236200,0.000000,-8.838600>}
box{<0,0,-0.063500><1.850000,0.036000,0.063500> rotate<0,0.000000,0> translate<18.386200,0.000000,-8.838600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.236200,0.000000,-8.838600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.236200,0.000000,-11.838600>}
box{<0,0,-0.063500><3.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.236200,0.000000,-11.838600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.236200,0.000000,-11.838600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.386200,0.000000,-11.838600>}
box{<0,0,-0.063500><1.850000,0.036000,0.063500> rotate<0,0.000000,0> translate<18.386200,0.000000,-11.838600> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<14.886200,0.000000,-8.048600>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-8.048600>}
box{<0,0,0.000000><1.850000,0.036000,0.000000> rotate<0,0.000000,0> translate<13.036200,0.000000,-8.048600> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-8.048600>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-7.548600>}
box{<0,0,0.000000><0.500000,0.036000,0.000000> rotate<0,90.000000,0> translate<13.036200,0.000000,-7.548600> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-7.548600>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<14.886200,0.000000,-7.548600>}
box{<0,0,0.000000><1.850000,0.036000,0.000000> rotate<0,0.000000,0> translate<13.036200,0.000000,-7.548600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.886200,0.000000,-10.088600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.886200,0.000000,-10.588600>}
box{<0,0,-0.063500><0.500000,0.036000,0.063500> rotate<0,-90.000000,0> translate<14.886200,0.000000,-10.588600> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<14.886200,0.000000,-10.588600>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-10.588600>}
box{<0,0,0.000000><1.850000,0.036000,0.000000> rotate<0,0.000000,0> translate<13.036200,0.000000,-10.588600> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-10.588600>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-10.088600>}
box{<0,0,0.000000><0.500000,0.036000,0.000000> rotate<0,90.000000,0> translate<13.036200,0.000000,-10.088600> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-10.088600>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<14.886200,0.000000,-10.088600>}
box{<0,0,0.000000><1.850000,0.036000,0.000000> rotate<0,0.000000,0> translate<13.036200,0.000000,-10.088600> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<14.886200,0.000000,-11.858600>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-11.858600>}
box{<0,0,0.000000><1.850000,0.036000,0.000000> rotate<0,0.000000,0> translate<13.036200,0.000000,-11.858600> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-11.858600>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-11.358600>}
box{<0,0,0.000000><0.500000,0.036000,0.000000> rotate<0,90.000000,0> translate<13.036200,0.000000,-11.358600> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-11.358600>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<14.886200,0.000000,-11.358600>}
box{<0,0,0.000000><1.850000,0.036000,0.000000> rotate<0,0.000000,0> translate<13.036200,0.000000,-11.358600> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<14.886200,0.000000,-12.628600>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<14.886200,0.000000,-13.128600>}
box{<0,0,0.000000><0.500000,0.036000,0.000000> rotate<0,-90.000000,0> translate<14.886200,0.000000,-13.128600> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<14.886200,0.000000,-13.128600>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-13.128600>}
box{<0,0,0.000000><1.850000,0.036000,0.000000> rotate<0,0.000000,0> translate<13.036200,0.000000,-13.128600> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-13.128600>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-12.628600>}
box{<0,0,0.000000><0.500000,0.036000,0.000000> rotate<0,90.000000,0> translate<13.036200,0.000000,-12.628600> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-12.628600>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<14.886200,0.000000,-12.628600>}
box{<0,0,0.000000><1.850000,0.036000,0.000000> rotate<0,0.000000,0> translate<13.036200,0.000000,-12.628600> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<14.886200,0.000000,-8.818600>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<14.886200,0.000000,-9.318600>}
box{<0,0,0.000000><0.500000,0.036000,0.000000> rotate<0,-90.000000,0> translate<14.886200,0.000000,-9.318600> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<14.886200,0.000000,-9.318600>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-9.318600>}
box{<0,0,0.000000><1.850000,0.036000,0.000000> rotate<0,0.000000,0> translate<13.036200,0.000000,-9.318600> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-9.318600>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-8.818600>}
box{<0,0,0.000000><0.500000,0.036000,0.000000> rotate<0,90.000000,0> translate<13.036200,0.000000,-8.818600> }
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<13.036200,0.000000,-8.818600>}
cylinder{<0,0,0><0,0.036000,0>0.000000 translate<14.886200,0.000000,-8.818600>}
box{<0,0,0.000000><1.850000,0.036000,0.000000> rotate<0,0.000000,0> translate<13.036200,0.000000,-8.818600> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  LCD_BIASSUPPLY_PRIMERA(-24.079200,0,30.226000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//C1	10uF/6.3v	0603-CAP
//C2	0.1uF	0603-CAP
//C3	0.47uF/16v	0603-CAP
//C4	0.47uF/16v	0603-CAP
//C5	TPSD336M020R0200	2917
//C6	1uF/25v	0603-CAP
//C7	1uF/25v	0603-CAP
//C8	1uF/25v	0603-CAP
//C9	0.33uF/16v	0603-CAP
//C10	10uF/10v	0603-CAP
//C11	0.47uF/16v	0603-CAP
//C12	0.47uF/16v	0603-CAP
//C13	1uF/25v	0603-CAP
//C14	1uF/25v	0603-CAP
//C15	1uF/25v	0603-CAP
//C16	0.1uF/16v	0603-CAP
//C17	10uF/10v	0603-CAP
//C18	10uF/10v	0603-CAP
//C19	0.1uF/16v	0603-CAP
//C40	1uF	0603-CAP
//C41	4.7uF	0603-CAP
//C96	2.2u/16V	0603-CAP
//C98	0.1u/16V	0603-CAP
//C99	1u/25V	0603-CAP
//CFB1	10pF	EIA3216
//CFF1	100pF	0603-CAP
//CFF7	5pF	0603-CAP
//CIN7	4.7uF	0603-CAP
//CIN9	4.7uF	0603-CAP
//CO8	0.22uF	0603-CAP
//COUT	1uF	0603-CAP
//D1	BZT52C5V6-V	SOD123
//D2	BZT52C5V6-V	SOD123
//D4	MBR0530T3	SOD123
//D6	MBR0530T3	SOD123
//D7	MBR0530T3	SOD123
//D8	MBRS1100TRPBF	DO-214AA
//D9	MBR0530T3	SOD123
//L1	CDRH125-47UH	CDRH12-INDUCTOR
//L2	CDRH3D16NP-100NC	CDRH3D16NP
//L7	ELL-6RH5RIM	ELL-6RH5RIM
//L8	CM453232-470KL	CM453232
//R1	241.5K	0603-RES
//R2	33K	0603-RES
//R3	0	0603-RES
//R4	330	0603-RES
//R5	10K	0603-RES
//R6	1K	0603-RES
//R7	5.1K-1%	0603-RES
//R8	2.94K-1%	0603-RES
//R9	0	0603-RES
//R10	0	0603-RES
//R11	5.1K-1%	0603-RES
//R12	470K	0603-RES
//R13	10k	0603-RES
//R14	330	0603-RES
//R15	10K	0603-RES
//R16	1K	0603-RES
//R17	620K	0603-RES
//R18	619	0603-RES
//R19	0	0603-RES
//R20	11K	0603-RES
//R21	11k	0603-RES
//R22	0	0603-RES
//R23	6.8k	0603-RES
//R24	0	0603-RES
//R25	0	0603-RES
//R26	10K	0603-RES
//R27	94.7K	0603-RES
//R37	1K	0603-RES
//R47	15	0603-RES
//R49	10k	0603-RES
//R50	0	0603-RES
//R100	10K	0603-RES
//RS	82	0603-RES
//U1	MAX152X	SOT-23-6
//U2	FDC633N	SUPERSOT-6
//U10	SN74LVC1G06DBVR	SOT-23-DBV
//U11	TPS79633DCQR	SOT-223-6
