if (mode==5 || view[7]) for (i=0;i<pathnum;i+=1) {
    if ((paths[i,0]==current_path && mode==5) || view[7]) {
        d3d_model_draw(paths[i,3],0,0,0,-1)
    }
}

if (mode==5 && current_path!=noone) {
    dx=path_get_point_x(current_path,current_pathpoint)-0.5
    dy=path_get_point_y(current_path,current_pathpoint)-0.5
    if (current_pathpoint>0) {
        draw_circle_color(dx,dy,4,0,0,0)
        draw_circle_color(dx,dy,3,selcol,selcol,0)
    } else {
        draw_rectangle_color(dx-4,dy-4,dx+4,dy+4,1,1,1,1,0)
        draw_rectangle_color(dx-3,dy-3,dx+3,dy+3,selcol,selcol,selcol,selcol,0)
    }

    if (!drag_point && mousein) {
        n=path_get_number(current_path)

        maxd=8*zm point=-1

        for (p=0;p<n;p+=1) {
            px=path_get_point_x(current_path,p)
            py=path_get_point_y(current_path,p)
            d=point_distance(global.mousex,global.mousey,px,py)
            if (d<=maxd) {point=p maxd=d}
        }

        if (point!=-1) {
            draw_circle_color(
                path_get_point_x(current_path,point)-0.5,
                path_get_point_y(current_path,point)-0.5,
                8*zm,
                selcol,selcol,1
            )
        } else {
            if (keyboard_check(vk_alt)) {mx=global.mousex-0.5 my=global.mousey-0.5} else {mx=fmx-0.5 my=fmy-0.5}
            closed=path_get_closed(current_path)
            draw_set_alpha(0.3)
            draw_line_width_color(
                path_get_point_x(current_path,current_pathpoint)-0.5,
                path_get_point_y(current_path,current_pathpoint)-0.5,
                mx,my,
                3,0,0
            )
            if (current_pathpoint<n-1 || closed) draw_line_width_color(
                mx,my,
                path_get_point_x(current_path,(current_pathpoint+1) mod n)-0.5,
                path_get_point_y(current_path,(current_pathpoint+1) mod n)-0.5,
                3,0,0
            )
            draw_set_alpha(0.5)
            draw_line_width_color(
                path_get_point_x(current_path,current_pathpoint)-0.5,
                path_get_point_y(current_path,current_pathpoint)-0.5,
                mx,my,
                1,$ff00ff,$ff00ff
            )
            if (current_pathpoint<n-1 || closed) draw_line_width_color(
                mx,my,
                path_get_point_x(current_path,(current_pathpoint+1) mod n)-0.5,
                path_get_point_y(current_path,(current_pathpoint+1) mod n)-0.5,
                1,$ff00ff,$ff00ff
            )
            draw_set_alpha(1)
        }
    }
}
