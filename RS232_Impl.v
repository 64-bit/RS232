
module RS232_Impl(

	input Clock,
	
	input RX,
	output TX,
	
	output [7:0] ReadLine,
	output DataReady,
	
	input [7:0] WriteLine,
	input Send
	
	
);

reg rx_idle = 1;

reg [3:0] rx_bit;
reg [5:0] rx_delay; //Clock divider
reg [7:0] rx_shift_register;
reg rx_data_ready = 0;

assign DataReady = rx_data_ready;
assign ReadLine = rx_shift_register;

//RX Code
always@(posedge Clock)
begin

	if(rx_data_ready == 1)
	begin
		rx_data_ready <= 0;
	end
	

	if(rx_idle && !RX)
	begin
		rx_idle = 0;
		rx_bit = 0;
		rx_delay = 6'b110000;
		rx_shift_register[7:0] = 8'b0;
	end
	
	//Main loop
	else if (!rx_idle)
	begin
		
		if(rx_delay == 6'b000000)
		begin
			//Time to sample RX
			
			if( rx_bit[3:0] < 4'd8)
			begin
				rx_shift_register[7:0] = rx_shift_register >> 1;
				rx_shift_register[7] = RX;
				rx_delay[5:0] = 6'b100000;
			end
			else begin
				rx_idle <= 1;
				rx_data_ready <= 1;
			end

			rx_bit[3:0] = rx_bit[3:0] + 1;			
		end
		
	rx_delay[5:0] <= rx_delay[5:0] - 1;
	end
end




endmodule