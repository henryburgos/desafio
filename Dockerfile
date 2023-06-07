#Utiliza una imagen base de servidor web
FROM nginx:1.21.1-alpine

#Copia los archivos estaticos al directorio predeterminado de Nginx 
COPY ./web /usr/share/nginx/html

#Expone el puerto en el que se ejecutara la aplicacion
EXPOSE 80

#inicia Nginx cuando se ejecuta el contenedor
CMD ["nginx" , "-g", "daemon off;"]