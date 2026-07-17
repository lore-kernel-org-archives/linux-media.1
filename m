Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AFB3C061C;
	Fri, 17 Jul 2026 09:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280291; cv=none; b=GqYK1d+HQGoW0HQIGUSk+TK1aYVYSgJIh4yMFgEfzT6rf6xEhUrQ6Mjz98nlOv0sY67JcJJvAMmpUbSoyX95GBkjWS50RbI2yfMfsk08ioYhorhqjNelX0Ze77Ujfnylxjy+2S01zzsXgH21Wm83KUTk+nkPOtACANxD1ggRZN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280291; c=relaxed/simple;
	bh=8y/rWWDFfo+fHuVBOWu0Aknjuype/jk33qDbe3MIv3E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CmvJuZ9Wo8Ft9wJNFj4+DRHTjSiC3psVN5S5EgV5C1uLXTM/m8q8iGWY8Vv4Lr/gDLmdZtTrCOxnXs5zq5KEaSjainrvZwdfxEWdBFyJyrB1FSpCeK6gC8c5l9rhtCeRcFf5ODv3rpgh3l2TXQda6oAbwZ+bMYQdq4/gIiMtUL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZVErpIds; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZVErpIds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=aV
	U/VDBXJmWW7gqj2wSCfqF0qmfwsioCAZ9w6gfg81E=; b=ZVErpIdsHVEpnI2EqX
	mesLXUsE6tnnpzlCS0GIoPN10uV2NQaXFN4y3XEhD+M/gtPikp7x+HgLPfXV80yZ
	2diKfDfBprnRxkCGke0U/A6UQC+orgUXFaYSxDVBx8aSvWTnh3PKHMGUqUxazn+h
	gUxZXRD9WKh4rCaZg+RICgwfg=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCnESG+9Flq5w+gHg--.17942S3;
	Fri, 17 Jul 2026 17:24:18 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH 01/16] media: s2255: Rename remaining CamelCase identifiers to snake_case
Date: Fri, 17 Jul 2026 17:23:34 +0800
Message-Id: <20260717092349.684342-2-huanglei814@163.com>
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
X-CM-TRANSID:QCgvCgCnESG+9Flq5w+gHg--.17942S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3uF4ftr4DCryfZF4xtFWkZwb_yoWkZFWrpF
	4rtFs0yr4Dta4UA3s3Cr1rZ345XFnrJ3y7KFW3C3sYgFyUJrykXF9rA3yIvryDAr929a4f
	CFs8Wr17CayDtaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UtrchUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC0QJeVWpZ9MKnJQAA3f

From: Lei Huang <huanglei@kylinos.cn>

Rename CamelCase identifiers throughout s2255drv.c to comply with the
Linux kernel coding style. All identifiers are local to this file
(no header file or cross-file references).

Struct members:
  ulState      -> state
  dwFrames     -> num_frames

Function parameters (s2255_vendor_req, also updating the forward
declaration to match):
  Request              -> req
  Index                -> index
  Value                -> value
  TransferBuffer       -> xfer_buf
  TransferBufferLength -> xfer_buf_len
  bOut                 -> is_out

Local variables:
  pY/pCb/pCr           -> p_y/p_cb/p_cr
  linesPerFrame        -> lines_per_frame
  pixelsPerLine        -> pixels_per_line
  outImageSize         -> out_image_size
  usbInSize            -> usb_in_size
  transBuffer          -> trans_buf
  pRel                 -> p_rel

No functional changes.

Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 139 +++++++++++++++--------------
 1 file changed, 70 insertions(+), 69 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 64140b780e63..0f98a4cc18a4 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -151,14 +151,14 @@ struct s2255_mode {
 /* frame structure */
 struct s2255_framei {
 	unsigned long size;
-	unsigned long ulState;	/* ulState:S2255_READ_IDLE, S2255_READ_FRAME*/
+	unsigned long state;	/* state:S2255_READ_IDLE, S2255_READ_FRAME*/
 	void *lpvbits;		/* image data */
 	unsigned long cur_size;	/* current data copied to it */
 };
 
 /* image buffer structure */
 struct s2255_bufferi {
-	unsigned long dwFrames;			/* number of frames in buffer */
+	unsigned long num_frames;			/* number of frames in buffer */
 	struct s2255_framei frame[SYS_FRAMES];	/* array of FRAME structures */
 };
 
@@ -343,8 +343,8 @@ static int s2255_board_shutdown(struct s2255_dev *dev);
 static void s2255_fwload_start(struct s2255_dev *dev);
 static void s2255_destroy(struct s2255_dev *dev);
 static long s2255_vendor_req(struct s2255_dev *dev, unsigned char req,
-			     u16 index, u16 value, void *buf,
-			     s32 buf_len, int bOut);
+			     u16 index, u16 value, void *xfer_buf,
+			     s32 xfer_buf_len, int is_out);
 
 /* dev_err macro with driver name */
 #define S2255_DRIVER_NAME "s2255"
@@ -440,19 +440,19 @@ static void planar422p_to_yuv_packed(const unsigned char *in,
 				     int width, int height,
 				     int fmt)
 {
-	unsigned char *pY;
-	unsigned char *pCb;
-	unsigned char *pCr;
+	unsigned char *p_y;
+	unsigned char *p_cb;
+	unsigned char *p_cr;
 	unsigned long size = height * width;
 	unsigned int i;
-	pY = (unsigned char *)in;
-	pCr = (unsigned char *)in + height * width;
-	pCb = (unsigned char *)in + height * width + (height * width / 2);
+	p_y = (unsigned char *)in;
+	p_cr = (unsigned char *)in + height * width;
+	p_cb = (unsigned char *)in + height * width + (height * width / 2);
 	for (i = 0; i < size * 2; i += 4) {
-		out[i] = (fmt == V4L2_PIX_FMT_YUYV) ? *pY++ : *pCr++;
-		out[i + 1] = (fmt == V4L2_PIX_FMT_YUYV) ? *pCr++ : *pY++;
-		out[i + 2] = (fmt == V4L2_PIX_FMT_YUYV) ? *pY++ : *pCb++;
-		out[i + 3] = (fmt == V4L2_PIX_FMT_YUYV) ? *pCb++ : *pY++;
+		out[i] = (fmt == V4L2_PIX_FMT_YUYV) ? *p_y++ : *p_cr++;
+		out[i + 1] = (fmt == V4L2_PIX_FMT_YUYV) ? *p_cr++ : *p_y++;
+		out[i + 2] = (fmt == V4L2_PIX_FMT_YUYV) ? *p_y++ : *p_cb++;
+		out[i + 3] = (fmt == V4L2_PIX_FMT_YUYV) ? *p_cb++ : *p_y++;
 	}
 	return;
 }
@@ -896,10 +896,10 @@ static int s2255_write_config(struct usb_device *udev, unsigned char *pbuf,
 
 static u32 get_transfer_size(struct s2255_mode *mode)
 {
-	int linesPerFrame = LINE_SZ_DEF;
-	int pixelsPerLine = NUM_LINES_DEF;
-	u32 outImageSize;
-	u32 usbInSize;
+	int lines_per_frame = LINE_SZ_DEF;
+	int pixels_per_line = NUM_LINES_DEF;
+	u32 out_image_size;
+	u32 usb_in_size;
 	unsigned int mask_mult;
 
 	if (mode == NULL)
@@ -909,16 +909,16 @@ static u32 get_transfer_size(struct s2255_mode *mode)
 		switch (mode->scale) {
 		case SCALE_4CIFS:
 		case SCALE_4CIFSI:
-			linesPerFrame = NUM_LINES_4CIFS_NTSC * 2;
-			pixelsPerLine = LINE_SZ_4CIFS_NTSC;
+			lines_per_frame = NUM_LINES_4CIFS_NTSC * 2;
+			pixels_per_line = LINE_SZ_4CIFS_NTSC;
 			break;
 		case SCALE_2CIFS:
-			linesPerFrame = NUM_LINES_2CIFS_NTSC;
-			pixelsPerLine = LINE_SZ_2CIFS_NTSC;
+			lines_per_frame = NUM_LINES_2CIFS_NTSC;
+			pixels_per_line = LINE_SZ_2CIFS_NTSC;
 			break;
 		case SCALE_1CIFS:
-			linesPerFrame = NUM_LINES_1CIFS_NTSC;
-			pixelsPerLine = LINE_SZ_1CIFS_NTSC;
+			lines_per_frame = NUM_LINES_1CIFS_NTSC;
+			pixels_per_line = LINE_SZ_1CIFS_NTSC;
 			break;
 		default:
 			break;
@@ -927,35 +927,35 @@ static u32 get_transfer_size(struct s2255_mode *mode)
 		switch (mode->scale) {
 		case SCALE_4CIFS:
 		case SCALE_4CIFSI:
-			linesPerFrame = NUM_LINES_4CIFS_PAL * 2;
-			pixelsPerLine = LINE_SZ_4CIFS_PAL;
+			lines_per_frame = NUM_LINES_4CIFS_PAL * 2;
+			pixels_per_line = LINE_SZ_4CIFS_PAL;
 			break;
 		case SCALE_2CIFS:
-			linesPerFrame = NUM_LINES_2CIFS_PAL;
-			pixelsPerLine = LINE_SZ_2CIFS_PAL;
+			lines_per_frame = NUM_LINES_2CIFS_PAL;
+			pixels_per_line = LINE_SZ_2CIFS_PAL;
 			break;
 		case SCALE_1CIFS:
-			linesPerFrame = NUM_LINES_1CIFS_PAL;
-			pixelsPerLine = LINE_SZ_1CIFS_PAL;
+			lines_per_frame = NUM_LINES_1CIFS_PAL;
+			pixels_per_line = LINE_SZ_1CIFS_PAL;
 			break;
 		default:
 			break;
 		}
 	}
-	outImageSize = linesPerFrame * pixelsPerLine;
+	out_image_size = lines_per_frame * pixels_per_line;
 	if ((mode->color & MASK_COLOR) != COLOR_Y8) {
 		/* 2 bytes/pixel if not monochrome */
-		outImageSize *= 2;
+		out_image_size *= 2;
 	}
 
 	/* total bytes to send including prefix and 4K padding;
 	   must be a multiple of USB_READ_SIZE */
-	usbInSize = outImageSize + PREFIX_SIZE;	/* always send prefix */
+	usb_in_size = out_image_size + PREFIX_SIZE;	/* always send prefix */
 	mask_mult = 0xffffffffUL - DEF_USB_BLOCK + 1;
 	/* if size not a multiple of USB_READ_SIZE */
-	if (usbInSize & ~mask_mult)
-		usbInSize = (usbInSize & mask_mult) + (DEF_USB_BLOCK);
-	return usbInSize;
+	if (usb_in_size & ~mask_mult)
+		usb_in_size = (usb_in_size & mask_mult) + (DEF_USB_BLOCK);
+	return usb_in_size;
 }
 
 static void s2255_print_cfg(struct s2255_dev *sdev, struct s2255_mode *mode)
@@ -1066,7 +1066,7 @@ static int start_streaming(struct vb2_queue *vq, unsigned int count)
 	vc->cur_frame = 0;
 	vc->frame_count = 0;
 	for (j = 0; j < SYS_FRAMES; j++) {
-		vc->buffer.frame[j].ulState = S2255_READ_IDLE;
+		vc->buffer.frame[j].state = S2255_READ_IDLE;
 		vc->buffer.frame[j].cur_size = 0;
 	}
 	return s2255_start_acquire(vc);
@@ -1701,7 +1701,7 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 	vc = &dev->vc[dev->cc];
 	idx = vc->cur_frame;
 	frm = &vc->buffer.frame[idx];
-	if (frm->ulState == S2255_READ_IDLE) {
+	if (frm->state == S2255_READ_IDLE) {
 		int jj;
 		unsigned int cc;
 		__le32 *pdword; /*data from dsp is little endian */
@@ -1790,12 +1790,12 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 	/* search done.  now find out if should be acquiring on this channel */
 	if (!vb2_is_streaming(&vc->vb_vidq)) {
 		/* we found a frame, but this channel is turned off */
-		frm->ulState = S2255_READ_IDLE;
+		frm->state = S2255_READ_IDLE;
 		return -EINVAL;
 	}
 
-	if (frm->ulState == S2255_READ_IDLE) {
-		frm->ulState = S2255_READ_FRAME;
+	if (frm->state == S2255_READ_IDLE) {
+		frm->state = S2255_READ_FRAME;
 		frm->cur_size = 0;
 	}
 
@@ -1829,13 +1829,13 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 		vc->cur_frame++;
 		/* end of system frame ring buffer, start at zero */
 		if ((vc->cur_frame == SYS_FRAMES) ||
-		    (vc->cur_frame == vc->buffer.dwFrames))
+		    (vc->cur_frame == vc->buffer.num_frames))
 			vc->cur_frame = 0;
 		/* frame ready */
 		if (vb2_is_streaming(&vc->vb_vidq))
 			s2255_got_frame(vc, vc->jpg_size);
 		vc->frame_count++;
-		frm->ulState = S2255_READ_IDLE;
+		frm->state = S2255_READ_IDLE;
 		frm->cur_size = 0;
 
 	}
@@ -1863,33 +1863,33 @@ static void s2255_read_video_callback(struct s2255_dev *dev,
 	return;
 }
 
-static long s2255_vendor_req(struct s2255_dev *dev, unsigned char Request,
-			     u16 Index, u16 Value, void *TransferBuffer,
-			     s32 TransferBufferLength, int bOut)
+static long s2255_vendor_req(struct s2255_dev *dev, unsigned char req,
+			     u16 index, u16 value, void *xfer_buf,
+			     s32 xfer_buf_len, int is_out)
 {
 	int r;
 	unsigned char *buf;
 
-	buf = kmalloc(TransferBufferLength, GFP_KERNEL);
+	buf = kmalloc(xfer_buf_len, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
-	if (!bOut) {
+	if (!is_out) {
 		r = usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
-				    Request,
+				    req,
 				    USB_TYPE_VENDOR | USB_RECIP_DEVICE |
 				    USB_DIR_IN,
-				    Value, Index, buf,
-				    TransferBufferLength, USB_CTRL_SET_TIMEOUT);
+				    value, index, buf,
+				    xfer_buf_len, USB_CTRL_SET_TIMEOUT);
 
 		if (r >= 0)
-			memcpy(TransferBuffer, buf, TransferBufferLength);
+			memcpy(xfer_buf, buf, xfer_buf_len);
 	} else {
-		memcpy(buf, TransferBuffer, TransferBufferLength);
+		memcpy(buf, xfer_buf, xfer_buf_len);
 		r = usb_control_msg(dev->udev, usb_sndctrlpipe(dev->udev, 0),
-				    Request, USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-				    Value, Index, buf,
-				    TransferBufferLength, USB_CTRL_SET_TIMEOUT);
+				    req, USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+				    value, index, buf,
+				    xfer_buf_len, USB_CTRL_SET_TIMEOUT);
 	}
 	kfree(buf);
 	return r;
@@ -1904,14 +1904,14 @@ static int s2255_get_fx2fw(struct s2255_dev *dev)
 {
 	int fw;
 	int ret;
-	u8 transBuffer[2] = {};
+	u8 trans_buf[2] = {};
 
-	ret = s2255_vendor_req(dev, S2255_VR_FW, 0, 0, transBuffer,
-			       sizeof(transBuffer), S2255_VR_IN);
+	ret = s2255_vendor_req(dev, S2255_VR_FW, 0, 0, trans_buf,
+			       sizeof(trans_buf), S2255_VR_IN);
 	if (ret < 0)
 		dprintk(dev, 2, "get fw error: %x\n", ret);
-	fw = transBuffer[0] + (transBuffer[1] << 8);
-	dprintk(dev, 2, "Get FW %x %x\n", transBuffer[0], transBuffer[1]);
+	fw = trans_buf[0] + (trans_buf[1] << 8);
+	dprintk(dev, 2, "Get FW %x %x\n", trans_buf[0], trans_buf[1]);
 	return fw;
 }
 
@@ -1923,7 +1923,7 @@ static int s2255_create_sys_buffers(struct s2255_vc *vc)
 {
 	unsigned long i;
 	unsigned long reqsize;
-	vc->buffer.dwFrames = SYS_FRAMES;
+	vc->buffer.num_frames = SYS_FRAMES;
 	/* always allocate maximum size(PAL) for system buffers */
 	reqsize = SYS_FRAMES_MAXSIZE;
 
@@ -1936,14 +1936,14 @@ static int s2255_create_sys_buffers(struct s2255_vc *vc)
 		vc->buffer.frame[i].size = reqsize;
 		if (vc->buffer.frame[i].lpvbits == NULL) {
 			pr_info("out of memory.  using less frames\n");
-			vc->buffer.dwFrames = i;
+			vc->buffer.num_frames = i;
 			break;
 		}
 	}
 
 	/* make sure internal states are set */
 	for (i = 0; i < SYS_FRAMES; i++) {
-		vc->buffer.frame[i].ulState = 0;
+		vc->buffer.frame[i].state = 0;
 		vc->buffer.frame[i].cur_size = 0;
 	}
 
@@ -2123,7 +2123,7 @@ static int s2255_start_acquire(struct s2255_vc *vc)
 	vc->bad_payload = 0;
 	vc->cur_frame = 0;
 	for (j = 0; j < SYS_FRAMES; j++) {
-		vc->buffer.frame[j].ulState = 0;
+		vc->buffer.frame[j].state = 0;
 		vc->buffer.frame[j].cur_size = 0;
 	}
 
@@ -2290,10 +2290,11 @@ static int s2255_probe(struct usb_interface *interface,
 		goto err_fwmarker;
 	} else {
 		/* make sure firmware is the latest */
-		__le32 *pRel;
-		pRel = (__le32 *) &dev->fw_data->fw->data[fw_size - 4];
-		pr_info("s2255 dsp fw version %x\n", le32_to_cpu(*pRel));
-		dev->dsp_fw_ver = le32_to_cpu(*pRel);
+		__le32 *p_rel;
+
+		p_rel = (__le32 *)&dev->fw_data->fw->data[fw_size - 4];
+		pr_info("s2255 dsp fw version %x\n", le32_to_cpu(*p_rel));
+		dev->dsp_fw_ver = le32_to_cpu(*p_rel);
 		if (dev->dsp_fw_ver < S2255_CUR_DSP_FWVER)
 			pr_info("s2255: f2255usb.bin out of date.\n");
 		if (dev->pid == 0x2257 &&
-- 
2.25.1

