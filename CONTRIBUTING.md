# Contributing to Bronx

Contributions, test reports, and accessibility feedback are welcome.

## Before opening an issue

Search existing issues and verify the problem with the latest Bronx release.
Include:

- CiviCRM and Bronx versions
- CMS and CMS theme
- RiverLea frontend and backend Stream selections
- Form type, field type, and relevant configuration
- Browser and viewport width
- Steps to reproduce, expected behavior, and actual behavior
- A screenshot when layout is relevant, with personal data removed

Do not include contact records, payment information, credentials, private URLs,
or other sensitive data.

## Pull requests

1. Keep selectors scoped to stable CiviCRM component markup.
2. Do not add website, CMS-theme, event, Profile, contribution-page, or
   generated element IDs.
3. Preserve FormBuilder/Afform layouts rather than replacing them.
4. Add or update a representative fixture for visual changes.
5. Run `./tests/validate.sh` and `./build.sh`.
6. Explain the tested desktop and mobile cases in the pull request.

Changes to CiviCRM core are outside the scope of this project.

## Development certificate

By submitting a contribution, you certify that you have the right to submit it
under the project's AGPL-3.0-or-later license.
