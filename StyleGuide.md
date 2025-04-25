# Comprehensive Markdown Style Guide

## Table of Contents
1. [Introduction](#introduction)
2. [Heading Structure](#heading-structure)
3. [Text Formatting](#text-formatting)
4. [Lists](#lists)
   - [Nesting in Lists](#nesting-in-lists)
5. [Code Blocks](#code-blocks)
6. [Tables](#tables)
7. [Links and References](#links-and-references)
8. [Images](#images)
9. [Blockquotes](#blockquotes)
10. [Advanced Features](#advanced-features)

## Introduction

This style guide demonstrates markdown formatting with a focus on nesting capabilities in GitHub-flavored markdown. Use this as a reference for creating well-structured documentation.

## Heading Structure

GitHub markdown supports 6 levels of headings, each with decreasing prominence:

# H1: Main Document Title
## H2: Major Section
### H3: Subsection
#### H4: Topic Group
##### H5: Specific Topic
###### H6: Minor Detail


> [!NOTE]
> Only use one H1 per document for the main title.<br>Structure content hierarchically with appropriate heading levels.

## Text Formatting

### Basic Formatting
- **Bold text** for emphasis (`**Bold text**`)
- *Italic text* for light emphasis (`*Italic text*`)
- ~~Strikethrough~~ for removed content (`~~Strikethrough~~`)
- `Inline code` for technical terms (`Inline code`)

### Combining Formats
- ***Bold and italic*** for strong emphasis (`***Bold and italic***`)
- **Some bold with *italic* inside** (`**Some bold with *italic* inside**`)
- *Some italic with **bold** inside* (`*Some italic with **bold** inside*`)

## Lists

### Unordered Lists
- First item
- Second item
- Third item

### Ordered Lists
1. First step
2. Second step
3. Third step

### Nesting in Lists
GitHub markdown supports multiple levels of nesting in lists:

- Main item 1
  - Subitem 1.1
    - Sub-subitem 1.1.1
      - Sub-sub-subitem 1.1.1.1
        - Sub-sub-sub-subitem 1.1.1.1.1
  - Subitem 1.2
- Main item 2
  1. Ordered subitem 2.1
     - Mixed nesting 2.1.1
     - Mixed nesting 2.1.2
  2. Ordered subitem 2.2
- Main item 3

### Task Lists
- [x] Completed task
- [ ] Incomplete task
  - [x] Completed subtask
  - [ ] Incomplete subtask
    - [ ] Sub-subtask

## Code Blocks

### Inline Code
Use `inline code` for short code references.

### Fenced Code Blocks
```
// JavaScript example
function exampleFunction() {
  const message = "Hello, world!";
  console.log(message);
  return message;
}
```

### Syntax Highlighting
```python
# Python example
def example_function():
    message = "Hello, world!"
    print(message)
    return message
```

### Nested Code Example
````markdown
   ```javascript
   // This shows how to include code blocks within a markdown block
   function nestedExample() {
   return "This demonstrates nested code blocks";
   }
   ```
````

## Tables

### Basic Table
| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |

### Alignment
| Left-aligned | Center-aligned | Right-aligned |
|:-------------|:--------------:|-------------:|
| Left         | Center         | Right        |
| Text         | Text           | Text         |

### Complex Tables
<table>
  <tr>
    <th>Header 1</th>
    <th>Header 2</th>
  </tr>
  <tr>
    <td>
      <ul>
        <li>Nested list item 1</li>
        <li>Nested list item 2</li>
      </ul>
    </td>
    <td>
      <code>Nested code</code>
    </td>
  </tr>
</table>

## Links and References

### External Links
[GitHub Documentation](https://docs.github.com/en/github/writing-on-github)

### Internal Links
[Return to Introduction](#introduction)

### Reference-style Links
[Reference link][ref1]

[ref1]: https://github.com

### Image Links
[![Alt text for image](https://example.com/image.jpg "Title for the image")](https://example.com)

## Images

### Basic Image
![Alt text for image](https://example.com/image.jpg "Title for the image")

### Resized Image with HTML
<img src="https://example.com/image.jpg" alt="Alt text" width="300" height="200">

## Blockquotes

### Simple Blockquote
> This is a blockquote. It can contain multiple sentences or paragraphs.

### Nested Blockquotes
> First level of quoting
>
> > Second level of quoting
> >
> > > Third level of quoting
>
> Back to the first level

### Blockquotes with Other Elements
> ### Heading in a blockquote
>
> - List item in blockquote
> - Another list item
>
> ```
> Code block in blockquote
> ```

## Advanced Features

### Collapsible Sections
<details>
  <summary>Click to expand</summary>
  
  This content is hidden until expanded.
  
  - It can contain lists
  - And other markdown elements
  
  ```
  Even code blocks!
  ```
</details>

### Definition Lists
<dl>
  <dt>Term</dt>
  <dd>Definition of the term</dd>
  
  <dt>Another term</dt>
  <dd>Definition of another term</dd>
</dl>

### Comments
<!-- This is a comment that won't appear in the rendered markdown -->

### Line Dividers
---
***
___

### HTML in Markdown
Use <kbd>Ctrl</kbd> + <kbd>C</kbd> to copy text.

Progress bar: <progress value="70" max="100"></progress>

### Superscript and Subscript
- Superscript: X<sup>2</sup>
- Subscript: H<sub>2</sub>O

### Footnotes
Here's a sentence with a footnote reference.[^1]

[^1]: This is the footnote content.
```
Hi I'm a footnote. :3
```