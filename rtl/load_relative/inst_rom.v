module inst_rom(clk,reset_n,pc,inst,ce);
input            clk;
input            reset_n;
input            ce;
input     [31:0] pc;
output reg[31:0] inst;

reg [31:0]inst_rom1[0:200];

initial $readmemh ("inst_rom.data", inst_rom1);

always @ (*) begin
	if(!ce) begin
		inst[31:0] =   {32{1'b0}};
	end else  begin
		inst[31:0] =   inst_rom1[pc[31:2]];
	end
end

endmodule
