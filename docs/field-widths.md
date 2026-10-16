# Bronx field-width system

Bronx uses four widths for legacy public CiviCRM forms. The widths describe
the expected amount of information rather than the particular Profile or
custom-field ID.

| Width | Token | Desktop maximum | Typical controls |
| --- | --- | ---: | --- |
| Compact | `--bronx-field-compact` | 12rem | Dates, times, short numbers, legacy `four`, `six`, and `eight` fields |
| Standard | `--bronx-field-standard` | 24rem | Names, email, phone, ordinary text, all native/Select2 choice controls, contact/entity references, radio/checkbox groups |
| Wide | `--bronx-field-wide` | 36rem | Long free-form `huge` values and uploads |
| Full | `--bronx-field-full` | 60rem | Textareas, rich-text editors, and compound content |

Every width is capped at the available content width. At 48rem and below all
controls become full-width, so the desktop distinctions never create mobile
overflow.

Legacy field-level pre-help and post-help rows use the 36rem wide tier. They
are separate siblings of their controls, so CiviCRM's markup does not allow
them to inherit an individual control's tier. General informational messages
remain full-width.

The public `#crm-main-content-wrapper` replaces River's minimum-width
`clamp()` with `min(100%, var(--crm-f-form-width))`. This preserves the 60rem
desktop cap while allowing the form to shrink inside any CMS content region.
No WordPress, Drupal, or Joomla theme selector is used.

## Coverage matrix

The legacy Profile layer accounts for these field families:

- short, ordinary, and long text values
- email, telephone, URL, password, numeric, money, and quantity values when
  emitted with CiviCRM's standard text-control classes
- native single and multiple selects
- Select2 3 single, multiple, and autocomplete/contact/entity-reference controls, including detached result panels
- date, time, and date-wrapper controls
- textarea and common CKEditor/TinyMCE wrappers
- radio and checkbox option groups
- file uploads
- help text, required markers, errors, focus states, and action buttons

Price sets use a dedicated event-registration layer that reuses the compact
width for quantities and the standard width for selects, option groups, and
the total summary. Contribution price fields use the same component layer.
Contribution progress widgets, repeating groups, and
Afform/FormBuilder still use markup outside the legacy `.crm-profile`
vocabulary and should receive dedicated component layers rather than broader
Profile selectors.
