module tb_CSA_8;
    logic [7:0] A, B;
    logic [7:0] sum;
    logic carry;
    
    // Instantiate Device Under Test
    CSA_8 dut (
        .A(A),
        .B(B),
        .sum(sum),
        .carry(carry)
    );
    
    initial begin
        $display("=== Testing 8-bit Carry Select Adder ===");
        $display("Time\tA\t\tB\t\tSum\t\tCarry\tExpected Sum\tExpected Carry");
        $display("-------------------------------------------------------------------");
        
        // Test boundary cases
        test_addition(8'h00, 8'h00, "Zero + Zero");
        test_addition(8'hFF, 8'h01, "Max + 1");
        test_addition(8'hFF, 8'hFF, "Max + Max");
        test_addition(8'h7F, 8'h7F, "127 + 127");
        
        // Test random cases
        $display("\n=== Random Tests ===");
        for (int i = 0; i < 20; i++) begin
            logic [7:0] rand_A = $random;
            logic [7:0] rand_B = $random;
            test_addition(rand_A, rand_B, "Random");
        end
        
        // Test carry propagation
        $display("\n=== Carry Propagation Tests ===");
        test_addition(8'b00001111, 8'b00000001, "Carry propagation 1");
        test_addition(8'b11110000, 8'b00001111, "Carry propagation 2");
        
        $display("\n=== Test Complete ===");
        $finish;
    end
    
    // Test helper task
    task test_addition(input logic [7:0] a_val, b_val, input string test_name);
        logic [8:0] expected_result; // 9 bits to include carry
        
        A = a_val;
        B = b_val;
        expected_result = a_val + b_val;
        
        #20;
        
        $display("%0t\t%h\t%h\t%h\t%b\t%h\t\t%b", 
                $time, A, B, sum, carry, 
                expected_result[7:0], expected_result[8]);
        
        // Verify results
        if (sum !== expected_result[7:0] || carry !== expected_result[8]) begin
            $error("%s failed: A=%h, B=%h, expected sum=%h carry=%b, got sum=%h carry=%b",
                   test_name, A, B, expected_result[7:0], expected_result[8], sum, carry);
        end else begin
            $display("%s: PASS", test_name);
        end
    endtask
endmodule

// 4-bit adder module (needs to be in same file or separate file)
module adder_4 (
    input logic [3:0] A, B,
    output logic [3:0] sum,
    output logic carry
);
    assign {carry, sum} = A + B;
endmodule
