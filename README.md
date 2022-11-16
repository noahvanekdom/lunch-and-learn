# Thanks for using the lunch_and_learn api

If you have issues, submit a pull request to the repo detailing your problem -- we'll get to it fast.
#### Ruby version

2.7.4

#### Rails version

5.2.8

#### System dependencies

Faraday, Figaro, JSONAPI-Serializer, Postgres, Homebrew

## Set Up Instructions

1. Clone the repository

2. cd into the repository

3. From the command line, run:

>bundle install

4. Run:

>bundle exec figaro install

5. Find required API Keys:

- Youtube: https://blog.hubspot.com/website/how-to-get-youtube-api-key
- Edemam: https://developer.edamam.com/edamam-recipe-api
- Unsplash: https://unsplash.com/documentation#creating-a-developer-account
- Geoapify: https://www.geoapify.com/places-api

### Database creation

To set up the database, from the command line, run:

>rails db:{create,migrate}

### How to run the test suite

To run the test suite, from the command line, run;

>bundle exec rspec

## Available Endpoints

#### Recipe Index

  ```get /api/v1/recipes```
  Returns a list of 10 recipes related to a an optional country param. If no country is specified, a random country will be chosen.

- Params: country (optional) - string
- Sample Request:

   >GET /api/v1/recipes?country=thailand
   >Content-Type: application/json
   >Accept: application/json

- Sample Response:

    ```json
    {
    "data": [
        {
          "id": null,
          "type": "recipe",
          "attributes": {
              "title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
              "url": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
              "country": "thailand",
              "image": "https://edamam-product-images.s3.amazonaws.com..."
          }
        },
        {"..."},
        {"..."},
        {"..."},
        {"etc"},
      ]
    }
    ```

#### Learning Resources Index

  ```get /api/v1/learning_resources```
  Returns an educational video and 10 images related to a an optional country param. If no country is specified, a random country will be chosen.

- Params: country (optional) - string
- Sample Request:

   >GET /api/v1/learning_resources?country=thailand
   >Content-Type: application/json
   >Accept: application/json

- Sample Response:

  ```json
  {
    "data": {
      "id": null,
      "type": "learning_resource",
      "attributes": {
          "country": "laos",
          "video": {
              "title": "A Super Quick History of Laos",
              "youtube_video_id": "uw8hjVqxMXw"
          },
          "images": [
            {
                "alt_tag": "standing statue and temples landmark during daytime",
                "url": "https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=MnwzNzg2NzV8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE2Njc4Njk1NTA&ixlib=rb-4.0.3"
            },
            {"..."},
            {"etc"},
                    ]
              }
          }
  }
  ```

#### User Registration Endpoint

```post /api/v1/users```
Creates a user in the backend database and assigns them an api key for use in creating favorites.

- Params - body (json body containing a user name and a unique email)
- Sample Request:
  >POST /api/v1/users
  >Content-Type: application/json
  >Accept: application/json
  >
  >```json
  >{
  >  "name": "Michael Jordan",
  >  "email": "GOAT@badgm.com"
  >}
  >```
>
- Sample Response:

  ```json
  {
    "data": {
      "type": "user",
      "id": "1",
     "attributes": {
        "name": "Michael Jordan",
        "email": "GOAT@badgm.com",
        "api_key": "jgn983hy48thw9begh98h4539h234s4"
      }
    }
  }
  ```

#### Favorite create Endpoint

```post /api/v1/favorites```
Creates a favorite in the backend database and assigns it to the user corresponding to the api key submitted. If no user matches the api key, an appropriate error response will be returned.

- Params:
  - body (json body containing):
    - country (required) - string
    - recipe_link (required) - string
    - recipe_link (required) - string
    - user api_key (required) - string
- Sample Request:

>POST /api/v1/favorites
>Content-Type: application/json
>Accept: application/json
>Body:

```json
 {
    "api_key": "jgn983hy48thw9begh98h4539h4",
    "country": "thailand",
    "recipe_link": "https://www.tastingtable.com/.....",
    "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
}
```

#### Favorite Index Endpoint

```get /api/v1/favorites```

Returns all favorites that belong to a user with a corresponding api key. If no user corresponds to the submitted api key, an appropriate error message will be returned. If a user has no favorites, an empty array will be returned.

- Params:
  - user api key (required) - string

Sample Request:
>GET /api/v1/favorites
>Content-Type: application/json
>Accept: application/json
>
>```json
>{
>    "api_key": "jgn983hy48thw9begh98h4539h4"
>}
>```

Sample Response:

```json
{
    "data": [
        {
            "id": "1",
            "type": "favorite",
            "attributes": {
                "recipe_title": "Recipe: Egyptian Tomato Soup",
                "recipe_link": "http://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight....",
                "country": "egypt",
                "created_at": "2022-11-02T02:17:54.111Z"
            }
        },
            ]
 }
 ```
More to come soon!
