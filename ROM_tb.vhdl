library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity sim is
end sim;

architecture rtl of sim is
component OUTPUT_PATCH
	port(
		-- inputs
		CLK	: in std_logic;
		ADDR :	in natural range 0 to 50;

		--	DDS control
		Q			: out std_logic_vector(7 downto 0)

	);
end component;

signal tb_CLK   	: std_logic:='0';
signal tb_ADD  	: std_logic_vector(5 downto 0);

signal tb_Q	: std_logic_vector(7 downto 0);




-- signal for initiating end of simulation.
signal SIM_END 		: boolean := false;

-- CLK
constant PERIOD_A : time := 50 ns;

-- total period of this simulation
constant PERIOD_B : time := 50 us;

begin
	DUT:OUTPUT_PATCH
 		port map(

			CLK => tb_CLK,
			ADDR => tb_ADD,
			Q => tb_Q
		);

	process
	begin
		wait for PERIOD_A;
		-- Enable counters
		tb_nRES <= '1';

		loop
			wait for PERIOD_A;

			tb_CLK <= not(tb_CLK);

			if (SIM_END) then
				wait;
			end if;
		end loop;

	end process;

	process(tb_CLK)
	begin
		if (tb_CLK'event and CLK = '0') then
			ADD_COUNTER <= ADD_COUNTER+1;
		end if;
	end process;

	tb_ADD <= ADD_COUNTER;


-- Controlling the total simulation period of time
	process
	begin
			wait for PERIOD_B;
			SIM_END <= true;
			wait;
	end process;

end rtl;
