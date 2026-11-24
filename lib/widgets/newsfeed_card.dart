import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'custom_text.dart';

// One post in the newsfeed: avatar, name, date, post text,
// an optional image, and the like, comment, and share row.
// Enhancement 1: the image area uses the Image widget.
// Enhancement 2: the avatar uses a profile image.
// Enhancement 3: the like and comment buttons are widgets.

class NewsFeedCard extends StatelessWidget {
  const NewsFeedCard({
    super.key,
    required this.authorName,
    required this.date,
    required this.text,
    required this.likes,
    this.avatarAsset,
    this.imageAsset,
    required this.onLike,
  });

  final String authorName;
  final String date;
  final String text;
  final int likes;
  final String? imageAsset;
  final String? avatarAsset;
  final VoidCallback onLike;

  

  @override
  Widget build(BuildContext context) {
    final bool hasAvatar = avatarAsset != null && avatarAsset!.trim().isNotEmpty;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar, name, and date.
            Row(
              children: [
                // TODO (Enhancement 2): Use or change the avatar for the
                // user profile image. Replace the icon below with a
                // CircleAvatar using an AssetImage or NetworkImage.
                CircleAvatar(
                    radius: 20.r,
                    backgroundColor: AppColors.lightGrey,
                    backgroundImage: hasAvatar ? AssetImage(avatarAsset!) : null,
                  ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: authorName,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: date,
                      fontSize: 13,
                      color: AppColors.grey,
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz, color: AppColors.grey),
              ],
            ),
            SizedBox(height: 10.h),
            // Post text.
            CustomText(text: text),
            SizedBox(height: 10.h),
            // Post image, shown only when the post has one.
            // TODO (Enhancement 1): Use a widget for the area of images.
            // The Image widget shows the image only when imageAsset
            // is not null. See: Image class, widgets library, Dart API.
            // If the image file is missing, a grey placeholder shows.
            if (imageAsset != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  imageAsset!,
                  width: double.infinity,
                  height: 200.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 200.h,
                      color: AppColors.lightGrey,
                      alignment: Alignment.center,
                      child: const CustomText(
                        text: 'Post image',
                        color: AppColors.grey,
                      ),
                    );
                  },
                ),
              ),
            SizedBox(height: 10.h),
            // Likes, comments, and shares.
            Row(
              children: [
                const Icon(
                  Icons.thumb_up,
                  color: AppColors.facebookBlue,
                  size: 18,
                ),
                SizedBox(width: 4.w),
                CustomText(text: '$likes'),
                const Spacer(),
                const CustomText(
                  text: '42 Comments   5 Shares',
                  fontSize: 13,
                  color: AppColors.grey,
                ),
              ],
            ),
            const Divider(),
            // Like, Comment, and Share buttons.
            // TODO (Enhancement 3): Change the like and comment icon
            // buttons into widget-based buttons. They are already
            // widgets below; style them to match the example output.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ActionButton(
                  icon: Icons.thumb_up_outlined,
                  label: 'Like',
                  onTap: onLike,
                ),
                _ActionButton(
                  icon: Icons.comment_outlined,
                  label: 'Comment',
                  onTap: () {},
                ),
                _ActionButton(
                  icon: Icons.share_outlined,
                  label: 'Share',
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 8.h),
            // Write a comment field.
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: const CustomText(
                text: 'Write a comment...',
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// A small like, comment, or share button.
class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: AppColors.grey, size: 20),
          SizedBox(width: 6.w),
          CustomText(text: label, color: AppColors.grey),
        ],
      ),
    );
  }
}
