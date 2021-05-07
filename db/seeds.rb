
User.create(
    email: "dfeleppa@admin.com",
    first_name: "Daniel",
    last_name: "Feleppa",
    coach: 1,
    admin: 1,
    password_digest: BCrypt::Password.create('pass')
)
