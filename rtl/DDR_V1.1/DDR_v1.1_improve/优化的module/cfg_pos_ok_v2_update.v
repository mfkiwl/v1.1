`timescale 1ns / 1ps
//`include "ddr_define.vh"
/*********************************************************************************
//////////////////////////////////////////////////////////////////////////////////
Module name : <cfg_pos_ok>  ���궨λ��
Function: ��ȡ������Ϣ���������ַͨ���б����ôص��״η���ʱ�ľ�������ꡣ
	�� Դ ��<ddr_cfg_decoder>
	Ŀ �� ��<addr_ch_xx>
	��Ҫ����5��������
	                1) ���궨λ�����أ�ֻ����ͨģʽ����Ч��   --------- (CFG0)
					2) ��/�����ȼ���־   ------------------------------ (CFG0)
					3) ���ô���Ŀ   ----------------------------------- (CFG0)
					4) һ����������   --------------------------------- (CFG6)
					5) һ����������   --------------------------------- (CFG6)
	���������ʱ����
	                �ڵõ�ȫ������������󣬼��ɿ�ʼ����  ------------- (CFG6���ʱ)
	������밴ʱ��ɣ�
	                ������������CFG15����֮ǰ���
//////////////////////////////////////////////////////////////////////////////////
*********************************************************************************/
module	cfg_pos_ok_v2(
	clk,
	//rst_n,
	
	cfg_broadcast_i,  //���㲥��������ǰģ����Ч,�ݴ˿�����Ϊ��ǰģ����ܿ���    ����cfgid=0
	
	pos_ok_start_pre_i, //����cfgid=5
	
	cfg_row_column_i,     //�������ȼ�   ����cfgid=0
	cfg_ch_cluster_num_i, //���ôظ���   ����cfgid=0
	
  cfg_row_num_1st_i,    //һ����������    ����cfgid=6
  cfg_column_num_1st_i, //һ����������    ����cfgid=6
  
  cfg_start_pos_row_0_o,
  cfg_start_pos_col_0_o,
  cfg_start_pos_row_1_o,
  cfg_start_pos_col_1_o,
  cfg_start_pos_row_2_o,
  cfg_start_pos_col_2_o,
  cfg_start_pos_row_3_o,
  cfg_start_pos_col_3_o,
  cfg_start_pos_row_4_o,
  cfg_start_pos_col_4_o,
  cfg_start_pos_row_5_o,
  cfg_start_pos_col_5_o,
  cfg_start_pos_row_6_o,
  cfg_start_pos_col_6_o,
  cfg_start_pos_row_7_o,
  cfg_start_pos_col_7_o
);
	
	//--------------------------------------------------
	// INPUT && OUTPUT ------- declaration
	//--------------------------------------------------
  input			clk;
  //input			rst_n;
  
  input             cfg_broadcast_i;
  
  input							pos_ok_start_pre_i;
	//input							pos_ok_start_en_i;
	
	input							cfg_row_column_i;
	input		[ 2:0]		cfg_ch_cluster_num_i;
	
  input		[15:0]		cfg_row_num_1st_i;
  input		[13:0]		cfg_column_num_1st_i;
	
  output	[15:0]    cfg_start_pos_row_0_o;
  output	[13:0]    cfg_start_pos_col_0_o;
  output	[15:0]    cfg_start_pos_row_1_o;
  output	[13:0]    cfg_start_pos_col_1_o;
  output	[15:0]    cfg_start_pos_row_2_o;
  output	[13:0]    cfg_start_pos_col_2_o;
  output	[15:0]    cfg_start_pos_row_3_o;
  output	[13:0]    cfg_start_pos_col_3_o;
  output	[15:0]    cfg_start_pos_row_4_o;
  output	[13:0]    cfg_start_pos_col_4_o;
  output	[15:0]    cfg_start_pos_row_5_o;
  output	[13:0]    cfg_start_pos_col_5_o;
  output	[15:0]    cfg_start_pos_row_6_o;
  output	[13:0]    cfg_start_pos_col_6_o;
  output	[15:0]    cfg_start_pos_row_7_o;
  output	[13:0]    cfg_start_pos_col_7_o;
	
	//--------------------------------------------------
	// REG && WIRE ------- declaration
	//--------------------------------------------------
//  reg     [15:0]    cfg_start_pos_row_0_r;
//  reg     [13:0]    cfg_start_pos_col_0_r;
  reg     [15:0]    cfg_start_pos_row_1_r = 'b0;
  reg     [13:0]    cfg_start_pos_col_1_r = 'b0;
  reg     [15:0]    cfg_start_pos_row_2_r = 'b0;
  reg     [13:0]    cfg_start_pos_col_2_r = 'b0;
  reg     [15:0]    cfg_start_pos_row_3_r = 'b0;
  reg     [13:0]    cfg_start_pos_col_3_r = 'b0;
  reg     [15:0]    cfg_start_pos_row_4_r = 'b0;
  reg     [13:0]    cfg_start_pos_col_4_r = 'b0;
  reg     [15:0]    cfg_start_pos_row_5_r = 'b0;
  reg     [13:0]    cfg_start_pos_col_5_r = 'b0;
  reg     [15:0]    cfg_start_pos_row_6_r = 'b0;
  reg     [13:0]    cfg_start_pos_col_6_r = 'b0;
  reg     [15:0]    cfg_start_pos_row_7_r = 'b0;
  reg     [13:0]    cfg_start_pos_col_7_r = 'b0;
           
	reg		  [15:0]    pos_row_r = 'b0;
	reg		  [13:0]    pos_col_r = 'b0;
  
	reg		  [ 2:0]    cluster_cnt = 'b0;
	wire              calculate_en_int;
	reg               calculate_en_r = 'B0;
	wire              record_en_int;
	reg     [ 7:0]    shift_cnt = 'b0;
	
assign  calculate_en_int  = (|cluster_cnt);
assign  record_en_int     = calculate_en_r;
	
	//--------------------------------------------------
	// Code script
	//--------------------------------------------------
	  
	  //��Ҫ�趨һ�����������������ɶ�Ӧ���ô���Ŀ�ĸߵ�ƽ������Ч�ź�
    always@(posedge clk) begin
    	if(!cfg_broadcast_i & pos_ok_start_pre_i) //�����ܿ���: cfg_broadcast_i
    		cluster_cnt <= cfg_ch_cluster_num_i;
    	else if(|cluster_cnt)
    		cluster_cnt <= cluster_cnt - 1'b1;
    	else
    		cluster_cnt <= 3'b0;
    end
    
    always@(posedge clk) begin
    	  calculate_en_r <= calculate_en_int;
    end
    
    always@(posedge clk) begin
    	if(!cfg_broadcast_i & pos_ok_start_pre_i) //�����ܿ���: cfg_broadcast_i
        shift_cnt <= {shift_cnt[6:0], 1'b1}; //��ʱ����7λ��Ϊ0 ------- �����������Ա�{7'b0,1'b1}ʡ��Դ
      else if(calculate_en_int)
        shift_cnt <= {shift_cnt[6:0], 1'b0};
      else
        shift_cnt <= 8'b0;
    end
    
	//����������ȷ��д���Ӧ�ļĴ���
    always@(posedge clk) begin
    	if(record_en_int & shift_cnt[1]) begin //ÿ����֧״̬ά��ʱ��Ϊ: 1-clk_cycle / 0-clk_cycle
    	  //-------------------------------------------
         cfg_start_pos_row_1_r <= pos_row_r;
         cfg_start_pos_col_1_r <= pos_col_r;
    	  //-------------------------------------------
    	end
    end
	
    always@(posedge clk) begin
    	if(record_en_int & shift_cnt[2]) begin //ÿ����֧״̬ά��ʱ��Ϊ: 1-clk_cycle / 0-clk_cycle
    	  //-------------------------------------------
         cfg_start_pos_row_2_r <= pos_row_r;
         cfg_start_pos_col_2_r <= pos_col_r;
    	  //-------------------------------------------
    	end
    end
	
    always@(posedge clk) begin
    	if(record_en_int & shift_cnt[3]) begin //ÿ����֧״̬ά��ʱ��Ϊ: 1-clk_cycle / 0-clk_cycle
    	  //-------------------------------------------
         cfg_start_pos_row_3_r <= pos_row_r;
         cfg_start_pos_col_3_r <= pos_col_r;
    	  //-------------------------------------------
    	end
    end
	
    always@(posedge clk) begin
    	if(record_en_int & shift_cnt[4]) begin //ÿ����֧״̬ά��ʱ��Ϊ: 1-clk_cycle / 0-clk_cycle
    	  //-------------------------------------------
         cfg_start_pos_row_4_r <= pos_row_r;
         cfg_start_pos_col_4_r <= pos_col_r;
    	  //-------------------------------------------
    	end
    end
	
    always@(posedge clk) begin
    	if(record_en_int & shift_cnt[5]) begin //ÿ����֧״̬ά��ʱ��Ϊ: 1-clk_cycle / 0-clk_cycle
    	  //-------------------------------------------
         cfg_start_pos_row_5_r <= pos_row_r;
         cfg_start_pos_col_5_r <= pos_col_r;
    	  //-------------------------------------------
    	end
    end
	
    always@(posedge clk) begin
    	/* if(!rst_n) begin
         cfg_start_pos_row_6_r <= 'b0;
         cfg_start_pos_col_6_r <= 'b0;
    	end
    	else  */if(record_en_int & shift_cnt[6]) begin //ÿ����֧״̬ά��ʱ��Ϊ: 1-clk_cycle / 0-clk_cycle
    	  //-------------------------------------------
         cfg_start_pos_row_6_r <= pos_row_r;
         cfg_start_pos_col_6_r <= pos_col_r;
    	  //-------------------------------------------
    	end
    end
	
    always@(posedge clk) begin
    	/* if(!rst_n) begin
         cfg_start_pos_row_7_r <= 'b0;
         cfg_start_pos_col_7_r <= 'b0;
    	end
    	else  */if(record_en_int & shift_cnt[7]) begin //ÿ����֧״̬ά��ʱ��Ϊ: 1-clk_cycle / 0-clk_cycle
    	  //-------------------------------------------
         cfg_start_pos_row_7_r <= pos_row_r;
         cfg_start_pos_col_7_r <= pos_col_r;
    	  //-------------------------------------------
    	end
    end
	
	
	//calculate the start pos
    always@(posedge clk) begin
    	/* if(!rst_n) begin
        pos_row_r <= 16'b0;
        pos_col_r <= 14'b0;
      end
//      else if(!cfg_broadcast_i & pos_ok_start_pre_i) begin//���㣺1������ǰ��֧����ֱ��ȥ���� 2������ʹ����������Ҳ���Բ����ܿ��ء�
//        pos_row_r <= 16'b0;
//        pos_col_r <= 14'b0;
//      end
      else  */if(!cfg_broadcast_i & calculate_en_int)
      begin
      	//--------------------------------------------------
          if(cfg_row_column_i) begin	//������
            if(pos_col_r == cfg_column_num_1st_i) begin
              pos_row_r <= pos_row_r + 1'b1;
              pos_col_r <= 'b0;
            end
            else begin
              pos_row_r <= pos_row_r;
              pos_col_r <= pos_col_r + 1'b1;
            end
          end
          
          else begin	//������
            if(pos_row_r == cfg_row_num_1st_i) begin
              pos_col_r <= pos_col_r + 1'b1;
              pos_row_r <= 'b0;
            end
            else begin
              pos_col_r <= pos_col_r;
              pos_row_r <= pos_row_r + 1'b1;
            end
          end
      	//--------------------------------------------------
      end
      else begin
        pos_row_r <= 16'b0;
        pos_col_r <= 14'b0;
      end
    end

	
	//########################################
	// OUTPUT ---------- connection
	//########################################
	
  assign  cfg_start_pos_row_0_o = {16{1'b0}};
  assign  cfg_start_pos_col_0_o = {14{1'b0}};
  assign  cfg_start_pos_row_1_o = cfg_start_pos_row_1_r;
  assign  cfg_start_pos_col_1_o = cfg_start_pos_col_1_r;
  assign  cfg_start_pos_row_2_o = cfg_start_pos_row_2_r;
  assign  cfg_start_pos_col_2_o = cfg_start_pos_col_2_r;
  assign  cfg_start_pos_row_3_o = cfg_start_pos_row_3_r;
  assign  cfg_start_pos_col_3_o = cfg_start_pos_col_3_r;
  assign  cfg_start_pos_row_4_o = cfg_start_pos_row_4_r;
  assign  cfg_start_pos_col_4_o = cfg_start_pos_col_4_r;
  assign  cfg_start_pos_row_5_o = cfg_start_pos_row_5_r;
  assign  cfg_start_pos_col_5_o = cfg_start_pos_col_5_r;
  assign  cfg_start_pos_row_6_o = cfg_start_pos_row_6_r;
  assign  cfg_start_pos_col_6_o = cfg_start_pos_col_6_r;
  assign  cfg_start_pos_row_7_o = cfg_start_pos_row_7_r;
  assign  cfg_start_pos_col_7_o = cfg_start_pos_col_7_r;
	
	
	
endmodule