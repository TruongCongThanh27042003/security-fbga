module security_FPGA(data_in,wr1, rd1, clk, rst_n,wr2, rd2,wr3,rd3,key,data_out,data_out_final,empty,full);
//security 
input [31:0] data_in;
output[31:0] data_out;
output empty,full;
input wr1, rd1, clk, rst_n,wr2, rd2;
wire lifo_low_th,lifo_high_th,lifo_ov,lifo_ud; 
wire [31:0] data_out_lifo_test;  
output wire [31:0] data_out_final;
wire fifo_full, fifo_empty;

//key
wire [31:0]out;
input [31:0]key;
wire [31:0] X;
//LIFO2
input wr3,rd3;
assign empty = fifo_empty;
assign full =fifo_full;

security se1(data_in,clk,rst_n,wr1, rd1,wr2, rd2,data_out,data_out_lifo_test,fifo_full, fifo_empty);

user_key userk(data_out,key,out);

LIFO lf2(X, lifo_ov, lifo_ud,lifo_low_th, lifo_high_th, clk, rst_n, wr3, rd3, out); 

assign data_out_final = X ^ 32'b10101010101010101010101010101010;
endmodule 