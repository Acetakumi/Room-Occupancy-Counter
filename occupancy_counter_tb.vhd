library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity occupancy_counter_tb is
end occupancy_counter_tb;

architecture behavior of occupancy_counter_tb is

   
    component occupancy_counter
        port (
            clk : in std_logic;
            enter_room : in std_logic;
            exit_room : in std_logic;
            reset : in std_logic;
            max_occupancy : in unsigned(7 downto 0);
            current_occupancy : out unsigned(7 downto 0);
            max_capacity : out std_logic
        );
    end component;


    signal clk              : std_logic := '0';
    signal enter_room       : std_logic := '0';
    signal exit_room        : std_logic := '0';
    signal reset            : std_logic := '0';
    signal max_occupancy    : unsigned(7 downto 0) := to_unsigned(5, 8);
    signal current_occupancy : unsigned(7 downto 0);
    signal max_capacity     : std_logic;

    constant clk_period : time := 10 ns;

begin

   
    uut: occupancy_counter
        port map (
            clk => clk,
            enter_room => enter_room,
            exit_room => exit_room,
            reset => reset,
            max_occupancy => max_occupancy,
            current_occupancy => current_occupancy,
            max_capacity => max_capacity
        );

   
    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

   
    stim_proc: process
    begin
        -- Initial reset
        reset <= '1';
        wait for clk_period * 2;
        reset <= '0';
        wait for clk_period * 2;

        -- Simulate 5 people entering
        for i in 1 to 5 loop
            enter_room <= '1';
            wait for clk_period;
            enter_room <= '0';
            wait for clk_period * 2;
       
        end loop;

        -- Try entering 1 more (should trigger max capacity)
        enter_room <= '1';
        wait for clk_period;
        enter_room <= '0';
        wait for clk_period * 2;
       

        -- Exit 2 people
        for i in 1 to 2 loop
            exit_room <= '1';
            wait for clk_period;
            exit_room <= '0';
            wait for clk_period * 2;
   
        end loop;

        -- Enter 1 person again
        enter_room <= '1';
        wait for clk_period;
        enter_room <= '0';
        wait for clk_period * 2;


        -- Reset again
        reset <= '1';
        wait for clk_period * 2;
        reset <= '0';
        wait for clk_period * 2;
        

        -- Exit 1 person (should do nothing since count is zero)
        exit_room <= '1';
        wait for clk_period;
        exit_room <= '0';
        wait;

    end process;

end behavior;

