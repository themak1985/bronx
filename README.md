# Bronx

Bronx is a lightweight, modern, mobile-first frontend Stream for CiviCRM's
RiverLea theme framework. It improves the presentation and responsiveness of
public-facing CiviCRM forms without changing CiviCRM core or requiring a
CMS-specific plugin.

WordPress is the initial reference platform, but Bronx styles CiviCRM markup
rather than WordPress pages or theme classes. It is intended to work with every
CMS supported by CiviCRM.

> Bronx is currently an alpha release. Test it on a staging site before using
> it in production.

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
| CMS | WordPress reference implementation; designed to be CMS-agnostic |

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

### Migrating from Bronx 0.5.x

Version 0.6.0 changed the extension key from `org.civicrm.bronx` to `bronx`.
CiviCRM therefore treats it as a different extension.

1. Select another frontend Stream.
2. Disable and uninstall **Bronx CiviCRM Theme** 0.5.x.
3. Remove the old `org.civicrm.bronx` directory.
4. Install Bronx 0.6.0 and select **Bronx** again.
5. Flush CiviCRM caches.

Bronx creates no user data or custom database tables.

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
