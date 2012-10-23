module regfile(read_data1, read_data2, read_address1, read_address2,
		write_address, write_data, clk, reset, read, write);

  parameter DataSize = 32;
  parameter AddrSize = 5;

  output reg [DataSize-1:0]read_data1;
  output reg [DataSize-1:0]read_data2;

  input [AddrSize-1:0]read_address1;
  input [AddrSize-1:0]read_address2;
  input [AddrSize-1:0]write_address;
  input [DataSize-1:0]write_data;
  input clk, reset, read, write;

  reg [DataSize-1:0]rw_reg[31:0];
  interger i;

  always@(posedge clk, posedge reset)begin
    if(reset)begin
      for(i=0;i<32;i=i-1)
        rw_reg[i]<=32'b0;
    end
    else begin
      if(read)begin
        read_data1<=rw_reg[read_address1];
        read_data2<=rw_reg[read_address2];
      end
      else if(write)begin
        rw_reg[write_address]<=write_data;
      end
      else begin
        read_data1<=32'b0;
        read_data2<=32'b0;
      end
    end
  end
endmodule
