Database Indexes Summary:
1. Primary Index:
Definition: An index on a set of columns that ensures that each row's values for these columns are unique.
Uniqueness: Enforces the uniqueness constraint on the columns.
Clustered vs. Non-clustered: By default, in many RDBMS systems like SQL Server and MySQL's InnoDB, the primary key is the clustered index. However, this can be changed based on specific configurations or requirements.
2. Unique Index:
Definition: An index that ensures all values in the indexed column(s) are unique, but unlike the primary index, a table can have multiple unique indexes.
Uniqueness: Enforces uniqueness but doesn't have the primary key's semantic importance.
Clustered vs. Non-clustered: A unique index can be either clustered or non-clustered, depending on the database configuration and design decisions.
3. Clustered Index:
Definition: Determines the physical ordering of data in the table. The table's data rows are stored on disk in the order defined by the clustered index.
Storage: The entire row's data is stored at the leaf level of the clustered index.
Uniqueness: While typically unique (as with primary keys), it can be non-unique in some systems, with some mechanism to ensure row-level uniqueness (like uniqueifiers).
Multiplicity: A table can have only one clustered index.
4. Secondary/Non-clustered Index:
Definition: An index that doesn't determine the physical order of data storage but provides a separate structure to improve query performance.
Storage: Contains the indexed column values and a reference to the actual data. The reference is either a Row ID for heap tables or the clustered index key for tables with a clustered index.
Uniqueness: Doesn't need to be unique. If it's non-unique, multiple entries with the same index key value can exist.
5. Multi-column (Composite) Indexes:
Definition: An index defined on more than one column.
Ordering: The order of columns in the index definition matters. The index will first organize data based on the first column, then the second, and so on.
Usage: Useful for queries that filter, join, or sort based on multiple columns.
Comparisons:
Primary vs. Unique vs. Clustered:

Primary and Unique indexes both enforce uniqueness but serve different semantic roles. The primary key is the main unique identifier for a row.
Both primary and unique indexes can be Clustered, but by default, the primary key is typically the clustered index in many RDBMS systems.
Clustered vs. Non-clustered:

Clustered defines the physical ordering of data in the table. Data rows are the leaf nodes of the clustered index.
Non-clustered provides an auxiliary structure separate from the data rows, which helps improve search performance. It points to the actual data location, either directly (Row ID) or through the clustered index key.
I hope this summary encapsulates our discussion on database indexing well!


