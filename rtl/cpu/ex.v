module ex(clk,reset_n,
	  alusel,aluop,reg1_data,reg2_data,id_we,id_waddr,
	  hilo_hi,hilo_lo,
	  mem_whilo,mem_hi,mem_lo,
	  wb_whilo,wb_hi,wb_lo,
	  ex_we,ex_waddr,ex_wdata,ex_whilo,ex_hi,ex_lo);
input            clk;
input            reset_n;
///////////////////////////////////
///input from id
///////////////////////////////////
input      [2:0] alusel;
input      [7:0] aluop;
input      [31:0]reg1_data;
input      [31:0]reg2_data;
input            id_we;
input      [4:0] id_waddr;


///////////////////////////////////
///input from hilo
///////////////////////////////////
input     [31:0] hilo_hi;
input     [31:0] hilo_lo;        

///////////////////////////////////
///input from mem
///////////////////////////////////
input            mem_whilo;
input     [31:0] mem_hi;
input     [31:0] mem_lo;        

///////////////////////////////////
///input from wb
///////////////////////////////////
input            wb_whilo;
input     [31:0] wb_hi;
input     [31:0] wb_lo;        

///////////////////////////////////
///output to ex
///////////////////////////////////
output reg       ex_we;
output reg [4:0] ex_waddr;
output reg [31:0]ex_wdata;
output reg       ex_whilo;
output reg [31:0]ex_hi;
output reg [31:0]ex_lo;


reg        [31:0]logicout;
reg        [31:0]moveout;
reg        [31:0]shiftout;
reg        [31:0]arithmeticout;

reg        [63:0]tempt;
reg        [63:0]right_move;
wire       [31:0]reg2_data_mux;
wire             over_sum;
wire       [31:0]sum_tempt;
wire             reg1_lt_reg2;
wire       [31:0]opdata1_mult;
wire       [31:0]opdata2_mult;
wire       [63:0]mul_tempt;

//////////////////////////////////////////////////////////////////////////
/////////////logicout
//////////////////////////////////////////////////////////////////////////
always @ (*) begin
	if(!reset_n) begin
		logicout[31:0] = {32{1'b0}};
	end else if(alusel!=3'b001) begin
		logicout[31:0] = {32{1'b0}};
	end else begin
		case(aluop[7:0])
			8'b00100100, 
			8'b00001100: logicout[31:0] = reg1_data & reg2_data;
			8'b00001101,
			8'b00100101: logicout[31:0] = reg1_data | reg2_data;
			8'b00100110, 
			8'b00001110: logicout[31:0] = reg1_data ^ reg2_data;
			8'b00100111: logicout[31:0] = ~(reg1_data | reg2_data);
			8'b00001111: logicout[31:0] = {reg2_data[15:0],16'd0};
			default:     logicout[31:0] = {32{1'b0}};
		endcase
	end
end


//////////////////////////////////////////////////////////////////////////
/////////////moveout
//////////////////////////////////////////////////////////////////////////
always @ (*) begin
	if(!reset_n) begin
		moveout[31:0] = {32{1'b0}};
	end else if(alusel==3'b010) begin //TODO
		case(aluop[7:0])
			8'b00000000: moveout[31:0] = (reg2_data << reg1_data[4:0]);
			8'b00000100: moveout[31:0] = (reg2_data << reg1_data[4:0]);
			8'b00000010: moveout[31:0] = (reg2_data >> reg1_data[4:0]);
			8'b00000110: moveout[31:0] = (reg2_data >> reg1_data[4:0]);
			8'b00000011:begin
				//TODO
				tempt[63:0]   = {32'hffff,32'h0} | reg2_data;
				right_move[63:0] = (tempt >> reg1_data[4:0]);
				if(reg2_data[31]==1)begin
					moveout[31:0] = right_move[31:0];
				end else begin
					moveout[31:0] = (reg2_data >> reg1_data[4:0]);
				end
			end
			8'b00000111:begin
				//TODO
				tempt[63:0]   = {32'hffff,32'h0} | reg2_data;
				right_move[63:0] = (tempt >> reg1_data);
				if(reg2_data[31]==1)begin
					moveout[31:0] = right_move[31:0];
				end else begin
					moveout[31:0] = (reg2_data >> reg1_data[4:0]);
				end
			end
			default: moveout[31:0] = {32{1'b0}};
		endcase
	end
end


//////////////////////////////////////////////////////////////////////////
/////////////shiftout
//////////////////////////////////////////////////////////////////////////
always @ (*) begin
	if(!reset_n) begin
		shiftout[31:0] = {32{1'b0}};
	end else if(alusel==3'b011) begin
		case(aluop)
			8'b00001010:begin
				if(reg2_data==32'd0)begin
					shiftout[31:0] = reg1_data[31:0];
				end
			end
			8'b00001011:begin
				if(reg2_data!=32'd0)begin
					shiftout[31:0] = reg1_data[31:0];
				end
			end
			8'b00010000:begin
				if(mem_whilo)begin
					shiftout[31:0] = mem_hi[31:0];
				end else if(wb_whilo)begin
					shiftout[31:0] = wb_hi[31:0];
				end else begin
					shiftout[31:0] = hilo_hi[31:0];
				end
			end
			8'b00010010:begin
				if(mem_whilo)begin
					shiftout[31:0] = mem_lo[31:0];
				end else if(wb_whilo)begin
					shiftout[31:0] = wb_lo[31:0];
				end else begin
					shiftout[31:0] = hilo_lo[31:0];
				end
			end
			default:begin
				shiftout[31:0] = {32{1'b0}};
			end
		endcase
	end
end

assign reg2_data_mux[31:0] = (alusel==3'b100 && ((aluop==8'b00100010)||(aluop==8'b00100011))||(aluop==8'b00101010)||(aluop==8'b00001010)||
			     (aluop==8'b00101011)||(aluop==8'b00001011)) ? (~reg2_data[31:0]+1) : reg2_data[31:0];
assign sum_tempt    [31:0] = reg1_data[31:0] + reg2_data_mux[31:0]; 
assign over_sum            = (reg1_data[31]) && reg2_data[31] &&(!sum_tempt[31]);
assign reg1_lt_reg2        = (alusel==3'b100 && ((aluop==8'b00101010)||(aluop==8'b00001010))) 
			     && ((reg1_data[31]&&(!reg2_data[31]))||(reg1_data[31]&&reg2_data[31]&&(!sum_tempt[31]))||((!reg1_data[31])&&(!reg2_data[31])&&(sum_tempt[31])));
assign opdata1_mult[31:0] = ((alusel==3'b100)&&((aluop==8'b000010)||(aluop==8'b11000)) && (reg1_data[31])) ? (~reg1_data+1):reg1_data;
assign opdata2_mult[31:0] = ((alusel==3'b100)&&((aluop==8'b000010)||(aluop==8'b11000)) && (reg2_data[31])) ? (~reg2_data+1):reg2_data;
assign mul_tempt   [63:0] = opdata1_mult[31:0] * opdata2_mult[31:0];

//////////////////////////////////////////////////////////////////////////
/////////////arithmeticout
//////////////////////////////////////////////////////////////////////////
always @ (*) begin
	if(!reset_n) begin
		arithmeticout[31:0] = {32{1'b0}};
	end else if(alusel[2:0]==3'b100) begin
		case(aluop[7:0])
			//TODO case 分支不全
			8'b00100000, 8'b00100010,8'b00100001, 8'b00100011,8'b00001000,8'b00001001:begin
				arithmeticout[31:0] = sum_tempt[31:0];
			end
			8'b00001011,8'b00101011:begin
				if(sum_tempt[31])begin
					arithmeticout[31:0] = 32'd1;
				end else begin
					arithmeticout[31:0] = 32'd0;
				end
			end
			8'b00011100:begin
				arithmeticout[31:0] = reg1_data[31] ? 32'd0  : 
						      reg1_data[30] ? 32'd1  :
						      reg1_data[29] ? 32'd2  :
						      reg1_data[28] ? 32'd3  :
						      reg1_data[27] ? 32'd4  :
						      reg1_data[26] ? 32'd5  :
						      reg1_data[25] ? 32'd6  :
						      reg1_data[24] ? 32'd7  :
						      reg1_data[23] ? 32'd8  :
						      reg1_data[22] ? 32'd9  :
						      reg1_data[21] ? 32'd10 :
						      reg1_data[20] ? 32'd11 :
						      reg1_data[19] ? 32'd12  :
						      reg1_data[18] ? 32'd13  :
						      reg1_data[17] ? 32'd14  :
						      reg1_data[16] ? 32'd15  :
						      reg1_data[15] ? 32'd16  :
						      reg1_data[14] ? 32'd17  :
						      reg1_data[13] ? 32'd18  :
						      reg1_data[12] ? 32'd19  :
						      reg1_data[11] ? 32'd20  :
						      reg1_data[10] ? 32'd21  :
						      reg1_data[ 9] ? 32'd22  :
						      reg1_data[ 8] ? 32'd23  :
						      reg1_data[ 7] ? 32'd24  :
						      reg1_data[ 6] ? 32'd25  :
						      reg1_data[ 5] ? 32'd26  :
						      reg1_data[ 4] ? 32'd27  :
						      reg1_data[ 3] ? 32'd28  :
						      reg1_data[ 2] ? 32'd29  :
						      reg1_data[ 1] ? 32'd30  :
						      reg1_data[ 0] ? 32'd31  : 32'd32;
			end
			8'b00100001:begin
				arithmeticout[31:0] = !reg1_data[31] ? 32'd0  : 
						      !reg1_data[30] ? 32'd1  :
						      !reg1_data[29] ? 32'd2  :
						      !reg1_data[28] ? 32'd3  :
						      !reg1_data[27] ? 32'd4  :
						      !reg1_data[26] ? 32'd5  :
						      !reg1_data[25] ? 32'd6  :
						      !reg1_data[24] ? 32'd7  :
						      !reg1_data[23] ? 32'd8  :
						      !reg1_data[22] ? 32'd9  :
						      !reg1_data[21] ? 32'd10 :
						      !reg1_data[20] ? 32'd11 :
						      !reg1_data[19] ? 32'd12  :
						      !reg1_data[18] ? 32'd13  :
						      !reg1_data[17] ? 32'd14  :
						      !reg1_data[16] ? 32'd15  :
						      !reg1_data[15] ? 32'd16  :
						      !reg1_data[14] ? 32'd17  :
						      !reg1_data[13] ? 32'd18  :
						      !reg1_data[12] ? 32'd19  :
						      !reg1_data[11] ? 32'd20  :
						      !reg1_data[10] ? 32'd21  :
						      !reg1_data[ 9] ? 32'd22  :
						      !reg1_data[ 8] ? 32'd23  :
						      !reg1_data[ 7] ? 32'd24  :
						      !reg1_data[ 6] ? 32'd25  :
						      !reg1_data[ 5] ? 32'd26  :
						      !reg1_data[ 4] ? 32'd27  :
						      !reg1_data[ 3] ? 32'd28  :
						      !reg1_data[ 2] ? 32'd29  :
						      !reg1_data[ 1] ? 32'd30  :
						      !reg1_data[ 0] ? 32'd31  : 32'd32;
			end
			8'b00000010:begin
				arithmeticout[31:0] = mul_tempt[31:0];
			end

		endcase
	end
end

//////////////////////////////////////////////////////////////////////////
/////////////wdata out
//////////////////////////////////////////////////////////////////////////
always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		ex_we         <= #`RD  1'b0;
		ex_waddr[4:0] <= #`RD  {5{1'b0}};
		ex_wdata[31:0]<= #`RD  {32{1'b0}};
	end else begin
		ex_we         <= #`RD  id_we;
		ex_waddr[4:0] <= #`RD  id_waddr[4:0];
		case(alusel[2:0])
			3'b000: ex_wdata[31:0] <= #`RD  {32{1'b0}};
			3'b001: ex_wdata[31:0] <= #`RD  logicout[31:0];
			3'b010: ex_wdata[31:0] <= #`RD  moveout[31:0];
			3'b011: ex_wdata[31:0] <= #`RD  shiftout[31:0];
			3'b100:begin
				//TODO rewrite in 'case' style 
				if((aluop==8'b00100000) || (aluop==8'b00100010) || (aluop==8'b00001000))begin
						if(!over_sum)begin
							ex_wdata[31:0] <= #`RD  arithmeticout[31:0];
						end
				end else if((aluop==8'b00001010) || (aluop==8'b00101010)) begin
					if(reg1_lt_reg2)begin
						ex_wdata[31:0] = 32'd1;
					end else begin
						ex_wdata[31:0] = 32'd0;
					end
					// A simple style looks like as follows:
					//ex_wdata[31:0] = reg1_lt_reg2 ? 32'd1 : 32'd0;
				end else  begin
					ex_wdata[31:0] <= #`RD  arithmeticout[31:0];
				end
			end
			default:begin
				ex_wdata[31:0] <= #`RD  {32{1'b0}};
			end
		endcase
	end
end


//////////////////////////////////////////////////////////////////////////
/////////////out to hilo
//////////////////////////////////////////////////////////////////////////
always @ (posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		ex_whilo     <= #`RD  1'b0;
		ex_hi [31:0] <= #`RD  {32{1'b0}};
		ex_lo [31:0] <= #`RD  {32{1'b0}};
	//TODO if-else if 分支不全
	end else if(alusel==3'b011) begin
		case(aluop[7:0])
			//TODO case 分支不全
			8'b00010001:begin
				ex_whilo     <= #`RD  1'b1;
                                ex_hi [31:0] <= #`RD  reg1_data[31:0];
			end
			8'b00010011:begin
				ex_whilo     <= #`RD  1'b1;
				ex_lo [31:0] <= #`RD  reg1_data[31:0];
			end
		endcase
	end else if(alusel==3'b100)begin
		case(aluop[7:0])
			//TODO case 分支不全
			8'b00011000,8'b00011001:begin
				ex_whilo    <= #`RD  1'b1;
				ex_hi[31:0] <= #`RD  mul_tempt[63:32];
				ex_lo[31:0] <= #`RD  mul_tempt[31:0 ];
			end
		endcase
	end
end

endmodule
