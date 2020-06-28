module mem(clk,reset_n,
	   ex_we,ex_waddr,ex_wdata,ex_whilo,ex_hi,ex_lo,
	   mem_we,mem_waddr,mem_wdata,mem_whilo,mem_hi,mem_lo);
input            clk;
input            reset_n;

/////////////////////////////
////input from ex
/////////////////////////////
input            ex_we;
input      [4:0] ex_waddr;
input      [31:0]ex_wdata;
input            ex_whilo;
input      [31:0] ex_hi;
input      [31:0] ex_lo;

/////////////////////////////
////output to mem
/////////////////////////////
output reg       mem_we;
output reg [4:0] mem_waddr;
output reg [31:0]mem_wdata;
output reg       mem_whilo;
output reg [31:0] mem_hi;
output reg [31:0]mem_lo;


always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		mem_we          <= #`RD  1'b0;
		mem_waddr[4:0]  <= #`RD  {5{1'b0}};
		mem_wdata[31:0] <= #`RD  {32{1'b0}};
		mem_whilo       <= #`RD  1'b0;
		mem_hi   [31:0]  <= #`RD  {32{1'b0}};
		mem_lo   [31:0] <= #`RD  {32{1'b0}};
	end else begin
		mem_we          <= #`RD  ex_we;
		mem_waddr[4:0]  <= #`RD  ex_waddr[4:0];
		mem_wdata[31:0] <= #`RD  ex_wdata[31:0];
		mem_whilo       <= #`RD  ex_whilo;
		mem_hi   [31:0]  <= #`RD  ex_hi[31:0];
		mem_lo   [31:0] <= #`RD  ex_lo[31:0];
	end
end

endmodule
