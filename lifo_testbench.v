`timescale 1ns/1ps

module lifo_testbench;

  reg wr, rd, clk, rst_n;
  reg [31:0] data_in;
  wire [31:0] data_out;
  wire lifo_low_th, lifo_high_th, lifo_ov, lifo_ud;

  LIFO lifo1(
   .data_out(data_out),
   .lifo_ov(lifo_ov),
   .lifo_ud(lifo_ud),
   .lifo_low_th(lifo_low_th),
   .lifo_high_th(lifo_high_th),
   .clk(clk),
   .rst_n(rst_n),
   .wr(wr),
   .rd(rd),
   .data_in(data_in)
  );

  always begin
    #5 clk = ~clk;
  end
initial begin
   // Initialize inputs
   wr = 0;
   rd = 0;
   clk = 0;
   rst_n = 0;
   data_in = 0;

   // Apply reset
   rst_n = 0;
   #10;
   rst_n = 1;
	wr = 1;
	data_in = 32'b10000000000000000000000000000000;
	#20;
	wr = 0;
	rd = 1;
	#40;
	rd = 0;
   #50; // Allow for some simulation time

   $stop; // Stop simulation
end

endmodule