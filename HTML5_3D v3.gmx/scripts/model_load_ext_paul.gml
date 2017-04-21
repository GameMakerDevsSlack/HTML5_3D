///d3d_model_load_ext( model, filename, flip normals, flip UVs, scale )

// Paul Frischknecht 2006 (c). All rights reserved.
/////////////////////////////////////
//created debug variables:
//modelload[0]=vertices loaded
//modelload[1]=time (in milliseconds) needed
///////////////////////////////////////
modelload[0]=0
modelload[1]=0

var flipnormals,fliptex,cur_milisec;
flipnormals=1
if(argument2)flipnormals=-1
fliptex=argument3
scale=argument4
cur_milisec=current_time
modelload[0]=0

var str,file,row,tex_y,v_x,v_y,v_z,n_x,n_y,n_z,u,v,i,numb,edges,faces,t,p_count;
file=file_text_open_read(argument1);
v_x = ds_list_create(); ds_list_add( v_x, 0 );
v_y = ds_list_create(); ds_list_add( v_y, 0 );
v_z = ds_list_create(); ds_list_add( v_z, 0 );
n_x = ds_list_create(); ds_list_add( n_x, 0 );
n_y = ds_list_create(); ds_list_add( n_y, 0 );
n_z = ds_list_create(); ds_list_add( n_z, 0 );
u = ds_list_create(); ds_list_add( u, 0 );
v = ds_list_create(); ds_list_add( v, 0 );
row = "";

do {
    
    //normals
    if ( string_count( "vn ", row ) == 1 ) {
        do {
            
            row = string_delete( row, 1, string_pos( " ", row ) );
            str = string_copy(   row, 1, string_pos( " ", row )-1 );
            
            row = string_delete( row, 1, string_pos( " ", row ) );
            ds_list_add( n_x, real( str ) );
            
            str = string_copy(   row, 1, string_pos( " ", row )-1 );
            row = string_delete( row, 1, string_pos( " ", row ) );
            ds_list_add( n_y, real( str ) );
            
            str = string_copy(   row, 1, string_length( row ) );
            ds_list_add( n_z, real( str ) );
            
            row = file_text_read_string( file );
            file_text_readln( file );
            
        } until ( string_count( "vn ", row ) == 0 );
    }
    
    
    
    //UVs
    if ( string_count( "vt ", row ) == 0 ) {
        do {
            
            row = file_text_read_string( file );
            file_text_readln( file );
            
        } until ( ( string_char_at( row, 1 ) == "v" ) and ( string_char_at( row, 2 ) == "t" ) )
             or ( ( string_char_at( row, 1 ) == "f" ) and ( string_char_at( row, 2 ) == " " ) );
    }
    
    if ( string_count( "vt ", row ) == 1 ) {
        do {
            
            row = string_delete( row, 1, string_pos( " ", row ) );
            str = string_copy(   row, 1, string_pos( " ", row )-1 );
            
            row = string_delete( row, 1, string_pos( " ", row ) );
            ds_list_add( u, real( str ) );
            
            str = string_copy(   row, 1, string_length( row ) );
            ds_list_add( v, real( str ) );
            
            row = file_text_read_string( file );
            file_text_readln( file );
            
        } until ( string_count( "vt ", row ) == 0 );
    }
    
    
    
    //positions
    if ( string_count( "v ", row ) == 0 ) {
        do {
            row = file_text_read_string( file );
            file_text_readln( file );
        } until ( string_char_at(row,1) == "v" ) and ( string_char_at( row, 2 ) == " " );
    }

    do {
        
        row = string_delete( row, 1, string_pos( " ", row ) );
        str = string_copy(   row, 1, string_pos( " ", row )-1 );
        
        row = string_delete( row, 1, string_pos( " ", row ) );
        ds_list_add( v_x, real( str ) );
        str = string_copy(   row, 1, string_pos( " ", row )-1 )
        row = string_delete( row, 1, string_pos( " ", row ) );
        ds_list_add( v_y, real( str ) );
        
        str = string_copy(   row, 1, string_length( row ) );
        ds_list_add( v_z, real( str ) );
        
        row = file_text_read_string( file );
        file_text_readln( file );
        
    } until ( string_count( "v ", row ) == 0 );
   
    do {
        row = file_text_read_string( file );
        file_text_readln( file );
    } until ( ( string_char_at( row, 1 ) == "v" ) and ( string_char_at( row, 2 ) == "n" ) )
         or ( ( string_char_at( row, 1 ) == "v" ) and ( string_char_at( row, 2 ) == "t" ) )
         or ( ( string_char_at( row, 1 ) == "f" ) and ( string_char_at( row, 2 ) == " " ) );
    
    
    
    //faces
    if ( string_count( "f ", row ) == 0 ) {
        do {
            row = file_text_read_string( file );
            file_text_readln( file );
        } until ( string_char_at( row, 1 ) == "f" ) and ( string_char_at( row, 2 ) == " " );
    }
    
    
    
    pos = 0;
    do {
        d3d_model_primitive_begin( argument0, pr_trianglelist );
       
        row = string_delete(      row, 1, string_pos( " ", row ) );
        row = string_replace_all( row, "//", "/0/" );
       
        str = string_copy( row, 1, string_pos( " ", row )-1 );
        p_count = string_count( "/", str );
        if ( p_count != 2 ) row = string_replace_all( row, " ", "/0 " );
       
        if ( string_char_at( row, string_length( row ) ) == " " ) row = string_copy( row, 1, string_length( row )-1 );
       
        edges = string_count( " ", row ) + 1;
        for( t = 0; t < edges; t+=1 ) {
            str=string_copy(row,1,string_pos("/",row)-1);
            row=string_delete(row,1,string_pos("/",row));
            faces[t,0]=real(str);

            str=string_copy(row,1,string_pos("/",row)-1);
            row=string_delete(row,1,string_pos("/",row));
            faces[t,1]=real(str);

        if!(t=edges-1)
            {
            str=string_copy(row,1,string_pos(" ",row)-1);
            row=string_delete(row,1,string_pos(" ",row));
            }
            else str=string_copy(row,1,string_length(row));
        faces[t,2]=real(str);
        }
        //build faces
        if(edges<=3)
            {
            for(t=0;t<edges;t+=1)
                {
                tex_y=ds_list_find_value(v,faces[t,1])
                if(fliptex)tex_y=1-tex_y
                //show_error(string(ds_list_find_value(v_x,faces[t,0]))+";"+string(ds_list_find_value(v_y,faces[t,0]))+";"+string(ds_list_find_value(v_z,faces[t,0]))+";",false)
                d3d_model_vertex_normal_texture(argument0,ds_list_find_value(v_x,faces[t,0])*scale,ds_list_find_value(v_y,faces[t,0])*scale,ds_list_find_value(v_z,faces[t,0])*scale
                                                     ,flipnormals*ds_list_find_value(n_x,faces[t,2]),flipnormals*ds_list_find_value(n_y,faces[t,2]),flipnormals*ds_list_find_value(n_z,faces[t,2])
                                                     ,ds_list_find_value(u,faces[t,1]),tex_y);modelload[0]+=1;
                }
            }
        else
            {

            for(t=2;t<edges;t+=1)
                {
                tex_y=ds_list_find_value(v,faces[0,1])
                if(fliptex)tex_y=1-tex_y
                d3d_model_vertex_normal_texture(argument0,ds_list_find_value(v_x,faces[0,0])*scale,ds_list_find_value(v_y,faces[0,0])*scale,ds_list_find_value(v_z,faces[0,0])*scale,flipnormals*ds_list_find_value(n_x,faces[0,2]),flipnormals*ds_list_find_value(n_y,faces[0,2]),flipnormals*ds_list_find_value(n_z,faces[0,2]),ds_list_find_value(u,faces[0,1]),tex_y);modelload[0]+=1;
                tex_y=ds_list_find_value(v,faces[t-1,1])
                if(fliptex)tex_y=1-tex_y
                d3d_model_vertex_normal_texture(argument0,ds_list_find_value(v_x,faces[t-1,0])*scale,ds_list_find_value(v_y,faces[t-1,0])*scale,ds_list_find_value(v_z,faces[t-1,0])*scale,flipnormals*ds_list_find_value(n_x,faces[t-1,2]),flipnormals*ds_list_find_value(n_y,faces[t-1,2]),flipnormals*ds_list_find_value(n_z,faces[t-1,2]),ds_list_find_value(u,faces[t-1,1]),tex_y);modelload[0]+=1;
                tex_y=ds_list_find_value(v,faces[t,1])
                if(fliptex)tex_y=1-tex_y
                d3d_model_vertex_normal_texture(argument0,ds_list_find_value(v_x,faces[t,0])*scale,ds_list_find_value(v_y,faces[t,0])*scale,ds_list_find_value(v_z,faces[t,0])*scale,flipnormals*ds_list_find_value(n_x,faces[t,2]),flipnormals*ds_list_find_value(n_y,faces[t,2]),flipnormals*ds_list_find_value(n_z,faces[t,2]),ds_list_find_value(u,faces[t,1]),tex_y);modelload[0]+=1;
                }
            }
        d3d_model_primitive_end(argument0)
        d3d_model_primitive_begin(argument0,pr_trianglelist)   

        row=file_text_read_string(file);file_text_readln(file)
        if(string_count("f ",row)=0)
            {
            do {row=file_text_read_string(file);file_text_readln(file)}
            until (string_char_at(row,1)="f"&&string_char_at(row,2)=" ")||(string_char_at(row,1)="v"&&string_char_at(row,2)=" ")||file_text_eof(file);
            }
        }
    until string_count("f ",row)=0
   
    d3d_model_primitive_end(argument0)
    while !(string_count("v ",row)=1||file_text_eof(file)) {row=file_text_read_string(file);file_text_readln(file)}
    
} until file_text_eof( file );
       
file_text_close( file );

ds_list_destroy(v_x);
ds_list_destroy(v_y);
ds_list_destroy(v_z);

ds_list_destroy(n_x);
ds_list_destroy(n_y);
ds_list_destroy(n_z);

ds_list_destroy(u);
ds_list_destroy(v);
    
modelload[1] = abs( current_time - cur_milisec );
