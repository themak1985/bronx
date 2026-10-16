# Bronx

Bronx is a lightweight, modern, mobile-first frontend Stream for CiviCRM's
[RiverLea theme framework](https://docs.civicrm.org/dev/en/latest/theming/structure/).
It improves the presentation and responsiveness of public-facing CiviCRM forms
without changing CiviCRM core or requiring a CMS-specific plugin.

Bronx has only been tested on WordPress so far. It styles CiviCRM markup rather
than WordPress pages or theme classes and is intended to be CMS-agnostic, but
that portability has not yet been verified on other platforms.

## Why Bronx exists

Bronx began in response to a practical need: public CiviCRM Profiles and forms
can feel visually dated, inconsistent, or awkward on mobile when embedded in a
modern website. Bashar Makhay developed Bronx using OpenAI's ChatGPT Codex,
testing it against real CiviCRM forms on WordPress at desktop and mobile sizes.
The goal is a cleaner, more dependable frontend experience that remains within
CiviCRM's supported theming system rather than replacing its forms or modifying
CiviCRM core.

> Bronx is currently an alpha release. Test it on a staging site before using
> it in production.

## Testing status

Testing to date has been limited to WordPress, principally with the Twenty
Twenty-Five theme and Twentig. More testing is needed across other WordPress
themes, configurations, form types, browsers, and assistive technologies.
Testing and issue reports from Drupal, Joomla, Backdrop, and CiviCRM Standalone
users are especially welcome. Cross-CMS support should be considered an
intention, not a verified claim, until that testing has taken place.

## Features

- Responsive public Profiles and event-registration forms
- Standalone Profile create and edit forms
- Contribution and donation forms, including Price Sets
- Text, email, number, date, textarea, file, radio, checkbox, native select,
  autocomplete, and Select2 controls
- Four predictable field-width tiers that collapse safely on small screens
- Required markers, pre-help and post-help text, messages, validation states,
  account creation, reCAPTCHA, and action buttons
- FormBuilder/Afform control styling that preserves FormBuilder layouts
- Light and dark River modes
- No database tables, user-data collection, tracking, or external assets

## Requirements

| Dependency | Supported version |
| --- | --- |
| CiviCRM | 6.16 or newer |
| RiverLea | Enabled |
| PHP | 8.1–8.5 |
| Smarty | 5.0 |
| CMS | Tested on WordPress only; broader CMS testing wanted |

Bronx is a native CiviCRM extension. A WordPress plugin is not required.

## Installation

1. Download the current Bronx release ZIP.
2. Extract it into the CiviCRM extensions directory. The resulting directory
   must be named `bronx`.
3. Open **Administer > System Settings > Extensions** and enable **Bronx**.
4. Flush CiviCRM caches.
5. Open **Administer > Customise Data & Screens > Display Settings**.
6. Select **Bronx** as the frontend Stream. A different Stream, such as Thames,
   may remain selected for the backend.

If styling prevents access to Display Settings, add `safe_css=1` to that
page's URL to bypass Stream styling temporarily.

## Scope and design principles

Bronx works inside RiverLea's Stream system. It does not replace CiviCRM's
markup, patch CiviCRM core, or impose a page background or global content
width. Host websites continue to control typography, surrounding layout, and
page width.

Rules are based on reusable CiviCRM components. Bronx contains no WordPress
theme selectors, website identifiers, event IDs, Profile IDs, contribution
page IDs, or generated Select2 IDs.

FormBuilder/Afform owns its layout. Bronx styles controls inside native
`.af-layout-cols` and `.af-layout-inline` containers without replacing the
layout selected in FormBuilder. Site-specific Afform classes are deliberately
excluded.

Third-party interfaces, including the OSE event calendar, are outside the
current scope. See the [public workflow coverage matrix](docs/public-coverage.md)
for verified and planned components.

## Field sizing

Legacy public forms use four maximum-width tiers:

- Compact: `12rem`
- Standard: `24rem`
- Wide: `36rem`
- Full: `60rem`

All tiers shrink to the available container width. The mapping and rationale
are documented in [docs/field-widths.md](docs/field-widths.md).

## Development and testing

The repository includes static fixtures for Profiles, event registration,
contributions, Afform, and 390-pixel mobile layouts.

```sh
./tests/validate.sh
./build.sh
```

Validation checks the manifest, stable selector rules, representative markup,
and the stylesheet budgets. The main stylesheet must remain below 40 KiB raw
and 8 KiB when compressed. `build.sh` creates `dist/bronx-0.6.0.zip` with a
top-level `bronx/` installation directory.

See [CONTRIBUTING.md](CONTRIBUTING.md) before proposing changes and
[CHANGELOG.md](CHANGELOG.md) for release history.

## Support and security

- Report reproducible bugs through
  [GitHub Issues](https://github.com/themak1985/bronx/issues).
- Request enhancements through GitHub Issues and describe the CiviCRM form,
  field type, CMS, viewport, and expected behavior.
- Report vulnerabilities privately as described in
  [SECURITY.md](SECURITY.md).

## Maintainer

Bashar Makhay — active maintainer (<bashar.makhay@gmail.com>)

## License

Bronx is distributed under the
[GNU Affero General Public License v3.0 or later](LICENSE).
