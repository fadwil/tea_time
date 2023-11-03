![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![Postgresql](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

# Tea Time API

This application functions as a back end API that exposes endpoints for a front end app to allow an end user to create a new subscription, cancel an active subscription, as well as view all of their subscriptions, including both active and inactive subscriptions.

## RESTful Endpoints

<details close>

### Get a Customer's Subscriptions

```http
GET /api/v1/customers/:customer_id/subscriptions
```

<details close>
<summary>  Details </summary>
<br>

Parameters: <br>
```
No Parameters
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Example Value:

```json
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "title": "Monthly Green Tea",
                "price": "19.99",
                "status": "cancelled",
                "frequency": "monthly",
                "customer_id": 1,
                "tea_id": 1
            }
        },
           {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "title": "Weekly Black Tea",
                "price": 20.00,
                "status": "active",
                "frequency": "weekly",
                "customer_id": 1,
                "tea_id": 2
            }
        }
    ]
}
```
</details>

---

### Create a Subscription

```http
POST /api/v1/subscriptions
```

<details close>
<summary>  Details </summary>
<br>

Parameters: <br>
```
CONTENT_TYPE=application/json
```

| Code | Description |
| :--- | :--- |
| 201 | CREATED |

Example Value:

```json
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "title": "Monthly Green Tea",
            "price": "19.99",
            "status": "active",
            "frequency": "monthly",
            "customer_id": 1,
            "tea_id": 1
        }
    }
}
```
</details>

---

### Update a Subscription

```http
PATCH /api/v1/subscriptions/:id
```

<details close>
<summary>  Details </summary>
<br>
  
Parameters: <br>
```
CONTENT_TYPE=application/json
```

Example Request: <br>

```json
{
  "subscription": {
    "status": null,
    "customer_id": 1
  }
}
```

| Code | Description |
| :--- | :--- |
| 200 | OK |

Example Response <br>

```json
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "title": "Monthly Green Tea",
            "price": "19.99",
            "status": "cancelled",
            "frequency": "monthly",
            "customer_id": 1,
            "tea_id": 1
        }
    }
}
```

</details>
</details>

