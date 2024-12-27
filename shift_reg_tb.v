module shift_reg_tb;
  parameter WIDTH = 8;

    reg clk;
    reg rst;
    reg [1:0] mode;
    reg [WIDTH-1:0] p_in;
    reg s_in;
    wire [WIDTH-1:0] out;
    wire s_out;

    shift_reg #(WIDTH) uut (
        .clk(clk),
        .rst(rst),
        .mode(mode),
        .p_in(p_in),
        .s_in(s_in),
        .out(out),
        .s_out(s_out)
    );

    always begin
       #5 clk=~clk;
    end

    initial begin
        clk=0;
        rst = 1;
        mode = 2'b00;
        p_in = 0;
        s_in = 0;


        #10 rst = 0;


        #10 mode = 2'b11; p_in = 8'b10101010;
        #10 mode = 2'b00;

         #10 mode = 2'b01; s_in = 1;
        #10 mode = 2'b01; s_in = 0;


        #10 mode = 2'b10; s_in = 1;
        #10 mode = 2'b10; s_in = 0;

        #10 mode = 2'b00;

        #10 rst = 1;
        #10 rst = 0;

        #20 $finish;
    end

endmodule


