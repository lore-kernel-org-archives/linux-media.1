Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7742D94BA;
	Mon, 20 Jul 2026 02:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516119; cv=none; b=Ol3x9rt/0DLZl8nd+53Bdk6ZP7WoM/PM5JnOaGvRRrB9TilvqO/pSn70NEFmliHHTJ/ojR05TRQTmUzn4vJ7pSO2qKpZxkIWp9uO5g2LyR/fuwA0cJf/1j4zOx5e7tq0SiWVqfDO9GOskPCIAxvM2v9wmH+OZFBYw9FSRRdRIfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516119; c=relaxed/simple;
	bh=2YIieWuP7AeigHxzRyf2683bP5bK+BOZGBQqcb2PYVo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FOBEsla5fxogWLP2R6Dj/mU/RQXPVO0t47sbpppUPjPgpAj6l304jRkJDtkHmOfYfuu7Vfu409Cl1hKSOD9+8C7EwdQxqxMeiDrMhxDifDy2T16p1HXq76+9WvAbvMSHgNrqficp/5CreOTVc9NnT0PskI3Qu++sel6sJMq+ilg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=HfacBBLX; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HfacBBLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=y0
	qoNGo3zAUD4ghJXQGTMVvLR2N4yxQeUkJY4IHyJJY=; b=HfacBBLXgg4/+bfuBr
	Nqlc7TjUjUSxNe78rzh2PSkev2D7+kRNS2D9DTZnr7VSICFatNvksRW+g/KHqkK2
	90A+aYZIf+lIqvMldJMzaBI7xypU6DwAfH/y5v/RybgE/imIxE17UZ41glskeba+
	khM4K4T1mFpFA8HmvvG3X8vuI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3v5rwjV1qaGtIJQ--.123S7;
	Mon, 20 Jul 2026 10:54:50 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v2 05/17] media: s2255: Replace NULL comparisons with ! notation
Date: Mon, 20 Jul 2026 10:54:34 +0800
Message-Id: <20260720025438.207149-6-huanglei814@163.com>
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
X-CM-TRANSID:_____wD3v5rwjV1qaGtIJQ--.123S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr1DGFW7Cw45Wr4fury3urg_yoWruFWxpa
	yagFZ5trW8try7Zrn3JF48WryYvwn3t3y2kFW7u3ykAr15J3s8Xw43GryIyr92krZayw13
	Jrs8Xr1UurWDKF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URCJQUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC0RqTimpdjfrNXgAA3B

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

