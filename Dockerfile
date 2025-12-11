FROM public.ecr.aws/lambda/nodejs:18

# Copy package files
COPY package*.json ./
RUN npm install

# Copy your source code
COPY . .

# Set Lambda handler
CMD ["main.handler"]
