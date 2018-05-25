# README

Web Scrapper is a tool which provides 2. API's

1. Accept web url and scrap website and extracts header tags & anchors
2. List all extracted pages with there content

* Ruby version

  2.5.1

* Rails version

  5.2.0

* Database creation

  `bundle exec rake db:setup`

* How to run the test suite

  `bundle exec rspec spec`


### API Documentation

1. List all extracted pages with there content

  Method : `GET`

  URL: `/api/v1/pages`

  Headers: `Content-Type: application/vnd.api+json`

  Response:
  ```
    {
     "data":[
        {
           "id":"1",
           "type":"pages",
           "links":{
              "self":"http://localhost:3000/api/v1/pages/1"
           },
           "attributes":{
              "title":null,
              "url":"https://800flower.ae",
              "las-scrapped-at":"24 May, 2018 07:07 AM"
           },
           "relationships":{
              "contents":{
                 "links":{
                    "self":"http://localhost:3000/api/v1/pages/1/relationships/contents",
                    "related":"http://localhost:3000/api/v1/pages/1/contents"
                 }
              }
           }
        },
        {
           "id":"3",
           "type":"pages",
           "links":{
              "self":"http://localhost:3000/api/v1/pages/3"
           },
           "attributes":{
              "title":"Google",
              "url":"https://google.com",
              "las-scrapped-at":"24 May, 2018 07:22 AM"
           },
           "relationships":{
              "contents":{
                 "links":{
                    "self":"http://localhost:3000/api/v1/pages/3/relationships/contents",
                    "related":"http://localhost:3000/api/v1/pages/3/contents"
                 }
              }
           }
        },
        {
           "id":"5",
           "type":"pages",
           "links":{
              "self":"http://localhost:3000/api/v1/pages/5"
           },
           "attributes":{
              "title":"Vishal Zambre's Blog",
              "url":"https://vishal.zambre.in",
              "las-scrapped-at":"24 May, 2018 11:57 AM"
           },
           "relationships":{
              "contents":{
                 "links":{
                    "self":"http://localhost:3000/api/v1/pages/5/relationships/contents",
                    "related":"http://localhost:3000/api/v1/pages/5/contents"
                 }
              }
           }
        }
      ],
     "links":{
        "first":"http://localhost:3000/api/v1/pages?page%5Bnumber%5D=1&page%5Bsize%5D=50",
        "last":"http://localhost:3000/api/v1/pages?page%5Bnumber%5D=1&page%5Bsize%5D=50"
      }
    }
  ```

2. Accept web url and scrap website and extracts header tags & anchors

  Method : `POST`

  URL: `/api/v1/pages`

  Headers: `Content-Type: application/vnd.api+json`

  Params: `{"data": { "type": "pages", "attributes": {"url": "https://vishal.zambre.in"}}}`

  Response:

  ```
    {
     "data":{
        "id":"8",
        "type":"pages",
        "links":{
           "self":"http://localhost:3000/api/v1/pages/8"
        },
        "attributes":{
           "title":"Google",
           "url":"https://google.co.in",
           "las-scrapped-at":"25 May, 2018 02:43 PM"
        },
        "relationships":{
           "contents":{
              "links":{
                 "self":"http://localhost:3000/api/v1/pages/8/relationships/contents",
                 "related":"http://localhost:3000/api/v1/pages/8/contents"
              }
           }
        }
      }
    }
  ```
