
First copy the fonts here to `/usr/local/share/fonts`:
```sh
cp * /usr/local/share/fonts
```

Then, install them by refreshing the cache:

```sh
fc-cache -f -v
```

You can make sure they're installed with:
```sh
fc-list | grep "Hack"
```
