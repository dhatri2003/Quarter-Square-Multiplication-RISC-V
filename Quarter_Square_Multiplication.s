# Quarter Square Multiplication for Multiplying 2 Numbers in RISC-V Assembly Language

.data
    # Initialize the data section with the two numbers to be multiplied
    num1:   .word 7
    num2:   .word 5
    result: .word 0

.text
    # Program starts at the .text section
    la x1, result
    # Load the first number into register t0
    lw t0, num1

    # Load the second number into register t1
    lw t1, num2

    # Calculate (a+b)^2
    add t2, t0, t1
    mul t2, t2, t2
    srli t2, t2, 2  # t2 = 1/4 * (a+b)^2

    # Calculate (a-b)^2
    sub t3, t0, t1
    mul t3, t3, t3
    srli t3, t3, 2  # t3 = 1/4 * (a-b)^2

    # Calculate the final result: 1/4 * (a+b)^2 - 1/4 * (a-b)^2
    sub t4, t2, t3

    # Store the final result in the result variable
    sw t4, 0(x1)

    # Halt the program
    nop
