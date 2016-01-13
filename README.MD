# MOK

A simple web CMS for organizing video files written in python. 

I found myself not wanting to use my built-in DVD-player to watch my movies 
but rather just watch them on any screen in my home. After carrying a portable 
hard-drive seemed inconvenient I started to write this app. The purpose is to 
have it run on any machine in your LAN and then stream it over the network 
using the functionalities of HTML5. 

## Requirements / Dependencies

- python3
    * bottle
    * bottle-sqlite
    * pycrypto
    * argon2
- sqlite3
- bootstrap

## Configuration

This part is a stub. 

The first line in `mok.py` after the import statements contains the 
location for the database-file, which must be edited accordingly. 

You can scaffold the required sqlite3 database using the `database.sql` 
file. For example from a sqlite3 prompt: `sqlite> .read database.sql`

In the table `category_type` is a column named `type_id` which can be 
used as a identifier for different types of categories, not just in name. 
For example a category with the `type_id` of 0 might behave differently 
as a category of 1, i.e. the first might be a simple Tags category where 
each video might have a big number of values for, the latter might be a 
category where each video might always have only one value for. 

## Roadmap

It is planned to provide methods for creating, updating and deleting 

* video entries
* category-types
* categories per type
* tag-types
* tags per type

Furthermore:

* Ajax search
* Random button

## License

This project is licensed under the AGPLv3 (see LICENSE for more info). 
It also contains files from the bootstrap project which are licensed 
under the MIT license. See bootstrap-LICENSE for the license and a list 
which files belong to the bootstrap project. 