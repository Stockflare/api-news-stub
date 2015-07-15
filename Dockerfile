FROM stockflare/base

LABEL ambassadr.services.news.test=env:PORT

LABEL ambassadr.host=env:HOST_IP

CMD ["bundle", "exec", "dotenv", "ambassador", "puma"]
