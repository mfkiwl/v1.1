`timescale 1ns / 1ps
/*********************************************************************************
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/08/10 10:21:30
// Design Name: 
// Module Name: addr_ch_xx
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
//         v0.01 - File Created
// Additional Comments:
// 
PS:  -----------------------------
      1����ģʽ�ݲ�����
      2�������㲥�ݲ�����
      3��D2D�����ݲ�����
     -----------------------------
     
//////////////////////////////////////////////////////////////////////////////////
*********************************************************************************/


module addr_ch_xx

#(

	parameter    DATA_CHANNEL_ID  = 5'd0		//32����������ͨ����Ψһ��ʶ��ȡֵ��Χ0~31
	
)
(
  clk,
  rst_n,
  
  //request info
  request_valid_i,        //strobe signal, last only one clock priod.
  request_pos_1st_i,
  request_pos_2nd_i,
  request_src_type_i,     //����src_a/src_b
  request_addr_1st_row_i,
  request_addr_1st_col_i,
  request_addr_last_trans_i,
  

	//cfg info
	cfg_valid_i,          //strobe signal, last only one clock priod.
	cfg_third_req_i,
	cfg_broadcast_i,
	cfg_row_column_i,			//0-��  1-��
	cfg_read_write_i,			//0-��  1-д
	cfg_cluster_num_i,
	cfg_VR_id_i,					//������������Ĵ������
	cfg_VR_FR_i,
	cfg_channel_id_i,	    //��ַͨ�����
	
//------------------no-use
	cfg_stream_i,
	cfg_D2D_flag_i,
//------------------
	
	//�����cfg info�����ߵ���ʽ�·���32��ddr_channel
  cfg_data_pos0_1st_i,	/*** ��DDR�������ݽ�����IP��һ������ ***/
  cfg_data_pos1_1st_i,
  cfg_data_pos2_1st_i,
  cfg_data_pos3_1st_i,
  cfg_data_pos4_1st_i,
  cfg_data_pos5_1st_i,
  cfg_data_pos6_1st_i,
  cfg_data_pos7_1st_i,
  cfg_data_pos0_2nd_i,
  cfg_data_pos1_2nd_i,
  cfg_data_pos2_2nd_i,
  cfg_data_pos3_2nd_i,
  cfg_data_pos4_2nd_i,
  cfg_data_pos5_2nd_i,
  cfg_data_pos6_2nd_i,
  cfg_data_pos7_2nd_i,
	
  cfg_addr_pos0_1st_i,	/*** �������������IP��һ������ ***/ //һ����˵��IP��COP��
  cfg_addr_pos1_1st_i,                                       //������������ʱ�������겻ʹ�ã�Ĭ��Ϊ�㡣
  cfg_addr_pos2_1st_i,
  cfg_addr_pos3_1st_i,
  cfg_addr_pos4_1st_i,
  cfg_addr_pos5_1st_i,
  cfg_addr_pos6_1st_i,
  cfg_addr_pos7_1st_i,
  cfg_addr_pos0_2nd_i,
  cfg_addr_pos1_2nd_i,
  cfg_addr_pos2_2nd_i,
  cfg_addr_pos3_2nd_i,
  cfg_addr_pos4_2nd_i,
  cfg_addr_pos5_2nd_i,
  cfg_addr_pos6_2nd_i,
  cfg_addr_pos7_2nd_i,
  
  cfg_start_pos_row_0_i,	/*** �������ôس��η���DDRʱ���ʵľ�����ڶ�ά���������е����� ***/
  cfg_start_pos_col_0_i,
  cfg_start_pos_row_1_i,
  cfg_start_pos_col_1_i,
  cfg_start_pos_row_2_i,
  cfg_start_pos_col_2_i,
  cfg_start_pos_row_3_i,
  cfg_start_pos_col_3_i,
  cfg_start_pos_row_4_i,
  cfg_start_pos_col_4_i,
  cfg_start_pos_row_5_i,
  cfg_start_pos_col_5_i,
  cfg_start_pos_row_6_i,
  cfg_start_pos_col_6_i,
  cfg_start_pos_row_7_i,
  cfg_start_pos_col_7_i,
	
  cfg_start_addr_i,
  cfg_row_num_1st_i,
  cfg_col_num_1st_i,
  cfg_row_num_2nd_i,
  cfg_col_num_2nd_i,
  cfg_circu_times_i,		//ѭ������
  
	cfg_col_addr_burst_i,	//һ�������м�һ��ַ������Ŀ
	cfg_row_addr_burst_i,	//һ�������м�һ��ַ������Ŀ
	cfg_2nd_addr_burst_i,	//���������м�һ��ַ������Ŀ
	cfg_length_burst_i,	  //���������С--------�涨Ϊ����������е�С���ܸ���

//-----------------------------------------------------------------------------------------//

  //result
  req_valid_o,
  req_pos_1st_o,
  req_pos_2nd_o,
  req_pos_src_type_o,
  cfg_start_addr_o,	     //��ַͨ������ʼ��ַ
  cfg_row_addr_burst_o,
  cfg_col_addr_burst_o,
  select_pos_row_o,
  select_pos_col_o,
  req_length_burst_o, 	 //���������С
  req_2nd_addr_burst_o,  //���������м��
  req_col_num_2nd_o,     //������������Ŀ
  
  //�㲥����Ҫ����Ϣ
  req_broadcast_o,
  req_pos0_1st_o,
  req_pos1_1st_o,
  req_pos2_1st_o,
  req_pos3_1st_o,
  req_pos4_1st_o,
  req_pos5_1st_o,
  req_pos6_1st_o,
  req_pos7_1st_o,
  req_pos0_src_type_o,
  req_pos1_src_type_o,
  req_pos2_src_type_o,
  req_pos3_src_type_o,
  req_pos4_src_type_o,
  req_pos5_src_type_o,
  req_pos6_src_type_o,
  req_pos7_src_type_o,
  
  //ͨ���ͷ���Ҫ����Ϣ
  req_release_o,
  VR_id_o,          //������������Ĵ������
  VR_FR_o,
  channel_id_o  //��ַͨ�����
    );
    
  
	//--------------------------------------------------
	// INPUT && OUTPUT ------- declaration
	//--------------------------------------------------
  input			clk;	//ϵͳʱ��
  input			rst_n;
  
  //request info
  input                 request_valid_i;
  input     [ 7:0]      request_pos_1st_i;
  input     [ 2:0]      request_pos_2nd_i;
  input     [ 1:0]      request_src_type_i;
  input     [15:0]      request_addr_1st_row_i;		//������COP������������
  input     [13:0]      request_addr_1st_col_i;
  input                 request_addr_last_trans_i;
    
	//cfg info
  input                 cfg_valid_i;
	
	input                 cfg_third_req_i;
	input                 cfg_stream_i;
	input                 cfg_broadcast_i;
	input                 cfg_row_column_i;		//0-��  1-��
	input                 cfg_read_write_i;		//0-��  1-д
	input                 cfg_D2D_flag_i;	
	input     [ 2:0]      cfg_cluster_num_i;
	input     [ 8:0]      cfg_VR_id_i;					//������������Ĵ������
	input     [ 2:0]      cfg_VR_FR_i;
	input     [ 4:0]      cfg_channel_id_i;	//��ַͨ�����
    
	//�����cfg info�����ߵ���ʽ�·���32��ddr_channel
  input     [ 7:0]      cfg_data_pos0_1st_i;	/*** ��DDR�������ݽ�����IP��һ������ ***/
  input     [ 7:0]      cfg_data_pos1_1st_i;
  input     [ 7:0]      cfg_data_pos2_1st_i;
  input     [ 7:0]      cfg_data_pos3_1st_i;
  input     [ 7:0]      cfg_data_pos4_1st_i;
  input     [ 7:0]      cfg_data_pos5_1st_i;
  input     [ 7:0]      cfg_data_pos6_1st_i;
  input     [ 7:0]      cfg_data_pos7_1st_i;
  input     [ 2:0]      cfg_data_pos0_2nd_i;
  input     [ 2:0]      cfg_data_pos1_2nd_i;
  input     [ 2:0]      cfg_data_pos2_2nd_i;
  input     [ 2:0]      cfg_data_pos3_2nd_i;
  input     [ 2:0]      cfg_data_pos4_2nd_i;
  input     [ 2:0]      cfg_data_pos5_2nd_i;
  input     [ 2:0]      cfg_data_pos6_2nd_i;
  input     [ 2:0]      cfg_data_pos7_2nd_i;
  
  input     [ 7:0]      cfg_addr_pos0_1st_i;	/*** �������������IP��һ������ ***/  //һ����˵��IP��COP
  input     [ 7:0]      cfg_addr_pos1_1st_i;  //������������ʱ�������겻ʹ�ã�Ĭ��Ϊ�㡣
  input     [ 7:0]      cfg_addr_pos2_1st_i;
  input     [ 7:0]      cfg_addr_pos3_1st_i;
  input     [ 7:0]      cfg_addr_pos4_1st_i;
  input     [ 7:0]      cfg_addr_pos5_1st_i;
  input     [ 7:0]      cfg_addr_pos6_1st_i;
  input     [ 7:0]      cfg_addr_pos7_1st_i;
  input     [ 2:0]      cfg_addr_pos0_2nd_i;
  input     [ 2:0]      cfg_addr_pos1_2nd_i;
  input     [ 2:0]      cfg_addr_pos2_2nd_i;
  input     [ 2:0]      cfg_addr_pos3_2nd_i;
  input     [ 2:0]      cfg_addr_pos4_2nd_i;
  input     [ 2:0]      cfg_addr_pos5_2nd_i;
  input     [ 2:0]      cfg_addr_pos6_2nd_i;
  input     [ 2:0]      cfg_addr_pos7_2nd_i;
  
  input     [15:0]      cfg_start_pos_row_0_i;	/*** �������ôس��η���DDRʱ���ʵľ�����ڶ�ά���������е����� ***/
  input     [13:0]      cfg_start_pos_col_0_i;
  input     [15:0]      cfg_start_pos_row_1_i;
  input     [13:0]      cfg_start_pos_col_1_i;
  input     [15:0]      cfg_start_pos_row_2_i;
  input     [13:0]      cfg_start_pos_col_2_i;
  input     [15:0]      cfg_start_pos_row_3_i;
  input     [13:0]      cfg_start_pos_col_3_i;
  input     [15:0]      cfg_start_pos_row_4_i;
  input     [13:0]      cfg_start_pos_col_4_i;
  input     [15:0]      cfg_start_pos_row_5_i;
  input     [13:0]      cfg_start_pos_col_5_i;
  input     [15:0]      cfg_start_pos_row_6_i;
  input     [13:0]      cfg_start_pos_col_6_i;
  input     [15:0]      cfg_start_pos_row_7_i;
  input     [13:0]      cfg_start_pos_col_7_i;
    
  input     [29:0]      cfg_start_addr_i;
  input     [15:0]      cfg_row_num_1st_i;
  input     [13:0]      cfg_col_num_1st_i;
  input     [15:0]      cfg_row_num_2nd_i;
  input     [13:0]      cfg_col_num_2nd_i;
  input     [29:0]      cfg_circu_times_i;		//ѭ������
  
	input     [29:0]      cfg_col_addr_burst_i;	//һ�������м�һ��ַ������Ŀ
	input     [29:0]      cfg_row_addr_burst_i;	//һ�������м�һ��ַ������Ŀ
	input     [29:0]      cfg_2nd_addr_burst_i;	//���������м�һ��ַ������Ŀ
	input     [29:0]      cfg_length_burst_i;	  //���������С--------�涨Ϊ����������е�С���ܸ���
	
  //result
  output    [ 1:0]      req_valid_o;
  output    [ 7:0]      req_pos_1st_o;
  output    [ 2:0]      req_pos_2nd_o;
  output    [ 1:0]      req_pos_src_type_o;
  output    [29:0]      cfg_start_addr_o;
  output    [29:0]      cfg_row_addr_burst_o;
  output    [29:0]      cfg_col_addr_burst_o;
  output    [15:0]      select_pos_row_o;
  output    [13:0]      select_pos_col_o;
  output    [29:0]      req_length_burst_o;
  output    [29:0]      req_2nd_addr_burst_o;
  output    [29:0]      req_col_num_2nd_o;
  
  output                req_broadcast_o;
  output    [ 7:0]      req_pos0_1st_o;
  output    [ 7:0]      req_pos1_1st_o;
  output    [ 7:0]      req_pos2_1st_o;
  output    [ 7:0]      req_pos3_1st_o;
  output    [ 7:0]      req_pos4_1st_o;
  output    [ 7:0]      req_pos5_1st_o;
  output    [ 7:0]      req_pos6_1st_o;
  output    [ 7:0]      req_pos7_1st_o;
  output    [ 1:0]      req_pos0_src_type_o;
  output    [ 1:0]      req_pos1_src_type_o;
  output    [ 1:0]      req_pos2_src_type_o;
  output    [ 1:0]      req_pos3_src_type_o;
  output    [ 1:0]      req_pos4_src_type_o;
  output    [ 1:0]      req_pos5_src_type_o;
  output    [ 1:0]      req_pos6_src_type_o;
  output    [ 1:0]      req_pos7_src_type_o;
  
  output                req_release_o;
  output    [ 8:0]      VR_id_o;          //������������Ĵ������
  output    [ 2:0]      VR_FR_o;
  output    [ 4:0]      channel_id_o;     //��ַͨ�����
	//--------------------------------------------------
	// REG && WIRE ------- declaration
	//--------------------------------------------------
	
	/*** �ػ�������Ϣ�����ϵ�������Ϣ ***/
	reg                   cfg_third_req_r;
	reg                   cfg_stream_r;
	reg                   cfg_broadcast_r;
	reg                   cfg_row_column_r;		  //0-��  1-��
	reg                   cfg_read_write_r;			//0-��  1-д
	reg                   cfg_D2D_flag_r;
	reg       [ 2:0]      cfg_cluster_num_r;
	reg       [ 8:0]      cfg_VR_id_r;					//������������Ĵ������
	reg       [ 2:0]      cfg_VR_FR_r;
	reg       [ 4:0]      cfg_channel_id_r;	    //��ַͨ�����
	
	//32��ddr_channel�ֱ�Ĵ�������Ϣ�����ϵ�cfg info
  reg       [ 7:0]      cfg_data_pos0_1st_r;	/*** ��DDR�������ݽ�����IP��һ������ ***/
  reg       [ 7:0]      cfg_data_pos1_1st_r;
  reg       [ 7:0]      cfg_data_pos2_1st_r;
  reg       [ 7:0]      cfg_data_pos3_1st_r;
  reg       [ 7:0]      cfg_data_pos4_1st_r;
  reg       [ 7:0]      cfg_data_pos5_1st_r;
  reg       [ 7:0]      cfg_data_pos6_1st_r;
  reg       [ 7:0]      cfg_data_pos7_1st_r;
  reg       [ 2:0]      cfg_data_pos0_2nd_r;
  reg       [ 2:0]      cfg_data_pos1_2nd_r;
  reg       [ 2:0]      cfg_data_pos2_2nd_r;
  reg       [ 2:0]      cfg_data_pos3_2nd_r;
  reg       [ 2:0]      cfg_data_pos4_2nd_r;
  reg       [ 2:0]      cfg_data_pos5_2nd_r;
  reg       [ 2:0]      cfg_data_pos6_2nd_r;
  reg       [ 2:0]      cfg_data_pos7_2nd_r;
  
  reg       [ 7:0]      cfg_addr_pos0_1st_r;	/*** �������������IP��һ������ ***/  //һ����˵��IP��COP
  reg       [ 7:0]      cfg_addr_pos1_1st_r;  //������������ʱ�������겻ʹ�ã�Ĭ��Ϊ�㡣
  reg       [ 7:0]      cfg_addr_pos2_1st_r;
  reg       [ 7:0]      cfg_addr_pos3_1st_r;
  reg       [ 7:0]      cfg_addr_pos4_1st_r;
  reg       [ 7:0]      cfg_addr_pos5_1st_r;
  reg       [ 7:0]      cfg_addr_pos6_1st_r;
  reg       [ 7:0]      cfg_addr_pos7_1st_r;
  reg       [ 2:0]      cfg_addr_pos0_2nd_r;
  reg       [ 2:0]      cfg_addr_pos1_2nd_r;
  reg       [ 2:0]      cfg_addr_pos2_2nd_r;
  reg       [ 2:0]      cfg_addr_pos3_2nd_r;
  reg       [ 2:0]      cfg_addr_pos4_2nd_r;
  reg       [ 2:0]      cfg_addr_pos5_2nd_r;
  reg       [ 2:0]      cfg_addr_pos6_2nd_r;
  reg       [ 2:0]      cfg_addr_pos7_2nd_r;
  
  reg       [15:0]      cfg_start_pos_row_0_r;	/*** �������ôس��η���DDRʱ���ʵľ�����ڶ�ά���������е����� ***/
  reg       [13:0]      cfg_start_pos_col_0_r;
  reg       [15:0]      cfg_start_pos_row_1_r;
  reg       [13:0]      cfg_start_pos_col_1_r;
  reg       [15:0]      cfg_start_pos_row_2_r;
  reg       [13:0]      cfg_start_pos_col_2_r;
  reg       [15:0]      cfg_start_pos_row_3_r;
  reg       [13:0]      cfg_start_pos_col_3_r;
  reg       [15:0]      cfg_start_pos_row_4_r;
  reg       [13:0]      cfg_start_pos_col_4_r;
  reg       [15:0]      cfg_start_pos_row_5_r;
  reg       [13:0]      cfg_start_pos_col_5_r;
  reg       [15:0]      cfg_start_pos_row_6_r;
  reg       [13:0]      cfg_start_pos_col_6_r;
  reg       [15:0]      cfg_start_pos_row_7_r;
  reg       [13:0]      cfg_start_pos_col_7_r;
	
  reg       [29:0]      cfg_start_addr_r;
  reg       [15:0]      cfg_row_num_1st_r;
  reg       [13:0]      cfg_col_num_1st_r;
  reg       [15:0]      cfg_row_num_2nd_r;
  reg       [13:0]      cfg_col_num_2nd_r;
  reg       [29:0]      cfg_circu_times_r;		//ѭ������

  reg       [29:0]      cfg_col_addr_burst_r;	//һ�������м�һ��ַ������Ŀ
  reg       [29:0]      cfg_row_addr_burst_r;	//һ�������м�һ��ַ������Ŀ
  reg       [29:0]      cfg_2nd_addr_burst_r;	//���������м�һ��ַ������Ŀ
  reg       [29:0]      cfg_length_burst_r;	  //���������С--------�涨Ϊ����������е�С���ܸ���
	
	reg       [ 1:0]      req_pos0_src_type_r;
	reg       [ 1:0]      req_pos1_src_type_r;
	reg       [ 1:0]      req_pos2_src_type_r;
	reg       [ 1:0]      req_pos3_src_type_r;
	reg       [ 1:0]      req_pos4_src_type_r;
	reg       [ 1:0]      req_pos5_src_type_r;
	reg       [ 1:0]      req_pos6_src_type_r;
	reg       [ 1:0]      req_pos7_src_type_r;
	
	
	/*** ͨ���������� ***/
	reg                   channel_cfg_en;
	reg                   channel_cfg_en_r1;
	reg                   channel_cfg_en_r2;
	
	/*** ͨ���������� ***/
	reg                   channel_period_r;
	reg                   channel_period_r1;
	wire                  cluster_period;
	assign cluster_period =  channel_period_r & channel_period_r1;
	
	/*** ͨ�����μĴ��� ***/
	reg       [ 7:0]      channel_mask_reg;
	
	/*** ��ͨ�����μĴ��� ***/
  reg       [ 7:0]      cluster_mask_reg;
	
	/***�����ڵ�ԭʼ���󸽴�����Ϣ��¼***/
	reg       [15:0]      ddr_1st_row_pos     [7:0];
	reg       [13:0]      ddr_1st_col_pos     [7:0];
	reg                   ddr_last_trans      [7:0];
//  reg       [ 1:0]      req_pos_src_type    [7:0];
	
	/***����������***/
	reg       [ 7:0]      data_pos_x_valid;   //Ŀ�Ľڵ�����
	reg       [ 7:0]      addr_pos_x_valid;   //�����ڵ�����
	
	/***����Ĵ����***/
	reg       [ 7:0]      dest_pos_x_valid;    //Ŀ�Ľڵ������־�Ĵ���
	reg       [ 7:0]      third_pos_x_valid;   //�����ڵ������־�Ĵ���
	
	/***����׼������־***/
	wire      [ 7:0]      third_valid_flag;    //����ģʽ��
	wire      [ 7:0]      boardcast_valid_flag;//�㲥ģʽ��
	wire      [ 7:0]      general_valid_flag;  //��ͨģʽ��
	reg       [ 7:0]      channel_valid_flag;  //��������ģʽ
	
	
	
	
	
	//--------------------------------------------------
	// CODE ------- description
	//--------------------------------------------------
	
	/*** �ػ�������Ϣ�����ϵ�������Ϣ ***/
	always@(posedge clk) begin
		if(!rst_n) begin
			cfg_third_req_r       <= 'b0;
			cfg_stream_r          <= 'b0;
			cfg_broadcast_r       <= 'b0;
			cfg_row_column_r      <= 'b0;
			cfg_read_write_r      <= 'b0;
			cfg_D2D_flag_r        <= 'b0;
			cfg_cluster_num_r     <= 3'b0;
			cfg_VR_id_r           <= 9'b0;
			cfg_VR_FR_r           <= 3'b0;
			cfg_channel_id_r      <= 5'b0;
			
			cfg_data_pos0_1st_r   <= 8'b0;
			cfg_data_pos1_1st_r   <= 8'b0;
			cfg_data_pos2_1st_r   <= 8'b0;
			cfg_data_pos3_1st_r   <= 8'b0;
			cfg_data_pos4_1st_r   <= 8'b0;
			cfg_data_pos5_1st_r   <= 8'b0;
			cfg_data_pos6_1st_r   <= 8'b0;
			cfg_data_pos7_1st_r   <= 8'b0;
			cfg_data_pos0_2nd_r   <= 3'b0;
			cfg_data_pos1_2nd_r   <= 3'b0;
			cfg_data_pos2_2nd_r   <= 3'b0;
			cfg_data_pos3_2nd_r   <= 3'b0;
			cfg_data_pos4_2nd_r   <= 3'b0;
			cfg_data_pos5_2nd_r   <= 3'b0;
			cfg_data_pos6_2nd_r   <= 3'b0;
			cfg_data_pos7_2nd_r   <= 3'b0;
			
			cfg_addr_pos0_1st_r   <= 8'b0;
			cfg_addr_pos1_1st_r   <= 8'b0;
			cfg_addr_pos2_1st_r   <= 8'b0;
			cfg_addr_pos3_1st_r   <= 8'b0;
			cfg_addr_pos4_1st_r   <= 8'b0;
			cfg_addr_pos5_1st_r   <= 8'b0;
			cfg_addr_pos6_1st_r   <= 8'b0;
			cfg_addr_pos7_1st_r   <= 8'b0;
			cfg_addr_pos0_2nd_r   <= 3'b0;
			cfg_addr_pos1_2nd_r   <= 3'b0;
			cfg_addr_pos2_2nd_r   <= 3'b0;
			cfg_addr_pos3_2nd_r   <= 3'b0;
			cfg_addr_pos4_2nd_r   <= 3'b0;
			cfg_addr_pos5_2nd_r   <= 3'b0;
			cfg_addr_pos6_2nd_r   <= 3'b0;
			cfg_addr_pos7_2nd_r   <= 3'b0;
			
			cfg_start_pos_row_0_r <= 16'b0;
			cfg_start_pos_col_0_r <= 14'b0;
			cfg_start_pos_row_1_r <= 16'b0;
			cfg_start_pos_col_1_r <= 14'b0;
			cfg_start_pos_row_2_r <= 16'b0;
			cfg_start_pos_col_2_r <= 14'b0;
			cfg_start_pos_row_3_r <= 16'b0;
			cfg_start_pos_col_3_r <= 14'b0;
			cfg_start_pos_row_4_r <= 16'b0;
			cfg_start_pos_col_4_r <= 14'b0;
			cfg_start_pos_row_5_r <= 16'b0;
			cfg_start_pos_col_5_r <= 14'b0;
			cfg_start_pos_row_6_r <= 16'b0;
			cfg_start_pos_col_6_r <= 14'b0;
			cfg_start_pos_row_7_r <= 16'b0;
			cfg_start_pos_col_7_r <= 14'b0;
			
			cfg_start_addr_r      <= 30'b0;
			cfg_row_num_1st_r     <= 16'b0;
			cfg_col_num_1st_r     <= 14'b0;
			cfg_row_num_2nd_r     <= 16'b0;
			cfg_col_num_2nd_r     <= 14'b0;
			cfg_circu_times_r     <= 30'b0;
			
			cfg_col_addr_burst_r  <= 30'b0;
			cfg_row_addr_burst_r  <= 30'b0;
			cfg_2nd_addr_burst_r  <= 30'b0;
			cfg_length_burst_r    <= 30'b0;
		end
		else if(cfg_valid_i && (cfg_channel_id_i==DATA_CHANNEL_ID)) begin
			cfg_third_req_r       <= cfg_third_req_i;
			cfg_stream_r          <= cfg_stream_i;
			cfg_broadcast_r       <= cfg_broadcast_i;
			cfg_row_column_r      <= cfg_row_column_i;
			cfg_read_write_r      <= cfg_read_write_i;
			cfg_D2D_flag_r        <= cfg_D2D_flag_i;
			cfg_cluster_num_r     <= cfg_cluster_num_i;
			cfg_VR_id_r           <= cfg_VR_id_i;
			cfg_VR_FR_r           <= cfg_VR_FR_i;
			cfg_channel_id_r      <= cfg_channel_id_i;
			
			cfg_data_pos0_1st_r   <= cfg_data_pos0_1st_i;
			cfg_data_pos1_1st_r   <= cfg_data_pos1_1st_i;
			cfg_data_pos2_1st_r   <= cfg_data_pos2_1st_i;
			cfg_data_pos3_1st_r   <= cfg_data_pos3_1st_i;
			cfg_data_pos4_1st_r   <= cfg_data_pos4_1st_i;
			cfg_data_pos5_1st_r   <= cfg_data_pos5_1st_i;
			cfg_data_pos6_1st_r   <= cfg_data_pos6_1st_i;
			cfg_data_pos7_1st_r   <= cfg_data_pos7_1st_i;
			cfg_data_pos0_2nd_r   <= cfg_data_pos0_2nd_i;
			cfg_data_pos1_2nd_r   <= cfg_data_pos1_2nd_i;
			cfg_data_pos2_2nd_r   <= cfg_data_pos2_2nd_i;
			cfg_data_pos3_2nd_r   <= cfg_data_pos3_2nd_i;
			cfg_data_pos4_2nd_r   <= cfg_data_pos4_2nd_i;
			cfg_data_pos5_2nd_r   <= cfg_data_pos5_2nd_i;
			cfg_data_pos6_2nd_r   <= cfg_data_pos6_2nd_i;
			cfg_data_pos7_2nd_r   <= cfg_data_pos7_2nd_i;
			                         
			cfg_addr_pos0_1st_r   <= cfg_addr_pos0_1st_i;
			cfg_addr_pos1_1st_r   <= cfg_addr_pos1_1st_i;
			cfg_addr_pos2_1st_r   <= cfg_addr_pos2_1st_i;
			cfg_addr_pos3_1st_r   <= cfg_addr_pos3_1st_i;
			cfg_addr_pos4_1st_r   <= cfg_addr_pos4_1st_i;
			cfg_addr_pos5_1st_r   <= cfg_addr_pos5_1st_i;
			cfg_addr_pos6_1st_r   <= cfg_addr_pos6_1st_i;
			cfg_addr_pos7_1st_r   <= cfg_addr_pos7_1st_i;
			cfg_addr_pos0_2nd_r   <= cfg_addr_pos0_2nd_i;
			cfg_addr_pos1_2nd_r   <= cfg_addr_pos1_2nd_i;
			cfg_addr_pos2_2nd_r   <= cfg_addr_pos2_2nd_i;
			cfg_addr_pos3_2nd_r   <= cfg_addr_pos3_2nd_i;
			cfg_addr_pos4_2nd_r   <= cfg_addr_pos4_2nd_i;
			cfg_addr_pos5_2nd_r   <= cfg_addr_pos5_2nd_i;
			cfg_addr_pos6_2nd_r   <= cfg_addr_pos6_2nd_i;
			cfg_addr_pos7_2nd_r   <= cfg_addr_pos7_2nd_i;
			                         
			cfg_start_pos_row_0_r <= cfg_start_pos_row_0_i;
			cfg_start_pos_col_0_r <= cfg_start_pos_col_0_i;
			cfg_start_pos_row_1_r <= cfg_start_pos_row_1_i;
			cfg_start_pos_col_1_r <= cfg_start_pos_col_1_i;
			cfg_start_pos_row_2_r <= cfg_start_pos_row_2_i;
			cfg_start_pos_col_2_r <= cfg_start_pos_col_2_i;
			cfg_start_pos_row_3_r <= cfg_start_pos_row_3_i;
			cfg_start_pos_col_3_r <= cfg_start_pos_col_3_i;
			cfg_start_pos_row_4_r <= cfg_start_pos_row_4_i;
			cfg_start_pos_col_4_r <= cfg_start_pos_col_4_i;
			cfg_start_pos_row_5_r <= cfg_start_pos_row_5_i;
			cfg_start_pos_col_5_r <= cfg_start_pos_col_5_i;
			cfg_start_pos_row_6_r <= cfg_start_pos_row_6_i;
			cfg_start_pos_col_6_r <= cfg_start_pos_col_6_i;
			cfg_start_pos_row_7_r <= cfg_start_pos_row_7_i;
			cfg_start_pos_col_7_r <= cfg_start_pos_col_7_i;
			                         
			cfg_start_addr_r      <= cfg_start_addr_i;
			cfg_row_num_1st_r     <= cfg_row_num_1st_i;
			cfg_col_num_1st_r     <= cfg_col_num_1st_i;
			cfg_row_num_2nd_r     <= cfg_row_num_2nd_i;
			cfg_col_num_2nd_r     <= cfg_col_num_2nd_i;
			cfg_circu_times_r     <= cfg_circu_times_i;
			                         
			cfg_col_addr_burst_r  <= cfg_col_addr_burst_i;
			cfg_row_addr_burst_r  <= cfg_row_addr_burst_i;
			cfg_2nd_addr_burst_r  <= cfg_2nd_addr_burst_i;
			cfg_length_burst_r    <= cfg_length_burst_i;
		end
	end
	
	/**** ͨ���������� ****/
	always@(posedge clk) begin
		if(!rst_n)
			channel_cfg_en  <= 1'b0;
		else if(cfg_valid_i && (cfg_channel_id_i==DATA_CHANNEL_ID))
			channel_cfg_en  <= 1'b1;
		else
			channel_cfg_en  <= 1'b0;
	end
	always@(posedge clk) begin
		if(!rst_n) begin
			channel_cfg_en_r1  <= 1'b0;
			channel_cfg_en_r2  <= 1'b0;
		end
		else begin
			channel_cfg_en_r1  <= channel_cfg_en;
			channel_cfg_en_r2  <= channel_cfg_en_r1;
		end
	end
	
	/**** ͨ�����μĴ��� ****/
	always@(posedge clk)/**��������δ���ôص�Ӱ��**/begin
		if(!rst_n)/**��ʼ��Ϊ��ȫ����״̬**/
			channel_mask_reg <= 8'b1111_1111;
		else if(channel_cfg_en)/**ͨ���������嵽��ʱ������ͨ�����μĴ�����ֵ**/
			case(cfg_cluster_num_r)/*3-bits*/
				3'd0:     channel_mask_reg <= 8'b1111_1110;
				3'd1:     channel_mask_reg <= 8'b1111_1100;
				3'd2:     channel_mask_reg <= 8'b1111_1000;
				3'd3:     channel_mask_reg <= 8'b1111_0000;
				3'd4:     channel_mask_reg <= 8'b1110_0000;
				3'd5:     channel_mask_reg <= 8'b1100_0000;
				3'd6:     channel_mask_reg <= 8'b1000_0000;
				3'd7:     channel_mask_reg <= 8'b0000_0000;
			endcase
		else
		  channel_mask_reg <= channel_mask_reg;
	end
	

	always@(posedge clk) begin
		if(!rst_n)
	    cluster_mask_reg <= 8'b1111_1111;
	  else if(channel_period_r)
	  	 if(cfg_broadcast_r)
	  	     cluster_mask_reg <= 8'b1111_1110;
	  	 else
	  	     cluster_mask_reg <= channel_mask_reg;
	  else
	    cluster_mask_reg <= 8'b1111_1111;
	end	



/////-------------------------------------------------------------------------------------------/////

// ��������ڵ����������ź�
//*********************************************
	always@(posedge clk) begin
		if(!rst_n) begin
			addr_pos_x_valid <= 8'b0;
		end
		else if(cfg_third_req_r && request_valid_i) begin
			if     ((request_pos_1st_i==cfg_addr_pos0_1st_r)&&(request_pos_2nd_i==cfg_addr_pos0_2nd_r))  addr_pos_x_valid[0] <= 1'b1;
			else if((request_pos_1st_i==cfg_addr_pos1_1st_r)&&(request_pos_2nd_i==cfg_addr_pos1_2nd_r))  addr_pos_x_valid[1] <= 1'b1;
			else if((request_pos_1st_i==cfg_addr_pos2_1st_r)&&(request_pos_2nd_i==cfg_addr_pos2_2nd_r))  addr_pos_x_valid[2] <= 1'b1;
			else if((request_pos_1st_i==cfg_addr_pos3_1st_r)&&(request_pos_2nd_i==cfg_addr_pos3_2nd_r))  addr_pos_x_valid[3] <= 1'b1;
			else if((request_pos_1st_i==cfg_addr_pos4_1st_r)&&(request_pos_2nd_i==cfg_addr_pos4_2nd_r))  addr_pos_x_valid[4] <= 1'b1;
			else if((request_pos_1st_i==cfg_addr_pos5_1st_r)&&(request_pos_2nd_i==cfg_addr_pos5_2nd_r))  addr_pos_x_valid[5] <= 1'b1;
			else if((request_pos_1st_i==cfg_addr_pos6_1st_r)&&(request_pos_2nd_i==cfg_addr_pos6_2nd_r))  addr_pos_x_valid[6] <= 1'b1;
			else if((request_pos_1st_i==cfg_addr_pos7_1st_r)&&(request_pos_2nd_i==cfg_addr_pos7_2nd_r))  addr_pos_x_valid[7] <= 1'b1;
		end
		else begin
			addr_pos_x_valid <= 8'b0;
		end
	end
//**********************************************

                //******* ��¼����������ŵľ�������� *********\\
                //��¼ǰ�᣺ �������ܿ���
                		//pos0 ~ pos7
                		always@(posedge clk) begin
                			if(!rst_n) begin
                				ddr_1st_row_pos[0] <= 16'b0;
                				ddr_1st_col_pos[0] <= 14'b0;
                				 ddr_last_trans[0] <=  1'b0;
                			// req_pos_src_type[0] <=  2'b0;
                			end
                			else if(	cfg_third_req_r && request_valid_i &&
                								(request_pos_1st_i==cfg_addr_pos0_1st_r)&&
                								(request_pos_2nd_i==cfg_addr_pos0_2nd_r)) begin
                				ddr_1st_row_pos[0] <= request_addr_1st_row_i;
                				ddr_1st_col_pos[0] <= request_addr_1st_col_i;
                				 ddr_last_trans[0] <= request_addr_last_trans_i;
                			// req_pos_src_type[0] <= request_src_type_i;
                			end
                		end
                		
                		always@(posedge clk) begin
                			if(!rst_n) begin
                				ddr_1st_row_pos[1] <= 16'b0;
                				ddr_1st_col_pos[1] <= 14'b0;
                				 ddr_last_trans[1] <=  1'b0;
                			// req_pos_src_type[1] <=  2'b0;
                			end
                			else if(	cfg_third_req_r && request_valid_i &&
                								(request_pos_1st_i==cfg_addr_pos1_1st_r)&&
                								(request_pos_2nd_i==cfg_addr_pos1_2nd_r)) begin
                				ddr_1st_row_pos[1] <= request_addr_1st_row_i;
                				ddr_1st_col_pos[1] <= request_addr_1st_col_i;
                				 ddr_last_trans[1] <= request_addr_last_trans_i;
                			// req_pos_src_type[1] <= request_src_type_i;
                			end
                		end
                		
                		always@(posedge clk) begin
                			if(!rst_n) begin
                				ddr_1st_row_pos[2] <= 16'b0;
                				ddr_1st_col_pos[2] <= 14'b0;
                				 ddr_last_trans[2] <=  1'b0;
                			// req_pos_src_type[2] <=  2'b0;
                			end
                			else if(	cfg_third_req_r && request_valid_i &&
                								(request_pos_1st_i==cfg_addr_pos2_1st_r)&&
                								(request_pos_2nd_i==cfg_addr_pos2_2nd_r)) begin
                				ddr_1st_row_pos[2] <= request_addr_1st_row_i;
                				ddr_1st_col_pos[2] <= request_addr_1st_col_i;
                				 ddr_last_trans[2] <= request_addr_last_trans_i;
                			// req_pos_src_type[2] <= request_src_type_i;
                			end
                		end
                		
                		always@(posedge clk) begin
                			if(!rst_n) begin
                				ddr_1st_row_pos[3] <= 16'b0;
                				ddr_1st_col_pos[3] <= 14'b0;
                				 ddr_last_trans[3] <=  1'b0;
                			// req_pos_src_type[3] <=  2'b0;
                			end
                			else if(	cfg_third_req_r && request_valid_i &&
                								(request_pos_1st_i==cfg_addr_pos3_1st_r)&&
                								(request_pos_2nd_i==cfg_addr_pos3_2nd_r)) begin
                				ddr_1st_row_pos[3] <= request_addr_1st_row_i;
                				ddr_1st_col_pos[3] <= request_addr_1st_col_i;
                				 ddr_last_trans[3] <= request_addr_last_trans_i;
                			// req_pos_src_type[3] <= request_src_type_i;
                			end
                		end
                		
                		always@(posedge clk) begin
                			if(!rst_n) begin
                				ddr_1st_row_pos[4] <= 16'b0;
                				ddr_1st_col_pos[4] <= 14'b0;
                				 ddr_last_trans[4] <=  1'b0;
                			// req_pos_src_type[4] <=  2'b0;
                			end
                			else if(	cfg_third_req_r && request_valid_i &&
                								(request_pos_1st_i==cfg_addr_pos4_1st_r)&&
                								(request_pos_2nd_i==cfg_addr_pos4_2nd_r)) begin
                				ddr_1st_row_pos[4] <= request_addr_1st_row_i;
                				ddr_1st_col_pos[4] <= request_addr_1st_col_i;
                				 ddr_last_trans[4] <= request_addr_last_trans_i;
                			// req_pos_src_type[4] <= request_src_type_i;
                			end
                		end
                		
                		always@(posedge clk) begin
                			if(!rst_n) begin
                				ddr_1st_row_pos[5] <= 16'b0;
                				ddr_1st_col_pos[5] <= 14'b0;
                				 ddr_last_trans[5] <=  1'b0;
                			// req_pos_src_type[5] <=  2'b0;
                			end
                			else if(	cfg_third_req_r && request_valid_i &&
                								(request_pos_1st_i==cfg_addr_pos5_1st_r)&&
                								(request_pos_2nd_i==cfg_addr_pos5_2nd_r)) begin
                				ddr_1st_row_pos[5] <= request_addr_1st_row_i;
                				ddr_1st_col_pos[5] <= request_addr_1st_col_i;
                				 ddr_last_trans[5] <= request_addr_last_trans_i;
                			// req_pos_src_type[5] <= request_src_type_i;
                			end
                		end
                		
                		always@(posedge clk) begin
                			if(!rst_n) begin
                				ddr_1st_row_pos[6] <= 16'b0;
                				ddr_1st_col_pos[6] <= 14'b0;
                				 ddr_last_trans[6] <=  1'b0;
                			// req_pos_src_type[6] <=  2'b0;
                			end
                			else if(	cfg_third_req_r && request_valid_i &&
                								(request_pos_1st_i==cfg_addr_pos6_1st_r)&&
                								(request_pos_2nd_i==cfg_addr_pos6_2nd_r)) begin
                				ddr_1st_row_pos[6] <= request_addr_1st_row_i;
                				ddr_1st_col_pos[6] <= request_addr_1st_col_i;
                				 ddr_last_trans[6] <= request_addr_last_trans_i;
                			// req_pos_src_type[6] <= request_src_type_i;
                			end
                		end
                		
                		always@(posedge clk) begin
                			if(!rst_n) begin
                				ddr_1st_row_pos[7] <= 16'b0;
                				ddr_1st_col_pos[7] <= 14'b0;
                				 ddr_last_trans[7] <=  1'b0;
                			// req_pos_src_type[7] <=  2'b0;
                			end
                			else if(	cfg_third_req_r && request_valid_i &&
                								(request_pos_1st_i==cfg_addr_pos7_1st_r)&&
                								(request_pos_2nd_i==cfg_addr_pos7_2nd_r)) begin
                				ddr_1st_row_pos[7] <= request_addr_1st_row_i;
                				ddr_1st_col_pos[7] <= request_addr_1st_col_i;
                				 ddr_last_trans[7] <= request_addr_last_trans_i;
                			// req_pos_src_type[7] <= request_src_type_i;
                			end
                		end
                //*****************************************
	
	
// ���Ŀ�Ľڵ����������ź�
//*********************************************
	always@(posedge clk) begin
		if(!rst_n)
			data_pos_x_valid <= 8'b0;
		else if(request_valid_i)
		begin
		    if     ((request_pos_1st_i==cfg_data_pos0_1st_r)&&(request_pos_2nd_i==cfg_data_pos0_2nd_r))  data_pos_x_valid[0] <= 1'b1;
		    else if((request_pos_1st_i==cfg_data_pos1_1st_r)&&(request_pos_2nd_i==cfg_data_pos1_2nd_r))  data_pos_x_valid[1] <= 1'b1;
		    else if((request_pos_1st_i==cfg_data_pos2_1st_r)&&(request_pos_2nd_i==cfg_data_pos2_2nd_r))  data_pos_x_valid[2] <= 1'b1;
		    else if((request_pos_1st_i==cfg_data_pos3_1st_r)&&(request_pos_2nd_i==cfg_data_pos3_2nd_r))  data_pos_x_valid[3] <= 1'b1;
		    else if((request_pos_1st_i==cfg_data_pos4_1st_r)&&(request_pos_2nd_i==cfg_data_pos4_2nd_r))  data_pos_x_valid[4] <= 1'b1;
		    else if((request_pos_1st_i==cfg_data_pos5_1st_r)&&(request_pos_2nd_i==cfg_data_pos5_2nd_r))  data_pos_x_valid[5] <= 1'b1;
		    else if((request_pos_1st_i==cfg_data_pos6_1st_r)&&(request_pos_2nd_i==cfg_data_pos6_2nd_r))  data_pos_x_valid[6] <= 1'b1;
		    else if((request_pos_1st_i==cfg_data_pos7_1st_r)&&(request_pos_2nd_i==cfg_data_pos7_2nd_r))  data_pos_x_valid[7] <= 1'b1;
		end
		else
			data_pos_x_valid <= 8'b0;
	end
//*********************************************

                //******* ��¼������Դ���� *********\\
                		//pos0 ~ pos7
                		always@(posedge clk) begin
                			if(!rst_n)
                			   req_pos0_src_type_r <=  2'b0;
                			//else if(	cfg_third_req_r && request_valid_i &&
                			else if(	 request_valid_i &&
                								(request_pos_1st_i==cfg_data_pos0_1st_r)&&
                								(request_pos_2nd_i==cfg_data_pos0_2nd_r))
                			   req_pos0_src_type_r <= request_src_type_i;
                		end
                		
                		always@(posedge clk) begin
                			if(!rst_n)
                			   req_pos1_src_type_r <=  2'b0;
                			//else if(	cfg_third_req_r && request_valid_i &&
                			else if(	 request_valid_i &&
                								(request_pos_1st_i==cfg_data_pos1_1st_r)&&
                								(request_pos_2nd_i==cfg_data_pos1_2nd_r))
                			   req_pos1_src_type_r <= request_src_type_i;
                		end
                		
                		always@(posedge clk) begin
                			if(!rst_n)
                			   req_pos2_src_type_r <=  2'b0;
                			//else if(	cfg_third_req_r && request_valid_i &&
                			else if(	 request_valid_i &&
                								(request_pos_1st_i==cfg_data_pos2_1st_r)&&
                								(request_pos_2nd_i==cfg_data_pos2_2nd_r))
                			   req_pos2_src_type_r <= request_src_type_i;
                		end
                		
                		always@(posedge clk) begin
                			if(!rst_n)
                			   req_pos3_src_type_r <=  2'b0;
                			//else if(	cfg_third_req_r && request_valid_i &&
                			else if(	request_valid_i &&
                								(request_pos_1st_i==cfg_data_pos3_1st_r)&&
                								(request_pos_2nd_i==cfg_data_pos3_2nd_r))
                			   req_pos3_src_type_r <= request_src_type_i;
                		end
                		
                		always@(posedge clk) begin
                			if(!rst_n)
                			   req_pos4_src_type_r <=  2'b0;
                			//else if(	cfg_third_req_r && request_valid_i &&
                			else if(	request_valid_i &&
                								(request_pos_1st_i==cfg_data_pos4_1st_r)&&
                								(request_pos_2nd_i==cfg_data_pos4_2nd_r))
                			   req_pos4_src_type_r <= request_src_type_i;
                		end
                		
                		always@(posedge clk) begin
                			if(!rst_n)
                			   req_pos5_src_type_r <=  2'b0;
                			//else if(	cfg_third_req_r && request_valid_i &&
                			else if(	request_valid_i &&
                								(request_pos_1st_i==cfg_data_pos5_1st_r)&&
                								(request_pos_2nd_i==cfg_data_pos5_2nd_r))
                			   req_pos5_src_type_r <= request_src_type_i;
                		end
                		
                		always@(posedge clk) begin
                			if(!rst_n)
                			   req_pos6_src_type_r <=  2'b0;
                			//else if(	cfg_third_req_r && request_valid_i &&
                			else if(	request_valid_i &&
                								(request_pos_1st_i==cfg_data_pos6_1st_r)&&
                								(request_pos_2nd_i==cfg_data_pos6_2nd_r))
                			   req_pos6_src_type_r <= request_src_type_i;
                		end
                		
                		always@(posedge clk) begin
                			if(!rst_n)
                			   req_pos7_src_type_r <=  2'b0;
                			//else if(	cfg_third_req_r && request_valid_i &&
                			else if(	request_valid_i &&
                								(request_pos_1st_i==cfg_data_pos7_1st_r)&&
                								(request_pos_2nd_i==cfg_data_pos7_2nd_r))
                			   req_pos7_src_type_r <= request_src_type_i;
                		end
                //*****************************************
/////-------------------------------------------------------------------------------------------/////
	
// �����ڵ������־�Ĵ���
//************************************************
	always@(posedge clk) begin
		if(!rst_n)
			third_pos_x_valid <= 8'b0;
		else case(cfg_third_req_r)
			1'b0: //��������δ����//
						begin
							third_pos_x_valid <= 8'b0;
						end
						
			1'b1: //�������ܿ���//
						begin
							if(|addr_pos_x_valid) /**�����ڵ�����**/ begin
								if     (addr_pos_x_valid[0])   third_pos_x_valid[0] <= 1'b1;
								else if(addr_pos_x_valid[1])   third_pos_x_valid[1] <= 1'b1;
								else if(addr_pos_x_valid[2])   third_pos_x_valid[2] <= 1'b1;
								else if(addr_pos_x_valid[3])   third_pos_x_valid[3] <= 1'b1;
								else if(addr_pos_x_valid[4])   third_pos_x_valid[4] <= 1'b1;
								else if(addr_pos_x_valid[5])   third_pos_x_valid[5] <= 1'b1;
								else if(addr_pos_x_valid[6])   third_pos_x_valid[6] <= 1'b1;
								else if(addr_pos_x_valid[7])   third_pos_x_valid[7] <= 1'b1;
							end
							else if(|third_valid_flag)/*����ɹ�����*/begin
								if     (third_valid_flag[0])   third_pos_x_valid[0] <= 1'b0;
								else if(third_valid_flag[1])   third_pos_x_valid[1] <= 1'b0;
								else if(third_valid_flag[2])   third_pos_x_valid[2] <= 1'b0;
								else if(third_valid_flag[3])   third_pos_x_valid[3] <= 1'b0;
								else if(third_valid_flag[4])   third_pos_x_valid[4] <= 1'b0;
								else if(third_valid_flag[5])   third_pos_x_valid[5] <= 1'b0;
								else if(third_valid_flag[6])   third_pos_x_valid[6] <= 1'b0;
								else if(third_valid_flag[7])   third_pos_x_valid[7] <= 1'b0;
							end
							else
							  third_pos_x_valid <= third_pos_x_valid;
						end
		endcase
	end
//************************************************
	
	
// Ŀ�Ľڵ������־�Ĵ���
//************************************************
	always@(posedge clk) begin
		if(!rst_n) begin
			dest_pos_x_valid <= 8'b0;
		end
		else case({cfg_third_req_r,cfg_broadcast_r})
		//------------------------------------------------------------------------------START
			2'b10: //����ģʽ//
			    begin
							if(|data_pos_x_valid) begin
								if     (data_pos_x_valid[0])   dest_pos_x_valid[0] <= 1'b1;
								else if(data_pos_x_valid[1])   dest_pos_x_valid[1] <= 1'b1;
								else if(data_pos_x_valid[2])   dest_pos_x_valid[2] <= 1'b1;
								else if(data_pos_x_valid[3])   dest_pos_x_valid[3] <= 1'b1;
								else if(data_pos_x_valid[4])   dest_pos_x_valid[4] <= 1'b1;
								else if(data_pos_x_valid[5])   dest_pos_x_valid[5] <= 1'b1;
								else if(data_pos_x_valid[6])   dest_pos_x_valid[6] <= 1'b1;
								else if(data_pos_x_valid[7])   dest_pos_x_valid[7] <= 1'b1;
							end
							else if(|third_valid_flag) begin
								if     (third_valid_flag[0])   dest_pos_x_valid[0] <= 1'b0;
								else if(third_valid_flag[1])   dest_pos_x_valid[1] <= 1'b0;
								else if(third_valid_flag[2])   dest_pos_x_valid[2] <= 1'b0;
								else if(third_valid_flag[3])   dest_pos_x_valid[3] <= 1'b0;
								else if(third_valid_flag[4])   dest_pos_x_valid[4] <= 1'b0;
								else if(third_valid_flag[5])   dest_pos_x_valid[5] <= 1'b0;
								else if(third_valid_flag[6])   dest_pos_x_valid[6] <= 1'b0;
								else if(third_valid_flag[7])   dest_pos_x_valid[7] <= 1'b0;
							end
							else
							  dest_pos_x_valid <= dest_pos_x_valid;
			    end
			2'b01: //�㲥ģʽ//
			    begin
							if(|data_pos_x_valid) begin
								if     (data_pos_x_valid[0])   dest_pos_x_valid[0] <= 1'b1;
								else if(data_pos_x_valid[1])   dest_pos_x_valid[1] <= 1'b1;
								else if(data_pos_x_valid[2])   dest_pos_x_valid[2] <= 1'b1;
								else if(data_pos_x_valid[3])   dest_pos_x_valid[3] <= 1'b1;
								else if(data_pos_x_valid[4])   dest_pos_x_valid[4] <= 1'b1;
								else if(data_pos_x_valid[5])   dest_pos_x_valid[5] <= 1'b1;
								else if(data_pos_x_valid[6])   dest_pos_x_valid[6] <= 1'b1;
								else if(data_pos_x_valid[7])   dest_pos_x_valid[7] <= 1'b1;
							end
			    		else if(&boardcast_valid_flag) //�����ô�ȫ��׼����ʱ�������㲥���󣬲���������Ŀ�Ľڵ��־�Ĵ�����ֵ��������Ӱ���´εĹ㲥������������Ѽ�
			    			dest_pos_x_valid <= 8'b0;
			    		else
			    			dest_pos_x_valid <= dest_pos_x_valid;
			    end
			2'b00: //��ͨģʽ//
			    begin
			    	  dest_pos_x_valid <= data_pos_x_valid;
			    end
		//------------------------------------------------------------------------------END
		endcase
	end
//************************************************
 
 //����ģʽ�£���������������Ĵ���
	assign  third_valid_flag     = ( cfg_third_req_r & !cfg_broadcast_r) ? (third_pos_x_valid &dest_pos_x_valid ): 8'b0000_0000;
	assign  boardcast_valid_flag = (!cfg_third_req_r &  cfg_broadcast_r) ? (channel_mask_reg  |dest_pos_x_valid ): 8'b0000_0000;
	assign  general_valid_flag   = (!cfg_third_req_r & !cfg_broadcast_r) ? (                   dest_pos_x_valid ): 8'b0000_0000;
	
 //����ϲ�
	always@(posedge clk) begin
		if(!rst_n)
		   channel_valid_flag <= 8'b0;
		else if(channel_period_r & channel_period_r1) begin
			if(cfg_broadcast_r)
			channel_valid_flag <= {7'b0, (&boardcast_valid_flag)};
			else
			channel_valid_flag <= third_valid_flag | general_valid_flag;
		end
		else
		   channel_valid_flag <= 8'b0;
	end
	
//-----------------------------------------------------------------------------------END
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////                                   <addr_ch_xx>�ڲ���·����ʾ��ͼ
////  ||=======================================================================================================||
////  ||=======================================================================================================||
////  ||                                                                                                       ||
////  ||                                            <one_cluster>Ⱥ                                            ||
////  ||   |||-----------------|||              |---------------------|             |||-----------------|||    ||
////  ||   |||-----------------|||              |---<one_cluster>-0---| |--> \\     |||-----------------|||    ||
////  ||   |||-----  ǰ  ------|||              |---------------------|       ||    |||-----  ��  ------|||    ||
////  ||   |||-----------------|||              |---<one_cluster>-1---| |-->  ||    |||-----------------|||    ||
////  ||   |||-----------------|||              |---------------------|       ||    |||-----------------|||    ||
////  ||   |||-----  ��  ------|||              |---<one_cluster>-2---| |-->  ||    |||-----  ��  ------|||    ||
////  ||   |||-----------------|||  ||    \\\   |---------------------|       ||    |||-----------------|||    ||
////  ||   |||-----------------|||  ||-----\\\  |---<one_cluster>-3---| |-->   \\   |||-----------------|||    ||
////  ||   |||-----  Ԥ  ------|||  ||------\\\ |---------------------|         >>  |||-----  ��  ------|||    ||
////  ||   |||-----------------|||  ||------/// |---<one_cluster>-4---| |-->   //   |||-----------------|||    ||
////  ||   |||-----------------|||  ||-----///  |---------------------|       ||    |||-----------------|||    ||
////  ||   |||-----  ��  ------|||  ||    ///   |---<one_cluster>-5---| |-->  ||    |||-----  ��  ------|||    ||
////  ||   |||-----------------|||              |---------------------|       ||    |||-----------------|||    ||
////  ||   |||-----------------|||              |---<one_cluster>-6---| |-->  ||    |||-----------------|||    ||
////  ||   |||-----  ��  ------|||              |---------------------|       ||    |||-----  ��  ------|||    ||
////  ||   |||-----------------|||              |---<one_cluster>-7---| |-->  //    |||-----------------|||    ||
////  ||   |||-----------------|||              |---------------------|             |||-----------------|||    ||
////  ||             ||                                                                       /\               ||
////  ||             ||                                                                      /||\              ||
////  ||             ||                                                                       ||               ||
////  ||              ��=======================================================================��                ||
////  ||                                                                                                       ||
////  ||=======================================================================================================|| 
////  ||=======================================================================================================|| 
////
////   ǰ��Ԥ��������<one_cluster>Ⱥ����Ϣ���£�
////   -----------------------------------------
////   (1)��ͨ�����α�־    (2)��Ч�Ĵ�����
////   (3)���������Ϣ���������㲥��־��������־�����ôظ�����ѭ���������������ȼ���־��һ������������һ���������������״������������������
////   (4)�����ڵ����󸽴��ľ�������ꡢlast_trans
////
////--------------------------------------------
////   <one_cluster>Ⱥ��������ٴ������Ϣ���£�
////   (1)�������ķô�DDR������
////   (2)���󸽴���ͨ���ͷű�־
////   (3)�ô�����ľ���������
////   
////--------------------------------------------
////   ǰ��Ԥ������������ٴ������Ϣ���£�
////   (1)�ô�DDR�����һ�����ꡢ��������
////   (2)һ�������м�һ��ַ������Ŀ��һ�������м�һ��ַ������Ŀ
////   (3)
////   
////---------------------------------------------------------------------
////---------------------------------------------------------------------
////   <addr_ch_xx>�ͳ�����Ϣ���£�
////   (1)
////   (2)
////   (3)
////
////
//-----------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------
//------------------------------------ ģ��-���� ------------------------------------
//-----------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------
    wire   [7:0]    cluster_request_allow;
    wire   [7:0]    cluster_release_allow;
    wire   [15:0]   cluster_pos_row    [7:0];
    wire   [13:0]   cluster_pos_col    [7:0];


one_cluster cluster_0 (
    .clk                   (clk), 
    .rst_n                 (rst_n), 
    .channel_period_en     (cluster_period), 
    .cfg_cluster_mask_i    (cluster_mask_reg[0]), 
    .cluster_req_i         (channel_valid_flag[0]), 
    .cfg_valid_i           (channel_cfg_en_r2), 
    .cfg_broadcast_i       (cfg_broadcast_r), 
    .cfg_third_i           (cfg_third_req_r), 
    .cluster_num_i         (cfg_cluster_num_r), 
    .cfg_circu_times_i     (cfg_circu_times_r), 
    .cfg_row_column_i      (cfg_row_column_r), 
    .cfg_row_num_1st_i     (cfg_row_num_1st_r), 
    .cfg_column_num_1st_i  (cfg_col_num_1st_r), 
    
    .cfg_start_pos_row_i   (cfg_start_pos_row_0_r), 
    .cfg_start_pos_col_i   (cfg_start_pos_col_0_r), 
    .ddr_1st_row_pos       (ddr_1st_row_pos[0]), 
    .ddr_1st_col_pos       (ddr_1st_col_pos[0]), 
    .ddr_last_trans        (ddr_last_trans[0]), 
    
    .cluster_request_allow (cluster_request_allow[0]), 
    .cluster_release_allow (cluster_release_allow[0]), 
    .cluster_pos_row       (cluster_pos_row[0]), 
    .cluster_pos_col       (cluster_pos_col[0])
    );

one_cluster cluster_1 (
    .clk                   (clk), 
    .rst_n                 (rst_n), 
    .channel_period_en     (cluster_period), 
    .cfg_cluster_mask_i    (cluster_mask_reg[1]), 
    .cluster_req_i         (channel_valid_flag[1]), 
    .cfg_valid_i           (channel_cfg_en_r2), 
    .cfg_broadcast_i       (cfg_broadcast_r), 
    .cfg_third_i           (cfg_third_req_r), 
    .cluster_num_i         (cfg_cluster_num_r), 
    .cfg_circu_times_i     (cfg_circu_times_r), 
    .cfg_row_column_i      (cfg_row_column_r), 
    .cfg_row_num_1st_i     (cfg_row_num_1st_r), 
    .cfg_column_num_1st_i  (cfg_col_num_1st_r), 
    
    .cfg_start_pos_row_i   (cfg_start_pos_row_1_r), 
    .cfg_start_pos_col_i   (cfg_start_pos_col_1_r), 
    .ddr_1st_row_pos       (ddr_1st_row_pos[1]), 
    .ddr_1st_col_pos       (ddr_1st_col_pos[1]), 
    .ddr_last_trans        (ddr_last_trans[1]), 
    
    .cluster_request_allow (cluster_request_allow[1]), 
    .cluster_release_allow (cluster_release_allow[1]), 
    .cluster_pos_row       (cluster_pos_row[1]), 
    .cluster_pos_col       (cluster_pos_col[1])
    );
    
one_cluster cluster_2 (
    .clk                   (clk), 
    .rst_n                 (rst_n), 
    .channel_period_en     (cluster_period), 
    .cfg_cluster_mask_i    (cluster_mask_reg[2]), 
    .cluster_req_i         (channel_valid_flag[2]), 
    .cfg_valid_i           (channel_cfg_en_r2), 
    .cfg_broadcast_i       (cfg_broadcast_r), 
    .cfg_third_i           (cfg_third_req_r), 
    .cluster_num_i         (cfg_cluster_num_r), 
    .cfg_circu_times_i     (cfg_circu_times_r), 
    .cfg_row_column_i      (cfg_row_column_r), 
    .cfg_row_num_1st_i     (cfg_row_num_1st_r), 
    .cfg_column_num_1st_i  (cfg_col_num_1st_r), 
    
    .cfg_start_pos_row_i   (cfg_start_pos_row_2_r), 
    .cfg_start_pos_col_i   (cfg_start_pos_col_2_r), 
    .ddr_1st_row_pos       (ddr_1st_row_pos[2]), 
    .ddr_1st_col_pos       (ddr_1st_col_pos[2]), 
    .ddr_last_trans        (ddr_last_trans[2]), 
    
    .cluster_request_allow (cluster_request_allow[2]), 
    .cluster_release_allow (cluster_release_allow[2]), 
    .cluster_pos_row       (cluster_pos_row[2]), 
    .cluster_pos_col       (cluster_pos_col[2])
    );
    
one_cluster cluster_3 (
    .clk                   (clk), 
    .rst_n                 (rst_n), 
    .channel_period_en     (cluster_period), 
    .cfg_cluster_mask_i    (cluster_mask_reg[3]), 
    .cluster_req_i         (channel_valid_flag[3]), 
    .cfg_valid_i           (channel_cfg_en_r2), 
    .cfg_broadcast_i       (cfg_broadcast_r), 
    .cfg_third_i           (cfg_third_req_r), 
    .cluster_num_i         (cfg_cluster_num_r), 
    .cfg_circu_times_i     (cfg_circu_times_r), 
    .cfg_row_column_i      (cfg_row_column_r), 
    .cfg_row_num_1st_i     (cfg_row_num_1st_r), 
    .cfg_column_num_1st_i  (cfg_col_num_1st_r), 
    
    .cfg_start_pos_row_i   (cfg_start_pos_row_3_r), 
    .cfg_start_pos_col_i   (cfg_start_pos_col_3_r), 
    .ddr_1st_row_pos       (ddr_1st_row_pos[3]), 
    .ddr_1st_col_pos       (ddr_1st_col_pos[3]), 
    .ddr_last_trans        (ddr_last_trans[3]), 
    
    .cluster_request_allow (cluster_request_allow[3]), 
    .cluster_release_allow (cluster_release_allow[3]), 
    .cluster_pos_row       (cluster_pos_row[3]), 
    .cluster_pos_col       (cluster_pos_col[3])
    );
    
one_cluster cluster_4 (
    .clk                   (clk), 
    .rst_n                 (rst_n),
    .channel_period_en     (cluster_period), 
    .cfg_cluster_mask_i    (cluster_mask_reg[4]), 
    .cluster_req_i         (channel_valid_flag[4]), 
    .cfg_valid_i           (channel_cfg_en_r2), 
    .cfg_broadcast_i       (cfg_broadcast_r), 
    .cfg_third_i           (cfg_third_req_r), 
    .cluster_num_i         (cfg_cluster_num_r), 
    .cfg_circu_times_i     (cfg_circu_times_r), 
    .cfg_row_column_i      (cfg_row_column_r), 
    .cfg_row_num_1st_i     (cfg_row_num_1st_r), 
    .cfg_column_num_1st_i  (cfg_col_num_1st_r), 
    
    .cfg_start_pos_row_i   (cfg_start_pos_row_4_r), 
    .cfg_start_pos_col_i   (cfg_start_pos_col_4_r), 
    .ddr_1st_row_pos       (ddr_1st_row_pos[4]), 
    .ddr_1st_col_pos       (ddr_1st_col_pos[4]), 
    .ddr_last_trans        (ddr_last_trans[4]), 
    
    .cluster_request_allow (cluster_request_allow[4]), 
    .cluster_release_allow (cluster_release_allow[4]), 
    .cluster_pos_row       (cluster_pos_row[4]), 
    .cluster_pos_col       (cluster_pos_col[4])
    );
    
one_cluster cluster_5 (
    .clk                   (clk), 
    .rst_n                 (rst_n), 
    .channel_period_en     (cluster_period), 
    .cfg_cluster_mask_i    (cluster_mask_reg[5]), 
    .cluster_req_i         (channel_valid_flag[5]), 
    .cfg_valid_i           (channel_cfg_en_r2), 
    .cfg_broadcast_i       (cfg_broadcast_r), 
    .cfg_third_i           (cfg_third_req_r), 
    .cluster_num_i         (cfg_cluster_num_r), 
    .cfg_circu_times_i     (cfg_circu_times_r), 
    .cfg_row_column_i      (cfg_row_column_r), 
    .cfg_row_num_1st_i     (cfg_row_num_1st_r), 
    .cfg_column_num_1st_i  (cfg_col_num_1st_r), 
    
    .cfg_start_pos_row_i   (cfg_start_pos_row_5_r), 
    .cfg_start_pos_col_i   (cfg_start_pos_col_5_r), 
    .ddr_1st_row_pos       (ddr_1st_row_pos[5]), 
    .ddr_1st_col_pos       (ddr_1st_col_pos[5]), 
    .ddr_last_trans        (ddr_last_trans[5]), 
    
    .cluster_request_allow (cluster_request_allow[5]), 
    .cluster_release_allow (cluster_release_allow[5]), 
    .cluster_pos_row       (cluster_pos_row[5]), 
    .cluster_pos_col       (cluster_pos_col[5])
    );
    
one_cluster cluster_6 (
    .clk                   (clk), 
    .rst_n                 (rst_n), 
    .channel_period_en     (cluster_period), 
    .cfg_cluster_mask_i    (cluster_mask_reg[6]), 
    .cluster_req_i         (channel_valid_flag[6]), 
    .cfg_valid_i           (channel_cfg_en_r2), 
    .cfg_broadcast_i       (cfg_broadcast_r), 
    .cfg_third_i           (cfg_third_req_r), 
    .cluster_num_i         (cfg_cluster_num_r), 
    .cfg_circu_times_i     (cfg_circu_times_r), 
    .cfg_row_column_i      (cfg_row_column_r), 
    .cfg_row_num_1st_i     (cfg_row_num_1st_r), 
    .cfg_column_num_1st_i  (cfg_col_num_1st_r), 
    
    .cfg_start_pos_row_i   (cfg_start_pos_row_6_r), 
    .cfg_start_pos_col_i   (cfg_start_pos_col_6_r), 
    .ddr_1st_row_pos       (ddr_1st_row_pos[6]), 
    .ddr_1st_col_pos       (ddr_1st_col_pos[6]), 
    .ddr_last_trans        (ddr_last_trans[6]), 
    
    .cluster_request_allow (cluster_request_allow[6]), 
    .cluster_release_allow (cluster_release_allow[6]), 
    .cluster_pos_row       (cluster_pos_row[6]), 
    .cluster_pos_col       (cluster_pos_col[6])
    );
    
one_cluster cluster_7 (
    .clk                   (clk), 
    .rst_n                 (rst_n), 
    .channel_period_en     (cluster_period), 
    .cfg_cluster_mask_i    (cluster_mask_reg[7]), 
    .cluster_req_i         (channel_valid_flag[7]), 
    .cfg_valid_i           (channel_cfg_en_r2), 
    .cfg_broadcast_i       (cfg_broadcast_r), 
    .cfg_third_i           (cfg_third_req_r), 
    .cluster_num_i         (cfg_cluster_num_r), 
    .cfg_circu_times_i     (cfg_circu_times_r), 
    .cfg_row_column_i      (cfg_row_column_r), 
    .cfg_row_num_1st_i     (cfg_row_num_1st_r), 
    .cfg_column_num_1st_i  (cfg_col_num_1st_r), 
    
    .cfg_start_pos_row_i   (cfg_start_pos_row_7_r), 
    .cfg_start_pos_col_i   (cfg_start_pos_col_7_r), 
    .ddr_1st_row_pos       (ddr_1st_row_pos[7]), 
    .ddr_1st_col_pos       (ddr_1st_col_pos[7]), 
    .ddr_last_trans        (ddr_last_trans[7]), 
    
    .cluster_request_allow (cluster_request_allow[7]), 
    .cluster_release_allow (cluster_release_allow[7]), 
    .cluster_pos_row       (cluster_pos_row[7]), 
    .cluster_pos_col       (cluster_pos_col[7])
    );
    
    reg               req_valid_r;
    reg               req_release_r;
    reg     [15:0]    select_pos_row;
    reg     [13:0]    select_pos_col;
    reg     [ 7:0]    req_pos_1st_r;
    reg     [ 2:0]    req_pos_2nd_r;
    reg     [ 1:0]    req_pos_src_type_r;
    
    always@(posedge clk) begin
    	if(!rst_n)
    	   req_valid_r <= 1'b0;
    	else if(|cluster_request_allow)
    	   req_valid_r <= 1'b1;
    	else
    	   req_valid_r <= 1'b0;
    end
    
    always@(posedge clk) begin
    	if(!rst_n)
    	   req_release_r <= 1'b0;
    	else if(channel_period_r)
    	    if(|cluster_request_allow)
    	       req_release_r <= &cluster_release_allow; //ͨ���ͷŵ�ǰ���ǣ��������ôصĹ���ȫ��׼�����ͷ�
    	    else
    	       req_release_r <= req_release_r;
    	else
    	   req_release_r <= 1'b0;
    end
    
	always@(posedge clk) begin
		if(!rst_n)
	    channel_period_r <= 1'b0;
	  else if(channel_cfg_en)
	    channel_period_r <= 1'b1;
	  else if(req_release_r)
	    channel_period_r <= 1'b0;
	  else
	    channel_period_r <= channel_period_r;
	end   
	
	
	always@(posedge clk) begin
	  if(!rst_n)
		channel_period_r1 <= 1'b0;
	  else
		channel_period_r1 <= channel_period_r;
	end
	
    
    
    always@(posedge clk) begin
    	if(!rst_n)
    	   select_pos_row <= 16'b0;
    	else if(|cluster_request_allow)
    	case(cluster_request_allow)
    		 //-------------------------------------
    		   8'b0000_0001:  select_pos_row <= cluster_pos_row[0];
    		   8'b0000_0010:  select_pos_row <= cluster_pos_row[1];
    		   8'b0000_0100:  select_pos_row <= cluster_pos_row[2];
    		   8'b0000_1000:  select_pos_row <= cluster_pos_row[3];
    		   8'b0001_0000:  select_pos_row <= cluster_pos_row[4];
    		   8'b0010_0000:  select_pos_row <= cluster_pos_row[5];
    		   8'b0100_0000:  select_pos_row <= cluster_pos_row[6];
    		   8'b1000_0000:  select_pos_row <= cluster_pos_row[7];
    		 //-------------------------------------
    	endcase
    	else
    	   select_pos_row <= select_pos_row;
    end

    always@(posedge clk) begin
    	if(!rst_n)
    	   select_pos_col <= 14'b0;
    	else if(|cluster_request_allow)
    	case(cluster_request_allow)
    		 //-------------------------------------
    		   8'b0000_0001:  select_pos_col <= cluster_pos_col[0];
    		   8'b0000_0010:  select_pos_col <= cluster_pos_col[1];
    		   8'b0000_0100:  select_pos_col <= cluster_pos_col[2];
    		   8'b0000_1000:  select_pos_col <= cluster_pos_col[3];
    		   8'b0001_0000:  select_pos_col <= cluster_pos_col[4];
    		   8'b0010_0000:  select_pos_col <= cluster_pos_col[5];
    		   8'b0100_0000:  select_pos_col <= cluster_pos_col[6];
    		   8'b1000_0000:  select_pos_col <= cluster_pos_col[7];
    		 //-------------------------------------
    	endcase
    	else
    	   select_pos_col <= select_pos_col;
    end
    
    always@(posedge clk) begin
    	if(!rst_n)
    	   req_pos_src_type_r <= 2'b0;
    	else if((!cfg_broadcast_r) & (|cluster_request_allow))
    	case(cluster_request_allow)
    		 //-------------------------------------
    		   8'b0000_0001:  req_pos_src_type_r <= req_pos0_src_type_r;
    		   8'b0000_0010:  req_pos_src_type_r <= req_pos1_src_type_r;
    		   8'b0000_0100:  req_pos_src_type_r <= req_pos2_src_type_r;
    		   8'b0000_1000:  req_pos_src_type_r <= req_pos3_src_type_r;
    		   8'b0001_0000:  req_pos_src_type_r <= req_pos4_src_type_r;
    		   8'b0010_0000:  req_pos_src_type_r <= req_pos5_src_type_r;
    		   8'b0100_0000:  req_pos_src_type_r <= req_pos6_src_type_r;
    		   8'b1000_0000:  req_pos_src_type_r <= req_pos7_src_type_r;
    		 //-------------------------------------
    	endcase
    	else
    	   req_pos_src_type_r <= req_pos_src_type_r;
    end
    
    always@(posedge clk) begin
    	if(!rst_n)
    	   req_pos_1st_r <= 8'b0;
    	else if((!cfg_broadcast_r) & (|cluster_request_allow))
    	case(cluster_request_allow)
    		 //-------------------------------------
    		   8'b0000_0001:  req_pos_1st_r <= cfg_data_pos0_1st_r;
    		   8'b0000_0010:  req_pos_1st_r <= cfg_data_pos1_1st_r;
    		   8'b0000_0100:  req_pos_1st_r <= cfg_data_pos2_1st_r;
    		   8'b0000_1000:  req_pos_1st_r <= cfg_data_pos3_1st_r;
    		   8'b0001_0000:  req_pos_1st_r <= cfg_data_pos4_1st_r;
    		   8'b0010_0000:  req_pos_1st_r <= cfg_data_pos5_1st_r;
    		   8'b0100_0000:  req_pos_1st_r <= cfg_data_pos6_1st_r;
    		   8'b1000_0000:  req_pos_1st_r <= cfg_data_pos7_1st_r;
    		 //-------------------------------------
    	endcase
    	else
    	   req_pos_1st_r <= req_pos_1st_r;
    end

    always@(posedge clk) begin
    	if(!rst_n)
    	   req_pos_2nd_r <= 3'b0;
    	else if((!cfg_broadcast_r) & (|cluster_request_allow))
    	case(cluster_request_allow)
    		 //-------------------------------------
    		   8'b0000_0001:  req_pos_2nd_r <= cfg_data_pos0_2nd_r;
    		   8'b0000_0010:  req_pos_2nd_r <= cfg_data_pos1_2nd_r;
    		   8'b0000_0100:  req_pos_2nd_r <= cfg_data_pos2_2nd_r;
    		   8'b0000_1000:  req_pos_2nd_r <= cfg_data_pos3_2nd_r;
    		   8'b0001_0000:  req_pos_2nd_r <= cfg_data_pos4_2nd_r;
    		   8'b0010_0000:  req_pos_2nd_r <= cfg_data_pos5_2nd_r;
    		   8'b0100_0000:  req_pos_2nd_r <= cfg_data_pos6_2nd_r;
    		   8'b1000_0000:  req_pos_2nd_r <= cfg_data_pos7_2nd_r;
    		 //-------------------------------------
    	endcase
    	else
    	   req_pos_2nd_r <= req_pos_2nd_r;
    end

	//########################################
	// OUTPUT ---------- connection
	//########################################
	
	//�ô���Ҫ����Ϣ���д�����
  assign  req_valid_o           =  {cfg_read_write_r, req_valid_r};
  assign  req_pos_1st_o         =  req_pos_1st_r;
  assign  req_pos_2nd_o         =  req_pos_2nd_r;
  assign  req_pos_src_type_o    =  req_pos_src_type_r;
  assign  cfg_start_addr_o      =  cfg_start_addr_r;     ////  ||    \\\
  assign  cfg_row_addr_burst_o  =  cfg_row_addr_burst_r; ////  ||-----\\\
  assign  cfg_col_addr_burst_o  =  cfg_col_addr_burst_r; ////  ||------>>> ���ڼ���ô��������ʵ��ַ���
  assign  select_pos_row_o      =  select_pos_row;       ////  ||-----///
  assign  select_pos_col_o      =  select_pos_col;       ////  ||    ///
  assign  req_length_burst_o    =  cfg_length_burst_r;
  assign  req_2nd_addr_burst_o  =  cfg_2nd_addr_burst_r;
  assign  req_col_num_2nd_o     =  cfg_col_num_2nd_r;
  
  //�㲥����Ҫ����Ϣ
  assign  req_broadcast_o      =  cfg_broadcast_r;
  assign  req_pos0_1st_o       =  cfg_data_pos0_1st_r;
  assign  req_pos1_1st_o       =  cfg_data_pos1_1st_r;
  assign  req_pos2_1st_o       =  cfg_data_pos2_1st_r;
  assign  req_pos3_1st_o       =  cfg_data_pos3_1st_r;
  assign  req_pos4_1st_o       =  cfg_data_pos4_1st_r;
  assign  req_pos5_1st_o       =  cfg_data_pos5_1st_r;
  assign  req_pos6_1st_o       =  cfg_data_pos6_1st_r;
  assign  req_pos7_1st_o       =  cfg_data_pos7_1st_r;
  assign  req_pos0_src_type_o  =  req_pos0_src_type_r;
  assign  req_pos1_src_type_o  =  req_pos1_src_type_r;
  assign  req_pos2_src_type_o  =  req_pos2_src_type_r;
  assign  req_pos3_src_type_o  =  req_pos3_src_type_r;
  assign  req_pos4_src_type_o  =  req_pos4_src_type_r;
  assign  req_pos5_src_type_o  =  req_pos5_src_type_r;
  assign  req_pos6_src_type_o  =  req_pos6_src_type_r;
  assign  req_pos7_src_type_o  =  req_pos7_src_type_r;
  
  //ͨ���ͷ���Ҫ����Ϣ
  assign  req_release_o   =  req_release_r;
  assign  VR_id_o         =  cfg_VR_id_r;
  assign  VR_FR_o         =  cfg_VR_FR_r;
  assign  channel_id_o    =  cfg_channel_id_r;

endmodule
