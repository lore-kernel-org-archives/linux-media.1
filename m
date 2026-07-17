Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BDA3B71BB;
	Fri, 17 Jul 2026 09:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280280; cv=none; b=K4VX6/qb77c0IfQRXhFgO0qyd4P3Zb0MPtK+FctFk3NT420WnEl3zWwyIqN1RUcj6LCddzEtjxonOCuiOkTgoGtmVOfN195yOabu+36wUUHNSij8zCYDcnyc8t/3OPr/eqvEBfQC6b+OcjlRVQ5obdNgiKt6WLKLkPsSSukywM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280280; c=relaxed/simple;
	bh=2YIieWuP7AeigHxzRyf2683bP5bK+BOZGBQqcb2PYVo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mbo7YjUnbCYcWTmyN3dOvX5L8yme4x0Q5LZa1f1WjcknDGptT4vxkl6EOw3lOjTw6CYuswisMwW/iaf+sZAnbOwyev9xOE+z9PJ3mIyMtc6dOpEo9WgkyGXpo4oEzOnDfqppArl35fpBjviEPaJnUN3AHgA5IrVL36Lr3mMvvYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YOA+AxI8; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YOA+AxI8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=y0
	qoNGo3zAUD4ghJXQGTMVvLR2N4yxQeUkJY4IHyJJY=; b=YOA+AxI8Hi1k7slIP/
	LY/ZR3U+r4Ijn+GRNHWihjIZIcb1KsxroCxJHN8Z32nF149s91Dc04+oGncSiQ2y
	4yoU87JmBgexA7GElrgq8BxmiF62Z1Q0pgf4VJtg04ZjuJOmLYGTXxd3DC/AARSQ
	YMWqFuXKS2oHt+IjY70FzCu/4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCnESG+9Flq5w+gHg--.17942S6;
	Fri, 17 Jul 2026 17:24:23 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH 04/16] media: s2255: Replace NULL comparisons with ! notation
Date: Fri, 17 Jul 2026 17:23:37 +0800
Message-Id: <20260717092349.684342-5-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260717092349.684342-1-huanglei814@163.com>
References: <20260717092349.684342-1-huanglei814@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgCnESG+9Flq5w+gHg--.17942S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr1DGFW7Cw45Wr4fury3urg_yoWruFWxpa
	yagFZ5trW8try7Zrn3JF48WryYvwn3t3y2kFW7u3ykAr15J3s8Xw43GryIyr92krZayw13
	Jrs8Xr1UurWDKF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U_EfrUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC0QdfVmpZ9MengwAA37

From: Lei Huang <huanglei@kylinos.cn>

Fix all 15 'CHECK: Comparison to NULL could be written' issues reported by
checkpatch.pl in s2255drv.c. Replace 'x == NULL' with '!x' for pointer
NULL checks.

Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index a759ba9a6d51..4df558a7b8b3 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -501,7 +501,7 @@ static void s2255_fwchunk_complete(struct urb *urb)
 		wake_up(&data->wait_fw);
 		return;
 	}
-	if (data->fw_urb == NULL) {
+	if (!data->fw_urb) {
 		s2255_dev_err(&udev->dev, "disconnected\n");
 		atomic_set(&data->fw_state, S2255_FW_FAILED);
 		/* wake up anything waiting for the firmware */
@@ -664,7 +664,7 @@ static int buffer_prepare(struct vb2_buffer *vb)
 	unsigned long size;
 
 	dprintk(vc->dev, 4, "%s\n", __func__);
-	if (vc->fmt == NULL)
+	if (!vc->fmt)
 		return -EINVAL;
 
 	if ((w < norm_minw(vc)) ||
@@ -763,7 +763,7 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 
 	fmt = format_by_fourcc(f->fmt.pix.pixelformat);
 
-	if (fmt == NULL)
+	if (!fmt)
 		return -EINVAL;
 
 	dprintk(vc->dev, 50, "%s NTSC: %d suggested width: %d, height: %d\n",
@@ -820,7 +820,7 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 
 	fmt = format_by_fourcc(f->fmt.pix.pixelformat);
 
-	if (fmt == NULL)
+	if (!fmt)
 		return -EINVAL;
 
 	if (vb2_is_busy(q)) {
@@ -904,7 +904,7 @@ static u32 get_transfer_size(struct s2255_mode *mode)
 	u32 usb_in_size;
 	unsigned int mask_mult;
 
-	if (mode == NULL)
+	if (!mode)
 		return 0;
 
 	if (mode->format == FORMAT_NTSC) {
@@ -1358,7 +1358,7 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 		return -EINVAL;
 
 	fmt = format_by_fourcc(fe->pixel_format);
-	if (fmt == NULL)
+	if (!fmt)
 		return -EINVAL;
 	fe->type = V4L2_FRMSIZE_TYPE_DISCRETE;
 	fe->discrete = is_ntsc ?  ntsc_sizes[fe->index] : pal_sizes[fe->index];
@@ -1380,7 +1380,7 @@ static int vidioc_enum_frameintervals(struct file *file, void *priv,
 		return -EINVAL;
 
 	fmt = format_by_fourcc(fe->pixel_format);
-	if (fmt == NULL)
+	if (!fmt)
 		return -EINVAL;
 
 	sizes = is_ntsc ? ntsc_sizes : pal_sizes;
@@ -1806,7 +1806,7 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 	psrc = (u8 *)pipe_info->transfer_buffer + offset;
 
 
-	if (frm->lpvbits == NULL) {
+	if (!frm->lpvbits) {
 		dprintk(dev, 1, "s2255 frame buffer == NULL.%p %p %d %d",
 			frm, dev, dev->cc, idx);
 		return -ENOMEM;
@@ -1937,7 +1937,7 @@ static int s2255_create_sys_buffers(struct s2255_vc *vc)
 		/* allocate the frames */
 		vc->buffer.frame[i].lpvbits = vmalloc(reqsize);
 		vc->buffer.frame[i].size = reqsize;
-		if (vc->buffer.frame[i].lpvbits == NULL) {
+		if (!vc->buffer.frame[i].lpvbits) {
 			pr_info("out of memory.  using less frames\n");
 			vc->buffer.num_frames = i;
 			break;
@@ -1979,7 +1979,7 @@ static int s2255_board_init(struct s2255_dev *dev)
 
 	pipe->transfer_buffer = kzalloc(pipe->max_transfer_size,
 					GFP_KERNEL);
-	if (pipe->transfer_buffer == NULL) {
+	if (!pipe->transfer_buffer) {
 		dprintk(dev, 1, "out of memory!\n");
 		return -ENOMEM;
 	}
@@ -2039,12 +2039,12 @@ static void read_pipe_completion(struct urb *purb)
 	int status;
 	int pipe;
 	pipe_info = purb->context;
-	if (pipe_info == NULL) {
+	if (!pipe_info) {
 		dev_err(&purb->dev->dev, "no context!\n");
 		return;
 	}
 	dev = pipe_info->dev;
-	if (dev == NULL) {
+	if (!dev) {
 		dev_err(&purb->dev->dev, "no context!\n");
 		return;
 	}
@@ -2211,13 +2211,13 @@ static int s2255_probe(struct usb_interface *interface,
 
 	/* allocate memory for our device state and initialize it to zero */
 	dev = kzalloc_obj(struct s2255_dev);
-	if (dev == NULL) {
+	if (!dev) {
 		s2255_dev_err(&interface->dev, "out of memory\n");
 		return -ENOMEM;
 	}
 
 	dev->cmdbuf = kzalloc(S2255_CMDBUF_SIZE, GFP_KERNEL);
-	if (dev->cmdbuf == NULL) {
+	if (!dev->cmdbuf) {
 		s2255_dev_err(&interface->dev, "out of memory\n");
 		goto err_fwdata1;
 	}
@@ -2231,7 +2231,7 @@ static int s2255_probe(struct usb_interface *interface,
 	mutex_init(&dev->cmdlock);
 	/* grab usb_device and save it */
 	dev->udev = usb_get_dev(interface_to_usbdev(interface));
-	if (dev->udev == NULL) {
+	if (!dev->udev) {
 		dev_err(&interface->dev, "null usb device\n");
 		retval = -ENODEV;
 		goto err_udev;
-- 
2.25.1

