---
_class: lead
paginate: true
marp: true
size: 16:9
theme: theme
//footer: GraphQl | 22120011 - 22120067 - 22120183 |
---

# GraphQL

## Thành viên nhóm:

- 22120011 - Lê Tuấn Anh
- 22120067 - Lâm Hồng Anh Đức
- 22120183 - Nguyễn Đặng Minh Lân

---

# GraphQL

---

## Nội dung

- [GraphQL là cái chi rứa?](#Definition)
- [Những gì cần biết về GraphQL](#Core)
- [Tại sao GraphQL hiệu quả?](#Usefulness)
- [Khi nào sử dụng GraphQL?](#When_using)
- [Thảo luận](#Truth)

---

<!-- _class: title-page -->

## GraphQL là cái gì?

---

<!-- _class: content-page -->

## GraphQL là cái gì?

### Trước khi biết:

- 1 loại truy vấn mới trên database?
- Có SQL là ngôn ngữ truy vấn có cấu trúc cho Database, vậy GraphQL chắc là ngôn ngữ truy vấn bằng đồ thị cho Database kiểu kéo thả trực quan hơn?

### Sau khi biết:

- GraphQL là ngôn ngữ truy vấn và runtime cho API

---

<!-- _class: content-page -->

## GraphQL là cái gì?

Hiểu đơn giản là **1 cách khác để xây dựng API** thay vì RESTAPI thông thường hay dùng.

##### REST API: Nhiều endpoints, response cố định

- Mỗi resource có 1 endpoint riêng
- Server quyết định trả về những gì
- Ví dụ: `/users/123` → Trả toàn bộ thông tin user

##### GraphQL: Một endpoint, response tùy chỉnh

- Chỉ 1 endpoint duy nhất (thường là `/graphql`)
- **Client quyết định** cần lấy những field nào
- Lấy đúng cái cần, không thừa không thiếu

---

<!-- _class: content-page -->

## So sánh REST và GraphQL

### Ví dụ: Lấy tên user và tiêu đề bài post

**REST API:**

```
GET /users/123        → {id, name, email, age, address, ...}
GET /users/123/posts  → [{id, title, content, createdAt, ...}, ...]
```

→ Gọi **2 requests**, nhận **nhiều data không cần thiết**

**GraphQL:**

```graphql
query {
  user(id: 123) {
    name
    posts { title }
  }
}
```

→ Chỉ **1 request**, nhận **đúng data cần thiết**

---

<!-- _class: title-page -->

## Những gì cần biết về GraphQL

---

<!-- _class: content-page -->

## 1. Schema - Hợp đồng giữa Client và Server

**Schema là gì?**
- **Bản thiết kế** mô tả toàn bộ cấu trúc dữ liệu
- Giống "menu nhà hàng" - liệt kê những gì có thể lấy

**Tại sao cần?**
- **Type Safety**: Kiểu dữ liệu rõ ràng, catch lỗi sớm
- **Self-documenting**: Client biết API có gì mà không cần docs riêng
- **Validation**: Tự động validate request

---

<!-- _class: content-page -->

## Schema - Các thành phần chính

```graphql
# 1. Object Types - Định nghĩa đối tượng
type User {
  id: ID!           # ! = bắt buộc
  name: String!
  posts: [Post!]!   # Mảng Post
}

# 2. Input Types - Dữ liệu gửi lên
input PostInput {
  title: String!
  content: String
}
```

---

<!-- _class: content-page -->

## Schema - Query, Mutation, Subscription

```graphql
# 3. Query - Đọc dữ liệu (GET)
type Query {
  posts: [Post!]!
  post(id: ID!): Post
}

# 4. Mutation - Thay đổi dữ liệu (POST/PUT/DELETE)
type Mutation {
  createPost(data: PostInput!): Post!
  updatePost(id: ID!, data: PostInput!): Post
}

# 5. Subscription - Real-time (WebSocket)
type Subscription {
  postAdded: Post!
}
```

---

<!-- _class: content-page -->

## 2. Query - Đọc dữ liệu

**Đặc điểm:**
- Tương đương **GET** trong REST
- Client chọn chính xác fields cần lấy
- Lấy nhiều resource trong 1 request

---

<!-- _class: content-page -->

## Query - Ví dụ

```graphql
query {
  user(id: 123) {
    name
    posts { title }
  }
}
```

**Response:**
```json
{
  "data": {
    "user": {
      "name": "John Doe",
      "posts": [{"title": "GraphQL basics"}]
    }
  }
}
```

---

<!-- _class: content-page -->

## 3. Mutation - Thay đổi dữ liệu

**Đặc điểm:**
- Tương đương **POST/PUT/DELETE** trong REST
- Tạo, cập nhật, xóa dữ liệu
- Trả về dữ liệu sau khi thay đổi

```graphql
mutation {
  createPost(data: {title: "abc", content: "xyz"}) {
    id
    title
  }
}
```

---

<!-- _class: content-page -->

## 4. Subscription - Real-time Updates

**Đặc điểm:**
- Dùng **WebSocket** thay vì HTTP
- Server **push** data khi có thay đổi
- Client giữ kết nối mở liên tục

**Khi nào dùng:** Chat, notifications, live dashboard

```graphql
subscription {
  postAdded {
    id
    title
  }
}
```

---

<!-- _class: title-page -->

## Ưu điểm của GraphQL

---

<!-- _class: content-page -->

## Ưu điểm của GraphQL

### 1. Không over/under-fetching

**Over-fetching (REST):** Nhận thừa data không cần
```
GET /users/123 → 20 fields (chỉ cần name)
```

**Under-fetching (REST):** Thiếu data, cần nhiều requests
```
GET /posts/1, GET /users/123, GET /comments/...
```

**GraphQL:** Lấy đúng cái cần, 1 request
```graphql
query { post(id:1) { title, author { name }, comments { text } } }
```

---

<!-- _class: content-page -->

## Ưu điểm của GraphQL

### 2. Giảm coupling Frontend - Backend

**REST:** Backend phải biết Frontend cần gì → Tạo endpoint riêng

**GraphQL:** Chỉ cần thống nhất **Schema** → Phát triển song song

### 3. Type Safety & Self-documenting

- Kiểu dữ liệu rõ ràng, catch lỗi sớm
- Schema = Documentation tự động
- Code completion, validation tốt

---

<!-- _class: content-page -->

## Ưu điểm của GraphQL

### 4. Hiệu năng tốt hơn

**Giảm requests:** 1 query thay vì nhiều REST calls
- REST: 5 requests × 100ms = 500ms
- GraphQL: 1 request × 150ms = 150ms

**Tiết kiệm bandwidth:** Payload nhỏ hơn (chỉ field cần thiết)

### 5. Frontend linh hoạt hơn

Field có trong schema → Frontend dùng luôn, không đợi Backend deploy

---

<!-- _class: title-page -->

## Khi nào sử dụng GraphQL?

---

<!-- _class: content-page -->

- Nhiều Clients (mobile/web) cần dữ liệu khác nhau
- Dữ liệu có cấu trúc sâu, như một chuỗi các đối tượng lồng nhau, cần gọi nhiều API lại.
- Xuất hiện **over-fetching / under-fetching** quá nhiều khi xài REST.

---

<!-- _class: title-page -->

## Thảo luận

---

<!-- _class: content-page -->

## Thảo luận

### So sánh giữa (Query + Mutation) và (Subscription)

|               | **Query + Mutation**        | **Subscription**                      |
| ------------- | --------------------------- | ------------------------------------- |
| **Cơ chế**    | Pull                        | Push                                  |
| **Công nghệ** | Http (request - reponse)    | WebSocket                             |
| **Chi phí**   | Chỉ tốn khi gọi             | Server phải duy trì két nối với clien |
| **Ứng dụng**  | Giỏ hàng, profile, sản phẩm | Chat, Grab/Uber                       |

---

<!-- _class: content-page -->

## Thảo luận

> Không có cái nào trên đời là hoàn hảo, cái nào cũng có mặt tốt và xấu của nó.

- **GraphQL không tốt hơn REST. Nó chỉ đơn giản giải quyết các vấn đề khác nhau.**

- GraphQL được tạo ra để giải quyết vấn đề scaling của Facebook.

- Cân nhắc sử dụng GraphQL khi gọi quá nhiều API mỗi page.

---

<!-- _class: title-page -->

## Nhược điểm của GraphQL

---

<!-- _class: content-page -->

## Nhược điểm của GraphQL

### 1. Độ phức tạp cao hơn
- Backend: Phải xây dựng Schema, Resolvers
- Learning curve: Team phải học nhiều concept mới
- REST đơn giản hơn cho CRUD cơ bản

### 2. Caching khó hơn
- REST: Dễ cache theo endpoint (`/users/123`)
- GraphQL: Mỗi query khác nhau → Cần Apollo Cache, DataLoader

---

<!-- _class: content-page -->

## Nhược điểm của GraphQL

### 3. N+1 Query Problem
```graphql
{ posts { author { name } } }  # 100 posts = 101 DB queries!
```
→ Cần DataLoader để tối ưu

### 4. File Upload phức tạp
- Không native support, cần library hoặc dùng REST riêng

---

<!-- _class: content-page -->

## Nhược điểm của GraphQL

### 5. HTTP Status Code mất ý nghĩa
- Luôn trả 200 OK (kể cả lỗi) → Khó monitor

### 6. Security risks
```graphql
{ posts { author { posts { author { ... } } } } }
```
→ Query độc có thể làm sập server
→ Cần depth limiting, complexity analysis

---

<!-- _class: content-page -->

## Nhược điểm của GraphQL

### 7. Khó debug & monitoring
- Mọi request qua `/graphql` → Khó track query nào chậm
- Cần tools đặc biệt (Apollo Studio)

### 8. Overhead cho dữ liệu đơn giản
- `GET /users` (REST) đơn giản hơn viết Schema + Resolvers

---

<!-- _class: content-page -->

## Kết luận

**GraphQL không phải silver bullet**

✅ **Tốt cho:** Dữ liệu phức tạp, nhiều clients, nested data

❌ **Không tốt cho:** CRUD đơn giản, file upload, team nhỏ

**Cân nhắc:** Team experience, độ phức tạp data, infrastructure

→ **Đôi khi REST + WebSocket đơn giản hơn!**

---

---

# GraphQL cho Flutter GraphQL cho Flutter bằng Hygraph serverless

---

## Nội dung

- [Dependencies](#Dependencies)
- [GraphQLClient](#GraphQLClient)
- [Query](#Query)
- [Mutation](#Mutation)
- [Publish](#Publish)

---

<!-- _class: title-page -->

## Dependencies

---

<!-- _class: content-page -->

## Dependencies

https://pub.dev/packages/graphql_flutter

- Thêm bằng terminal

```bash
flutter pub add graphql_flutter
```

- Thêm bằng file pubspect.yaml

```dart
dependencies:
  flutter:
    sdk: flutter
  ...
  graphql_flutter: ^5.2.1
```

---

<!-- _class: title-page -->

## GraphQLClient

---

<!-- _class: content-page -->

## GraphQLClient

### Yêu cầu:

- endpoint link
- token (nếu có)

### Code mẫu:

```dart
final HttpLink httpLink = ... (endpoint-link)
final String token = ... (token)

final AuthLink authLink = AuthLink(getToken: ()=> "Bearer $token");

final Link link = authLink.concat(httpLink);

return GraphQLClient(link: link, cache: GraphQLCache());
```

---

<!-- _class: title-page -->

## Query

---

<!-- _class: content-page -->

## Query

### Sử dụng

- raw query
- GraphQLClient

### Đầu vào

- raw query string
- tham số (nếu có)

### Đầu ra

- Map<String,dynamic>

---

<!-- _class: content-page -->

## Query

### 1. Kiểu query không tham số

```dart
final result = await client.query(
    QueryOptions(document: gql(getPostsQuery)),
);
```

### 2. Kiểu query có tham số

```dart
final result = await client.query(
      QueryOptions(document: gql(getPostByIdQuery), variables: {"id": id}),
);
```

---

<!-- _class: title-page -->

## Mutation

---

<!-- _class: content-page -->

## Mutation

### Sử dụng

- raw mutation
- GraphQLClient

### Đầu vào

- raw mutation string
- tham số: **unique, id ...**

### Đầu ra

- Map<String,dynamic>

---

<!-- _class: content-page -->

## Mutation

### 1. Kiểu mutation create

```dart
final result = await client.mutate(
      MutationOptions(
        document: gql(createPostMutation),
        variables: {
          "input": {"title": title, "content": content},
        },
      ),
);
```

---

<!-- _class: content-page -->

## Mutation

### 2. Kiểu mutation update

```dart
final result = await client.mutate(
    MutationOptions(
      document: gql(updatePostMutation),
      variables: {
        "id": id,
        "input": {
          "title": title,
          "content": content,
        },
      },
    ),
);
```

---

<!-- _class: content-page -->

## Mutation

### 3. Kiểu mutation delete

```dart
final result = await client.mutate(
    MutationOptions(
      document: gql(deletePostMutation),
      variables: {
        "id": id,
      },
    ),
);
```

---

<!-- _class: content-page -->

## Mutation

### Lưu ý mutation khi sử dụng hygraph:

- Dữ liệu khi thay đổi đều sẽ ở bản draft, nếu muốn nó chính thức sử dụng được cần phải publish.
- Publish là **cơ chế riêng** của Hygraph (CMS), không phải chuẩn chung của mọi GraphQL server.

---

<!-- _class: title-page -->

## Publish

---

<!-- _class: content-page -->

## Publish

### Sử dụng

- raw mutation
- GraphQLClient

### Đầu vào

- raw mutation string
- tham số: **id**

### Đầu ra

- Map<String,dynamic>

---

<!-- _class: content-page -->

## Publish

```dart
final result = await client.mutate(
      MutationOptions(
        document: gql(publishWishMutation),
        variables: {"ID": id},
      ),
);
```
