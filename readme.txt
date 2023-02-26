For the convenience of implementation, some instructions are provided as follows.

For individual project,
1. First please set parameters of the system of integrated sensing and communication in "Setting_2Ts.m" or "Setting_3Ts" and run it.
   Note that if there are two ISAC transmitters as well as two sensing receivers, please turn to "Setting_2Ts.m";
   Apart from that, if the number is three, please take account of "Setting_3Ts.m";
   If anything, the number of base station is required to be defined fundamentally, please try it according to the paper.   
2. Save all the matrices as a .mat file, which will be used in further simulation, e.g., channel matrix, array response vectors, and optimal precoders.
3. Choose a hybrid precoding algorithm (different algorithms are packed into different folders), run the "main_XXX.m". 
   Note that at the beginning of each "main_XXX.m" file, a command loading the saved channel matrices is used. Users should revise this command accordingly corresponding to the "XXX.mat" file name of the saved channel matrices.
   
** NOTE: For the "SDR_solution_2(3)Ts", "CRLB_approximation_2(3)TS" and "Separate_design_2(3)Ts" algorithms, the authors used a cvx. Users should include a cvx package when these algorithms are implemented.
         The script "cc.m" helps to delete all the orders and parameters in current workplace.
         The function "Sp.m" helps to generate a random number in a certain range.