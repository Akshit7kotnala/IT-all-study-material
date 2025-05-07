: Transfer Files Between Two Virtual Machines Using Host-Only Adap**1. Create the First Virtual Machine (VM1):**


 - Open VirtualBox and click on "New".
 - Enter a name (e.g., VM1, vm01, VM0001). Use different naming if there's an error.
 - Set Type: Linux, Version: Ubuntu (64-bit).
 - Under Hard Disk, select "Use an existing virtual hard disk file" and choose the Ubuntu .vdi file.
 - If the file is not visible, click "Add" and manually select it.

**2. Create the Second Virtual Machine (VM2):**
 - Repeat Step 1 using a different name (e.g., VM2, vm02, VM002, etc.).
   
**3. Configure Network Settings for VM1:**
 - Go to VM1 -> Settings -> Network.
 - Set 'Attached to': Host-Only Adapter.
 - In Advanced settings, set Promiscuous Mode: Allow All.
 - Enable the Serial Port.
 - Click OK.
   
**4. Configure Network Settings for VM2:**
 - Go to VM2 -> Settings -> Network.
 - Set 'Attached to': Host-Only Adapter.
 - In Advanced settings, set Promiscuous Mode: Allow All.
 - Enable the Serial Port.
 - Click OK.
   
**5. Launch Both VMs:**
 - Start both VM1 and VM2.
 - Login with Username: vagrant and Password: vagrant
   
**6. Install Networking Tools:**
 - On both VMs, open the terminal and run: sudo apt install net-tools
   
**7. Assign Static IP Addresses:**
 - On VM1, run: sudo ip addr add 192.168.10.2/24 dev eth0
 - On VM2, run: sudo ip addr add 192.168.10.3/24 dev eth0
   
**8. Enable the Network Interfaces:**
 - On both VMs, run: sudo ip link set eth0 up
 - Then check IPs using: ifconfig or hostname -I
 - Make sure both VMs have different IPs.
   
**9. Create and Write a File on VM1:**
 - Run: touch file.txt
 - Edit using: nano file.txt
 - Type any message like HELLO, then press Ctrl+X -> Y -> Enter to save.
 - Confirm content using: cat file.txt
   
**10. Transfer File from VM1 to VM2:**
 - Run the following command from VM1:
 scp file.txt vagrant@192.168.10.3:/home/vagrant
 - Replace 192.168.10.3 with VM2's actual IP if different.
 - Type 'yes' when prompted.
 - Enter the password: vagrant
   
**11. Verify File on VM2:**
 - On VM2, run:
 ls
 cat file.txt
 - The message from VM1 should now be visible.
   
[Success] File Transfer Completed Successfully!
