library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity OUTPUT_PATCH is

	port
	(
		ADDR	: in natural range 0 to 50;
		CLK	: in std_logic;
		Q		: out std_logic_vector(7 downto 0)
	);
	
end entity;

architecture rtl of OUTPUT_PATCH is

	-- Build a 2-D array type for the patch table
	subtype WORD_T is std_logic_vector(7 downto 0);
	type MEMORY_T is array(50 downto 0) of WORD_T;
	
	signal ROM:memory_t;
	attribute ram_init_file:string;
	attribute ram_init_file of ROM: signal is "patch_table.mif";
	-- ram_init_file ha tokubetuna atoribyu-tode korede .mif fairuwoshiteisurukotogadekiru
	
begin
	
	process(CLK)
	begin
		if(rising_edge(CLK)) then
			Q <= ROM(ADDR);
		end if;
	end process;
		
end rtl;
