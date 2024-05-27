module fifo_mem_tb;
    reg wr, rd, clk, rst_n;
    reg [31:0] data_in;
    wire [31:0] data_out;
    wire fifo_full, fifo_empty, fifo_threshold, fifo_overflow, fifo_underflow;

    // Khởi tạo DUT
    fifo_mem DUT (
        .data_out(data_out),
        .fifo_full(fifo_full),
        .fifo_empty(fifo_empty),
        .fifo_threshold(fifo_threshold),
        .fifo_overflow(fifo_overflow),
        .fifo_underflow(fifo_underflow),
        .clk(clk),
        .rst_n(rst_n),
        .wr(wr),
        .rd(rd),
        .data_in(data_in)
    );


    always begin
        #5 clk = ~clk;
    end


    initial begin
        // Khởi tạo tín hiệu
        clk = 0; rst_n = 0; wr = 0; rd = 0; data_in = 0;

        #10 rst_n = 1; // Thả reset
        #10 wr = 1; data_in = 32'hDEADBEEF; // Ghi dữ liệu vào FIFO
        #10 wr = 0;
        #10 rd = 1; // Đọc dữ liệu từ FIFO
        #10 rd = 0;

        #10 wr = 1; data_in = 32'hCAFEBABE; // Ghi dữ liệu khác vào FIFO
        #10 wr = 0;
        #10 rd = 1; // Đọc dữ liệu từ FIFO
        #10 rd = 0;

        #10 $finish; // Kết thúc mô phỏng
    end
endmodule
