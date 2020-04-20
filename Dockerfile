FROM phaus/hugo:0.63.2
COPY . /data
WORKDIR /data
RUN /usr/local/hugo --cleanDestinationDir

FROM nginx:alpine
COPY --from=0 /data/public /usr/share/nginx/html
