module read_pointer_tb;
  reg rd, fifo_empty, clk, rst_n;
  wire [9:0] rptr;
  wire fifo_rd;

  // Instantiate the module
  read_pointer u1 (
    .rptr(rptr),
    .fifo_rd(fifo_rd),
    .rd(rd),
    .fifo_empty(fifo_empty),
    .clk(clk),
    .rst_n(rst_n)
  );

  // Clock generator
  always begin
    #5 clk = ~clk;
  end

  // Test sequence
  initial begin
    rd = 0;
    fifo_empty = 0;
    clk = 0;
    rst_n = 0;
    #10 rst_n = 1;  // Release reset
    #10 rd = 1;     // Start reading
    #20 rd = 0;     // Stop reading
    #10 fifo_empty = 1;  // FIFO becomes empty
    #20 fifo_empty = 0;  // FIFO is not empty
    #10 rd = 1;     // Start reading again
    #20 $finish;    // End of test
  end
endmodule
