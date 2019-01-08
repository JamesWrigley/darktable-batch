darktable-batch
================================================================================
This image is for users who run their Darktable jobs on separate, possibly
headless, and probably more powerful servers.

For example, say you have 30 4K images that you've edited on an old laptop, and
you want to process all these quickly. One way would be to open a spot request
for a beefy EC2 instance, scp your images to the machine and run `darktable-cli`
on them. But then you would have to install Darktable every time you made a new
spot request (not necessarily easy on Amazon Linux).

Instead of that, just install Docker in the server and mount the directory of
your precious photos under `/images` in the container:
```
docker run --mount type=bind,source=<images_dir>,target=/images darktable-batch:latest
```

A script will automatically process all images which have an XMP file using
`darktable-cli`, and write them back out to `<images_dir>/out`. By default the
output format is JPG, but that can be customized via the `OUTFMT` env variable:
```
docker run -e OUTFMT=png --mount type=bind,source=<images_dir>,target=/images darktable-batch:latest
```
