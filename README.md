## ESP8266 Development Environment.

Repository with scripts to automatically setup ESP8266 development environment
for NONOS SDK 3.0.1 on Ubuntu Linux. 

## Prerequisites

Python 2.7 is required. Check your version with:

```
$ python --version
Python 2.7.15 :: Anaconda, Inc.
```

## Directory Structure.

Installation script creates following directory structure:

    $ESPROOT
     ├── bin         
     ├── esp-open-sdk
     └── esptool         

The root directory of the development environment is defined by `$ESPROOT` 
environment variable. By default it's set to `$HOME/esproot` but if you want to
set it to some other path it's recommended to define it in `.profile` file so 
it's set every time you log in**. The root of the development environment 
contains three directories. Each of the subdirectories of the `$ESPROOT` 
has a function described in below table:

Directory        | Function
-----------------|---------
**bin**          | Helper binaries.
**esp-open-sdk** | [esp-open-sdk](https://github.com/pfalcon/esp-open-sdk) compiled as standalone (`make STANDALONE=y`). See the documentation at [esp-open-sdk](https://github.com/pfalcon/esp-open-sdk).
**esptool**      | Checkout of the [esptool](https://github.com/espressif/esptool) repository.

## Initializing Development Environment.

To initialize development environment in default `$ESPROOT` directory issue: 
 
```
$ wget -O - https://raw.githubusercontent.com/kicdev/esp-env/master/init.sh | bash
```

which will set up the directory structure, checkout and compile all needed 
software and [esp-open-sdk](https://github.com/pfalcon/esp-open-sdk). 

## License.

[Apache License Version 2.0](LICENSE) unless stated otherwise.
