--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:29:53 05/29/2022
-- Design Name:   
-- Module Name:   C:/Users/Abdul-Rahman/Desktop/VHDL/LAB4/lab4sim.vhd
-- Project Name:  LAB4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Lab4
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
ENTITY Lab4sim IS
END Lab4sim;
 
ARCHITECTURE behavior OF Lab4sim IS 
    COMPONENT Lab4
    PORT(
         User1 : IN  std_logic;
         User2 : IN  std_logic;
         MCLK : IN  std_logic;
         RST : IN  std_logic;
         L : OUT  std_logic_vector(9 downto 0);
         Left_player_score : OUT  std_logic_vector(3 downto 0);
         Right_player_score : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal User1 : std_logic := '0';
   signal User2 : std_logic := '0';
   signal MCLK : std_logic := '0';
   signal RST : std_logic := '0';

  --Outputs
   signal L : std_logic_vector(9 downto 0);
   signal Left_player_score : std_logic_vector(3 downto 0);
   signal Right_player_score : std_logic_vector(3 downto 0);
   -- Clock period definitions
   constant MCLK_period : time := 10 ns; 
BEGIN
   uut: Lab4 PORT MAP (
          User1 => User1,
          User2 => User2,
          MCLK => MCLK,
          RST => RST,
          L => L,
          Left_player_score => Left_player_score,
          Right_player_score => Right_player_score
        );
   MCLK_process :process
   begin
MCLK <= '0';
wait for MCLK_period/2;
MCLK <= '1';
wait for MCLK_period/2;
   end process;
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold RST state for 100 ns.
      wait for 100 ns;	
      wait for MCLK_period*10;
      User1 <= '1'; User2 <= '0'; RST <= '0';
     wait for MCLK_period*10;
     User1 <= '0'; User2 <= '1'; RST <= '0';		
   wait;
   end process;
END;


