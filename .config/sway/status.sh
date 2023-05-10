# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

# Produces "21 days", for example
uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%a %F %H:%M:%S")

# Get the Linux version but remove the "-1-ARCH" part
linux_version=$(uname -r | cut -d '-' -f1)

# Returns the battery status: "Full", "Discharging", or "Charging".
bat_percentage=$(upower -i `upower -e | grep 'BAT'` | python3 -c "from sys import stdin;s=''.join([i for i in stdin]);import re;print(re.search(r'percentage:\s+(.+)\n',s).group(1))" )
battery_status=$(cat /sys/class/power_supply/BAT*/status | python3 -c "s=input();print('Charging' if s == 'Charging' else '!Charging')")

network_status=$(ifconfig | python3 -c "from sys import stdin;s=''.join([i for i in stdin]);s=([i for i in s.split('\n\n') if 'wlan' in i or 'eth' in i][0]);import re;r=re.search(r'(.*?): flags', s);print('e\n' if r == None else '', end='');r1=re.search(r'inet (.*?) ', s).group(1);print(f'{r.group(1)}: {r1}')")

# Emojis and characters for the status bar
# 💎 💻 💡 🔌 ⚡ 📁 \|
echo $network_status "|" $bat_percentage "|" $battery_status "|" $date_formatted 

