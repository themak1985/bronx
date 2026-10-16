# Afform and FormBuilder

Bronx treats FormBuilder/Afform as a separate component from legacy Profiles.
It styles fields and actions without replacing the layout selected in
FormBuilder.

## Supported layout behavior

- Ordinary controls fill the Afform field slot containing them.
- `.af-layout-cols` remains a native FormBuilder column layout and stacks when
  its actual container becomes narrower than 32rem.
- `.af-layout-inline` retains its native wrapping behavior.
- Text, email, select, textarea, and Select2 controls stay within their slots.
- Afform action buttons keep their icon and label centered as one unit.

The responsive breakpoint is a container query. An embedded form can therefore
stack inside a narrow sidebar even when the browser viewport is wide.

## Tarab NYC migration

Tarab's current form uses a custom `.name-row` wrapper rather than the native
`.af-layout-cols` class. Keep the existing site CSS enabled while testing Bronx
0.4.1. It remains responsible for that custom row.

For a temporary mobile correction, the site CSS may add:

```css
@container (max-width: 32rem) {
  af-form .name-row {
    flex-direction: column;
    gap: 16px;
  }
}
```

The long-term CMS-agnostic solution is to configure the First Name and Last
Name fields in a native FormBuilder column container. After that conversion,
the `.name-row` rules can be removed. The general field, container, and button
rules can be removed from site CSS after the Bronx version has been compared on
desktop and mobile.
