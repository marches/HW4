//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------
`include "register.v"
`include "multiplexer.v"
`include "decoders.v"

module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	    // Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);

	wire [31:0] RegSelect;
	decoder1to32 decode (.enable(RegWrite), .address(WriteRegister), .out(RegSelect));

	wire [31:0] R0;
	wire [31:0] R1;
	wire [31:0] R2; 
	wire [31:0] R3; 
	wire [31:0] R4; 
	wire [31:0] R5; 
	wire [31:0] R6; 
	wire [31:0] R7; 
	wire [31:0] R8; 
	wire [31:0] R9;
	wire [31:0] R10;
	wire [31:0] R11;
	wire [31:0] R12; 
	wire [31:0] R13; 
	wire [31:0] R14; 
	wire [31:0] R15; 
	wire [31:0] R16; 
	wire [31:0] R17; 
	wire [31:0] R18; 
	wire [31:0] R19;
	wire [31:0] R20;
	wire [31:0] R21;
	wire [31:0] R22; 
	wire [31:0] R23; 
	wire [31:0] R24; 
	wire [31:0] R25; 
	wire [31:0] R26; 
	wire [31:0] R27; 
	wire [31:0] R28; 
	wire [31:0] R29;
	wire [31:0] R30;
	wire [31:0] R31; 
	
	register32zero r0(.d(WriteData), .clk(Clk), .wrenable(RegSelect[0]), .q(R0));
	register32 r1(.d(WriteData), .clk(Clk), .wrenable(RegSelect[1]), .q(R1));
	register32 r2(.d(WriteData), .clk(Clk), .wrenable(RegSelect[2]), .q(R2));
	register32 r3(.d(WriteData), .clk(Clk), .wrenable(RegSelect[3]), .q(R3));
	register32 r4(.d(WriteData), .clk(Clk), .wrenable(RegSelect[4]), .q(R4));
	register32 r5(.d(WriteData), .clk(Clk), .wrenable(RegSelect[5]), .q(R5));
	register32 r6(.d(WriteData), .clk(Clk), .wrenable(RegSelect[6]), .q(R6));
	register32 r7(.d(WriteData), .clk(Clk), .wrenable(RegSelect[7]), .q(R7));
	register32 r8(.d(WriteData), .clk(Clk), .wrenable(RegSelect[8]), .q(R8));
	register32 r9(.d(WriteData), .clk(Clk), .wrenable(RegSelect[9]), .q(R9));
	register32 r10(.d(WriteData), .clk(Clk), .wrenable(RegSelect[10]), .q(R10));
	register32 r11(.d(WriteData), .clk(Clk), .wrenable(RegSelect[11]), .q(R11));
	register32 r12(.d(WriteData), .clk(Clk), .wrenable(RegSelect[12]), .q(R12));
	register32 r13(.d(WriteData), .clk(Clk), .wrenable(RegSelect[13]), .q(R13));
	register32 r14(.d(WriteData), .clk(Clk), .wrenable(RegSelect[14]), .q(R14));
	register32 r15(.d(WriteData), .clk(Clk), .wrenable(RegSelect[15]), .q(R15));
	register32 r16(.d(WriteData), .clk(Clk), .wrenable(RegSelect[16]), .q(R16));
	register32 r17(.d(WriteData), .clk(Clk), .wrenable(RegSelect[17]), .q(R17));
	register32 r18(.d(WriteData), .clk(Clk), .wrenable(RegSelect[18]), .q(R18));
	register32 r19(.d(WriteData), .clk(Clk), .wrenable(RegSelect[19]), .q(R19));
	register32 r20(.d(WriteData), .clk(Clk), .wrenable(RegSelect[20]), .q(R20));
	register32 r21(.d(WriteData), .clk(Clk), .wrenable(RegSelect[21]), .q(R21));
	register32 r22(.d(WriteData), .clk(Clk), .wrenable(RegSelect[22]), .q(R22));
	register32 r23(.d(WriteData), .clk(Clk), .wrenable(RegSelect[23]), .q(R23));
	register32 r24(.d(WriteData), .clk(Clk), .wrenable(RegSelect[24]), .q(R24));
	register32 r25(.d(WriteData), .clk(Clk), .wrenable(RegSelect[25]), .q(R25));
	register32 r26(.d(WriteData), .clk(Clk), .wrenable(RegSelect[26]), .q(R26));
	register32 r27(.d(WriteData), .clk(Clk), .wrenable(RegSelect[27]), .q(R27));
	register32 r28(.d(WriteData), .clk(Clk), .wrenable(RegSelect[28]), .q(R28));
	register32 r29(.d(WriteData), .clk(Clk), .wrenable(RegSelect[29]), .q(R29));
	register32 r30(.d(WriteData), .clk(Clk), .wrenable(RegSelect[30]), .q(R30));
	register32 r31(.d(WriteData), .clk(Clk), .wrenable(RegSelect[31]), .q(R31));

	
	mux32to1by32 mux1(ReadData1, ReadRegister1, R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, 
			R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, 
			R21, R22, R23, R24, R25, R26, R27, R28, R29, R30, R31);

	mux32to1by32 mux2(ReadData2, ReadRegister2, R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, 
			R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, 
			R21, R22, R23, R24, R25, R26, R27, R28, R29, R30, R31);

endmodule