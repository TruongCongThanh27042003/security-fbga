module memory_array_tb;

  // Parameters
  parameter DATA_WIDTH = 32;
  parameter ADDR_WIDTH = 10;
  parameter MEM_SIZE = 2**ADDR_WIDTH;
  
  // Signals
  reg [DATA_WIDTH-1:0] data_in;
  wire [DATA_WIDTH-1:0] data_out;
  reg clk;
  reg fifo_we;
  reg [ADDR_WIDTH-1:0] wptr;
  reg [ADDR_WIDTH-1:0] rptr;
  reg fifo_rd;
  
  // Instantiate the module
  memory_array dut (
    .data_in(data_in),
    .data_out(data_out),
    .clk(clk),
    .fifo_we(fifo_we),
    .wptr(wptr),
    .rptr(rptr),
	 .fifo_rd(fifo_rd)
  );
  
  // Clock generation
  always begin
    #5 clk = ~clk;
  end
  
  // Test stimulus
  initial begin
    // Initialize signals
    data_in = 0;
    fifo_we = 0;
    wptr = 0;
    rptr = 0;
    clk = 0;
    
    // Write data into memory
    #10 data_in = 32'hAA55AA55;
    fifo_we = 1;
    wptr = 0;
    #10 data_in = 32'h55AA55AA;
    fifo_we = 1;
    wptr = 1;
    #10 ;
    fifo_we = 0;
	 fifo_rd = 1;
    wptr = 2;
    
    // Read data from memory
    #20;
    rptr = 0;
    #10 rptr = 1;
    #10 rptr = 2;
    
    // Finish simulation
    #10 $stop;
  end
  
endmodule