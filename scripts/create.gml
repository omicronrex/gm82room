globalvar width,height,gridx,gridy,roomwidth,roomheight,mouse_wx,mouse_wy,grid,crosshair,removeoutside,fillwithcolor,fillcolor,remember,minimap,mode,buttoncol;

width=display_get_width()-80-64
height=display_get_height()-80-64
room_caption="Game Maker 8.2 Room Editor"
maxfps=display_get_frequency()

room_speed=maxfps

draw_set_font(fntCode)

xgo=0
ygo=0
zooming=0
zoom=1
zoomcenter=0
resizecount=0

dir="SOFTWARE\Game Maker\Version 8.2\Preferences\"
grid=registry_read_dword(dir+"RoomGridOnOffDefault",0)
removeoutside=registry_read_dword(dir+"RemoveOutside",0)
fillwithcolor=registry_read_dword(dir+"FillRoomWithBackground",1)
fillcolor=registry_read_dword(dir+"RoomBackgroundFullColourDefault",$400040)
remember=registry_read_dword(dir+"RememberRoomSettings",0)
minimap=registry_read_dword(dir+"RoomMinimap",1)
crosshair=registry_read_dword(dir+"RoomCrosshair",1)

state="load"
crc_init()

load_room()

window_set_showborder(1)

with (instance) visible=1
depth=abs(depth)

state="run"

mode=0

width=min(width,roomwidth+64+160*2)
height=min(height,roomheight+64+64)

xgo=roomwidth/2 ygo=roomheight/2

zoom=max(1,(roomwidth+64)/width,(roomheight+64+64)/height)
zoomgo=zoom

window_set_size(width,height)
window_resize_buffer(width,height)
window_set_region_size(width,height,0)
window_center()

view_wport[0]=width
view_hport[0]=height

select=noone
selecting=0
instance_create(0,0,Interface)

bgtex=background_get_texture(bgBlack)
