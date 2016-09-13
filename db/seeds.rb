
owner = Owner.create(name: 'matz')
Article.create(name: 'iPhone 12SC Plus', price: 42000, description: 'this is a revolution', owner: owner)
Article.create(name: 'Nexus', price: 5000, description: 'Android', owner: owner)
Article.create(name: 'Nokia S8', price: 8000, description: 'Windows', owner: owner)