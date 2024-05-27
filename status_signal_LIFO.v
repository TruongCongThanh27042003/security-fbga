module status_signal_LIFO (clk, rst_n, wr, rd,lifo_empty,lifo_full,lifo_ov,lifo_ud,lifo_low_th,lifo_high_th,pointer);

//inputs
input clk;

input rst_n;
input wr;
input rd;
input lifo_empty;
input lifo_full;
input [9:0] pointer;

//outputs
output reg lifo_ov;
output reg lifo_ud;
output lifo_low_th;
output lifo_high_th;

//Internal signals


wire lifo_re, lifo_we;
//pointer
assign lifo_we = wr & ~lifo_full;
//
assign lifo_re = rd & ~lifo_empty;
//The low threshold signal
assign lifo_low_th = (pointer[9:0] < 8);
assign lifo_high_th = (pointer[9:0] >= 8);

always @ (posedge clk) begin
   if (~rst_n) lifo_ov <= 1'b0;
   else if (lifo_re) lifo_ov <= 1'b0;
   else if (wr & lifo_full) lifo_ov <= 1'b1;
end

//Underflow


always @ (posedge clk) begin
   if (~rst_n) lifo_ud <= 1'b0;
   else if (lifo_we) lifo_ud <= 1'b0;
   else if (rd & lifo_empty) lifo_ud <= 1'b1;
end
endmodule