module Api::Errors
  extend ActiveSupport::Concern

  included do
    rescue_from StandardError, with: :render_500
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
  end

  private

  # exceptionは例外オブジェクト
  # messagesはエラーメッセージの配列
  def render_404(exception = nil, messages = nil)
    # &.はボッチ演算子で、exceptionがnilの時はno method errorが発生してしまうので、それを防ぐ効果がある。
    # *messagesは可変長引数で、複数の引数を配列として受け取る
    render_error(404, "Record not found", exception&.message, *messages)
  end

  def render_500(exception = nil, messages = nil)
    render_error(500, "Internal server error", exception&.message, *messages)

  end

  # exception&.messageと*messagesを配列として受け取っているのが*error_messages
  def render_error(code, message, *error_messages)
    response = {
      message: message,
      errors: error_messages.compact
    }

    render json: response, status: code
  end
end