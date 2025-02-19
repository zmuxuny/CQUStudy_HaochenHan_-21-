//alu defines
`define ALU_AND             5'b0_0000
`define ALU_OR              5'b0_0001
`define ALU_ADD             5'b0_0010
`define ALU_SUB             5'b0_0011
`define ALU_SLT             5'b0_0100
`define ALU_SLL             5'b0_0101
`define ALU_SRL             5'b0_0110
`define ALU_SRA             5'b0_0111
`define ALU_SLTU            5'b0_1000
`define ALU_UNSIGNED_MULT   5'b0_1001
`define ALU_XOR             5'b0_1010
`define ALU_NOR             5'b0_1011
`define ALU_UNSIGNED_DIV    5'b0_1100
`define ALU_SIGNED_MULT     5'b0_1101
`define ALU_SIGNED_DIV      5'b0_1110
`define ALU_LUI             5'b0_1111
`define ALU_ADDU            5'b1_0000
`define ALU_SUBU            5'b1_0001
`define ALU_LEZ             5'b1_0010
`define ALU_GTZ             5'b1_0011
`define ALU_GEZ             5'b1_0100
`define ALU_LTZ             5'b1_0101
`define ALU_SLL_SA          5'b1_0110
`define ALU_SRL_SA          5'b1_0111
`define ALU_SRA_SA          5'b1_1000
`define ALU_EQ              5'b1_1001
`define ALU_NEQ             5'b1_1010
`define ALU_MTHI            5'b1_1011
`define ALU_MTLO            5'b1_1100
                            // 5'b1_1101
                            // 5'b1_1110
`define ALU_DONOTHING       5'b1_1111
`define ALU_RELU            5'b1_1101