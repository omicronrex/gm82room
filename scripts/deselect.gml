select=noone
selectt=noone
with (instance) {sel=0 fieldactive=0}
with (tileholder) sel=0

chunkloaded=0
selection=0

if (mode==5) {
    current_path=noone
    if (current_pathindex!=noone) generate_path_model(current_pathindex)
    update_inspector()
    current_pathindex=noone
}
