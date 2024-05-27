module user_key (
   input [31:0] in0, 
  input [31:0] key,
  output  reg [31:0] out
);

   always @(*) begin
      if (key == 32'b11000000000000000000000000000011)
         out <= in0;
      else
         out <= 32'bz;
   end

endmodule
