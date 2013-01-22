# Our Data

*A prototypical reimagination of data.gov*

## Features:

* Refreshes .gov list daily
* Asychnosly updates dataset catalog daily using Rescue
* Exposes all data as a resful API

## API

### Agencies

#### Endpoint: `/agencies`

#### Example Response:

```javascript
[
    {
       "name":"Federal Communications Commission",
       "datasets":[
          {
             "title":"test",
             "description":"test description",
             "dataDictionary":"http://foo.gov/data",
             "accessURL":"http://foo.gov/dataset",
             "modified":null,
             "person":"Uncle Sam",
             "mbox":"sam@fcc.gov",
             "public":true,
             "organization":"Federal Communications Commission",
             "keywords":"foo, bar, test",
             "format":"json"
          }
       ],
       "domains":[
          {
             "hostname":"www.fcc.gov",
             "agency_id":35,
             "last_crawled":null
          },
          {
             "hostname":"www.openinternet.gov",
             "agency_id":35,
             "last_crawled":null
          },
          {
             "hostname":"www.nbm.gov",
             "agency_id":35,
             "last_crawled":null
          },
          ...
       ]
    }
   ...
]
```

### Individual Agency

#### Endpoint `/agency/:id`

#### Example Response:

```javascript
{
   "name":"Federal Communications Commission",
   "datasets":[
      {
         "title":"test",
         "description":"test description",
         "dataDictionary":"http://foo.gov/data",
         "accessURL":"http://foo.gov/dataset",
         "modified":null,
         "person":"Uncle Sam",
         "mbox":"sam@fcc.gov",
         "public":true,
         "organization":"Federal Communications Commission",
         "keywords":"foo, bar, test",
         "format":"json"
      }
   ],
   "domains":[
      {
         "hostname":"www.fcc.gov",
         "agency_id":35,
         "last_crawled":null
      },
      {
         "hostname":"www.openinternet.gov",
         "agency_id":35,
         "last_crawled":null
      },
      {
         "hostname":"www.nbm.gov",
         "agency_id":35,
         "last_crawled":null
      },
      ...
   ]
}
```

### Datasets

#### Endpoint `/datasets/`

#### Example Response:

```javascript

[
   {
      "title":"test",
      "description":"test description",
      "dataDictionary":"http://foo.gov/data",
      "accessURL":"http://foo.gov/dataset",
      "modified":null,
      "person":"Uncle Sam",
      "mbox":"sam@fcc.gov",
      "public":true,
      "organization":"Federal Communications Commission",
      "keywords":"foo, bar, test",
      "format":"json"
   }
   ...
]
```

#### Parameters (e.g., `/datasets?format=json&tags=foo,bar`)

* `agency_id` (integer)
* `public` (bool)
* `tags` (string, comma separated) 
* `format` (string, comma separated)

### Individual Dataset

#### Endpoint `/datasets/:id`

#### Resposne

```javascript
   {
      "title":"test",
      "description":"test description",
      "dataDictionary":"http://foo.gov/data",
      "accessURL":"http://foo.gov/dataset",
      "modified":null,
      "person":"Uncle Sam",
      "mbox":"sam@fcc.gov",
      "public":true,
      "organization":"Federal Communications Commission",
      "keywords":"foo, bar, test",
      "format":"json"
   }
```

### Tags

### Endpoint `/tags`

#### Response

```javascript
[
   {
      "tag":{
         "count":1,
         "id":1,
         "name":"foo"
      }
   },
   {
      "tag":{
         "count":1,
         "id":2,
         "name":"bar"
      }
   },
   {
      "tag":{
         "count":1,
         "id":3,
         "name":"test"
      }
   },
   ...
]
```

### Specific Tags

#### Endpoint `tags/:tag` or `tags/:tag,:tag`

#### Response

```javascript
[
   {
      "title":"test",
      "description":"test description",
      "dataDictionary":"http://foo.gov/data",
      "accessURL":"http://foo.gov/dataset",
      "modified":null,
      "person":"Uncle Sam",
      "mbox":"sam@fcc.gov",
      "public":true,
      "organization":"Federal Communications Commission",
      "keywords":"foo, bar, test",
      "format":"json"
   },
   ...
]
```

### Format

#### Endpoint `/formats`

#### Response

```javascript
[
   {
      "tag":{
         "count":1,
         "id":4,
         "name":"json"
      }
   }
]
```

### Specific Format

#### Endpoint `/formats/:format`

#### Example response:

```javascript
[
   {
      "title":"test",
      "description":"test description",
      "dataDictionary":"http://foo.gov/data",
      "accessURL":"http://foo.gov/dataset",
      "modified":null,
      "person":"Uncle Sam",
      "mbox":"sam@fcc.gov",
      "public":true,
      "organization":"Federal Communications Commission",
      "keywords":"foo, bar, test",
      "format":"json"
   },
   ...
]
```


