
## Database Indexes Summary:

### Dense Index:

-   Every search key value has an index entry.
-   For every unique value of the search key, there is an entry in the index.
-   This means that the number of entries in a dense index is the same as the number of distinct values of the search key in the table.

### Sparse Index:

-   Index entries exist only for some of the search key values.
-   Typically, a sparse index entry points to a block or a range of blocks, not to a single row.
-   This means that the number of entries in a sparse index is less than the number of rows in the table.

### Primary Index:

- **Definition**: An index on a set of columns that can uniquely identify a tuple/row
- By default, in many RDBMS systems like SQL Server and MySQL's InnoDB, the primary key is the clustered index. However, this can be changed based on specific configurations or requirements.
- If you don't define a primary key, InnoDB will use the first UNIQUE index where all the key columns are NOT NULL as the clustered index. If no such unique index exists, InnoDB will create a hidden clustered index on a synthetic column.


### Unique Index:
- **Definition**: An index that ensures all values in the indexed column(s) are unique, but unlike the primary index, a table can have multiple unique indexes.
- For unique indexes, NULL values are considered distinct from each other. This means that, unlike other values that must be unique across all rows, you can have multiple rows with a NULL value in a column that has a unique index.
-  A unique index can be either clustered or non-clustered, depending on the database configuration and design decisions.

### Clustered Index:
- **Definition**: Determines the physical ordering of data in the table. The table's data rows are stored on disk in the order defined by the clustered index.
- **Storage**: The entire row's data is stored at the leaf level of the clustered index or index contains all the cols value saves the time for extra i/o disk seek.
- **Uniqueness**: While typically unique (as with primary keys), it can be non-unique in some systems, with some mechanism to ensure row-level uniqueness (like uniqueifiers).
- **Multiplicity**: A table can have only one clustered index as it determines the phsical order of data stored in table.
- **No Separate Table Data Storage**: In InnoDB, the table data is integrated into the clustered index. This means there is no separate storage for table data outside of this index, which is different from systems like PostgreSQL.
- **Performance Implications**: The choice of the clustered index (usually the primary key) is crucial in InnoDB as it affects the performance of both read and write operations. Efficiently chosen primary keys can significantly enhance performance.
- Secondary Indexes: In InnoDB, secondary indexes store the primary key columns as references, not the actual row location (ctid in PostgreSQL).

### Secondary/Non-clustered Index:
- Definition: An index that doesn't determine the physical order of data storage but provides a separate structure to improve query performance.
- Storage: Contains the indexed column values and a reference to the actual data. The reference is either a Row ID for heap tables or the clustered index key for tables with a clustered index.
- Uniqueness: Doesn't need to be unique. If it's non-unique, multiple entries with the same index key value can exist.

### Multi-column (Composite) Indexes:
- Definition: An index defined on more than one column.
- Ordering: The order of columns in the index definition matters. The index will first organize data based on the first column, then the second, and so on.
- Usage: Useful for queries that filter, join, or sort based on multiple columns.


### Comparisons:

### Primary vs. Unique vs. Clustered:

- Primary and Unique indexes both enforce uniqueness but serve different semantic roles. The primary key is the main unique identifier for a row.
- Both primary and unique indexes can be Clustered, but by default, the primary key is typically the clustered index in many RDBMS systems.


