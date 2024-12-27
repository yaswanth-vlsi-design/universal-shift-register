module shift_reg #(parameter width = 8) (
    input clk,  
    input rst,
    input [1:0] mode,
    input [width-1:0] p_in,
    input s_in,
    output reg [width-1:0] out,
    output reg s_out
);


    always @(posedge clk or posedge rst) begin
        if (rst) begin
            out <= 0;
            s_out <= 0;
        end else begin
            case (mode)
                2'b00: begin
                    out<= out;
                end
                2'b01: begin

                    out <= {out[width-2:0], s_in};
                    s_out <= out[width-1]; 
                end
                2'b10: begin
                    out <= {s_in, out[width-1:1]};
                    s_out <= out[0]; 
                end
                2'b11: begin

                    out <= p_in;
                end
                default: begin

                    out <= out;
                end
            endcase
        end
    end

endmodule
