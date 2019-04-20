Role Name
=========

OpenJDK Java Platform Standard Edition

Requirements
------------

None

Role Variables
--------------

openjdk_version: The desired version to use. For example, 11.0.2

Dependencies
------------

None

Example Playbook
----------------

You can include the role in the playbook like below. 

    - hosts: all
      roles:
         - { role: openjdk, openjdk_version: 11.0.2 }

License
-------

Apache License, Version 2.0


Author Information
------------------

Issac Lee
