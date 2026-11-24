# zipagan_mobprog

In a real newsfeed, not every post has a picture—some posts are just plain text, while others include a photo. If we always put an `Image.asset` widget inside `newsfeed_card.dart` without checking first, text-only posts would either show a broken image error or leave a big blank gap in the card.
`String? imageAsset` (Nullable String): Putting a question mark (`?`) after `String` tells Dart that `imageAsset` is allowed to be `null` (empty). So for my post, which only has text, I can pass `imageAsset: null`. For my classmate's post that has a photo, I pass the file path (`'assets/images/holiday.webp'`).
