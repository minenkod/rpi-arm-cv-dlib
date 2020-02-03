FROM "insert image here"

WORKDIR /usr/src/app

COPY requirments.txt ./
RUN chmod +x ./requirments.txt
RUN pip install --no-cache-dir -r requirments.txt

EXPOSE 5000
COPY . . 

CMD ["python ", "./main.py"]



