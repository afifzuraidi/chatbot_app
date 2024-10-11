require 'openai'

class ChatGPTService
  def initialize(prompt)
    @client = OpenAI::Client.new
    @prompt = prompt
  end

  def call
    response = @client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: [{ role: "user", content: @prompt }],
        max_tokens: 1000
      }
    )
    response['choices'][0]['message']['content']
  rescue => e
    "There was an error: #{e.message}"
  end
end
