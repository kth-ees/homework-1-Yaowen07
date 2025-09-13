module bin2bcd (
  input logic [3:0] binary,
  output logic [3:0] bcd,
  output logic carry
);
  // …
  always_comb begin
    case(binary)
      4'd0: begin bcd=4'b0000; carry=1'b0;end
      4'd1: begin bcd=4'b0001; carry=1'b0;end// Add your description here
      4'd2: begin bcd=4'b0010; carry=1'b0;end
      4'd3: begin bcd=4'b0011; carry=1'b0;end
      4'd4: begin bcd=4'b0100; carry=1'b0;end
      4'd5: begin bcd=4'b0101; carry=1'b0;end
      4'd6: begin bcd=4'b0110; carry=1'b0;end
      4'd7: begin bcd=4'b0111; carry=1'b0;end
      4'd8: begin bcd=4'b1000; carry=1'b0;end
      4'd9: begin bcd=4'b1001; carry=1'b0;end
      4'd10: begin bcd=4'b0000; carry=1'b1;end
      4'd11: begin bcd=4'b0001; carry=1'b1;end
      4'd12: begin bcd=4'b0010; carry=1'b1;end
      4'd13: begin bcd=4'b0011; carry=1'b1;end
      4'd14: begin bcd=4'b0100; carry=1'b1;end
      4'd15: begin bcd=4'b0101; carry=1'b1;end
  // …
endmodule
