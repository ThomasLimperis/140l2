// testbench for lab2
`include "display_tb.sv"
module lab2_tb();
  logic Reset = 1,
        Clk = 0,
        Timeset = 0,
        Alarmset = 0,
		Minadv = 0,
		Hrsadv = 0,
		Alarmon = 1,
		Pulse = 0;
  wire[6:0] S1disp, S0disp,
            M1disp, M0disp,
	        H1disp, H0disp;
  wire Buzz;

  struct_diag sd(.*); // (.Reset(Reset),....)
  initial begin
    $monitor("buzz = %b %t",Buzz,$time);
	#  2ns  Reset    = 0;
	#  2ns  Timeset  = 1;
	        Minadv   = 1;
	# 110ns  Minadv   = 0;   //Minadv has passed 50
	       Hrsadv   = 1;
	#  14ns  Timeset  = 0;  // Hrsadv has passed 7
		Hrsadv   = 0;
#2ns
$display("display current time after setting");
    display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
#2ns  Alarmset = 1; 
#2ns
$display("display alarm time before setting");
    display_tb (.seg_d(H1disp),    //display the alarm time
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	#  10ns  Hrsadv   = 1;
	#  16ns  Minadv   = 1;   //alarm hour: 8
		Hrsadv = 0;
	# 2ns  Minadv   = 0;  // alarm min 1
#2ns
$display("display alarm time after setting");
    display_tb (.seg_d(H1disp),    //display the alarm time
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	#  2ns  Alarmset = 0;
#2ns   //24 second past
$display("display current time after setting alarm");
    display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	# 120ns;  //1 minute passted
    display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	# 120ns;
    display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	# 120ns;
    display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	# 120ns;
    display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	# 120ns;
    display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	# 120ns;
    display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	# 120ns;
    display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	# 120ns;
    display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	# 120ns;
    display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));
	# 120ns;
    display_tb (.seg_d(H1disp),
    .seg_e(H0disp), .seg_f(M1disp),
    .seg_g(M0disp), .seg_h(S1disp),
    .seg_i(S0disp));

  	#3000ns  $stop;
  end 
  always begin  // period is 2 ns
    #1ns Pulse = 1;
	#1ns Pulse = 0;
  end
endmodule