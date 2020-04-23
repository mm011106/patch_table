library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity OUTPUT_PATCH is
	port
	(
		ADDR		: in natural range 0 to 50;
		CLK		: in std_logic;
		Q			: out std_logic_vector(7 downto 0)
	);

end entity;

architecture RTL of OUTPUT_PATCH is

	-- Build a 2-D array type for the patch table
	subtype WORD_T is std_logic_vector(7 downto 0);
	type MEMORY_T is array(50 downto 0) of WORD_T;

	signal ROM:MEMORY_T;
	attribute ram_init_file:string;
	attribute ram_init_file of ROM: signal is "C:\Users\miyam\OneDrive\Documents\HDL\ROM\patch_table.mif";
	-- ram_init_fileはファイルを指定するための特別なアトリビュート名

begin

	process(CLK)
	begin
		if(rising_edge(CLK)) then
			Q <= ROM(ADDR);
		end if;
	end process;

end RTL;
