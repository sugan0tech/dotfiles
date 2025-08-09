let dark_theme = {
    # Adjusted colors
    separator: white
    leading_trailing_space_bg: { attr: n }
    header: yellow_bold   # Changed from green_bold to yellow_bold
    empty: blue
    bool: light_cyan
    int: white
    filesize: cyan
    duration: white
    date: purple
    range: white
    float: white
    string: white
    nothing: white
    binary: white
    cell-path: white
    row_index: yellow_bold  # Changed from green_bold to yellow_bold
    record: white
    list: white
    block: white
    hints: dark_gray
    search_result: { bg: red fg: white }
    shape_and: yellow_bold  # Changed from purple_bold to yellow_bold
    shape_binary: yellow_bold  # Changed from purple_bold to yellow_bold
    shape_block: blue_bold
    shape_bool: light_cyan
    shape_closure: yellow_bold  # Changed from green_bold to yellow_bold
    shape_custom: yellow  # Changed from green to yellow
    shape_datetime: cyan_bold
    shape_directory: cyan
    shape_external: cyan
    shape_externalarg: yellow_bold  # Changed from green_bold to yellow_bold
    shape_external_resolved: light_yellow_bold
    shape_filepath: cyan
    shape_flag: blue_bold
    shape_float: purple_bold
    shape_garbage: { fg: white bg: red attr: b }
    shape_glob_interpolation: cyan_bold
    shape_globpattern: cyan_bold
    shape_int: purple_bold
    shape_internalcall: cyan_bold
    shape_keyword: cyan_bold
    shape_list: cyan_bold
    shape_literal: blue
    shape_match_pattern: yellow  # Changed from green to yellow
    shape_matching_brackets: { attr: u }
    shape_nothing: light_cyan
    shape_operator: yellow
    shape_or: yellow_bold  # Changed from purple_bold to yellow_bold
    shape_pipe: yellow_bold  # Changed from purple_bold to yellow_bold
    shape_range: yellow_bold
    shape_record: cyan_bold
    shape_redirection: yellow_bold  # Changed from purple_bold to yellow_bold
    shape_signature: yellow_bold  # Changed from green_bold to yellow_bold
    shape_string: yellow  # Changed from green to yellow
    shape_string_interpolation: cyan_bold
    shape_table: blue_bold
    shape_variable: purple
    shape_vardecl: purple
    shape_raw_string: light_yellow  # Changed from light_purple to light_yellow
}


$env.config.color_config = $dark_theme
source "$HOME/.cargo/env.nu"
