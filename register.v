// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register
(
output reg	q,
input		d,
input		wrenable,
input		clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q <= d;
        end
    end

endmodule

module register32
(
output reg [31:0]	q,
input [31:0]		d,
input		wrenable,
input		clk
);

	reg [5:0] counter;

	always @(posedge clk) begin
        if(wrenable) begin
	        for (counter = 0; counter < 32; counter = counter + 1) 
	        	q[counter] <= d[counter];
        end
    end

endmodule

module register32zero
(
output reg [31:0]	q,
input [31:0]		d,
input		wrenable,
input		clk
);

	reg [5:0] counter;

	always @(posedge clk) begin
        if(wrenable) begin
	        for (counter = 0; counter < 32; counter = counter + 1)
	        	q[counter] <= 1'b0;
        end
    end

endmodule
