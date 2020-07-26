`define        K                              1024
`define        M                              (`K)*(`K)
`define        Burst_Length                   8

`define        PR_REQ_STARTADDR               0

/* cluster_type */
`define        DDR_CLUSTER_TYPE            3'b000;
`define        RCU_CLUSTER_TYPE            3'b001;
`define        FFT_CLUSTER_TYPE            3'b010;
`define        COP_CLUSTER_TYPE            3'b011;
`define        FR_CLUSTER_TYPE             3'b100;
`define        ETH_CLUSTER_TYPE            3'b101;
//`define        DDR_CLUSTER_TYPE            3'b110;





/* DDR���� */
`define        DDR0CfgPortY                4'b0000
`define        DDR0CfgPortX                4'b0100
`define        DDR1CfgPortY                4'b0100
`define        DDR1CfgPortX                4'b0100

/* COPȡָ��ʱ�Ļ�ַ�����ʳ��� */
`define        COP_IP_REQ_STARTADDR           256*(`M)
`define        COP_IP_REQ_LENGTH              1024
//`define        COP_IP_REQ_SRCTYPE             2'b11

/* MC ȡָ��ʱ�Ļ�ַ�����ʳ��� */
`define        MC_IP_TOP_REQ_STARTADDR        258*(`M)       //absolute direct address
`define        MC_IP_TOP_REQ_LENGTH           256            //absolute shift address
`define        MC_IP_TOP_REQ_SRCTYPE          2'b01          //
`define        MC_IP_BTM_REQ_STARTADDR        259*(`M)       //absolute direct address
`define        MC_IP_BTM_REQ_LENGTH           512            //absolute direct address
`define        MC_IP_BTM_REQ_SRCTYPE          2'b10

/* ȡ����ʱ�Ļ�ַ */
`define        MEM_REQ_STARTADDR              260*(`M)

/* MC���� */
`define        MC_POS_1ST                     8'h11
`define        MC_POS_2ND                     3'd0

/* COP����(һ������) */
`define        COP_0_POS_1ST                  {4'd3,4'd1}
`define        COP_1_POS_1ST                  {4'd3,4'd2}
`define        COP_2_POS_1ST                  {4'd3,4'd3}
`define        COP_3_POS_1ST                  {4'd0,4'd0}
`define        COP_4_POS_1ST                  {4'd0,4'd0}
`define        COP_5_POS_1ST                  {4'd0,4'd0}
`define        COP_6_POS_1ST                  {4'd0,4'd0}
`define        COP_7_POS_1ST                  {4'd0,4'd0}

/* COP����(��������) */  //----yyp, 2016/8/23 22:33:02
`define        COP_0_POS_2ND                  3'd1
`define        COP_1_POS_2ND                  3'd2
`define        COP_2_POS_2ND                  3'd3
`define        COP_3_POS_2ND                  3'd0
`define        COP_4_POS_2ND                  3'd0
`define        COP_5_POS_2ND                  3'd0
`define        COP_6_POS_2ND                  3'd0
`define        COP_7_POS_2ND                  3'd0


/* RCU���� */
// `define     RCU_0_POS                      {4'd0,4'd0}
// `define     RCU_1_POS                      {4'd0,4'd0}
// `define     RCU_2_POS                      {4'd0,4'd0}
// `define     RCU_3_POS                      {4'd0,4'd0}
// `define     RCU_4_POS                      {4'd0,4'd0}
// `define     RCU_5_POS                      {4'd0,4'd0}
// `define     RCU_6_POS                      {4'd0,4'd0}
// `define     RCU_7_POS                      {4'd0,4'd0}