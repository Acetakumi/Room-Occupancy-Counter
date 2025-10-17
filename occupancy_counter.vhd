library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity occupancy_counter is
    port (
        clk : in std_logic;
        enter_room : in std_logic;
        exit_room : in std_logic;
        reset : in std_logic;
        max_occupancy : in unsigned(7 downto 0);
        current_occupancy : out unsigned(7 downto 0);
        max_capacity : out std_logic
    );
end occupancy_counter;

architecture arch_occupancy_counter of occupancy_counter is
    signal current_count : unsigned(7 downto 0) := (others => '0');
    signal prev_enter_room : std_logic := '0';
    signal prev_exit_room : std_logic := '0';
    signal enter_pulse : std_logic := '0';
    signal exit_pulse : std_logic := '0';
begin

    process(clk)
    begin
        if rising_edge(clk) then
            enter_pulse <= enter_room and not prev_enter_room;
            exit_pulse <= exit_room and not prev_exit_room;

            prev_enter_room <= enter_room;
            prev_exit_room <= exit_room;
        end if;
    end process;

    process(clk, reset)
    begin
        if reset = '1' then
            current_count <= (others => '0');
        elsif rising_edge(clk) then
            if enter_pulse = '1' and current_count < max_occupancy then
                current_count <= current_count + 1;
            elsif exit_pulse = '1' and current_count > 0 then
                current_count <= current_count - 1;
            end if;
        end if;
    end process;

    current_occupancy <= current_count;
    max_capacity <= '1' when current_count = max_occupancy else '0';

end arch_occupancy_counter;
