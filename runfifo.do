vlib work
vlog FIFO.svp if.sv tb.sv top.sv +cover -covercells
vsim -voptargs=+acc work.FIFO_top -cover
add wave *
add wave -position insertpoint  \
sim:/FIFO_top/tb/WIDTH \
sim:/FIFO_top/tb/wr_en \
sim:/FIFO_top/tb/rd_en \
sim:/FIFO_top/tb/rst_n \
sim:/FIFO_top/tb/full \
sim:/FIFO_top/tb/almostfull \
sim:/FIFO_top/tb/empty \
sim:/FIFO_top/tb/almostempty \
sim:/FIFO_top/tb/overflow \
sim:/FIFO_top/tb/underflow \
sim:/FIFO_top/tb/wr_ack \
sim:/FIFO_top/tb/data_in \
sim:/FIFO_top/tb/data_out \
sim:/FIFO_top/tb/i \
sim:/FIFO_top/tb/check
coverage save FIFO_top.ucdb -onexit
run -all
#quit -sim
vcover report FIFO_top.ucdb -details -annotate -all