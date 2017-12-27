user = User.create email: 'bernarod.fire@gmail.com', password: 'formatar123', password_confirmation: 'formatar123'
cat = Category.create(name: 'erotica')
Article.create(title: 'COMO SE FODER', user: user, category: cat, body: 'bata punheta todo dia')
