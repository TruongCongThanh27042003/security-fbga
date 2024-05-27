module write_pointer_tb;
  reg [9:0] data_in;
  reg wr, fifo_full, clk, rst_n;
  wire [9:0] wptr;
  wire fifo_we;

  // Instantiate the module
  write_pointer u1 (
    .wptr(wptr),
    .fifo_we(fifo_we),
    .wr(wr),
    .fifo_full(fifo_full),
    .clk(clk),
    .rst_n(rst_n)
  );

  // Clock generator
  always begin
    #5 clk = ~clk;
  end

  // Test sequence
  initial begin
    data_in = 0;
    wr = 0;
    fifo_full = 0;
    clk = 0;
    rst_n = 0;
    #10 rst_n = 1;  // Release reset
    #10 wr = 1; data_in = 10'b0000000001;  // Start writing value 1
    #20 wr = 1; data_in = 10'b0000000010;  // Write value 2
    #10 wr = 0;     // Stop writing
    #10 fifo_full = 1;  // FIFO becomes full
    #20 fifo_full = 0;  // FIFO is not full
    #10 wr = 1; data_in = 10'b0000000011;  // Start writing value 3
    #20 $finish;    // End of test
  end
endmodule
