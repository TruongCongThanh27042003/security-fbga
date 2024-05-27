`timescale 1ns / 1ps

module security_FPGA_tb;

  // Parameters

  // Inputs
  reg [31:0] data_in;
  reg wr1, rd1, clk, rst_n, wr2, rd2, wr3, rd3;
  reg [31:0] key;
  wire empty,full;
  // Outputs
  wire [31:0] data_out, data_out_final;

  // Instantiate the module under test
  security_FPGA uut (
    .data_in(data_in),
    .wr1(wr1),
    .rd1(rd1),
    .clk(clk),
    .rst_n(rst_n),
    .wr2(wr2),
    .rd2(rd2),
    .wr3(wr3),
    .rd3(rd3),
    .key(key),
    .data_out(data_out),
    .data_out_final(data_out_final),
	 .empty(empty),
	 .full(full)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Initial block
  initial begin
    // Initialize inputs
    data_in = 32'bz;
    wr1 = 0;
    rd1 = 0;
    clk = 0;
    rst_n = 0;
    wr2 = 0;
    rd2 = 0;
    wr3 = 0;
    rd3 = 0;
    key = 32'b11000000000000000000000000000001;
	 
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
	 #10;
	 rd1 = 0;
	 wr3 = 1;
	 #10;
	 rd1 = 1;
	 wr3 = 0;
	 #10;
	 rd1 = 0;
	 wr3 = 1;
	 #10;
	 wr3 = 0;
	 rd3 = 1;
	 #20;
	 

	 $stop;
  end

endmodule