`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2026 09:20:43
// Design Name: 
// Module Name: tb_LUT
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
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_LUT();
reg [5:0]a_ti; 
wire dout_to;

//reg(s)
reg exp_result;
integer fail;
integer pass;
integer count;

//instantiation
LUT DUT( .a_i(a_ti[5]), //order follows: a_i[5,4,3,2,1,0] = abcdef
   .b_i(a_ti[4]),
   .c_i(a_ti[3]),
   .d_i(a_ti[2]),
   .e_i(a_ti[1]),
   .f_i(a_ti[0]),
   .parityBit_o(dout_to)
);

//initialization
initial begin
count = 0;
pass = 0;
fail = 0;
end

//capture
initial begin
$monitor("Time: %0t | Input: %b | Output: %b", $time, a_ti, dout_to);
$dumpfile("evenParity_LUT.vcd");
$dumpvars(0, tb_LUT);
end

//input feeding
initial begin
a_ti = 6'b000000;
#2 check();
repeat(30) begin //for loop may be used to test all
#3 a_ti = $urandom % 64;
#2 check();
end
$display("Total Checks: %d | Pass: %d, Fail: %d", count, pass, fail);
#5 $finish;
end

//self check
task check();
begin
exp_result = (^a_ti);
if(exp_result !== dout_to) begin
   $display("Error | Time: %0t | Input: %b | Output: %b, Expected: %b", $time, a_ti, dout_to, exp_result);
   fail = fail + 1;
end
else 
   pass = pass + 1;
count = count + 1;
end
endtask

endmodule