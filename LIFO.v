module LIFO(data_out, lifo_ov, lifo_ud,lifo_low_th, lifo_high_th, clk, rst_n, wr, rd, data_in);  
  input wr, rd, clk, rst_n;  
  input[31:0] data_in;   
  output[31:0] data_out;  
  output lifo_low_th,lifo_high_th,lifo_ov,lifo_ud;  
  wire [9:0] pointer1;
  wire lifo_full,lifo_empty;
  wire fifo_we,fifo_rd;   
  lifo_memory lfm(clk, rst_n, wr, rd,lifo_empty,lifo_full,data_in,data_out,pointer1);  
  status_signal_LIFO sslf(clk, rst_n, wr, rd,lifo_empty,lifo_full,lifo_ov,lifo_ud,lifo_low_th,lifo_high_th,pointer1);  
endmodule  