module csa_8 (
  input logic [7:0] a, b,
  output logic [7:0] sum,
  output logic carry
);
  // …
  logic [3:0] sum_low, sum_high0, sum_high1;
  logic carry_low, carry_high0, carry_high1;
  adder_4 low_adder(.A(A[3:0]), .B(B[3:0]), .sum(sum_low), .carry(carry_low));
  adder_4 high0_adder(.A(A[7:4]), .B(B[7:4]), .sum(sum_high0), .carry(carry_high0));
  adder_4 high1_adder(.A(A[7:4]), .B(B[7:4]), .sum(sum_high1), .carry(carry_high1));
  always_comb begin
    if(carry_low) begin
      sum={sum_high1,sum_low};
      carry=carry_high1;
    end else begin
      sum={sum_high0,sum_low};
      carry=carry_high0;
    end// …
endmodule
