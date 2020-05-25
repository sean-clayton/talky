defmodule Talky.Repo.Migrations.CreateChatMessages do
  use Ecto.Migration

  def change do
    create table(:chat_messages) do
      add :body, :text

      timestamps()
    end
  end
end
