module lifo_memory(clk, rst_n, wr, rd,lifo_empty,lifo_full,data_in,data_out,pointer1);
//inputs
input clk;
input rst_n;
input wr;
input rd;
input [31:0] data_in;
//outputs
output  reg [31:0] data_out;
output  lifo_empty;
output  lifo_full;
output [9:0]pointer1; 
//pointer
reg [9:0] pointer;
wire [9:0] next_pointer, add_value;
//memory 3MB
reg [32767:0] mem_array[1023:0];
wire lifo_re, lifo_we,lifo_en;
//pointer
assign pointer1 = pointer;
assign lifo_we = wr & ~lifo_full;
//
assign lifo_re = rd & ~lifo_empty;
//
assign lifo_en = lifo_re ^ lifo_we;
//
assign add_value[9:0] = lifo_re? {{9{1'b1}}, 1'b0}: {10{1'b0}};
//
assign next_pointer[9:0] = pointer[9:0] +add_value[9:0] + 1'b1;
//
always @ (posedge clk) begin
  if (~rst_n)
   pointer[9:0] <= {10{1'b0}};
  else if (lifo_en)
   pointer[9:0] <= next_pointer[9:0];
end
//Status
//
assign lifo_full = pointer[9];
//
assign lifo_empty= ~|pointer[9:0];
//memory array
always @ (posedge clk) begin
  if (lifo_we)
   mem_array[pointer[9:0]] <= data_in[31:0];
end

always @ (posedge clk) begin
	if(lifo_re) begin
   data_out[31:0] <= mem_array[next_pointer[9:0]];
	end
end

endmodule