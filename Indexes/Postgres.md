
## Heap Storage and `ctid`

-   **Heap Storage**: PostgreSQL stores table data in a structure known as a heap. It's an unordered collection of rows.
-   **`ctid` Column**: Each row in a table has a unique `ctid` that represents its physical location (block number and tuple index within the block) in the heap.

## Primary Indexes

-   **B-tree Indexes**: The default index type in PostgreSQL. Primary key indexes are usually B-tree indexes.
-   **Separate Structure**: The primary index is a separate structure from the table data.
-   **Direct Row Pointers**: Entries in the primary index contain the indexed values and `ctid`s pointing to the corresponding rows.

## Secondary Indexes

-   **Direct Pointers to Rows**: Secondary indexes in PostgreSQL contain indexed values and `ctid`s that point directly to rows in the heap.
-   **Independent of Primary Index**: These indexes function independently from the primary index.

## Index Scans and Performance

-   **Efficient Data Retrieval**: Indexes allow efficient location of rows based on indexed columns.
-   **Types of Scans**: PostgreSQL uses different types of index scans like Index Scan, Bitmap Heap Scan, or Index Only Scan based on query structure.

## MVCC and Updates

-   **Multi-Version Concurrency Control (MVCC)**: PostgreSQL uses MVCC for concurrency control, creating a new row version on updates.
-   **New `ctid` on Update**: Updated rows get a new `ctid`, with the old version eventually removed by the vacuum process.

## Vacuum Process

-   **Cleanup of Old Row Versions**: The VACUUM process in PostgreSQL cleans up old row versions that are no longer visible to any transactions.
-   **Space Reclamation**: This process helps in reclaiming space and maintaining database performance.
