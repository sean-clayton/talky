defmodule Talky.ChatsTest do
  use Talky.DataCase

  alias Talky.Chats

  describe "chat_messages" do
    alias Talky.Chats.ChatMessage

    @valid_attrs %{body: "some body"}
    @update_attrs %{body: "some updated body"}
    @invalid_attrs %{body: nil}

    def chat_message_fixture(attrs \\ %{}) do
      {:ok, chat_message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Chats.create_chat_message()

      chat_message
    end

    test "list_chat_messages/0 returns all chat_messages" do
      chat_message = chat_message_fixture()
      assert Chats.list_chat_messages() == [chat_message]
    end

    test "get_chat_message!/1 returns the chat_message with given id" do
      chat_message = chat_message_fixture()
      assert Chats.get_chat_message!(chat_message.id) == chat_message
    end

    test "create_chat_message/1 with valid data creates a chat_message" do
      assert {:ok, %ChatMessage{} = chat_message} = Chats.create_chat_message(@valid_attrs)
      assert chat_message.body == "some body"
    end

    test "create_chat_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chats.create_chat_message(@invalid_attrs)
    end

    test "update_chat_message/2 with valid data updates the chat_message" do
      chat_message = chat_message_fixture()
      assert {:ok, %ChatMessage{} = chat_message} = Chats.update_chat_message(chat_message, @update_attrs)
      assert chat_message.body == "some updated body"
    end

    test "update_chat_message/2 with invalid data returns error changeset" do
      chat_message = chat_message_fixture()
      assert {:error, %Ecto.Changeset{}} = Chats.update_chat_message(chat_message, @invalid_attrs)
      assert chat_message == Chats.get_chat_message!(chat_message.id)
    end

    test "delete_chat_message/1 deletes the chat_message" do
      chat_message = chat_message_fixture()
      assert {:ok, %ChatMessage{}} = Chats.delete_chat_message(chat_message)
      assert_raise Ecto.NoResultsError, fn -> Chats.get_chat_message!(chat_message.id) end
    end

    test "change_chat_message/1 returns a chat_message changeset" do
      chat_message = chat_message_fixture()
      assert %Ecto.Changeset{} = Chats.change_chat_message(chat_message)
    end
  end
end
