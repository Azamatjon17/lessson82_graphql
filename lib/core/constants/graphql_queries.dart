const String fetchProducts = """
query {
  products {
    id
    title
    price
    description
  }
}
""";

const String createProduct = """
mutation addProduct(
  \$title: String!, 
  \$price: Float!, 
  \$description: String!, 
  \$categoryId: Float!,
  \$images: [String!]!
) {
  addProduct(
    data: {
      title: \$title, 
      price: \$price, 
      description: \$description, 
      categoryId: \$categoryId,
      images: \$images
    }
  ) {
    id
    title
    price
    description
    images
    category {
      name
    }
  }
}
""";
