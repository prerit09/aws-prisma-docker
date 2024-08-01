# Stage 1: Build the application
FROM node:18 AS builder

# Set the working directory
WORKDIR /app

# Install dependencies
COPY package.json ./
RUN npm install

# Copy the application code
COPY . .

# Build the Next.js application
RUN npm run build

# Stage 2: Set up the production environment
FROM node:18

# Set the working directory
WORKDIR /app

# Copy the built application from the builder stage
COPY --from=builder /app ./

# Install production dependencies
RUN npm install --only=production

# Expose the port Next.js will run on
EXPOSE 3000

# Start the Next.js application
CMD ["npm", "start"]
