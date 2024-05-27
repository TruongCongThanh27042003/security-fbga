`timescale 1ns / 1ps

module user_key_tb;

  // Inputs
  reg [31:0] in0;
  reg [31:0] key;

  // Outputs
  wire [31:0] out;

  user_key uut (
    .in0(in0),
    .key(key),
    .out(out)
  );

  // Initial block
  initial begin
    // Initialize inputs
    in0 = 32'b11111111111111111111111111111111;
    key = 32'b11000000000000000000000000000011;
    #10;
	 key = 5'b11000;
	 #10;
    $stop;
  end

endmodule