`timescale 1ns/1ps

module lifo_memory_testbench;

  reg clk, rst_n, wr, rd;
  reg [31:0] data_in;
  wire [31:0] data_out;
  wire lifo_empty, lifo_full;
  wire [9:0] pointer1;

  lifo_memory uut(
   .clk(clk),
   .rst_n(rst_n),
   .wr(wr),
   .rd(rd),
   .lifo_empty(lifo_empty),
   .lifo_full(lifo_full),
   .data_in(data_in),
   .data_out(data_out),
   .pointer1(pointer1)
  );
always begin
   #5 clk = ~clk;
end

  initial begin
   // Initialize inputs
   clk = 0;
   rst_n = 0;
   wr = 0;
   rd = 0;
   data_in = 0;

   // Apply reset
   rst_n = 0;
   #10;
   rst_n = 1;
	wr = 1;
	data_in = 32'b10000000000000000000000000000000;
	#10;
	data_in = 32'b01000000000000000000000000000000;
	#10;
	wr = 0;
	rd = 1;
	#30;

   $stop; // Stop simulation
  end

endmodule