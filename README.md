# README

# Chatbot Web Application

This is a simple chatbot web interface built with **Ruby on Rails**, integrated with the **ChatGPT API** using the `ruby-openai` gem. The application allows users to input prompts and get responses from the AI. It also includes user authentication (via Devise) and Bootstrap for a responsive, user-friendly interface.

---

## Features

- **User Input Form**: Users can input questions and receive AI-generated responses.
- **ChatGPT API Integration**: Uses the OpenAI API for AI-generated responses.
- **Conversation Flow**: Displays the conversation history (user prompts and AI responses) on the same page.
- **User Authentication**: Allows users to log in and out (via Devise).
- **Responsive UI**: Styled with Bootstrap, featuring a fixed-bottom message input area and scrollable chat history.

---

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/afifzuraidi/chatbot_app.git
cd chatbot_app
```

### 2. Install Dependencies

Make sure you have Ruby and Bundler installed. Then, run:


```bash
bundle install
yarn install
```
### 3. Set Up the Database

You'll need to set up the database. Run the following commands:


```bash
rails db:create
rails db:migrate
```
### 4. Configure the OpenAI API Key

You need to get an API key from OpenAI. Once you have the API key, set it in your environment variables.

Create a `.env` file in the root directory and add your OpenAI API key:

```bash
OPENAI_API_KEY=your_openai_api_key_here
```
### 5. Start the Rails Server

Once everything is set up, start the Rails server:

```bash
foreman start -f Procfile.dev
```

Visit `http://localhost:3000` to access the chatbot interface.

---

### How to Use

#### 1. **Sign In**: The app uses Devise for user authentication. Create an account or log in with existing credentials.

#### 2. **Ask a Question**: Type a question or prompt in the message input form at the bottom of the page.

#### 3. **Receive AI Response**: The chatbot will return an AI-generated response from the OpenAI API and display it on the same page.

---

### Project Structure

- `app/controllers/chats_controller.rb`: Manages user input and retrieves AI responses.

- `app/services/chat_gpt_service.rb`: Service object for integrating with the OpenAI API.

- `app/views/chats/index.html.erb`: Displays the chat interface with user prompts and AI responses.

- `app/models/chat.rb`: Chat model, storing user messages and AI responses.

- `app/assets/stylesheets/application.boostrap.scss`: Includes Bootstrap for styling.

