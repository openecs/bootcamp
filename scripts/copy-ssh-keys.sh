#!/bin/bash

grep -F '# My SSH Key' /home/vagrant/.ssh/authorized_keys || (echo '# My SSH Key' >> /home/vagrant/.ssh/authorized_keys && cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys)      
