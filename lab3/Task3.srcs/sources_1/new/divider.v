`timescale 1ns / 1ps

module divider(clk,clk_N);
    input clk;                      // 系统时钟
    output reg clk_N;                   // 分频后的时钟
    parameter delay = 50_000_000;      // 1Hz的时钟,N=fclk/fclk_N
    reg [31:0] counter;             /* 计数器变量，通过计数实现分频。
                                       当计数器从0计数到(N/2-1)时，
                                       输出时钟翻转，计数器清零 */
    initial
    begin
        counter = 0;
        clk_N = 0;
    end                                   
        
    always @(posedge clk)  
        begin    // 时钟上升沿
            counter <= counter + 1;
            if(counter>delay)
                begin
                    clk_N <= ~clk_N;
                    counter <=0;
                end
        end                     
endmodule
