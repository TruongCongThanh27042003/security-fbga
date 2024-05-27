module mux32_to_1 (
   input [31:0] in0, 
   input [31:0] in1,
   input [31:0] in2, 
   input [31:0] in3, 
   input [31:0] in4, 
   input [31:0] in5, 
   input [31:0] in6, 
   input [31:0] in7, 
   input [31:0] in8, 
   input [31:0] in9, 
   input [31:0] in10, 
   input [31:0] in11, 
   input [31:0] in12, 
   input [31:0] in13, 
   input [31:0] in14, 
   input [31:0] in15, 
  input [3:0] sel,
  output  reg [31:0] out
);

   always @(*) begin
      if (sel == 5'b1101)
         out <= in12;
      else
         out <= 32'bz;
   end

endmodule
//data_output = data_inputs[select];