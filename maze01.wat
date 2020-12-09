(module 
 (import "js" "memory" (memory 1))
 (import "js" "table" (table 1 funcref))
 (global $canvas_width (import "js" "canvas_width") (mut i32))
 (global $canvas_height (import "js" "canvas_height") (mut i32))
 (global $artwork_width (import "js" "artwork_width") (mut i32))
 (global $artwork_height (import "js" "artwork_height") (mut i32))
 (global $canvas_addr (import "js" "canvas_addr") (mut i32))
 (global $artwork_addr (import "js" "artwork_addr") (mut i32))
 (func $console_log (import "js" "console_log") (param i32))
 (func $error_out_of_bounds (import "js" "error_out_of_bounds") (param i32) (param i32) (param i32))
 (func $random (import "js" "random") (param i32) (result i32))
 (func $calc_canvas_address (import "js" "calc_canvas_address") (param i32) (param i32) (result i32))
 (func $calc_artwork_address (import "js" "calc_artwork_address") (param i32) (param i32) (result i32))
 (func $clear_screen (import "js" "clear_screen") (param i32))
 (func $draw_image (import "js" "draw_image") (param i32) (param i32) (param i32) (param i32) (param i32))
 (func $draw_artwork (import "js" "draw_artwork") (param i32) (param i32) (param i32) (param i32) (param i32) (param i32))
 (data(offset (i32.const 0x600)) "\00\00\01\00\02\00\03\00\04\00\05\00\06\00\07\00\08\00\09\00\0a\00\0b\00\0c\00\0d\00\0e\00\0f\00\10\00\11\00\12\00\13\00\14\00\15\00\16\00\17\00\18\00\19\00\1a\00\1b\00\1c\00\1d\00\1e\00\1f\00\1f\01\1f\02\1f\03\1f\04\1f\05\1f\06\1f\07\1f\08\1f\09\1f\0a\1f\0b\1f\0c\1f\0d\1f\0e\1f\0f\1f\10\1f\11\1f\12\1f\13\1f\14\1f\15\00\01\00\02\00\03\00\04\00\05\00\06\00\07\00\08\00\09\00\0a\00\0b\00\0c\00\0d\00\0e\00\0f\00\10\00\11\00\12\00\13\00\14\00\15\01\15\02\15\03\15\04\15\05\15\06\15\07\15\08\15\09\15\0a\15\0b\15\0c\15\0d\15\0e\15\0f\15\10\15\11\15\12\15\13\15\14\15\15\15\16\15\17\15\18\15\19\15\1a\15\1b\15\1c\15\1d\15\1e\15\01\04\02\04\03\04\04\04\05\04\06\04\07\04\08\04\09\04\0a\04\0b\04\0c\04\0d\04\0e\04\0f\04\10\04\11\04\12\04\13\04\14\04\15\04\16\04\17\04\18\04\19\04\1a\04\1b\04\01\09\02\09\03\09\04\09\05\09\06\09\07\09\08\09\09\09\0a\09\0b\09\0c\09\10\09\11\09\12\09\13\09\14\09\15\09\16\09\17\09\18\09\19\09\1a\09\1b\09\1c\09\1d\09\1e\09\01\0e\02\0e\03\0e\07\0e\08\0e\09\0e\0a\0e\0b\0e\0c\0e\0d\0e\0e\0e\0f\0e\10\0e\11\0e\12\0e\13\0e\14\0e\15\0e\16\0e\17\0e\18\0e\19\0e\1a\0e\1b\0e\1c\0e\1d\0e\1e\0e\01\14\02\14\03\14\04\14\05\14\06\14\07\14\08\14\09\14\0a\14\0b\14\0c\14\0d\14\0e\14\0f\14\10\14\11\14\12\14\13\14\14\14\15\14\16\14\17\14\18\14\19\14\1a\14\1b\14\1c\14\1d\14\1e\14\01\13\02\13\03\13\04\13\05\13\06\13\07\13\08\13\09\13\0a\13\0b\13\0c\13\0d\13\0e\13\0f\13\10\13\12\13\13\13\14\13\15\13\16\13\17\13\18\13\19\13\1a\13\1b\13\1c\13\1d\13\1e\13\11\13")   
 
 (func $draw_maze
       (local $addr i32)
       (local $counter i32)
       i32.const 0x600
       local.set $addr
       i32.const 0
       local.set $counter
       block $done
         loop $repeat 
	 (i32.ge_u (local.get $counter) (i32.const 245))
	 br_if $done
	 (call $draw_artwork
	 (i32.const 18)
	 (i32.const 132)
	 (i32.const 16)
	 (i32.const 16)
	 (i32.mul (i32.const 16) (i32.load8_u (local.get $addr)))
	 (i32.mul (i32.const 16) (i32.load8_u (i32.add (i32.const 1) (local.get $addr))))
	 )
	 (local.set $addr (i32.add (i32.const 2) (local.get $addr)))
	 i32.const 1
	 local.get $counter
	 i32.add
	 local.set $counter
	 local.get $counter
	 br_if $repeat 
	end $repeat
     end $done
)
 (func $step (export "step") (param $progress i32) 

 (local $adress i32)
 (local $counter i32)
 
 (call $clear_screen (i32.const 0xFF000000))   
 (call $draw_maze) 				
 )
)

