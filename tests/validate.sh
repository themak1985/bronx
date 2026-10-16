#!/bin/sh
set -eu

root_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
extension_dir="$root_dir"
stream_css="$extension_dir/streams/bronx/_main.css"
fixture="$root_dir/tests/fixtures/profile-fields.html"
mobile_fixture="$root_dir/tests/fixtures/profile-fields-mobile.html"
standalone_fixture="$root_dir/tests/fixtures/standalone-profile.html"
standalone_mobile_fixture="$root_dir/tests/fixtures/standalone-profile-mobile.html"
afform_fixture="$root_dir/tests/fixtures/afform-fields.html"
event_fixture="$root_dir/tests/fixtures/event-registration.html"
contribution_fixture="$root_dir/tests/fixtures/contribution.html"
coverage_doc="$root_dir/docs/public-coverage.md"

xmllint --noout "$extension_dir/info.xml"

required_files=$(printf '%s\n' \
  "$extension_dir/bronx.php" \
  "$extension_dir/managed/RiverleaStream_Bronx.mgd.php" \
  "$stream_css" \
  "$extension_dir/streams/bronx/_dark.css" \
  "$extension_dir/LICENSE" \
  "$extension_dir/CHANGELOG.md" \
  "$extension_dir/CONTRIBUTING.md" \
  "$extension_dir/SECURITY.md" \
  "$fixture" \
  "$mobile_fixture" \
  "$standalone_fixture" \
  "$standalone_mobile_fixture" \
  "$afform_fixture" \
  "$event_fixture" \
  "$contribution_fixture" \
  "$coverage_doc")

while IFS= read -r required_file; do
  test -s "$required_file" || {
    echo "Missing or empty: $required_file" >&2
    exit 1
  }
done <<EOF
$required_files
EOF

grep -q '<extension key="bronx"' "$extension_dir/info.xml"
grep -q '<version>0.6.0</version>' "$extension_dir/info.xml"
grep -q '<ver>6.16</ver>' "$extension_dir/info.xml"
grep -q '<smarty_compatibility>' "$extension_dir/info.xml"
grep -q '<ver>5.0</ver>' "$extension_dir/info.xml"
grep -q '<php_compatibility>' "$extension_dir/info.xml"
grep -q '<ver>8.5</ver>' "$extension_dir/info.xml"
grep -q '<author>Bashar Makhay</author>' "$extension_dir/info.xml"
grep -q 'https://github.com/themak1985/bronx' "$extension_dir/info.xml"
grep -q "'entity' => 'RiverleaStream'" "$extension_dir/managed/RiverleaStream_Bronx.mgd.php"
grep -q "'name' => 'bronx'" "$extension_dir/managed/RiverleaStream_Bronx.mgd.php"
grep -q "'extension' => 'bronx'" "$extension_dir/managed/RiverleaStream_Bronx.mgd.php"
grep -q -- '--crm-f-form-layout: block' "$stream_css"
grep -q -- '--crm-page-padding: 0' "$stream_css"
grep -q -- '--crm-f-form-width: 60rem' "$stream_css"
grep -q '^#crm-container\.crm-public {' "$stream_css"
grep -q ':where(\.crm-profile, #crm-profile-block)' "$stream_css"
grep -q 'id="crm-profile-block" class="crm-container crm-public"' "$standalone_fixture"
grep -q 'class="CRM_Profile_Form_Edit"' "$standalone_fixture"
grep -q 'crm_user_signup-section' "$standalone_fixture"
grep -q 'width: 390px' "$standalone_mobile_fixture"
grep -q 'form.CRM_Event_Form_Registration_Register' "$stream_css"
grep -q '\.select2-container-multi \.select2-search-field' "$stream_css"
grep -q '\.select2-container-multi \.select2-search-choice \.select2-search-choice-close' "$stream_css"
grep -q '\.select2-container\.select2-allowclear \.select2-choice \.select2-search-choice-close' "$stream_css"
grep -q '^\.select2-drop\.crm-container\.crm-public' "$stream_css"
grep -A5 '^\.select2-drop\.crm-container\.crm-public' "$stream_css" | grep -q 'min-inline-size: 0'
grep -q 'class="select2-search-choice-close"' "$fixture"
grep -q 'select2-allowclear' "$fixture"
grep -q 'crm-form-autocomplete crm-ajax-select' "$fixture"
grep -q 'select2-drop select2-drop-multi crm-container crm-public' "$fixture"
grep -q -- '--bronx-field-compact: 12rem' "$stream_css"
grep -q -- '--bronx-field-standard: 24rem' "$stream_css"
grep -q -- '--bronx-field-wide: 36rem' "$stream_css"
grep -q -- '--bronx-field-full: var(--crm-f-form-width)' "$stream_css"
grep -q 'crm-form-date' "$fixture"
grep -q 'select2-container-multi' "$fixture"
grep -q 'crm-form-textarea' "$fixture"
grep -q 'id="crm-main-content-wrapper"' "$fixture"
grep -q 'class="g-recaptcha"' "$fixture"
grep -q '#crm-main-content-wrapper' "$stream_css"
grep -q 'table.form-layout-compressed:has(.g-recaptcha)' "$stream_css"
grep -q '\.crm-container \.afform-directive' "$stream_css"
grep -q 'container-type: inline-size' "$stream_css"
grep -q '\.af-container\.af-layout-cols' "$stream_css"
grep -q '@container (max-width: 32rem)' "$stream_css"
grep -q 'class="afform-directive"' "$afform_fixture"
grep -q 'af-layout-cols' "$afform_fixture"
grep -q 'af-field-type-hidden' "$afform_fixture"
grep -q 'af-field\.af-field-type-hidden' "$stream_css"
grep -q 'class="crm-public-form-item crm-group priceset-group"' "$event_fixture"
grep -q 'class="crm-form-date-wrapper"' "$event_fixture"
grep -q 'class="crm-section editrow_group-section form-item"' "$event_fixture"
grep -q 'class="note-editor note-frame"' "$event_fixture"
grep -q 'CRM_Contribute_Form_Contribution_Main' "$contribution_fixture"
grep -q 'contribution_amount-section crm-price-field-id-' "$contribution_fixture"
grep -q 'section-pricesetTotal hiddenElement' "$contribution_fixture"
grep -q 'form.CRM_Contribute_Form_Contribution_Main' "$stream_css"
grep -q 'section-pricesetTotal.hiddenElement' "$stream_css"
grep -q '^#crm-container\.crm-public \.price_set-section \.price-set-row' "$stream_css"
grep -A5 'crm-price-amount-amount' "$stream_css" | grep -q 'margin-inline-start: 0'
grep -A5 'crm-price-amount-amount' "$stream_css" | grep -q 'padding-inline-start: 0'
grep -q 'additional_participants-section' "$stream_css"
grep -q 'price_set-section' "$stream_css"
grep -q 'editrow_group-section:not(:has' "$stream_css"
grep -q ':is(\.helprow-pre, \.helprow-post)' "$stream_css"
grep -A6 ':is(\.helprow-pre, \.helprow-post)' "$stream_css" | grep -q 'var(--bronx-field-wide)'
grep -q '\.crm-form-date-wrapper > \.crm-clear-link' "$stream_css"
grep -q '\.crm-submit-buttons \.crm-button > i\.crm-i' "$stream_css"
grep -A5 '#crm-container\.crm-public \.crm-submit-buttons {' "$stream_css" | grep -q 'justify-content: flex-start;'
grep -q '\.note-editor \.note-toolbar \.note-btn' "$stream_css"
grep -q -- '--bronx-select-arrow:' "$stream_css"
grep -q 'form select\.crm-form-select:not(\[multiple\])' "$stream_css"
grep -q 'appearance: none' "$stream_css"
grep -q 'background-position: right 0.875rem center' "$stream_css"

root_tokens=$(sed -n '/^:root {/,/^}/p' "$stream_css")
if printf '%s\n' "$root_tokens" | grep -q -- '--crm-f-'; then
  echo "Legacy frontend layout tokens must not leak from :root into Afform." >&2
  exit 1
fi

if grep -q '\.name-row' "$stream_css"; then
  echo "Stream CSS must not contain the Tarab-specific Afform class." >&2
  exit 1
fi

if grep -qE -- '--crm-btn-radius:[[:space:]]*999px' "$stream_css"; then
  echo "Submit buttons must not use the legacy pill radius." >&2
  exit 1
fi

if grep -qE 'wp-theme-|crm-event-id-[0-9]|crm-profile-id-[0-9]|crm-contribution-page-id-[0-9]|#s2id_autogen|#dp[0-9]' "$stream_css"; then
  echo "Stream CSS contains a site-specific or generated selector." >&2
  exit 1
fi

main_css_bytes=$(wc -c < "$stream_css" | tr -d '[:space:]')
if [ "$main_css_bytes" -gt 40960 ]; then
  echo "Main Stream CSS exceeds the 40 KiB budget: $main_css_bytes bytes" >&2
  exit 1
fi

if command -v gzip >/dev/null 2>&1; then
  gzip_css_bytes=$(gzip -c -9 "$stream_css" | wc -c | tr -d '[:space:]')
  if [ "$gzip_css_bytes" -gt 8192 ]; then
    echo "Compressed main Stream CSS exceeds the 8 KiB budget: $gzip_css_bytes bytes" >&2
    exit 1
  fi
  echo "CSS size: $main_css_bytes bytes raw; $gzip_css_bytes bytes gzip."
else
  echo "CSS size: $main_css_bytes bytes raw; gzip check skipped."
fi

if command -v php >/dev/null 2>&1; then
  find "$extension_dir" -name '*.php' -exec php -l {} \;
else
  echo "Notice: PHP is unavailable; skipped PHP syntax checks." >&2
fi

echo "Validation passed."
