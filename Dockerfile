FROM nginx:1.19.2

COPY index.html /usr/share/nginx/html

# Expose port 80
EXPOSE 80  

