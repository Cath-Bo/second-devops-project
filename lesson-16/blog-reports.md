# How many articles have been published in each movie genre?
```SELECT 
     categories.name AS category,
     COUNT(articles.id) AS article_count
FROM categories
JOIN articles ON categories.id = articles.category_id
GROUP BY categories.id, categories.name
ORDER BY article_count DESC;```

# How many articles has each user written?

```SELECT
    users.username,
    COUNT(articles.id) AS article_count
FROM users
JOIN articles ON users.id = articles.user_id
GROUP BY users.id, users.username
ORDER BY article_count DESC;```

# Which articles have received the most comments?

```SELECT
    articles.title,
    COUNT(comments.id) AS comment_count
FROM articles
JOIN comments ON articles.id = comments.article_id
GROUP BY articles.id, articles.title
ORDER BY comment_count DESC;```

# User activity in comments

```SELECT
    users.username,
    COUNT(comments.id) AS comment_count
FROM users
JOIN comments ON users.id = comments.user_id
GROUP BY users.id, users.username
ORDER BY comment_count DESC;```

# The ten tags used in the largest number of articles.

```SELECT
    tags.name AS tag,
    COUNT(article_tags.article_id) AS article_count
FROM tags
JOIN article_tags ON tags.id = article_tags.tag_id
GROUP BY tags.id, tags.name
ORDER BY article_count DESC, tags.name
LIMIT 10;```



# 3NF explanation:
- The database schema satisfies the Third Normal Form (3NF).
- Each table stores information about one type of entity or relationship.
- Every non-key attribute depends on the primary key.
- User information is stored only in the users table.
- Category information is stored only in the categories table.
- Articles reference users and categories through foreign keys.
- The comments table references articles and users through foreign keys.
- The article_tags table resolves the many-to-many relationship
- between articles and tags.
- Its composite primary key (article_id, tag_id) prevents duplicate
- article-tag relationships.
- This structure avoids unnecessary data duplication and
- transitive dependencies between non-key attributes.
