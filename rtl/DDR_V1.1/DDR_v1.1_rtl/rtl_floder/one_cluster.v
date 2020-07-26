`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/12 13:08:38
// Design Name: 
// Module Name: one_cluster
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// ģ�鶨λ:������������������������
//////////////////////////////////////////////////////////////////////////////////
/*********************************************************************************
  �������������´������¼�������������¼��
  ѭ����������
*********************************************************************************/

module one_cluster#(
  parameter      TIME  = 8  //��Ҫ�ķ�9��ʱ�����ڵõ�������
)
(
      clk, rst_n,
      
      channel_period_en,
      cfg_cluster_mask_i, //��ͨ�����ο���,�����㲥ģʽ�µ�1~7�š��ǹ㲥ģʽ�µ�δ���ôض�Ӧ���
      
      cluster_req_i, //��������
      cfg_valid_i,   //��������
      cfg_broadcast_i,
      cfg_third_i,
      cluster_num_i, //���ôظ���
      cfg_circu_times_i, //ѭ������
      cfg_row_column_i,  //�������ȼ�
      cfg_row_num_1st_i,
      cfg_column_num_1st_i,
      cfg_start_pos_row_i,
      cfg_start_pos_col_i,
      ddr_1st_row_pos,
      ddr_1st_col_pos,
      ddr_last_trans,
      
      cluster_request_allow, //���ô����������źţ�����Ч
      cluster_release_allow, //���ô��ͷ������źţ�����Ч
      cluster_pos_row,  //��������ľ����������
      cluster_pos_col   //��������ľ����������
    );
  
	//--------------------------------------------------
	// INPUT && OUTPUT ------- declaration
	//-------------------------------------------------- 
	    
  input               clk;
  input               rst_n;
  
  input               channel_period_en;
  input               cfg_cluster_mask_i;
  
  input               cluster_req_i;
  input               cfg_valid_i;
  input               cfg_broadcast_i;
  input               cfg_third_i;
  input               cfg_row_column_i;
  
  input     [ 2:0]    cluster_num_i;
  input     [29:0]    cfg_circu_times_i;
  
  input     [15:0]    cfg_row_num_1st_i;
  input     [13:0]    cfg_column_num_1st_i;
  
  input     [15:0]    cfg_start_pos_row_i;
  input     [13:0]    cfg_start_pos_col_i;
  
  input     [15:0]    ddr_1st_row_pos;
  input     [13:0]    ddr_1st_col_pos;
  input               ddr_last_trans;
  
  output    reg[15:0]    cluster_pos_row;
  output    reg[13:0]    cluster_pos_col;
  
  output    reg       cluster_request_allow;
  output    reg       cluster_release_allow;
  
  
	//--------------------------------------------------
	// REG && WIRE ------- declaration
	//--------------------------------------------------

  //��ڣ�һ�ν��������з�ת
//--------------------------------------------------------------------
  wire      [15:0]    cfg_row_num_1st;
  wire      [15:0]    cfg_col_num_1st;
  wire      [15:0]    cfg_start_pos_row;
  wire      [15:0]    cfg_start_pos_col;
  
  assign  cfg_row_num_1st    =  cfg_row_column_i ? cfg_row_num_1st_i : cfg_column_num_1st_i;
  assign  cfg_col_num_1st    = !cfg_row_column_i ? cfg_row_num_1st_i : cfg_column_num_1st_i;
  assign  cfg_start_pos_row  =  cfg_row_column_i ? cfg_start_pos_row_i : cfg_start_pos_col_i;
  assign  cfg_start_pos_col  = !cfg_row_column_i ? cfg_start_pos_row_i : cfg_start_pos_col_i;
//--------------------------------------------------------------------

  //���ڣ��ٴν���������
//--------------------------------------------------------------------
  reg       [15:0]    temporary_row;
  reg       [15:0]    temporary_col;
  reg       [15:0]    next_row;
  reg       [15:0]    next_col;
  reg       [15:0]    now_row;
  reg       [15:0]    now_col;
//--------------------------------------------------------------------
  
  
  
//----------------------------------------------------------------
// STATE-MACHINE (FSM)
// FSM_ENCODING  (GRAY)
//----------------------------------------------------------------
      localparam     IDLE       = 2'b00;  //����̬��������������
      localparam     CALCULATA  = 2'b01;  //�����´�����ʱ�ľ��������
      localparam     WAIT       = 2'b11;  //�ȴ����������
      localparam     RESULT     = 2'b10;  //�����Ѽ��������ͣ��
      
      (*fsm_encoding="gray"*)reg       [ 1:0]    state_cs;
      (*fsm_encoding="gray"*)reg       [ 1:0]    state_ns;
	  
      reg       [ 3:0]    state_cnt;
  
always@(posedge clk) begin
	if(!rst_n)
	  state_cs <= IDLE;
	else if(channel_period_en)
	  state_cs <= state_ns;
	else
	  state_cs <= IDLE;
end
  
always@( * ) begin
	case(state_cs)
	//------------------------------
	  IDLE:
	      begin
	      	  if(cfg_cluster_mask_i) //�����ͨ�����ο���,����FSM
	      	    state_ns = IDLE;
	      	  else if(cluster_req_i)
	      	    state_ns = CALCULATA;
	      	  else
	      	    state_ns = IDLE;
	      end
	  CALCULATA:
	      begin
	      	  if(cfg_broadcast_i)
	      	    state_ns = WAIT;
	      	  else if(state_cnt == cluster_num_i)
	      	    state_ns = WAIT;
	      	  else
	      	    state_ns = CALCULATA;
	      end
	  WAIT:
	      begin
	      	  if(state_cnt == TIME)
	      	    state_ns = RESULT;
	      	  else
	      	    state_ns = WAIT;
	      end
	  RESULT:   state_ns = IDLE;
	//------------------------------
	endcase
end
  
always@(posedge clk) begin
	if(!rst_n) 
	  state_cnt <= 'b0;
	else if(state_cs == CALCULATA || state_cs == WAIT) //total: 8 clk-period
	  state_cnt <= state_cnt + 1'b1;
	else
	  state_cnt <= 'b0;
end
  

////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////

//�������
//--------------------------------------------------------START
  always@(posedge clk) begin
  	if(!rst_n) begin
  	  now_row <= 16'b0;
  	  now_col <= 16'b0;
  	end
  	else if(cluster_req_i) begin
  	  now_row <= next_row;
  	  now_col <= next_col;
  	end
  end
  
  //��¼�´η��ʵľ��������
  always@(posedge clk) begin
  	if(!rst_n) begin
  	  next_row <= 16'b0;
  	  next_col <= 16'b0;
  	end
  	else if(cfg_cluster_mask_i) begin //�����ͨ�����ο��أ������´������¼��
  		next_row <= 16'b0;
  	  next_col <= 16'b0;
  	end
  	else if(cfg_broadcast_i & cfg_valid_i) begin
  	  next_row <= 16'b0;
  	  next_col <= 16'b0;
  	end
  	else if(cfg_valid_i) begin
  	  next_row <= cfg_start_pos_row;
  	  next_col <= cfg_start_pos_col;
  	end
  	else if(state_cs == CALCULATA && state_ns == WAIT) begin
  	  next_row <= temporary_row;
  	  next_col <= temporary_col;
  	end
  end
  
  //�������
//  always@(posedge clk) begin
//  	if(!rst_n) begin
//  	  temporary_row <= 16'b0;
//  	  temporary_col <= 16'b0;
//  	end
//  	else if(cfg_cluster_mask_i) begin //�����ͨ�����ο��أ���������������
//  		temporary_row <= 16'b0;
//  		temporary_col <= 16'b0;
//  	end
//  	else if(cfg_valid_i) begin
//  	  temporary_row <= cfg_start_pos_row;
//  	  temporary_col <= cfg_start_pos_col;
//  	end
//  	else if(state_ns == CALCULATA) begin
//	  		if (temporary_col == cfg_col_num_1st && temporary_row==cfg_row_num_1st)
//	  		begin
//	  		    temporary_col <= 16'b0;
//	  		    temporary_row <= 16'b0;
//	  		end
//	  		else if(temporary_col == cfg_col_num_1st)
//	  		begin
//	  		    temporary_col <= 16'b0;
//	  		    temporary_row <= temporary_row+1'b1;
//	  		end
//	  		else
//	  		begin
//	  		    temporary_col <= temporary_col + 1'b1;
//	  		    temporary_row <= temporary_row;
//	  		end
//  	end
//  end
  
  always@(posedge clk) begin
  	if(!rst_n)
  	  temporary_row <= 16'b0;
  	else if(cfg_cluster_mask_i) //�����ͨ�����ο��أ���������������
  		temporary_row <= 16'b0;
  	else if(cfg_broadcast_i&cfg_valid_i) //���㲥�����ҵ�ǰģ��δ������,��������������������
  		temporary_row <= 16'b0;
  	else if(cfg_valid_i)
  	  temporary_row <= cfg_start_pos_row;
  	else if(state_ns == CALCULATA && temporary_col == cfg_col_num_1st)
	  	temporary_row <= (temporary_row == cfg_row_num_1st) ? 16'b0 :(temporary_row+1'b1);
	  else
	  	temporary_row <= temporary_row;
  end
  always@(posedge clk) begin
  	if(!rst_n)
  	  temporary_col <= 16'b0;
  	else if(cfg_cluster_mask_i)//�����ͨ�����ο��أ���������������
  		temporary_col <= 16'b0;
  	else if(cfg_broadcast_i&cfg_valid_i) //���㲥�����ҵ�ǰģ��δ������,��������������������
  		temporary_col <= 16'b0;
  	else if(cfg_valid_i)
  	  temporary_col <= cfg_start_pos_col;
  	else if(state_ns == CALCULATA)
	  	temporary_col <= (temporary_col==cfg_col_num_1st) ? 16'b0 : (temporary_col+1'b1);
	  else
	    temporary_col <= temporary_col;
  end
//--------------------------------------------------------END


//ѭ������
//--------------------------------------------------------START
  reg       [29:0]    loop_cnt;
  wire                loop_add_en; //ѭ����������ʹ��
  wire                loop_end_en; //���һ��ѭ����־
  reg       [15:0]    temporary_row_r1;
  reg       [15:0]    temporary_col_r1;
  reg                 cluster_release_en;
  
  always@(posedge clk) begin
  	if(!rst_n) begin
       temporary_row_r1 <= 16'b0;
       temporary_col_r1 <= 16'b0;  		
  	end
  	else begin
       temporary_row_r1 <= temporary_row;
       temporary_col_r1 <= temporary_col;
  	end
  end
  
assign  loop_add_en = (temporary_row_r1 == cfg_row_num_1st) &&
                      (temporary_col_r1 == cfg_col_num_1st) &&
                      (state_cs == CALCULATA);
assign  loop_end_en = (loop_cnt == cfg_circu_times_i);
  
  //��¼ѭ������
  always@(posedge clk) begin
  	if(!rst_n)
  	   loop_cnt <= 'b0;
  	else if(cfg_valid_i) //���ó�ʼ��
  	   loop_cnt <= 'b0;
  	else if(loop_add_en && !loop_end_en)
  	   loop_cnt <= loop_cnt + 1'b1;
  	else
  	   loop_cnt <= loop_cnt;
  end
  
  //�������ô��ͷ�����
  always@(posedge clk) begin
  	if(!rst_n)
  	   cluster_release_en <= 1'b0;
  	else if(cfg_valid_i) //���������嵽��ʱ�������ʼ���ڲ���ؼĴ���
  	   cluster_release_en <= 1'b0;
  	else if(loop_add_en && loop_end_en)
  	   cluster_release_en <= 1'b1;
  	else
  	   cluster_release_en <= cluster_release_en;
  end
//--------------------------------------------------------END


//����Ѽ�
//--------------------------------------------------------START
  always@(posedge clk) begin
  	if(!rst_n)
  	   cluster_request_allow <= 1'b0;
  	else if(state_ns == RESULT)
  	   cluster_request_allow <= 1'b1;
  	else
  	   cluster_request_allow <= 1'b0;
  end
  
  always@(posedge clk) begin
  	if(!rst_n) begin
  		cluster_pos_row <= 'b0;
  		cluster_pos_col <= 'b0;
  	end
  	else if(state_ns == RESULT) begin
	  		if(cfg_third_i) begin //��������������ֱ�Ӵ��;��������
	  			cluster_pos_row <= ddr_1st_row_pos;
		  		cluster_pos_col <= ddr_1st_col_pos;
	  		end
	  		else begin
		  		cluster_pos_row <=  cfg_row_column_i ? now_row[15:0] : now_col[15:0];
		  		cluster_pos_col <= !cfg_row_column_i ? now_row[13:0] : now_col[13:0];
	  		end
  	end
  end
  
  always@(posedge clk) begin
  	if(!rst_n)
  	   cluster_release_allow <= 1'b0;
  	else if(!channel_period_en)
  	   cluster_release_allow <= 1'b0;
  	else if(cfg_cluster_mask_i)
  	   cluster_release_allow <= 1'b1;
  	else if(state_ns == RESULT)
  	   if(cfg_third_i)
  	     cluster_release_allow <= ddr_last_trans;
  	   else
  	     cluster_release_allow <= cluster_release_en;
  end
//--------------------------------------------------------END

endmodule
