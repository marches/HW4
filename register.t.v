`include "register.v"


module testReg();

	wire q;
	reg d;
	reg en;
	reg clk;

	register dut0(.q(q), .d(d), .wrenable(en), .clk(clk));

	initial begin

	en = 1;
	d = 1;
	clk = 0; # 10
	clk = 1; # 10
	if (q!=d) begin
		$display("q not set to d with enable on");
	end

	// test enable
	en = 0;
	d = 0;
	clk = 0; # 10
	clk = 1; # 10
	if (q==d) begin
		$display("q changed when en off");
	end

	end

endmodule

module test32();

	wire [31:0] q;
	reg [31:0] d;
	reg en;
	reg clk;

	register32 dut1(.q(q), .d(d), .wrenable(en), .clk(clk));

	initial begin

	en = 1;
	d = 3426527914;	// "Random" 32-bit number 
	clk = 0; # 10
	clk = 1; # 10
	if (q!=d) begin
		$display("q not set to d with enable on - 32 bit version");
	end

	end


endmodule

module test0();

	wire [31:0] q;
	reg [31:0] d;
	reg en;
	reg clk;

	register32zero dut2(.q(q), .d(d), .wrenable(en), .clk(clk));

	initial begin

	en = 1;
	d = 3426527914;	// "Random" 32-bit number 
	clk = 0; # 10
	clk = 1; # 10
	if (q!=0) begin
		$display("q not set to 0 with enable on - 32 bit version");
	end

	end


endmodule