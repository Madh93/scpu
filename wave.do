onerror {resume}
quietly virtual signal -install /cpu {/cpu/e1  } op1
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu/microc_/memoria_/a
add wave -noupdate /cpu/reset
add wave -noupdate /cpu/clk
add wave -noupdate /cpu/e1
add wave -noupdate /cpu/e2
add wave -noupdate /cpu/e3
add wave -noupdate /cpu/s1
add wave -noupdate /cpu/microc_/banco_/ra1
add wave -noupdate /cpu/microc_/banco_/ra2
add wave -noupdate /cpu/microc_/banco_/rd1
add wave -noupdate /cpu/microc_/banco_/rd2
add wave -noupdate /cpu/microc_/banco_/wa3
add wave -noupdate /cpu/microc_/banco_/wd3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 199
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {61025668 ps} {61026807 ps}
