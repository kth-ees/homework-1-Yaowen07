module tb_bin2bcd;
    logic [3:0] binary;
    logic [3:0] bcd;
    logic carry;
    
    // Instantiate Device Under Test
    bin2bcd dut (
        .binary(binary),
        .bcd(bcd),
        .carry(carry)
    );
    
    // Expected output values (from problem table)
    logic [3:0] expected_bcd [0:15];
    logic expected_carry [0:15];
    
    initial begin
        // Initialize expected values
        expected_bcd[0] = 4'b0000; expected_carry[0] = 1'b0;
        expected_bcd[1] = 4'b0001; expected_carry[1] = 1'b0;
        expected_bcd[2] = 4'b0010; expected_carry[2] = 1'b0;
        expected_bcd[3] = 4'b0011; expected_carry[3] = 1'b0;
        expected_bcd[4] = 4'b0100; expected_carry[4] = 1'b0;
        expected_bcd[5] = 4'b0101; expected_carry[5] = 1'b0;
        expected_bcd[6] = 4'b0110; expected_carry[6] = 1'b0;
        expected_bcd[7] = 4'b0111; expected_carry[7] = 1'b0;
        expected_bcd[8] = 4'b1000; expected_carry[8] = 1'b0;
        expected_bcd[9] = 4'b1001; expected_carry[9] = 1'b0;
        expected_bcd[10] = 4'b0001; expected_carry[10] = 1'b1;
        expected_bcd[11] = 4'b0011; expected_carry[11] = 1'b1;
        expected_bcd[12] = 4'b0101; expected_carry[12] = 1'b1;
        expected_bcd[13] = 4'b0111; expected_carry[13] = 1'b1;
        expected_bcd[14] = 4'b1001; expected_carry[14] = 1'b1;
        expected_bcd[15] = 4'b1011; expected_carry[15] = 1'b1;
    end
    
    initial begin
        $display("=== Testing 4-bit Binary to BCD Encoder ===");
        $display("Time\tBinary\tBCD\tCarry\tExpected BCD\tExpected Carry");
        $display("-------------------------------------------------------");
        
        // Test all possible input combinations
        for (int i = 0; i < 16; i++) begin
            binary = i;
            #10;
            $display("%0t\t%b\t%b\t%b\t%b\t\t%b", 
                    $time, binary, bcd, carry, 
                    expected_bcd[i], expected_carry[i]);
            
            // Verify output correctness
            if (bcd !== expected_bcd[i] || carry !== expected_carry[i]) begin
                $error("Error: binary=%b, expected (bcd=%b, carry=%b), got (bcd=%b, carry=%b)", 
                       binary, expected_bcd[i], expected_carry[i], bcd, carry);
            end
        end
        
        // Random tests
        $display("\n=== Random Tests ===");
        for (int i = 0; i < 10; i++) begin
            binary = $random;
            #10;
            $display("Random: binary=%b, bcd=%b, carry=%b", binary, bcd, carry);
            
            // Verify random test results
            if (bcd !== expected_bcd[binary] || carry !== expected_carry[binary]) begin
                $error("Random test failed!");
            end
        end
        
        $display("\n=== Test Complete ===");
        $finish;
    end
endmodule
