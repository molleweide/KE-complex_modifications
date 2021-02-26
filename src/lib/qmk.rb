# karabiner qmk mirror functions
#
# I have browsed through the code and compiled
# some of the functionality that I like to be able
# mirror my qmk keyboard. Feel free to help me out and
# give me instructions on how to make this fit into the project
# if you find that this is a good idea. I am completely
# new to ruby lang so there might be a smarter way of putting
# this together.
#
# My goal is to have my laptop feel exactly as if I was
# using my split qmk keyboards
#
#
# todo
#
#
#
# - dual/single map
#     check for state variables

require_relative './karabiner'

PARAMETERS = {
  :to_if_alone_timeout_milliseconds => 135,
  :to_delayed_action_delay_milliseconds => 0,
  :to_if_held_down_threshold_milliseconds => 135,
  :simultaneous_threshold_milliseconds => 300,
}.freeze

# todo
#
# test if this function works
def QMK_SET_LAYER(value)
  Karabiner.set_variable('QMK_LAYER, value)
end

def generate_dual_key_rule(input, alone, held_down)
  {
    'type' => 'basic',
    'from' => {
      'key_code' => input,
      'modifiers' => { 'optional' => ['any'] },
    },
    'to_if_alone' => [
      {
        'key_code' => alone,
      },
    ],
    'to_if_held_down' => [
      {
        'key_code' => held_down,
      },
    ],
    'parameters' => {
      'basic.to_if_alone_timeout_milliseconds' => PARAMETERS[:to_if_alone_timeout_milliseconds],
      'basic.to_if_held_down_threshold_milliseconds' => PARAMETERS[:to_if_held_down_threshold_milliseconds],
    },
  }
end

def generate_single_key_rule(input, output)
  {
    'type' => 'basic',
    'from' => {
      'key_code' => input,
      'modifiers' => { 'optional' => ['any'] },
    },
    'to' => [
      {
        'key_code' => output,
      },
    ],
  }
end

def QMK_HOLD_DOWN_ACTIVATE_STATE(qmk_from_layer, input, alone, qmk_to_layer)
  {
    'type' => 'basic',
    'conditions' => [
      {
        'type' => 'variable_if',
        'name' => 'QMK_LAYER',
        'value' => qmk_from_layer,
      },
    'from' => {
      'key_code' => input,
      'modifiers' => { 'optional' => ['any'] },
    },
    'to_if_alone' => [
      {
        'key_code' => alone,
      },
    ],
    'to_if_held_down' => [
      Karabiner.set_variable('QMK_LAYER', qmk_to_layer),
    ],
    'to_after_key_up' => [
      Karabiner.set_variable('QMK_LAYER', qmk_from_layer),
    ],
    'parameters' => {
      'basic.to_if_alone_timeout_milliseconds' => PARAMETERS[:to_if_alone_timeout_milliseconds],
      'basic.to_if_held_down_threshold_milliseconds' => PARAMETERS[:to_if_held_down_threshold_milliseconds],
    },
  }
end
