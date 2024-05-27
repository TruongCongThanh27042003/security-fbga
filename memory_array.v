 module memory_array(data_out, data_in, clk,fifo_we, wptr,rptr,fifo_rd);  
  input[31:0] data_in;  
  input clk,fifo_we,fifo_rd;  
  input[9:0] wptr,rptr;  
  output[31:0] data_out;  
  reg[32767:0] data_out2[1023:0];  
  reg [31:0] data_out;  
  always @(posedge clk)  
  begin  
   if(fifo_we)   
      data_out2[wptr[8:0]] <= data_in ;  
  end  
   always @(posedge clk)  
  begin  
   if(fifo_rd)   
      data_out = data_out2[rptr[8:0]] ;  
  end   
 endmodule  