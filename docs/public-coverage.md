# Bronx public-workflow coverage

This matrix separates verified Bronx component coverage from screens that are
currently relying on RiverLea Core or still require representative fixtures.
“Planned” does not mean the screen is unusable; it means Bronx has not yet
verified the markup and responsive behavior as part of its release contract.

## Profiles

| Workflow or component | Status | Fixture or note |
| --- | --- | --- |
| Profile embedded in event/contribution forms | Covered | `profile-fields.html`, `event-registration.html`, `contribution.html` |
| Standalone Profile create/edit (`#crm-profile-block`) | Covered | Desktop and 390px mobile fixtures |
| Account-creation block | Partial | Covered structurally; live CMS combinations still need testing |
| Pre-help, post-help, validation, required markers | Covered | Embedded and standalone Profile fixtures |
| Profile search form and results | Planned | Requires search/results fixture |
| Public Profile view and directory listing | Planned | Requires view/list fixture |
| Multiple-record custom fields | Planned | Requires repeating-record fixture |

## Events

| Workflow or component | Status | Fixture or note |
| --- | --- | --- |
| Initial registration and embedded Profiles | Covered | `event-registration.html` |
| Event fees and price sets | Covered | Quantity, select, radio, checkbox, and totals |
| Multiple-participant selector | Covered | Responsive label and control behavior |
| Additional-participant form | Planned | Requires representative fixture |
| Confirmation and participant summary | Planned | Currently relies on RiverLea Core |
| Thank-you, waitlist, and full-event messages | Planned | Currently relies on RiverLea Core |
| Self-service update and transfer | Planned | Requires representative fixture |
| Public event information and listing pages | Planned | Verify before adding any Bronx CSS |

## Contributions and memberships

| Workflow or component | Status | Fixture or note |
| --- | --- | --- |
| Main contribution form and amount choices | Covered | `contribution.html` |
| Contribution price sets and totals | Covered | Shared price-set component layer |
| Confirmation and thank-you | Planned | Currently relies on RiverLea Core |
| Billing address and processor containers | Planned | Processor-owned iframe contents are out of scope |
| Recurring contributions | Planned | Requires representative fixture |
| Membership selection and renewal | Planned | Requires contribution and standalone variants |
| On-behalf-of and premium blocks | Planned | Requires representative fixtures |

## FormBuilder/Afform

| Workflow or component | Status | Fixture or note |
| --- | --- | --- |
| Text, email, select, textarea, Select2, hidden fields | Covered | `afform-fields.html` |
| Native column and inline layouts | Covered | Container-responsive fixture |
| Conditional visibility and repeating groups | Planned | Must preserve FormBuilder ownership of layout |
| Validation summaries and complex actions | Planned | Requires representative fixture |

## Other public CiviCRM workflows

Mailing subscribe/unsubscribe, petitions, pledges, and standalone membership
forms are planned. Backend administration screens and third-party extension
interfaces—such as the OSE event calendar—are outside Bronx's frontend scope.

## Platform and quality checks

WordPress is the reference platform. Drupal, Joomla, and Backdrop require
integration testing before a community beta. Every covered component must be
checked for keyboard use, visible focus, error states, mobile reflow, zoom,
reduced motion, and light/dark River modes.

The build enforces a 40 KiB uncompressed and 8 KiB gzip budget for `_main.css`.
New workflows should reuse existing component layers and should not receive
custom CSS when RiverLea Core already presents them acceptably.
