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

; Script element (<script>)
(script_element) @tag.outer

(script_element
  (start_tag)
  .
  (_) @tag.inner
  .
  (end_tag))

; Style element (<style>)
(style_element) @tag.outer

(style_element
  (start_tag)
  .
  (_) @tag.inner
  .
  (end_tag))

