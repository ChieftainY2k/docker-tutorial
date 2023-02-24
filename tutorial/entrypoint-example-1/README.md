```shell
docker rm -f entryapp && docker build . -t entryimage && docker run --name entryapp entryimage
```