# Stubbed News API

This micro-api is for testing purposes only.

The purpose of this project is to provide a static list of posts that present data in an identical manner to the real Stockflare News API, so that the API is easy to develop over.

### Supported Calls

| method | url | description  | example | paginated? |
|--------|-----|--------------|---------|------------|
| GET | `/posts` | Retrieve all the latest posts |  `/posts?page=2&per_page=4` | yes |
| GET | `/posts/:id` | Retrieve specific post by its ID | `/posts/1` | no |
| GET | `/tags/:tag` | Retrieve posts that have a specific tag | `/tags/china` | yes |

## Paginated Responses

Paginated responses contain an `X-Pagination` header that has a serialized JSON objected within it, here is an example of the header contents:

```
{"next":2,"previous":0,"current":1,"per_page":30,"count":5,"total":12,"pages":1}
```

**If given the above header contents, you then sent a second request for page 2, the API will return 404**. The API favors returning a 404 response over an empty body.

The contents of this header may be used to determine the length of the paginated response, as well as if the end of the pagination has been reached.
