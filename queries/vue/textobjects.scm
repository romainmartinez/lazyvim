; extends

; Regular elements
(element) @tag.outer

(element
  (start_tag)
  .
  (_) @tag.inner
  .
  (end_tag))

(element
  (start_tag)
  _+ @tag.inner
  (end_tag))

; Template element (Vue SFC <template>)
(template_element) @tag.outer

(template_element
  (start_tag)
  .
  (_) @tag.inner
  .
  (end_tag))

(template_element
  (start_tag)
  _+ @tag.inner
  (end_tag))

; Script element (Vue SFC <script>)
(script_element) @tag.outer

(script_element
  (start_tag)
  .
  (_) @tag.inner
  .
  (end_tag))

; Style element (Vue SFC <style>)
(style_element) @tag.outer

(style_element
  (start_tag)
  .
  (_) @tag.inner
  .
  (end_tag))
