class ChatbotJob < ApplicationJob
  queue_as :default

  def perform(assistant)
    # Do something later
    @assistant = assistant
    chatgpt_response = client.chat(parameters: {model: "gpt-4o-mini", messages: questions_formatted_for_openai})
    new_content = chatgpt_response["choices"][0]["message"]["content"]

    @assistant.update(answer: new_content)
    Turbo::StreamsChannel.broadcast_update_to(
      "assistant_#{@assistant.id}",
      target: "assistant_#{@assistant.id}",
      partial: "assistants/assistant", locals: {assistant: @assistant}
    )
  end

  private

  def client
    @client ||= OpenAI::Client.new
  end

  def questions_formatted_for_openai
    assistants = @assistant.user.assistants
    results = []
    results << {role: "system", content: "You are a tabletop game assistant to help with rules, guidelines, and suggestions for the player and game master. Resume in two paragraphs"}
    assistants.each do |assistant|
      results << { role: "user", content: assistant.question }
      results << { role: "assistant", content: assistant.answer || "" }
    end
    return results
  end
end
