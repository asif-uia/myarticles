# 5 rows.
50.times do
	Article.create({
		title: Faker::Book.title,
		body: Faker:: Lorem.sentence
	})
end