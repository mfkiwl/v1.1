verdiWindowResize -win $_Verdi_1 "67" "27" "733" "545"
debImport "-sv" "-f" "filelist.vc"
debExit
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
srcDeselectAll -win $_nTrace1
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_test" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata_fun" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 785279.577102 -snap {("G1" 5)}
wvSetCursor -win $_nWave2 822673.842678 -snap {("G1" 5)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.rdata_fun\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 170000 -TraceValue \
           00000000
nsMsgSwitchTab -tab trace
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.sram0" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wen" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cs_n" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cs_n" -win $_nTrace1
srcAction -pos 24 5 2 -win $_nTrace1 -name "cs_n" -ctrlKey off
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoom -win $_nWave2 598308.249221 1832319.013238
wvSetCursor -win $_nWave2 922176.974643 -snap {("G1" 5)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.rdata_fun\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue xxxxxxxx
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.sram0" -win \
           $_nTrace1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cs_n" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cs_n" -win $_nTrace1
srcAction -pos 24 5 1 -win $_nTrace1 -name "cs_n" -ctrlKey off
debReload
srcDeselectAll -win $_nTrace1
srcSelect -signal "bist_test_enable" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
debReload
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvZoomOut -win $_nWave2
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 926690.075660 -snap {("G1" 5)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.rdata_fun\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue xxxxxxxx
nsMsgSwitchTab -tab trace
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.sram0" -win \
           $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 217488.487145 -snap {("G1" 8)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.sram0.cs_n" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 1
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "bist_ten" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 222216.497735 -snap {("G1" 10)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.bist_ten" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 90000 -TraceValue 1
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" -win \
           $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
srcDeselectAll -win $_nTrace1
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" \
           -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "Addr_test" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_test" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSetCursor -win $_nWave2 416064.931929 -snap {("G1" 5)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.rdata_fun\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue xxxxxxxx
srcDeselectAll -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 10)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata_fun" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 572089.281403 -snap {("G1" 10)}
wvSetCursor -win $_nWave2 572089.281403 -snap {("G1" 11)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.rdata_fun\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue xxxxxxxx
srcDeselectAll -win $_nTrace1
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.sram0" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.sram0" \
           -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
debReload
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 18912.042360 1843924.130140
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSetCursor -win $_nWave2 899952.360599 -snap {("G1" 4)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 106316.835836 -snap {("G1" 10)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 896456.168860 -snap {("G1" 4)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 906944.744077 -snap {("G1" 10)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.data_test\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 870000 -TraceValue \
           11111111
nsMsgSwitchTab -tab trace
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_temp\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 868486.634948 -snap {("G1" 12)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.data_temp\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 770000 -TraceValue \
           01111111
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" -win \
           $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 959387.620163 -snap {("G1" 3)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 861494.251470 -snap {("G1" 12)}
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvZoom -win $_nWave2 837020.909296 1085250.522768
wvSetCursor -win $_nWave2 970646.429192 -snap {("G1" 2)}
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 869832.869698 -snap {("G1" 12)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.data_temp\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 770000 -TraceValue \
           01111111
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" -win \
           $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
wvSelectSignal -win $_nWave2 {( "G1" 12 )} 
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvSetCursor -win $_nWave2 969219.822218 -snap {("G1" 11)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.rdata_fun\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 870000 -TraceValue \
           01111111
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\]" -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 867930.727066 -snap {("G1" 10)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.data_test\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 770000 -TraceValue \
           01111111
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_temp\[7:0\]" -win $_nTrace1
wvSetCursor -win $_nWave2 868881.798382 -snap {("G1" 11)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.data_temp\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 770000 -TraceValue \
           01111111
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" -win \
           $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcDeselectAll -win $_nTrace1
debReload
wvSetCursor -win $_nWave2 848433.765088 -snap {("G1" 11)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.data_temp\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 750000 -TraceValue \
           01111111
nsMsgSwitchTab -tab trace
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" -win \
           $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvSelectSignal -win $_nWave2 {( "G1" 10 )} 
wvSelectSignal -win $_nWave2 {( "G1" 11 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 10)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata_fun" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 925832.508489 -snap {("G1" 11)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.rdata_fun\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 870000 -TraceValue \
           01111111
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.sram0" -win \
           $_nTrace1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 1
wvSetCursor -win $_nWave2 923935.310726 -snap {("G1" 11)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.rdata_fun\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 870000 -TraceValue \
           01111111
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.sram0" -win \
           $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 923935.310726 -snap {("G1" 4)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.addr_cnt\[12:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 910000 -TraceValue \
           0000000000001
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" -win \
           $_nTrace1
debReload
wvSetCursor -win $_nWave2 927729.706252 -snap {("G1" 11)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.rdata_fun\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 870000 -TraceValue \
           01111111
nsMsgSwitchTab -tab trace
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.sram0" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "oen" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "wen" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cs_n" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 867019.377827 -snap {("G1" 11)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.rdata_fun\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 770000 -TraceValue \
           00111111
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.sram0" -win \
           $_nTrace1
wvSetCursor -win $_nWave2 927729.706252 -snap {("G1" 11)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.rdata_fun\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 870000 -TraceValue \
           01111111
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.sram0" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {28 31 7 1 2 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "Wdata\[7:0\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 923935.310726 -snap {("G1" 11)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.rdata_fun\[7:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 870000 -TraceValue \
           01111111
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.sram0" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "Addr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvSetCursor -win $_nWave2 884094.157696 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 168850.600933 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 265607.686862 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 368056.366080 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 462916.254245 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 567262.131226 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 665916.414917 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 166953.403170 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 284579.664495 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 385131.145949 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 489477.022931 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 588131.306622 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 667813.612681 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 783542.676242 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 885991.355460 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 166953.403170 -snap {("G1" 11)}
wvSetCursor -win $_nWave2 83476.701585 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 104345.876981 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 144187.030011 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 87271.097112 -snap {("G1" 10)}
wvSetCursor -win $_nWave2 108140.272508 -snap {("G1" 2)}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSetCursor -win $_nWave2 127112.250141 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 108140.272508 -snap {("G1" 2)}
wvSetCursor -win $_nWave2 125215.052378 -snap {("G1" 2)}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" \
           -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "wen_test" -win $_nTrace1
srcAction -pos 13 2 3 -win $_nTrace1 -name "wen_test" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "wen_temp" -win $_nTrace1
srcAction -pos 47 10 5 -win $_nTrace1 -name "wen_temp" -ctrlKey off
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.sram0" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.sram0" \
           -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "wen" -win $_nTrace1
srcAction -pos 3 2 1 -win $_nTrace1 -name "wen" -ctrlKey off
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.sram0" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.sram0" \
           -delim "."
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" \
           -delim "."
debReload
wvTpfCloseForm -win $_nWave2
wvGetSignalClose -win $_nWave2
wvCloseWindow -win $_nWave2
verdiDockWidgetUndock -dock widgetDock_<Message>
verdiDockWidgetDock -dock widgetDock_<Message>
verdiDockWidgetFix -dock widgetDock_<Message>
verdiDockWidgetUndock -dock widgetDock_<Message>
verdiDockWidgetDock -dock widgetDock_<Message>
wvCreateWindow
verdiWindowBeWindow -win $_nWave3
wvResizeWindow -win $_nWave3 96 118 433 444
verdiDockWidgetSetCurTab -dock widgetDock_<Decl._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
nsMsgSwitchTab -tab general
nsMsgSwitchTab -tab cmpl
verdiWindowResize -win $_Verdi_1 "158" "76" "558" "399"
verdiWindowResize -win $_Verdi_1 "67" "27" "733" "545"
verdiDockWidgetSetCurTab -dock widgetDock_<Decl._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Decl._Tree>
verdiDockWidgetSetCurTab -dock widgetDock_<Inst._Tree>
nsMsgSwitchTab -tab trace
nsMsgSwitchTab -tab search
nsMsgSwitchTab -tab intercon
wvCreateWindow
wvSetPosition -win $_nWave4 {("G1" 0)}
wvOpenFile -win $_nWave4 {/home/ft/tree/v1.1/work/ahb_sramc/sram.fsdb}
verdiDockWidgetMaximize -dock windowDock_nWave_4
verdiDockWidgetHide -dock windowDock_nWave_4
verdiDockWidgetUndock -dock widgetDock_<Message>
verdiDockWidgetDock -dock widgetDock_<Message>
verdiDockWidgetUndock -dock widgetDock_<Message>
wvResizeWindow -win $_nWave3 77 271 433 744
srcDeselectAll -win $_nTrace1
verdiDockWidgetHide -dock widgetDock_<Message>
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" -win \
           $_nTrace1
srcSetScope -win $_nTrace1 \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" \
           -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "state" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "bit_cnt" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "addr_cnt" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "Addr_test" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_test" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvResizeWindow -win $_nWave3 57 17 733 545
wvResizeWindow -win $_nWave3 57 17 733 545
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_test" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata_fun" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvZoom -win $_nWave3 16180.787513 1205468.669701
wvSetCursor -win $_nWave3 182127.933865 -snap {("G1" 6)}
wvResizeWindow -win $_nWave3 57 17 733 545
wvSetCursor -win $_nWave3 876986.011207
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvDisplayGridCount -win $_nWave4 -off
wvGetSignalClose -win $_nWave4
wvReloadFile -win $_nWave3
wvZoom -win $_nWave3 0.000000 5984207.437443
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 4955498.950046 -snap {("G1" 3)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.addr_cnt\[12:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 4190000 -TraceValue \
           0000000000101
nsMsgSwitchTab -tab trace
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" -win \
           $_nTrace1
verdiDockWidgetHide -dock widgetDock_<Message>
srcDeselectAll -win $_nTrace1
verdiWindowBeWindow -win $_nWave4
wvResizeWindow -win $_nWave4 57 20 301 441
wvTpfCloseForm -win $_nWave4
wvGetSignalClose -win $_nWave4
wvCloseWindow -win $_nWave4
wvZoom -win $_nWave3 4092711.186422 6681074.477293
wvSelectSignal -win $_nWave3 {( "G1" 3 )} 
wvSelectSignal -win $_nWave3 {( "G1" 4 )} 
wvCut -win $_nWave3
wvSetPosition -win $_nWave3 {("G2" 0)}
wvSetPosition -win $_nWave3 {("G1" 5)}
wvSetCursor -win $_nWave3 4996963.796356 -snap {("G1" 3)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.addr_cnt\[12:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 4190000 -TraceValue \
           0000000000101
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" -win \
           $_nTrace1
verdiDockWidgetHide -dock widgetDock_<Message>
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_state" -win $_nTrace1
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvReloadFile -win $_nWave3
wvSetCursor -win $_nWave3 4996963.796357 -snap {("G1" 2)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.bit_cnt\[2:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 4910000 -TraceValue 111
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" -win \
           $_nTrace1
verdiDockWidgetDock -dock widgetDock_<Message>
wvSetCursor -win $_nWave3 5250537.279566 -snap {("G2" 0)}
wvSetCursor -win $_nWave3 5001748.201700 -snap {("G1" 2)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.bit_cnt\[2:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 4910000 -TraceValue 111
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" -win \
           $_nTrace1
wvZoom -win $_nWave3 4843862.825362 5690702.571174
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoom -win $_nWave3 4838384.194843 6153255.519209
wvZoom -win $_nWave3 4862688.655552 5297738.502246
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoom -win $_nWave3 4481919.519859 6167436.116293
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvReloadFile -win $_nWave3
wvSetCursor -win $_nWave3 9919151.859346 -snap {("G1" 3)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.addr_cnt\[12:0\]" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 9110000 -TraceValue \
           0000000000101
srcDeselectAll -win $_nTrace1
debReload
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvReloadFile -win $_nWave3
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvReloadFile -win $_nWave3
srcDeselectAll -win $_nTrace1
srcSelect -signal "bist_done" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "bist_fail" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave3 124622.299182 -snap {("G1" 7)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.bist_fail" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
nsMsgSwitchTab -tab trace
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" -win \
           $_nTrace1
wvZoom -win $_nWave3 31155.574795 364520.225107
wvSetCursor -win $_nWave3 128515.306310 -snap {("G1" 7)}
srcActiveTrace \
           "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0.bist_fail" \
           -win $_nTrace1 -TraceByDConWave -TraceTime 0 -TraceValue 0
srcHBSelect "sram_tb.top.sram_core0.gen_sram_block\[0\].u_sram_bist.mbist0" -win \
           $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "rdata_fun\[bit_cnt\]" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvDisplayGridCount -win $_nWave3 -off
wvGetSignalClose -win $_nWave3
wvReloadFile -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvTpfCloseForm -win $_nWave3
wvGetSignalClose -win $_nWave3
wvCloseWindow -win $_nWave3
debExit
