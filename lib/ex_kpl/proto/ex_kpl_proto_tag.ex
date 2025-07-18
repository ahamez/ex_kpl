# Code generated by protox. Don't edit.
# credo:disable-for-this-file
defmodule ExKpl.Proto.Tag do
  @moduledoc false
  if function_exported?(Protox, :check_generator_version, 1) do
    Protox.check_generator_version(1)
  else
    raise "This code was generated with protox 2 but the runtime is using an older version of protox."
  end

  @type t :: %__MODULE__{
          value: String.t() | nil,
          key: String.t() | nil,
          __uf__: [{non_neg_integer(), Protox.Types.tag(), binary()}]
        }
  defstruct value: nil, key: nil, __uf__: []

  (
    (
      @spec encode(t()) :: {:ok, iodata(), non_neg_integer()} | {:error, any()}
      def encode(msg) do
        msg |> encode!() |> Tuple.insert_at(0, :ok)
      rescue
        e in [Protox.EncodingError, Protox.RequiredFieldsError] -> {:error, e}
      end

      @spec encode!(t()) :: {iodata(), non_neg_integer()} | no_return()
      def encode!(msg) do
        {_acc = [], _acc_size = 0}
        |> encode_value(msg)
        |> encode_key(msg)
        |> encode_unknown_fields(msg)
      end
    )

    defp encode_value({acc, acc_size}, msg) do
      case msg.value do
        nil ->
          {acc, acc_size}

        _ ->
          {value_bytes, value_bytes_size} = Protox.Encode.encode_string(msg.value)
          {["\x12", value_bytes | acc], acc_size + 1 + value_bytes_size}
      end
    rescue
      ArgumentError ->
        reraise Protox.EncodingError.new(:value, "invalid field value"), __STACKTRACE__
    end

    defp encode_key({acc, acc_size}, msg) do
      case msg.key do
        nil ->
          raise Protox.RequiredFieldsError.new([:key])

        _ ->
          {value_bytes, value_bytes_size} = Protox.Encode.encode_string(msg.key)
          {["\n", value_bytes | acc], acc_size + 1 + value_bytes_size}
      end
    rescue
      ArgumentError ->
        reraise Protox.EncodingError.new(:key, "invalid field value"), __STACKTRACE__
    end

    defp encode_unknown_fields({acc, acc_size}, msg) do
      Enum.reduce(msg.__uf__, {acc, acc_size}, fn {tag, wire_type, bytes}, {acc, acc_size} ->
        case wire_type do
          0 ->
            {key_bytes, key_size} = Protox.Encode.make_key_bytes(tag, :int32)
            {[acc, <<key_bytes::binary, bytes::binary>>], acc_size + key_size + byte_size(bytes)}

          1 ->
            {key_bytes, key_size} = Protox.Encode.make_key_bytes(tag, :double)
            {[acc, <<key_bytes::binary, bytes::binary>>], acc_size + key_size + byte_size(bytes)}

          2 ->
            {len_bytes, len_size} = bytes |> byte_size() |> Protox.Varint.encode()
            {key_bytes, key_size} = Protox.Encode.make_key_bytes(tag, :packed)

            {[acc, <<key_bytes::binary, len_bytes::binary, bytes::binary>>],
             acc_size + key_size + len_size + byte_size(bytes)}

          5 ->
            {key_bytes, key_size} = Protox.Encode.make_key_bytes(tag, :float)
            {[acc, <<key_bytes::binary, bytes::binary>>], acc_size + key_size + byte_size(bytes)}
        end
      end)
    end
  )

  (
    (
      @spec decode(binary()) :: {:ok, t()} | {:error, any()}
      def decode(bytes) do
        {:ok, decode!(bytes)}
      rescue
        e in [Protox.DecodingError, Protox.IllegalTagError, Protox.RequiredFieldsError] ->
          {:error, e}
      end

      (
        @spec decode!(binary()) :: t() | no_return()
        def decode!(bytes) do
          parse_key_value(bytes, struct(ExKpl.Proto.Tag))
        end
      )
    )

    (
      @spec parse_key_value(binary(), struct()) :: struct()
      defp parse_key_value(<<>>, msg) do
        msg
      end

      defp parse_key_value(bytes, msg) do
        {field, rest} =
          case bytes do
            <<_::5, 3::3, _rest::binary>> ->
              raise Protox.DecodingError.new(bytes, "invalid wire type 3")

            <<_::5, 4::3, _rest::binary>> ->
              raise Protox.DecodingError.new(bytes, "invalid wire type 4")

            <<_::5, 6::3, _rest::binary>> ->
              raise Protox.DecodingError.new(bytes, "invalid wire type 6")

            <<_::5, 7::3, _rest::binary>> ->
              raise Protox.DecodingError.new(bytes, "invalid wire type 7")

            <<0::5, _::3, _rest::binary>> ->
              raise %Protox.IllegalTagError{}

            <<2::5, _wire_type::3, bytes::binary>> ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[value: Protox.Decode.validate_string!(delimited)], rest}

            <<1::5, _wire_type::3, bytes::binary>> ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[key: Protox.Decode.validate_string!(delimited)], rest}

            <<bytes::binary>> ->
              {tag, wire_type, rest} = Protox.Decode.parse_key(bytes)
              {value, rest} = Protox.Decode.parse_unknown(tag, wire_type, rest)
              {[__uf__: msg.__uf__ ++ [value]], rest}
          end

        msg_updated = struct(msg, field)
        parse_key_value(rest, msg_updated)
      end
    )
  )

  (
    @spec unknown_fields(struct()) :: [{non_neg_integer(), Protox.Types.tag(), binary()}]
    def unknown_fields(msg) do
      msg.__uf__
    end

    @spec unknown_fields_name() :: :__uf__
    def unknown_fields_name() do
      :__uf__
    end

    @spec clear_unknown_fields(struct) :: struct
    def clear_unknown_fields(msg) do
      struct!(msg, __uf__: [])
    end
  )

  (
    @spec default(atom()) ::
            {:ok, boolean() | integer() | String.t() | float()}
            | {:error, :no_such_field | :no_default_value}
    def default(:value) do
      {:ok, ""}
    end

    def default(:key) do
      {:ok, ""}
    end

    def default(_) do
      {:error, :no_such_field}
    end
  )

  @spec schema() :: Protox.MessageSchema.t()
  def schema() do
    %{
      __struct__: Protox.MessageSchema,
      fields: %{
        key: %{
          __struct__: Protox.Field,
          extender: nil,
          kind: %{__struct__: Protox.Scalar, default_value: ""},
          label: :required,
          name: :key,
          tag: 1,
          type: :string
        },
        value: %{
          __struct__: Protox.Field,
          extender: nil,
          kind: %{__struct__: Protox.Scalar, default_value: ""},
          label: :optional,
          name: :value,
          tag: 2,
          type: :string
        }
      },
      file_options: nil,
      name: ExKpl.Proto.Tag,
      syntax: :proto2
    }
  end
end
