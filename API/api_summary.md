# API Interaction Summary

## 1. What is a REST API?

A REST API is a way for applications to communicate with each other over the internet using HTTP requests. It allows users to retrieve, create, update, and delete data using standard methods.

## 2. HTTP Status Codes

- **200 OK:** The request was successful and the server returned the requested data.
- **404 Not Found:** The requested resource could not be found on the server.

## 3. jq Filter Used

Command:

`cat API/github_profile.json | jq '{name:.name, repos:.public_repos, followers:.followers, joined:.created_at}'`

- `name:.name` extracts the GitHub user's name.
- `repos:.public_repos` extracts the number of public repositories.
- `followers:.followers` extracts the follower count.
- `joined:.created_at` extracts the account creation date.

## 4. API Sources

- GitHub REST API: https://api.github.com/users/ayaanali03
- JSONPlaceholder: https://jsonplaceholder.typicode.com/posts
