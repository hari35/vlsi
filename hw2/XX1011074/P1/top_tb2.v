`timescale 1ns/10ps
`define PERIOD 10

module top_tb2;

  parameter DataSize = 32;
  parameter MemSize = 1024;

  reg clk;
  reg reset;
  
  //test &debug
  reg [DataSize-1:0]golden_reg[31:0];
  reg [31:0]tb_rw_reg_0;
  reg [31:0]tb_rw_reg_1;
  reg [31:0]tb_rw_reg_2;
  reg [31:0]tb_rw_reg_3;
  reg [31:0]tb_rw_reg_4;
  reg [31:0]tb_rw_reg_5;
  reg [31:0]tb_rw_reg_6;
  reg [31:0]tb_rw_reg_7;
  reg [31:0]tb_rw_reg_8;
  reg [31:0]tb_rw_reg_9;
  integer i;
  integer err_num;

  top TOP (
    clk,
    reset
  );
  
  always begin
  	#(`PERIOD/2) clk = ~clk;
  end

  /* Set signal */
  initial begin
  clk = 1'b0;
  #(`PERIOD) reset = 1'b0;
  #(`PERIOD) reset = 1'b1;  
  #(`PERIOD*2.5);
  #(`PERIOD*4);
  reset = 1'b0;
    
  $readmemb("mins2.prog", TOP.p4.IM1.mem_data);
  for (i = 0; i < MemSize; i = i+1) begin
    if (TOP.p4.IM1.mem_data[i])
      $display("memdata[%d]: %h", i, TOP.p4.IM1.mem_data[i]); 
  end

  #(`PERIOD*4*20) $finish;
  end

  /* Create tb waveform */
  initial begin
  #(`PERIOD*2); 
    for ( i = 0; i < DataSize; i = i+1) begin
      golden_reg[i] = 32'd0;
    end

    tb_rw_reg_0 = 32'd0;
    tb_rw_reg_1 = 32'd0;
    tb_rw_reg_2 = 32'd0;
    tb_rw_reg_3 = 32'd0;
    tb_rw_reg_4 = 32'd0;
    tb_rw_reg_5 = 32'd0;
    tb_rw_reg_6 = 32'd0;
    tb_rw_reg_7 = 32'd0;
    tb_rw_reg_8 = 32'd0;
    tb_rw_reg_9 = 32'd0;
    err_num = 0;

  #(`PERIOD*1.5);
  #(`PERIOD*4);
  #(`PERIOD*4) //NOP
  #(`PERIOD*4) //MOVI
  tb_rw_reg_0 = 32'h00C8;
  golden_reg[0] = 32'h00C8;

  #(`PERIOD*4) //ADDI
  tb_rw_reg_1 = 32'h012C;
  golden_reg[1] = 32'h012C;
  if (tb_rw_reg_0 != TOP.p4.p3.regfile1.rw_reg_0)
    err_num = err_num + 1;

  #(`PERIOD*4) //ADD
  tb_rw_reg_2 = 32'h01F4;
  golden_reg[2] = 32'h01F4;
  if (tb_rw_reg_1 != TOP.p4.p3.regfile1.rw_reg_1)
    err_num = err_num + 1;

  #(`PERIOD*4) //SUB
  tb_rw_reg_2 = 32'h0064;
  golden_reg[2] = 32'h0064;
  if (tb_rw_reg_2 != TOP.p4.p3.regfile1.rw_reg_2)
    err_num = err_num + 1;

  #(`PERIOD*4) //AND
  tb_rw_reg_2 = 32'h0008;
  golden_reg[2] = 32'h0008;
  if (tb_rw_reg_2 != TOP.p4.p3.regfile1.rw_reg_2)
    err_num = err_num + 1;

  #(`PERIOD*4) //OR
  tb_rw_reg_2 = 32'h01EC;
  golden_reg[2] = 32'h01EC;
  if (tb_rw_reg_2 != TOP.p4.p3.regfile1.rw_reg_2)
    err_num = err_num + 1;

  #(`PERIOD*4) //XOR
  tb_rw_reg_2 = 32'h01E4;
  golden_reg[2] = 32'h01E4;
  if (tb_rw_reg_2 != TOP.p4.p3.regfile1.rw_reg_2)
    err_num = err_num + 1;

  #(`PERIOD*4) //SRLI
  tb_rw_reg_2 = 32'h0019;
  golden_reg[2] = 32'h0019;
  if (tb_rw_reg_2 != TOP.p4.p3.regfile1.rw_reg_2)
    err_num = err_num + 1;

  #(`PERIOD*4) //SLLI
  tb_rw_reg_2 = 32'h0640;
  golden_reg[2] = 32'h0640;
  if (tb_rw_reg_2 != TOP.p4.p3.regfile1.rw_reg_2)
    err_num = err_num + 1;

  #(`PERIOD*4) //ROTRI
  tb_rw_reg_2 = 32'h0019;
  golden_reg[2] = 32'h0019;
  if (tb_rw_reg_2 != TOP.p4.p3.regfile1.rw_reg_2)
    err_num = err_num + 1;

  #(`PERIOD*4) //ORI
  tb_rw_reg_2 = 32'h00EC;
  golden_reg[2] = 32'h00EC;
  if (tb_rw_reg_2 != TOP.p4.p3.regfile1.rw_reg_2)
    err_num = err_num + 1;

  #(`PERIOD*4) //XORI
  tb_rw_reg_2 = 32'h00AC;
  golden_reg[2] = 32'h00AC;
  if (tb_rw_reg_2 != TOP.p4.p3.regfile1.rw_reg_2)
    err_num = err_num + 1;

  #(`PERIOD*4) //ADD
  tb_rw_reg_3 = 32'h01D8;
  golden_reg[3] = 32'h01D8;
  if (tb_rw_reg_2 != TOP.p4.p3.regfile1.rw_reg_2)
    err_num = err_num + 1;

  #(`PERIOD*4) //SUB
  tb_rw_reg_4 = 32'h0110;
  golden_reg[4] = 32'h0110;
  if (tb_rw_reg_3 != TOP.p4.p3.regfile1.rw_reg_3)
    err_num = err_num + 1;

  #(`PERIOD*4) //AND
  tb_rw_reg_5 = 32'h0080;
  golden_reg[5] = 32'h0080;
  if (tb_rw_reg_4 != TOP.p4.p3.regfile1.rw_reg_4)
    err_num = err_num + 1;

  #(`PERIOD*4) //OR
  tb_rw_reg_6 = 32'h01D8;
  golden_reg[6] = 32'h01D8;
  if (tb_rw_reg_5 != TOP.p4.p3.regfile1.rw_reg_5)
    err_num = err_num + 1;

  #(`PERIOD*4) //XOR
  tb_rw_reg_7 = 32'h0158;
  golden_reg[7] = 32'h0158;
  if (tb_rw_reg_6 != TOP.p4.p3.regfile1.rw_reg_6)
    err_num = err_num + 1;

  #(`PERIOD*4) //SRLI
  tb_rw_reg_8 = 32'h0005;
  golden_reg[8] = 32'h0005;
  if (tb_rw_reg_7 != TOP.p4.p3.regfile1.rw_reg_7)
    err_num = err_num + 1;

  #(`PERIOD*4) //SLLI
  tb_rw_reg_9 = 32'h0280;
  golden_reg[9] = 32'h0280;
  if (tb_rw_reg_8 != TOP.p4.p3.regfile1.rw_reg_8)
    err_num = err_num + 1;

  #(`PERIOD*4) //IDEL
  if (tb_rw_reg_9 != TOP.p4.p3.regfile1.rw_reg_9)
    err_num = err_num + 1;
  end

  /* Dump and finish */
  initial begin
    $dumpfile("top_tb2.vcd");
    $dumpvars;
//  $fsdbDumpfile("top_tb2.fsdb");
//  $fsdbDumpvars;
  end

endmodule