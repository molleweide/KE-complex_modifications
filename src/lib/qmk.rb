# todo
#
# add if layer variable
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
    'to' =>[
      {
        'key_code' => output,
      },
    ],
  }
end

def layer_toggle() end

def single_switch_to_layer() end

def dual_key_hold_layer
  [
    # option+n -> control+page_down
    {
      'type' => 'basic',
      'from' => {
        'key_code' => 'n',
        'modifiers' => Karabiner.from_modifiers(['option'], ['caps_lock']),
      },
      'to' => [
        {
          'key_code' => 'page_down',
          'modifiers' => ['left_control'],
        },
      ],
      'conditions' => [
        Karabiner.frontmost_application_if(['visual_studio_code']),
      ],
    },
    # option+p -> control+page_up
    {
      'type' => 'basic',
      'from' => {
        'key_code' => 'p',
        'modifiers' => Karabiner.from_modifiers(['option'], ['caps_lock']),
      },
      'to' => [
        {
          'key_code' => 'page_up',
          'modifiers' => ['left_control'],
        },
      ],
      'conditions' => [
        Karabiner.frontmost_application_if(['visual_studio_code']),
      ],
    },
    # disable control+t
    {
      'type' => 'basic',
      'from' => {
        'key_code' => 't',
        'modifiers' => Karabiner.from_modifiers(['control'], ['caps_lock']),
      },
      'conditions' => [
        Karabiner.frontmost_application_if(['visual_studio_code']),
      ],
    },
  ]
end

def LAYER_space_down; end

main

<%# -------------------------------------------------- %>
<%# press spacebar to enter TouchCursor Mode, release to quit %>
<%# -------------------------------------------------- %>
{
    "type": "basic",
    "from": <%= from("spacebar", [], ["caps_lock"]) %>,
    "to": [
        { "set_variable": { "name": "touchcursor_extended_mode", "value": 1 } }
    ],
    "to_if_alone": <%= to([["spacebar"]]) %>,
    "to_after_key_up": [
        { "set_variable": { "name": "touchcursor_extended_mode", "value": 0 } }
    ]
},
<%# -------------------------------------------------- %>
<%# press esc to enter vimium mode, i to leave %>
<%# -------------------------------------------------- %>
{
    "type": "basic",
    "from": <%= from("escape", [], ["caps_lock"]) %>,
    "to": [
        { "set_variable": { "name": "vimium", "value": 1 } }
    ],
    "conditions": [
        { "type": "variable_if", "name": "vimium", "value": 0 }
    ]
},
{
    "type": "basic",
    "from": <%= from("escape", [], ["caps_lock"]) %>,
    "to": <%= to([["escape"]]) %>,
    "conditions": [
        { "type": "variable_if", "name": "vimium", "value": 1 }
    ]
},
{
    "type": "basic",
    "from": <%= from("i", [], ["caps_lock"]) %>,
    "to": [
        { "set_variable": { "name": "vimium", "value": 0 } }
    ],
    "conditions": [
        { "type": "variable_if", "name": "vimium", "value": 1 }
    ]
},

