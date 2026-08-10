Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600E53FF1B4
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 16:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786379111; cv=none; b=gczL/bfwLEN4OPWBRL/krMjJFYZ0sL7kgTdokpdfbsu4XrZDJG14Gy/yUqB5TN5cv8myj/ZR0zwgD3b9/kNV13H6HGgzGh0MIKP5rgUorqwFkGRu5q8WE+6ijx5f5GmeFhK5lk1UQQWGgWUmiXd8o18/CyfmTGmgks2Nl9fB4OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786379111; c=relaxed/simple;
	bh=OZCxEQBO7ikSri3iF0la47hhuE+wTN4kRp4PymkIqxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KkNjVEs0bIRVfZHDD6yxlVzz4X0Es99hMZRNglJdChmYVOXAzAfGDj1hfm6NgvsUJZABPQcI/tk1jkDLyOZslTJcquvsrRqkqpY+axRxQLsUDtaVOZZwBWdVQf/VcRDAgOE1HUKkig5F/HFaePukD3X7KoxYukud/n96OEsiE/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3hIb1Hr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3hIb1Hr"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954aff6088so18825255e9.3
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 09:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786379108; x=1786983908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S9mz+YpW234KVCnAcTLehfIXdje5NCShU76DcD3h6sA=;
        b=I3hIb1HrziU1oDyngb0IcqVAfYGbOss3/hOydXKp8A9g1/devG12AZ442Y73AHZA6+
         SB8R9v4UVMgWSY1qTbm2H4qvzLNEPFG7iPdzJjZXgbfZFqo9GXJor/cnWgyKSf6Kq1Pu
         t6+fhVF4HtKOxfNX8vG/dVCVPKPkyWMmvESAYh6iXsUWhfvD6R2fJaqA1JRyWhiFbKli
         R1pmvtZiJNBHuibzOlaaB0e0W1ax+x4qnl7mblHxp/jUqUc71x0ZJtTul4nzwiIZxw6Z
         WNocS+bDYV3HIkhj7ixr6PRQ/Rm5k9NTkc9ES8rT8L82/SC3JoyI1G8+KFNFIqkiCIZR
         sPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786379108; x=1786983908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9mz+YpW234KVCnAcTLehfIXdje5NCShU76DcD3h6sA=;
        b=h+nXJnC6/KViUmx8sIyp/L2A/IFW87EmyHW9i6c8Ff7qKKQIkfXbCUKJoczvijBYnm
         3SEXHPSjglab4lgRx/dJhJp6QbkjLNnYZPyViJvf/19xaHgohhkhjlUvyltSrP10FVVi
         XKl5SYyZYI+3qCBfX4U5J4tnVGgdDfipBS4r6TW7v1NQN4d1W1Kh5ddJRqfUb/QrzXXg
         Wfj2RP0N34/zixNI1IK3KoTxL3qGGANjwoX9WUQUQtas7fmbIMm4QHmBKcEDbOiz4m3e
         ARuT6ssNmAwaP8YMheEcP4J7/GvuONmKFFnlCHVuTkKVx0w5Qbfk0OkX465scvuqv6t+
         Su0Q==
X-Gm-Message-State: AOJu0YyM7vO4hAy1XJ/yOZtBlhbHI/zTmZkHoi+lqtO5FVb5HcOlTpee
	DnceLiYyzHtBTLyyllab3RE/PcH6nxDUBn9SR8qACuGeY9MfTKtQpRQkg+4I+0EuISamzw==
X-Gm-Gg: AR+sD13exw4bQqUFU20sAuvr1LgNNs8iZuGlhpv8L8YhXpC5RprRA5NyxdniPKY1sj1
	OWiWH40hGXlF42uiP7wGgDZLglGuygzOcSUneJcw364koENT/3Dq/xvwlcaWwIR7WBfvL/i/WE5
	qUoSpUiGl1DRpZydrfh++CKdmQXGDREFdg9u/jJOnVjyNLwt+eFVXNLOLInKQrYlyJymDKwNIyO
	9FPUcfvqxDLVhkO0vlRa/Fl0B7D1CdLosyPTMbzKzguEZflSYTYsZJHZYmHqr6kNmuWeNc7uemN
	6b9vQtzT0oR1sEa9CyE9lKcOnouG9rZ0TdZSMK3pO5qYoAyfUMZKRtJYYwzxvYZUnkk6CYR3VS0
	cKWiEz1ne2qoZbS+EDTzmPP7Gvp5cQ0k2XKsj6oUz84g5MrdaXW99VHf2mcbsGUfzkrPC9nBA1a
	1KXGMv/PlvPBDGSqc3L/Kgc5WxCKugx9EQwyNCMSEf9xeWGs3WLV52RLrHAkU8uL5G08WJWCXqf
	jObGwxlJDvoxNe7zHw=
X-Received: by 2002:a05:600c:19c7:b0:493:faf3:3ea5 with SMTP id 5b1f17b1804b1-49972741746mr30685255e9.4.1786379107411;
        Mon, 10 Aug 2026 09:25:07 -0700 (PDT)
Received: from zephyr ([77.237.184.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-499740e13e3sm3218185e9.10.2026.08.10.09.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 09:25:06 -0700 (PDT)
From: Ali Nasrollahi <a.nasrolahi01@gmail.com>
X-Google-Original-From: Ali Nasrollahi <A.Nasrolahi01@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com,
	Frank.Li@nxp.com,
	hverkuil+cisco@kernel.org,
	guoniu.zhou@oss.nxp.com,
	Ali Nasrollahi <A.Nasrolahi01@gmail.com>
Subject: [PATCH] media: v4l2-core: make number of video devices configurable
Date: Mon, 10 Aug 2026 19:54:07 +0330
Message-ID: <20260810162406.118981-2-A.Nasrolahi01@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The V4L2 core currently limits the number of registered video devices to
256. This can become a restriction for workloads that create a large
number of virtual video devices, such as v4l2loopback instances.

Make the maximum number of video devices configurable through a module
parameter. The default and minimum remain at the existing limit of 256,
while the maximum is capped at 4096.

The parameter is only available when CONFIG_VIDEO_FIXED_MINOR_RANGES is
disabled, as the fixed minor allocation scheme relies on the existing
minor ranges.

The device array is allocated according to the configured limit, while
the allocation bitmaps remain statically sized to the maximum supported
limit of 4096.

Signed-off-by: Ali Nasrollahi <A.Nasrolahi01@gmail.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 70 +++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 15 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index fd267fb74905..5a526b577970 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -31,7 +31,8 @@
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-event.h>
 
-#define VIDEO_NUM_DEVICES	256
+#define VIDEO_MIN_NUM_DEVICES	256
+#define VIDEO_MAX_NUM_DEVICES	4096
 #define VIDEO_NAME              "video4linux"
 
 #define dprintk(fmt, arg...) do {					\
@@ -39,6 +40,27 @@
 		       __func__, ##arg);				\
 } while (0)
 
+static unsigned int video_nr_devices = VIDEO_MIN_NUM_DEVICES;
+
+#ifndef CONFIG_VIDEO_FIXED_MINOR_RANGES
+static int param_set_video_nr_devices(const char *val,
+				      const struct kernel_param *kp)
+{
+	return param_set_uint_minmax(val, kp, VIDEO_MIN_NUM_DEVICES,
+				     VIDEO_MAX_NUM_DEVICES);
+}
+
+static const struct kernel_param_ops param_ops_video_nr_devices = {
+	.set = param_set_video_nr_devices,
+	.get = param_get_uint,
+};
+
+module_param_cb(video_nr_devices, &param_ops_video_nr_devices,
+		&video_nr_devices, 0444);
+
+MODULE_PARM_DESC(video_nr_devices, "Maximum number of V4L2 devices (256-4096)");
+#endif
+
 /*
  *	sysfs stuff
  */
@@ -98,9 +120,14 @@ static struct dentry *v4l2_debugfs_root_dir;
 /*
  *	Active devices
  */
-static struct video_device *video_devices[VIDEO_NUM_DEVICES];
+#ifdef CONFIG_VIDEO_FIXED_MINOR_RANGES
+static struct video_device *video_devices[VIDEO_MIN_NUM_DEVICES];
+static DECLARE_BITMAP(devnode_nums[VFL_TYPE_MAX], VIDEO_MIN_NUM_DEVICES);
+#else
+static struct video_device **video_devices;
+static DECLARE_BITMAP(devnode_nums[VFL_TYPE_MAX], VIDEO_MAX_NUM_DEVICES);
+#endif
 static DEFINE_MUTEX(videodev_lock);
-static DECLARE_BITMAP(devnode_nums[VFL_TYPE_MAX], VIDEO_NUM_DEVICES);
 
 /* Device node utility functions */
 
@@ -504,7 +531,7 @@ static const struct file_operations v4l2_fops = {
  * in the video_device array, but it was able to obtain a minor number.
  *
  * This means that we can always obtain a free stream index number since
- * the worst case scenario is that there are VIDEO_NUM_DEVICES - 1 slots in
+ * the worst case scenario is that there are video_nr_devices - 1 slots in
  * use of the video_device array.
  *
  * Returns a free index number.
@@ -513,19 +540,19 @@ static int get_index(struct video_device *vdev)
 {
 	/* This can be static since this function is called with the global
 	   videodev_lock held. */
-	static DECLARE_BITMAP(used, VIDEO_NUM_DEVICES);
+	static DECLARE_BITMAP(used, VIDEO_MAX_NUM_DEVICES);
 	int i;
 
-	bitmap_zero(used, VIDEO_NUM_DEVICES);
+	bitmap_zero(used, VIDEO_MAX_NUM_DEVICES);
 
-	for (i = 0; i < VIDEO_NUM_DEVICES; i++) {
+	for (i = 0; i < video_nr_devices; i++) {
 		if (video_devices[i] != NULL &&
 		    video_devices[i]->v4l2_dev == vdev->v4l2_dev) {
 			__set_bit(video_devices[i]->index, used);
 		}
 	}
 
-	return find_first_zero_bit(used, VIDEO_NUM_DEVICES);
+	return find_first_zero_bit(used, video_nr_devices);
 }
 
 #define SET_VALID_IOCTL(ops, cmd, op) \
@@ -915,7 +942,7 @@ int __video_register_device(struct video_device *vdev,
 	int i = 0;
 	int ret;
 	int minor_offset = 0;
-	int minor_cnt = VIDEO_NUM_DEVICES;
+	int minor_cnt = video_nr_devices;
 	const char *name_base;
 
 	/* A minor value of -1 marks this video device as never
@@ -1020,10 +1047,10 @@ int __video_register_device(struct video_device *vdev,
 #else
 	/* The device node number and minor numbers are independent, so
 	   we just find the first free minor number. */
-	for (i = 0; i < VIDEO_NUM_DEVICES; i++)
+	for (i = 0; i < video_nr_devices; i++)
 		if (video_devices[i] == NULL)
 			break;
-	if (i == VIDEO_NUM_DEVICES) {
+	if (i == video_nr_devices) {
 		mutex_unlock(&videodev_lock);
 		pr_err("could not get a free minor\n");
 		return -ENFILE;
@@ -1032,7 +1059,7 @@ int __video_register_device(struct video_device *vdev,
 	vdev->minor = i + minor_offset;
 	vdev->num = nr;
 
-	if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
+	if (WARN_ON(vdev->minor >= video_nr_devices)) {
 		mutex_unlock(&videodev_lock);
 		return -EINVAL;
 	}
@@ -1241,7 +1268,7 @@ static int __init videodev_init(void)
 	int ret;
 
 	pr_info("Linux video capture interface: v2.00\n");
-	ret = register_chrdev_region(dev, VIDEO_NUM_DEVICES, VIDEO_NAME);
+	ret = register_chrdev_region(dev, video_nr_devices, VIDEO_NAME);
 	if (ret < 0) {
 		pr_warn("videodev: unable to get major %d\n",
 				VIDEO_MAJOR);
@@ -1250,11 +1277,21 @@ static int __init videodev_init(void)
 
 	ret = class_register(&video_class);
 	if (ret < 0) {
-		unregister_chrdev_region(dev, VIDEO_NUM_DEVICES);
+		unregister_chrdev_region(dev, video_nr_devices);
 		pr_warn("video_dev: class_register failed\n");
 		return -EIO;
 	}
 
+#ifndef CONFIG_VIDEO_FIXED_MINOR_RANGES
+	video_devices = kzalloc_objs(*video_devices, video_nr_devices);
+	if (!video_devices) {
+		class_unregister(&video_class);
+		unregister_chrdev_region(dev, video_nr_devices);
+		pr_warn("video_dev: failed to allocate video_devices\n");
+		return -ENOMEM;
+	}
+#endif
+
 	return 0;
 }
 
@@ -1262,8 +1299,11 @@ static void __exit videodev_exit(void)
 {
 	dev_t dev = MKDEV(VIDEO_MAJOR, 0);
 
+#ifndef CONFIG_VIDEO_FIXED_MINOR_RANGES
+	kvfree(video_devices);
+#endif
 	class_unregister(&video_class);
-	unregister_chrdev_region(dev, VIDEO_NUM_DEVICES);
+	unregister_chrdev_region(dev, video_nr_devices);
 	debugfs_remove_recursive(v4l2_debugfs_root_dir);
 	v4l2_debugfs_root_dir = NULL;
 }
-- 
2.55.0

