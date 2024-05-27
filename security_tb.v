`timescale 1ns/1ps

module security_tb;

  // Inputs
  reg clk;
  reg rst_n;
  reg wr1, rd1, wr2, rd2;
  reg [31:0] data_in;

  // Outputs
  wire [31:0] data_out, data_out_lifo_test;
  wire fifo_full, fifo_empty;

  // Instantiate the security module
  security sec_inst (
    .data_in(data_in),
    .clk(clk),
    .rst_n(rst_n),
    .wr1(wr1),
    .rd1(rd1),
    .wr2(wr2),
    .rd2(rd2),
    .data_out(data_out),
    .data_out_lifo_test(data_out_lifo_test),
    .fifo_full(fifo_full),
    .fifo_empty(fifo_empty)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test scenario
  initial begin
    data_in = 32'bz;
    wr1 = 0;
    rd1 = 0;
    clk = 0;
    rst_n = 0;
    wr2 = 0;
    rd2 = 0;
	 
    #10;
    rst_n = 1;
	 wr2 = 1;
	 data_in = 32'b00000000_01111000_01101001_01101110;
	 #10;
	 data_in = 32'b01100011_01101000_01100001_01101111;
	 #10;
	 wr2 = 0;
	 rd2 = 1;
	 #10;
	 rd2 = 0;
	 wr1 = 1;
	 #10;
	 rd2 = 1;
	 wr1 = 0;
	 #10;
	 rd2 = 0;
	 wr1 = 1;
	 #10;
	 wr1 = 0;
	 rd1 = 1;
    #20 $stop;
  end

endmodule