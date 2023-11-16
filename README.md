# ShiftCare-Challenge
## Requirements

- Ruby version: 3.2.2
- Database: PostgreSQL

## Installation

```bash
bundle install
rails db:setup
```

## Command Line
### Search Clients by Name
Search through all clients and return those with names partially matching a given search query:

```bash
rake clients:search NAME="name"
```

### Find Duplicate Emails
Find out if there are any clients with the same email in the dataset, and show those duplicates if any are found:

```bash
rake clients:find_duplicates
```

## Assumption
I think about your `Next steps`.
We can consider enhancing the Queries::Clients::Search query and the Client model to handle searching from JSON files.
Converting all functions to APIs is not a major concern as we can leverage the existing Queries module.
