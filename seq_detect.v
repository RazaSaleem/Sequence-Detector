// Code your design here
modlue seq_detector (input wire clk,
                     input wire rst,
                     input wire data_in,
                     output wire out
                    );

//State encoding 

  localparam s0 = 2'b00,
			 s1 = 2'b01,
 			 s2 = 2'b10,
			 s3 = 2'b11;



  reg [1:0] current_state;
  reg [1:0] next_state;


  // state memory : state register
  always @ (posedge clk) 
    begin
      if(rst)
        current_state <= s0;
      else
        current_state <= next_state;
    end

  //transition logic : next state logic
  always @ (data_in or current_state)
    begin
      case(current_state)
        
        s0 : begin
          if (data_in == 0)
            next_state <= s0;
          else
            next_state <= s1;
        end
        
        s1 : begin
          if (data_in == 0)
            next_state <= s2;
          else
            next_state <= s1;
        end
        
        s2 : begin
          if (data_in == 0)
            next_state <= s0;
          else
            next_state <= s3;
        end
        
        s3 : begin
          if (data_in == 0)
            next_state <= s2;
          else
            next_state <= s1;
        end
        
        default : next_state <= s0;
        
      endcase
    end
  //output combinational logic
  assign out = (current_state == s3) ? 1 : 0;
/*
  always @ (data_in or current_state)
    begin
      case(current_state)
        s0 : out <= 0;
        s1 : out <= 0;
        s2 : out <= 0;
        s3 : out <= 1;
        default : out <= 0;
      endcase
    end
*/
endmodule
