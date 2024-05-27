`timescale 1ns/100ps

module status_signal_LIFO_testbench;

  // Parameters
  parameter DATA_WIDTH    = 16;
  parameter POINTER_WIDTH = 4;
  parameter TH_LEVEL      = (2**POINTER_WIDTH)/2;

  // Inputs
  reg clk = 0;
  reg rst_n = 1;
  reg wr = 0;
  reg rd = 0;
  reg lifo_empty = 1;
  reg lifo_full = 0;
  reg [9:0] pointer;

  // Outputs
  wire lifo_ov;
  wire lifo_ud;
  wire lifo_low_th;
  wire lifo_high_th;
  // Instantiate the module under test
  status_signal_LIFO uut (
    .clk(clk),
    .rst_n(rst_n),
    .wr(wr),
    .rd(rd),
    .lifo_empty(lifo_empty),
    .lifo_full(lifo_full),
    .lifo_ov(lifo_ov),
    .lifo_ud(lifo_ud),
	 .lifo_low_th(lifo_low_th),
	 .lifo_high_th(lifo_high_th),
	 .pointer(pointer)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Stimulus generation
  initial begin
    // Initialize signals
    wr = 1; // Enable write
    rd = 0; // Disable read initially
    lifo_empty = 1;
    lifo_full = 0;
	 pointer = 20;

    // Reset
    rst_n = 0;
    #10 rst_n = 1;

    // Test case 1: Trigger Overflow
    #10 wr = 1;
    #10 wr = 1;
    #10 wr = 1;
    #10 wr = 1; // Overflow should be triggered here

    // Test case 2: Trigger Underflow
    #10 wr = 0;
    #10 wr = 0;
    #10 wr = 0;
    #10 rd = 1; // Underflow should be triggered here

    // Add more test scenarios as needed

    // Finish simulation
    #10 $stop;
  end

endmodule