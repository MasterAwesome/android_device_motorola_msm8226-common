 #!/system/bin/sh
 # Copyright 2015 Arvind Mukund <arvind@MasterAwesome>
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
 # the Free Software Foundation; either version 2 of the License, or
 # (at your option) any later version.
 # 
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 # 
 # You should have received a copy of the GNU General Public License
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 # MA 02110-1301, USA.
 

echo `cat /proc/sys/kernel/sched_migration_cost_ns`
#Setting migration costs to 1000000 from default of 50000, provides faster kernel migrations over the default of 0.5ms.
# enable selected subsystem restart
check_swappiness=$(cat /proc/sys/vm/swappiness)
check_migration_cost=$(cat /proc/sys/kernel/sched_migration_cost)

if [ check_migration_cost != 1000000 ]
 then
    echo "1000000" > /proc/sys/kernel/sched_migration_cost
fi

if [ check_swappiness != 10 ]
 then
    echo "10" > /proc/sys/vm/swappiness
fi


