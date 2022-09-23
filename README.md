# Financial Web

## Description

Financial web is a home financing system.

## Tech stack

Python 3.10.7

Flask

MySQL

For details, check requirements.txt.

## How to install

### Create Python virtual environment

``` python -m venv ./financialweb ```

``` financialweb/Scripts/activate```


### Install requirements libraries

``` pip install -r requirements.txt```

### Setting database

The system uses a MySQL db. Create one MySQL instance at will.

In a MySQL terminal, run the script to create an empty schema.

```\source ./data/schema.sql```

There is a dump version with a few sample records.

```\source ./data/nobdan.sql```

Alternatively, a dump version of a full Postgresql database in

```./data/nobdan_for_postgres.sql```

### Setting config files

Open ```config.yaml``` and set configuration according user environment.



## How to Run

### Dev and test mode

Within /src folder, run:

```python financialweb.py```

### Production mode

TBD
