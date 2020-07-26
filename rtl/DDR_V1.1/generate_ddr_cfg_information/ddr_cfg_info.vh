/*******************************************************************\
˵���� ���ļ�������ddr��ַͨ�������ã�Ϊ��������Ϣ���ɵı���ԣ�
       ԭ���Ϲ涨�ü�����ַͨ�������ü�����ַͨ����
���ߣ� yuanyapeng
�ű��� perl
���ڣ� 2016-10-13
\*******************************************************************/

/*******************************************************************\
PS1�� ����ע�ͷ�ʽ�£�ע�Ͳ��ֲ�Ҫ����Ч�������ݴ���ͬһ�У�
PS2�� ����ע���£������ƣ�
PS3�� ��ַͨ�����á�ä�䡱��ʽ��
PS4�� �벻Ҫʹ�á�NULL�����Ⱥ궨����������ʾ0ֵ
PS5�� �벻Ҫʹ�á�M������K���Ⱥ궨����������ʾ��λ
\*******************************************************************/

//����ʹ�õĵ�ַͨ����Ŀ
ddr_ach_num           1   //��ʵֵ��һ

//�������õĵ�ַͨ����Ŀ�����ȷ����ַͨ��


/**************************************************************************************\
                            ddr��ַͨ�����ò���
CFG0��ģʽ����
      ==================================CFG0======================================
          31          30      29          28          27          26
          third_req   stream  Broadcast   Row/Column  Read/Write  D2D_FLAG
          25:23       22:20           19:17       16:8    7:5     4:0
          reserved    ch_cluster_num  reserved    Vr_id   3��d0    ddr_channel_id
      ============================================================================
	  
CFG1��
CFG2��Ŀ��ڵ�һ����������
      ==================================CFG1======================================
          31:24             23:16             15:8              7:0
          ch_data_pos3_1st  ch_data_pos2_1st  ch_data_pos1_1st  ch_data_pos0_1st
      ============================================================================
      ==================================CFG2======================================
          31:24             23:16             15:8              7:0
          ch_data_pos7_1st  ch_data_pos6_1st  ch_data_pos5_1st  ch_data_pos4_1st
      ============================================================================

CFG3��
CFG4�������ڵ�һ����������
      ==================================CFG3======================================
          31:24             23:16             15:8              7:0
          ch_data_pos3_2nd  ch_data_pos2_2nd  ch_data_pos1_2nd  ch_data_pos0_2nd
      ============================================================================
      ==================================CFG4======================================
          31:24             23:16             15:8              7:0
          ch_data_pos7_2nd  ch_data_pos6_2nd  ch_data_pos5_2nd  ch_data_pos4_2nd
      ============================================================================
	  
CFG5��ͨ����ַ�������
      ==================================CFG5======================================
          31:30             29:0
          Reserved(2)       ch_start_addr
      ============================================================================

CFG6��һ��������������
      ==================================CFG6======================================
          31:30             29:16                   15:0
          Reserved(2)       ch_column_num_1st       ch_row_num_1st
      ============================================================================

CFG7������������������
      ==================================CFG7======================================
          31:30             29:16                   15:0
          Reserved(2)       ch_column_num_2nd       ch_row_num_2nd
      ============================================================================

CFG8��Ŀ��ڵ������������
      ==================================CFG8======================================
          31:24              23:21               20:18
          Reserved(2)        ch_data_pos7_2nd    ch_data_pos6_2nd
          17:15              14:12               11:9
          ch_data_pos5_2nd   ch_data_pos4_2nd    ch_data_pos3_2nd
          8:6                5:3                 2:0
          ch_data_pos2_2nd   ch_data_pos1_2nd    ch_data_pos0_2nd
      ============================================================================

CFG9�������ڵ������������
      ==================================CFG9======================================
          31:24              23:21               20:18
          Reserved(2)        ch_addr_pos7_2nd    ch_addr_pos6_2nd
          17:15              14:12               11:9
          ch_addr_pos5_2nd   ch_addr_pos4_2nd    ch_addr_pos3_2nd
          8:6                5:3                 2:0
          ch_addr_pos2_2nd   ch_addr_pos1_2nd    ch_addr_pos0_2nd
      ============================================================================
	  
CFG10��ѭ������
      ==================================CFG10=====================================
          31:30             29:0
          Reserved(2)       ch_circu_times
      ============================================================================
	  
CFG11��һ�������м�һ��ַ������Ŀ
      ==================================CFG11=====================================
          31:30             29:0
          Reserved(2)       ch_col_addr_burst
      ============================================================================
	  
CFG12��һ�������м�һ��ַ������Ŀ
      ==================================CFG12=====================================
          31:30             29:0
          Reserved(2)       ch_row_addr_burst
      ============================================================================
	  
CFG13�����������м�һ��ַ������Ŀ
      ==================================CFG13=====================================
          31:30             29:0
          Reserved(2)       ch_2nd_addr_burst
      ============================================================================
	  
CFG14������������С����
      ==================================CFG14=====================================
          31:30             29:0
          Reserved(2)       ch_access_length
      ============================================================================
	  
CFG15������
\***************************************************************************************/


/*******************************************************\
standard addr channel configure information
\*******************************************************/
//cfg0
     third_req               1'b0
     stream                   1'b0
     Broadcast               1'b0
     Row_Column              1'b1
     Read_Write              1'b1
     D2D_FLAG                 1'b0
     ch_cluster_num          3'd2
     Vr_id                     9'd0
     ddr_channel_id          5'd1
//cfg1
     ch_data_pos0_1st        8'h21
     ch_data_pos1_1st        8'h22
     ch_data_pos2_1st        8'h23
     ch_data_pos3_1st        8'h0
//cfg2
     ch_data_pos4_1st        8'h0
     ch_data_pos5_1st        8'h0
     ch_data_pos6_1st        8'h0
     ch_data_pos7_1st        8'h0
//cfg3
     ch_addr_pos0_1st        8'h0
     ch_addr_pos1_1st        8'h0
     ch_addr_pos2_1st        8'h0
     ch_addr_pos3_1st        8'h0
//cfg4
     ch_addr_pos4_1st        8'h0
     ch_addr_pos5_1st        8'h0
     ch_addr_pos6_1st        8'h0
     ch_addr_pos7_1st        8'h0
//cfg5
     ch_start_addr           30'd0
//cfg6
     ch_column_num_1st       14'd3
	 ch_row_num_1st          16'd2
//cfg7
     ch_column_num_2nd       14'd127
	 ch_row_num_2nd          16'd1023
//cfg8
     ch_data_pos0_2nd        3'd0
     ch_data_pos1_2nd        3'd0
     ch_data_pos2_2nd        3'd0
     ch_data_pos3_2nd        3'd0
     ch_data_pos4_2nd        3'd0
     ch_data_pos5_2nd        3'd0
     ch_data_pos6_2nd        3'd0
     ch_data_pos7_2nd        3'd0
//cfg9
     ch_addr_pos0_2nd        3'd0
     ch_addr_pos1_2nd        3'd0
     ch_addr_pos2_2nd        3'd0
     ch_addr_pos3_2nd        3'd0
     ch_addr_pos4_2nd        3'd0
     ch_addr_pos5_2nd        3'd0
     ch_addr_pos6_2nd        3'd0
     ch_addr_pos7_2nd        3'd0
//cfg10
     ch_circu_times          30'd3
//cfg11
     ch_col_addr_burst       30'd1024
//cfg12
     ch_row_addr_burst       30'd4194304
//cfg13
     ch_2nd_addr_burst       30'd4096
//cfg14
     ch_access_length        30'd1048576
//cfg15
     //Reserved
     

	 
	 
	 
//cfg0
     third_req               1'b0
     stream                  1'b0
     Broadcast               1'b0
     Row_Column              1'b1
     Read_Write              1'b0
     D2D_FLAG                1'b0
     ch_cluster_num          3'd7
     Vr_id                   9'd1
     ddr_channel_id          5'd2
//cfg1
     ch_data_pos0_1st        8'h31
     ch_data_pos1_1st        8'h32
     ch_data_pos2_1st        8'h33
     ch_data_pos3_1st        8'h34
//cfg2
     ch_data_pos4_1st        8'h35
     ch_data_pos5_1st        8'h36
     ch_data_pos6_1st        8'h37
     ch_data_pos7_1st        8'h38
//cfg3
     ch_addr_pos0_1st        8'h0
     ch_addr_pos1_1st        8'h0
     ch_addr_pos2_1st        8'h0
     ch_addr_pos3_1st        8'h0
//cfg4
     ch_addr_pos4_1st        8'h0
     ch_addr_pos5_1st        8'h0
     ch_addr_pos6_1st        8'h0
     ch_addr_pos7_1st        8'h0
//cfg5
     ch_start_addr           30'd4194304
//cfg6
     ch_column_num_1st       14'd3
	 ch_row_num_1st          16'd1
//cfg7
     ch_column_num_2nd       14'd127
	 ch_row_num_2nd          16'd1023
//cfg8
     ch_data_pos0_2nd        3'd0
     ch_data_pos1_2nd        3'd0
     ch_data_pos2_2nd        3'd0
     ch_data_pos3_2nd        3'd0
     ch_data_pos4_2nd        3'd0
     ch_data_pos5_2nd        3'd0
     ch_data_pos6_2nd        3'd0
     ch_data_pos7_2nd        3'd0
//cfg9
     ch_addr_pos0_2nd        3'd0
     ch_addr_pos1_2nd        3'd0
     ch_addr_pos2_2nd        3'd0
     ch_addr_pos3_2nd        3'd0
     ch_addr_pos4_2nd        3'd0
     ch_addr_pos5_2nd        3'd0
     ch_addr_pos6_2nd        3'd0
     ch_addr_pos7_2nd        3'd0
//cfg10
     ch_circu_times          30'd0
//cfg11
     ch_col_addr_burst       30'd1024
//cfg12
     ch_row_addr_burst       30'd4194304
//cfg13
     ch_2nd_addr_burst       30'd4096
//cfg14
     ch_access_length        30'd4194304
//cfg15
     //Reserved
     

	 
//cfg0
     third_req               1'b1
     stream                  1'b0
     Broadcast               1'b0
     Row_Column              1'b1
     Read_Write              1'b0
     D2D_FLAG                1'b0
     ch_cluster_num          3'd0
     Vr_id                   9'd2
     ddr_channel_id          5'd3
//cfg1
     ch_data_pos0_1st        8'h66
     ch_data_pos1_1st        8'h0
     ch_data_pos2_1st        8'h0
     ch_data_pos3_1st        8'h0
//cfg2
     ch_data_pos4_1st        8'h0
     ch_data_pos5_1st        8'h0
     ch_data_pos6_1st        8'h0
     ch_data_pos7_1st        8'h0
//cfg3
     ch_addr_pos0_1st        8'h22
     ch_addr_pos1_1st        8'h0
     ch_addr_pos2_1st        8'h0
     ch_addr_pos3_1st        8'h0
//cfg4
     ch_addr_pos4_1st        8'h0
     ch_addr_pos5_1st        8'h0
     ch_addr_pos6_1st        8'h0
     ch_addr_pos7_1st        8'h0
//cfg5
     ch_start_addr           30'd0
//cfg6
     ch_column_num_1st       14'd0
	 ch_row_num_1st          16'd0
//cfg7
     ch_column_num_2nd       14'd127
	 ch_row_num_2nd          16'd3
//cfg8
     ch_data_pos0_2nd        3'd1
     ch_data_pos1_2nd        3'd0
     ch_data_pos2_2nd        3'd0
     ch_data_pos3_2nd        3'd0
     ch_data_pos4_2nd        3'd0
     ch_data_pos5_2nd        3'd0
     ch_data_pos6_2nd        3'd0
     ch_data_pos7_2nd        3'd0
//cfg9
     ch_addr_pos0_2nd        3'd1
     ch_addr_pos1_2nd        3'd0
     ch_addr_pos2_2nd        3'd0
     ch_addr_pos3_2nd        3'd0
     ch_addr_pos4_2nd        3'd0
     ch_addr_pos5_2nd        3'd0
     ch_addr_pos6_2nd        3'd0
     ch_addr_pos7_2nd        3'd0
//cfg10
     ch_circu_times          30'd0
//cfg11
     ch_col_addr_burst       30'd1024
//cfg12
     ch_row_addr_burst       30'd3072
//cfg13
     ch_2nd_addr_burst       30'd1024
//cfg14
     ch_access_length        30'd3072
//cfg15
     //Reserved
     
