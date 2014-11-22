# ShareMyFiles

This is a simple sharing files application for self-hosting.

It is written with Ruby On Rails 4. It use a sqlite3 database.

## Usage

The main page is the index of sharing files. You need to be logged to access it.

The "shares" folder contain files which will be shared. You need to put them to this folder.

Files extension accepted are only **ZIP** files.

To download a file, you need to know the token of the file. No authentification is needed.

Exemple:
> http://www.exemple.com/9f97935498c475c51492cdede4c3166561499d5a

## Infos

### Create a user

To create a user on the database, execute these command-lines:

```bash
	rail c
```

When the rails console is launched execute this:

```bash
	User.create(name: 'your_username', password: 'your_password')
```

### Sessions

In the file
> config/initializers/session_store.rb

It can be good practice to change the value of *key*.

By default the session expiration time is set to 3 minutes, you can change it in this file.
