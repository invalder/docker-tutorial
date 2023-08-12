# our base image
FROM alpine:3.5

# Install Python and pip
RUN apk add --update py2-pip

# Install dependencies
# install Python modules needed by the Python app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# copy files required for the app to run
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# Expose the Flask port
EXPOSE 5000

# Run the application
CMD ["python", "/usr/src/app/app.py"]

