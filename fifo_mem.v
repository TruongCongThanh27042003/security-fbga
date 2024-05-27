module fifo_mem(data_out,fifo_full, fifo_empty, fifo_threshold, fifo_overflow, fifo_underflow,clk, rst_n, wr, rd, data_in);  
  input wr, rd, clk, rst_n;  
  input[31:0] data_in;  
  output[31:0] data_out;  
  output fifo_full, fifo_empty, fifo_threshold, fifo_overflow, fifo_underflow;  
  wire[9:0] wptr,rptr;  
  wire fifo_we,fifo_rd;   
  write_pointer top1(wptr,fifo_we,wr,fifo_full,clk,rst_n);  
  read_pointer top2(rptr,fifo_rd,rd,fifo_empty,clk,rst_n);  
  memory_array top8(data_out, data_in, clk,fifo_we, wptr,rptr,fifo_rd);  
  status_signal top9(fifo_full, fifo_empty, fifo_threshold, fifo_overflow, fifo_underflow, wr, rd, fifo_we, fifo_rd, wptr,rptr,clk,rst_n);  
 endmodule  