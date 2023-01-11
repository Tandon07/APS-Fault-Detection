import pymongo
import pandas as pd
import json
from dataclasses import dataclass
import os
# Provide the mongodb localhost url to connect python to mongodb.

@dataclass()
class EnvironmentVariable:
    mongo_db_url=os.getenv("Mongo_DB_URL")

env_var=EnvironmentVariable()


TARGET_COLUMN = "class"
mongo_client = pymongo.MongoClient(env_var.mongo_db_url)