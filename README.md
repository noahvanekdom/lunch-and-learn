Thanks for using the lunch_and_learn api!

## Set up:

#### Run the following commands to get started using the api locally.

#### Ruby version
2.7.4

#### Rails version
5.2.8

#### System dependencies
Faraday, Figaro, JSONAPI-Serializer, Postgres, Homebrew

##### How to Set Up The Repository

1. Clone the repository

2. cd into the repository

3. From the command line, run:

>bundle install

4. Run:

>bundle exec figaro install

5. Find required API Keys:
  1. Youtube:
  2. Edemam:
  3. Unsplash:
  4. Geoapify:


###### Database creation:

To set up the database, from the command line, run:

>rails db:{create,migrate}

##### How to run the test suite

To run the test suite, from the command line, run;

>bundle exec rspec

* Services (job queues, cache servers, search engines, etc.)

### Available Endpoints

#### Recipe endpoint

##### Recipe Index:
  `get /api/v1/recipes`
  Returns a list of 10 recipes related to a an optional country param. If no country is specified, a random country will be chosen.
  - Params: country (optional) - string
  - Sample Request:
   >GET /api/v1/recipes?country=thailand
   >Content-Type: application/json
   >Accept: application/json
  - Sample Response:
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
        {...},
        {...},
        {...},
        {etc},
      ]
    }

##### Learning Resources Index
  `get /api/v1/learning_resources`
  Returns an educational video and 10 images related to a an optional country param. If no country is specified, a random country will be chosen.
  - Params: country (optional) - string
  - Sample Request:
   >GET /api/v1/learning_resources?country=thailand
   >Content-Type: application/json
   >Accept: application/json
  - Sample Response:
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
            {...},
            {etc},
                    ]
              }
          }
  }

##### User Registration Endpoint

`post /api/v1/users`
Creates a user in the backend database and assigns them an api key for use in creating favorites.
- Params - body (json body containing a user name and a unique email)
- Sample Request:
  >POST /api/v1/users
  >Content-Type: application/json
  >Accept: application/json
  >
  >{
  >  "name": "Michael Jordan",
  >  "email": "GOAT@badgm.com"
  >}
- Sample Response:
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

#### Favorite create Endpoint





#####
