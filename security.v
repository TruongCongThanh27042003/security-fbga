module security(data_in,clk,rst_n,wr1, rd1,wr2, rd2,data_out,data_out_lifo_test,fifo_full, fifo_empty);
//fifo 
input wr1, rd1, clk, rst_n;  
wire[31:0] data_out_lifo;  
wire fifo_threshold, fifo_overflow, fifo_underflow;  
output fifo_full, fifo_empty;
//lifo
input wr2, rd2;    
wire lifo_low_th,lifo_high_th,lifo_ov,lifo_ud;  
output [31:0] data_out_lifo_test;
//key and input
input [31:0] data_in;
output[31:0] data_out;
//input "xin chao" = data_in
//xin = 00000000 01111000 01101001 01101110
//chao = 01100011 01101000 01100001 01101111
wire [31:0] X;

assign data_out_lifo_test = data_out_lifo;
assign X = data_in ^ 32'b10101010101010101010101010101010;
//KEY = 10101010101010101010101010101010

//fifo_mem ff1(data_out,fifo_full, fifo_empty, fifo_threshold, fifo_overflow, fifo_underflow,clk, rst_n, wr, rd, X); 
LIFO lf1(data_out_lifo, lifo_ov, lifo_ud,lifo_low_th, lifo_high_th, clk, rst_n, wr2, rd2, X);  
//wr = 1 , rd = 0 => wr = 0, rd = 1
fifo_mem ff1(data_out,fifo_full, fifo_empty, fifo_threshold, fifo_overflow, fifo_underflow,clk, rst_n, wr1, rd1, data_out_lifo); 
//wr = 1 , rd = 0 => wr = 0, rd = 1
endmodule