Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF40D2DC767;
	Mon, 20 Jul 2026 02:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516120; cv=none; b=kpkmzvLDPp5QpXqMronLHxbGBazXYa3MUotpUY6QNmLP+QDXH4m0xzSxZxv+YBUOqB3OeJ4nJTpqOWMQp+65SCBM3WRNUW8kkBLm7d77dGhapGru8npDT72leCmDnyyhm7B+62EdkyqKRcqWJNyUOjYy3K1JdacAQgzMif3sNxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516120; c=relaxed/simple;
	bh=6yumHfCo3RyYbivrt06kRUv9ZT5D+VT/PZvoD6jq14k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mRnzwKEVP26Z+EzPwegPNoyoi/cbpa8mE97E3omiw3dQFQ7iRLAwfI5VjKXWd0UoO83upmlyv/KHmY7ccNghVCcWr5Rxznvl7nBhvkzHJL8Z6SgT/bNHdxpiDD4WDzjPyussi6Br+rtn9+qlv+Os6fK6LWcYbTN5cKNZzJLfxzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=eaUejjMG; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="eaUejjMG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=fP
	Fmfum7TLcFkxwOaE03ywicc1Ax55XWHhoItc8IsrU=; b=eaUejjMGnyn4HyT/oy
	0ZwSXCSiWf2VAtUoDKZpN+tvGp9nTL6GIzyVpjTcKjtFMIXPAS2rpz3WnVoW0DcY
	BHTvLM/0ahG3+1r5gRie21mNV38E5e3w7AhIGmLknZ5iUz8lX0jVofc5XopZY1nf
	hscG8qMdkRVI0yCRxG3ePUwnc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3v5rwjV1qaGtIJQ--.123S8;
	Mon, 20 Jul 2026 10:54:51 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v2 06/17] media: s2255: Fix alignment to match open parenthesis
Date: Mon, 20 Jul 2026 10:54:35 +0800
Message-Id: <20260720025438.207149-7-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260720025438.207149-1-huanglei814@163.com>
References: <20260720025438.207149-1-huanglei814@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v5rwjV1qaGtIJQ--.123S8
X-Coremail-Antispam: 1Uf129KBjvJXoW3JF17JF48Jr18ZF45tFy3CFg_yoW7Xr4DpF
	Z5W3WDtr1UJr1rWw48tF4UuF1a9wn7tr4Y9FWrW348Wrnakr95WFZ3Kas2yrZIkFyIk3Zr
	tws0qrW5Cryjyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jcb1bUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC0RuTimpdjfvNbwAA3w

From: Lei Huang <huanglei@kylinos.cn>

Fix all 16 'CHECK: Alignment should match open parenthesis' issues
reported by checkpatch.pl in s2255drv.c. Adjust continuation line
indentation in function declarations, if-conditions, function calls,
and block comments to properly align with the opening parenthesis.

Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 36 +++++++++++++++---------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 4df558a7b8b3..f3e4bd069f1c 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -720,21 +720,21 @@ static int vidioc_querycap(struct file *file, void *priv,
 }
 
 static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
-			       struct v4l2_fmtdesc *f)
+				   struct v4l2_fmtdesc *f)
 {
 	int index = f->index;
 
 	if (index >= ARRAY_SIZE(formats))
 		return -EINVAL;
 	if (!jpeg_enable && ((formats[index].fourcc == V4L2_PIX_FMT_JPEG) ||
-			(formats[index].fourcc == V4L2_PIX_FMT_MJPEG)))
+			     (formats[index].fourcc == V4L2_PIX_FMT_MJPEG)))
 		return -EINVAL;
 	f->pixelformat = formats[index].fourcc;
 	return 0;
 }
 
 static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
-			    struct v4l2_format *f)
+				struct v4l2_format *f)
 {
 	struct s2255_vc *vc = video_drvdata(file);
 	int is_ntsc = vc->std & V4L2_STD_525_60;
@@ -754,7 +754,7 @@ static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 }
 
 static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
-			      struct v4l2_format *f)
+				  struct v4l2_format *f)
 {
 	const struct s2255_fmt *fmt;
 	enum v4l2_field field;
@@ -805,7 +805,7 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 }
 
 static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
-			    struct v4l2_format *f)
+				struct v4l2_format *f)
 {
 	struct s2255_vc *vc = video_drvdata(file);
 	const struct s2255_fmt *fmt;
@@ -1234,7 +1234,7 @@ static int s2255_s_ctrl(struct v4l2_ctrl *ctrl)
 }
 
 static int vidioc_g_jpegcomp(struct file *file, void *priv,
-			 struct v4l2_jpegcompression *jc)
+			     struct v4l2_jpegcompression *jc)
 {
 	struct s2255_vc *vc = video_drvdata(file);
 
@@ -1245,7 +1245,7 @@ static int vidioc_g_jpegcomp(struct file *file, void *priv,
 }
 
 static int vidioc_s_jpegcomp(struct file *file, void *priv,
-			 const struct v4l2_jpegcompression *jc)
+			     const struct v4l2_jpegcompression *jc)
 {
 	struct s2255_vc *vc = video_drvdata(file);
 
@@ -1348,7 +1348,7 @@ static const struct v4l2_frmsize_discrete pal_sizes[] = {
 };
 
 static int vidioc_enum_framesizes(struct file *file, void *priv,
-			    struct v4l2_frmsizeenum *fe)
+				  struct v4l2_frmsizeenum *fe)
 {
 	struct s2255_vc *vc = video_drvdata(file);
 	int is_ntsc = vc->std & V4L2_STD_525_60;
@@ -1366,7 +1366,7 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 }
 
 static int vidioc_enum_frameintervals(struct file *file, void *priv,
-			    struct v4l2_frmivalenum *fe)
+				      struct v4l2_frmivalenum *fe)
 {
 	struct s2255_vc *vc = video_drvdata(file);
 	const struct s2255_fmt *fmt;
@@ -1418,7 +1418,7 @@ static int s2255_open(struct file *file)
 		return -ENODEV;
 	case S2255_FW_FAILED:
 		s2255_dev_err(&dev->udev->dev,
-			"firmware load failed. retrying.\n");
+			      "firmware load failed. retrying.\n");
 		s2255_fwload_start(dev);
 		wait_event_timeout(dev->fw_data->wait_fw,
 				   ((atomic_read(&dev->fw_data->fw_state)
@@ -1601,17 +1601,17 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
 
 		v4l2_ctrl_handler_init(&vc->hdl, 6);
 		v4l2_ctrl_new_std(&vc->hdl, &s2255_ctrl_ops,
-				V4L2_CID_BRIGHTNESS, -127, 127, 1, DEF_BRIGHT);
+				  V4L2_CID_BRIGHTNESS, -127, 127, 1, DEF_BRIGHT);
 		v4l2_ctrl_new_std(&vc->hdl, &s2255_ctrl_ops,
-				V4L2_CID_CONTRAST, 0, 255, 1, DEF_CONTRAST);
+				  V4L2_CID_CONTRAST, 0, 255, 1, DEF_CONTRAST);
 		v4l2_ctrl_new_std(&vc->hdl, &s2255_ctrl_ops,
-				V4L2_CID_SATURATION, 0, 255, 1, DEF_SATURATION);
+				  V4L2_CID_SATURATION, 0, 255, 1, DEF_SATURATION);
 		v4l2_ctrl_new_std(&vc->hdl, &s2255_ctrl_ops,
-				V4L2_CID_HUE, 0, 255, 1, DEF_HUE);
+				  V4L2_CID_HUE, 0, 255, 1, DEF_HUE);
 		vc->jpegqual_ctrl = v4l2_ctrl_new_std(&vc->hdl,
-				&s2255_ctrl_ops,
-				V4L2_CID_JPEG_COMPRESSION_QUALITY,
-				0, 100, 1, S2255_DEF_JPEG_QUAL);
+						      &s2255_ctrl_ops,
+						      V4L2_CID_JPEG_COMPRESSION_QUALITY,
+						      0, 100, 1, S2255_DEF_JPEG_QUAL);
 		if (dev->dsp_fw_ver >= S2255_MIN_DSP_COLORFILTER &&
 		    (dev->pid != 0x2257 || vc->idx <= 1))
 			v4l2_ctrl_new_custom(&vc->hdl, &color_filter_ctrl,
@@ -2301,7 +2301,7 @@ static int s2255_probe(struct usb_interface *interface,
 		if (dev->dsp_fw_ver < S2255_CUR_DSP_FWVER)
 			pr_info("s2255: f2255usb.bin out of date.\n");
 		if (dev->pid == 0x2257 &&
-				dev->dsp_fw_ver < S2255_MIN_DSP_COLORFILTER)
+		    dev->dsp_fw_ver < S2255_MIN_DSP_COLORFILTER)
 			pr_warn("2257 needs firmware %d or above.\n",
 				S2255_MIN_DSP_COLORFILTER);
 	}
-- 
2.25.1

