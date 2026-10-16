# Frontend Profile Markup Research

Captured from the rendered public pages on 2026-10-13. This is a structural
reference, not a source-code copy. Dynamic values, option lists, tokens,
scripts, and site content have been omitted.

## Pages inspected

- `https://pandemicresponse.columbia.edu/civicrm/event/register/?id=55&reset=1`
- `https://tarabnyc.org/civicrm/event/register/?id=364&reset=1`

Both pages were loading CiviCRM's `civicrm.css` and Greenwich's
`ext/greenwich/dist/bootstrap3.css` when inspected. The selectors below are
from CiviCRM's rendered form markup rather than Greenwich, so the styling plan
must continue to work if the sites switch to a River/Thames frontend theme.

The calendar page is intentionally excluded from the initial scope because it
is produced by a third-party extension.

## Page and form boundaries

```html
<body class="... civicrm civicrm-event civicrm-event-register">
  <div id="crm-container" class="crm-container crm-public">
    <div class="crm-event-id-[ID] crm-block crm-event-register-form-block">
      <form id="Register" class="CRM_Event_Form_Registration_Register">
        <!-- public CiviCRM form content -->
      </form>
    </div>
  </div>
</body>
```

Recommended public registration scope:

```css
#crm-container.crm-public .crm-event-register-form-block
```

This boundary avoids applying form widths and backgrounds to every public
CiviCRM component.

## Profile fieldsets

One registration page contains one Profile; the other contains two Profiles.
All use the same structure:

```html
<fieldset class="crm-profile crm-profile-id-[ID] crm-profile-name-[GENERATED]">
  <legend>Profile section title</legend>
  <!-- field rows -->
</fieldset>
```

Use `.crm-profile`. Do not target the numeric ID or generated profile-name
class.

## Standard field row

```html
<div class="crm-section editrow_[FIELD]-section form-item" id="editrow-[FIELD]">
  <div class="label">
    <label for="[FIELD]">
      Field label
      <span class="crm-marker" title="This field is required.">*</span>
    </label>
  </div>
  <div class="content">
    <input id="[FIELD]" class="big crm-form-text required" type="text">
  </div>
  <div class="clear"></div>
</div>
```

The legacy two-column layout is implemented through `.label` and `.content`.
A modern stacked layout can therefore be created without changing templates:
make the row a block/grid container, remove legacy floats and fixed label
widths, and allow `.content` and its controls to fill the available width.

The `big`, `medium`, `six`, and similar input classes encode legacy character
widths. They should not determine the visual width of ordinary public form
controls. Semantic exceptions such as postal codes and short quantities can
use an explicit small-control rule.

## Help and description rows

```html
<div class="crm-section helprow-[FIELD]-section helprow-post" id="helprow-[FIELD]">
  <div class="content description">Supporting text</div>
</div>
```

These are separate siblings rather than children of their input row. Styling
must align them with the control column on desktop and the full form width in
the stacked/mobile layout.

Long informational text can also appear as:

```html
<div class="messages help">Long informational message</div>
```

## Radio groups

```html
<div class="crm-section ... form-item" role="radiogroup" aria-labelledby="[ID]">
  <div class="label" id="[ID]">
    Question
    <span class="crm-marker">*</span>
  </div>
  <div class="content">
    <div class="crm-multiple-checkbox-radio-options">
      <div class="crm-option-label-pair">
        <input class="required crm-form-radio" type="radio" id="[OPTION]">
        <label for="[OPTION]">Option</label>
      </div>
    </div>
  </div>
</div>
```

`.crm-option-label-pair` is the useful unit for a touch-friendly option row.
The radiogroup's `.label` is a `div`, not always a `label` element.

## Select2 controls

CiviCRM enhances some select and multiselect fields with legacy Select2
markup. The generated wrapper includes inline pixel widths:

```html
<div
  id="s2id_[FIELD]"
  class="select2-container select2-container-multi huge crm-select2 crm-form-multiselect required"
  style="width: 375px;"
>
  <ul class="select2-choices">
    <li class="select2-search-field">
      <input class="select2-input select2-default" style="width: 355px;">
    </li>
  </ul>
</div>

<select
  id="[FIELD]"
  class="huge crm-select2 crm-form-multiselect required"
  multiple
  style="display: none;"
></select>
```

Responsive styling must override the generated wrapper/input widths within
the form scope. Generated IDs such as `s2id_autogen1` are not stable and must
never be used as selectors.

## Date fields

```html
<span class="crm-form-date-wrapper">
  <input class="crm-form-text required crm-hidden-date" type="text">
  <input class="crm-form-text required crm-form-date hasDatepicker crm-placeholder-icon" type="text">
</span>
```

The datepicker's generated `dp[NUMBER]` ID is not stable. Target
`.crm-form-date-wrapper` and `.crm-form-date`.

## Submit area

```html
<div id="crm-submit-buttons" class="crm-submit-buttons">
  <button
    id="_qf_Register_upload-bottom"
    class="crm-form-submit default validate crm-button crm-button-type-upload crm-button_qf_Register_upload"
    type="submit"
  >
    <i class="crm-i fa-check"></i>
    Register
  </button>
</div>
```

Button styling should use `.crm-submit-buttons .crm-button` and should not
depend on the action-specific ID.

## Stable selectors for the first prototype

- `#crm-container.crm-public`
- `.crm-event-register-form-block`
- `form.CRM_Event_Form_Registration_Register`
- `.crm-profile`
- `.crm-section.form-item`
- `.crm-section.form-item > .label`
- `.crm-section.form-item > .content`
- `.crm-form-text`, `.crm-form-select`, and `.crm-form-multiselect`
- `.select2-container`
- `.crm-multiple-checkbox-radio-options`
- `.crm-option-label-pair`
- `.helprow-post .description`
- `.messages.help`
- `.crm-submit-buttons .crm-button`

## Selectors to avoid

- WordPress-theme classes such as `wp-theme-twentytwentyfive`
- Event IDs such as `.crm-event-id-55`
- Profile IDs such as `.crm-profile-id-45`
- Generated profile-name classes
- Select2 IDs beginning with `s2id_`
- Datepicker IDs beginning with `dp`
- Field-specific IDs except for an explicitly documented exceptional field

## WordPress context observed

The Tarab registration page exposed `wp-theme-twentytwentyfive` on the body.
The Columbia page exposed a custom `wp-theme-nypri` child-theme context. The
CiviCRM markup described above remained consistent across both sites. This is
evidence that the first implementation can live entirely in the CiviCRM River
Stream and should not require a WordPress bridge.
