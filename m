Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106042E7162;
	Mon, 20 Jul 2026 02:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516142; cv=none; b=ZtsCQwGSxpb4AFPwMBNAqKE/HQrpez2qgggXVAp0ZpFuM21JtHUQonGFuNRR3EIPsFOLsFjStNeHLDJonMf3VKcAUdRhI5IJKGAZgvApX7j/p5ZTmR1N1mF30TZinSeaQGeJ299qtH2gD/Sqg4toMVq0chcQGSiu9oVZJU6k/sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516142; c=relaxed/simple;
	bh=wfWh8IjMAFPtP+OnBhlXY8xJ1JuRsQOowoIzjTfEftY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uFu41kPZcD9H3LJ+PmMjbxIesCDJmeSoyZ7bTlTIHNuOhT9BEhK392FT6VjyG933HTAuSxSjOO/P2ROzp94/BUQiKMVRbFDTvlRUaAhdYgCce1LB+YFHIBNzrwrV21rSfdbG5qNIajQXow0qRJ7EsWnIF56YvOkaoj+2YBYUV4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=R5eNtTZ7; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="R5eNtTZ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=o6
	IfAxE7Gvat9/Iy55YMQDiRdPv0HWMSbGcsu0f2GXk=; b=R5eNtTZ7N1HTZ0KDCI
	clYoioce/QpD9hl+lsZ9JKzjybranBSC5KkIVQW6I6kSoDNTSGkblXprLC0V8Wf2
	Y4w4bLMJMHFSog/XQtD8xxHBBr8kD00ks6zqH8MtSgSGqe779Cp2U7oB+nuHhnzG
	8g48tvm5qPez/FkHVpBy03EPo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnZIkOjl1qWxR+Kw--.19016S4;
	Mon, 20 Jul 2026 10:55:12 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v2 12/17] media: s2255: Add blank lines after variable declarations
Date: Mon, 20 Jul 2026 10:55:03 +0800
Message-Id: <20260720025508.207815-3-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260720025508.207815-1-huanglei814@163.com>
References: <20260720025508.207815-1-huanglei814@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnZIkOjl1qWxR+Kw--.19016S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3AF4rAF47AryxuryxGryfZwb_yoWxZr47pF
	ZxtFWYyF4UJ3W7GFWrJr4Uur1aqw1Dt397GFWfKa40yry5A3s5XFWkC34IyrykAFyIk3W7
	AFs0qr4UG3y7KF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jqv3bUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC0RCZkGpdjhDP2gAA30

From: Lei Huang <huanglei@kylinos.cn>

Fix all 22 'WARNING: Missing a blank line after declarations' issues
reported by checkpatch.pl in s2255drv.c. Insert a blank line between
local variable declarations and the first statement in each function.

Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index e5242247a118..501ac7cf31b3 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -440,6 +440,7 @@ static void planar422p_to_yuv_packed(const unsigned char *in,
 	unsigned char *p_cr;
 	unsigned long size = height * width;
 	unsigned int i;
+
 	p_y = (unsigned char *)in;
 	p_cr = (unsigned char *)in + height * width;
 	p_cb = (unsigned char *)in + height * width + (height * width / 2);
@@ -468,6 +469,7 @@ static void s2255_timer(struct timer_list *t)
 {
 	struct s2255_dev *dev = timer_container_of(dev, t, timer);
 	struct s2255_fw *data = dev->fw_data;
+
 	if (usb_submit_urb(data->fw_urb, GFP_ATOMIC) < 0) {
 		pr_err("s2255: can't submit urb\n");
 		atomic_set(&data->fw_state, S2255_FW_FAILED);
@@ -488,6 +490,7 @@ static void s2255_fwchunk_complete(struct urb *urb)
 	struct s2255_fw *data = urb->context;
 	struct usb_device *udev = urb->dev;
 	int len;
+
 	if (urb->status) {
 		dev_err(&udev->dev, "URB failed with status %d\n", urb->status);
 		atomic_set(&data->fw_state, S2255_FW_FAILED);
@@ -563,6 +566,7 @@ static void s2255_got_frame(struct s2255_vc *vc, int jpgsize)
 static const struct s2255_fmt *format_by_fourcc(int fourcc)
 {
 	unsigned int i;
+
 	for (i = 0; i < ARRAY_SIZE(formats); i++) {
 		if (-1 == formats[i].fourcc)
 			continue;
@@ -639,6 +643,7 @@ static int queue_setup(struct vb2_queue *vq,
 		       unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct s2255_vc *vc = vb2_get_drv_priv(vq);
+
 	if (*nbuffers < S2255_MIN_BUFS)
 		*nbuffers = S2255_MIN_BUFS;
 	*nplanes = 1;
@@ -682,6 +687,7 @@ static void buffer_queue(struct vb2_buffer *vb)
 	struct s2255_buffer *buf = container_of(vbuf, struct s2255_buffer, vb);
 	struct s2255_vc *vc = vb2_get_drv_priv(vb->vb2_queue);
 	unsigned long flags = 0;
+
 	dprintk(vc->dev, 1, "%s\n", __func__);
 	spin_lock_irqsave(&vc->qlock, flags);
 	list_add_tail(&buf->list, &vc->buf_list);
@@ -880,6 +886,7 @@ static int s2255_write_config(struct usb_device *udev, unsigned char *pbuf,
 	int pipe;
 	int done;
 	long retval = -1;
+
 	if (udev) {
 		pipe = usb_sndbulkpipe(udev, S2255_CONFIG_EP);
 		retval = usb_bulk_msg(udev, pipe, pbuf, size, &done, 500);
@@ -954,6 +961,7 @@ static u32 get_transfer_size(struct s2255_mode *mode)
 static void s2255_print_cfg(struct s2255_dev *sdev, struct s2255_mode *mode)
 {
 	struct device *dev = &sdev->udev->dev;
+
 	dev_info(dev, "------------------------------------------------\n");
 	dev_info(dev, "format: %d\nscale %d\n", mode->format, mode->scale);
 	dev_info(dev, "fdec: %d\ncolor %d\n", mode->fdec, mode->color);
@@ -1153,6 +1161,7 @@ static int vidioc_enum_input(struct file *file, void *priv,
 	inp->status = 0;
 	if (dev->dsp_fw_ver >= S2255_MIN_DSP_STATUS) {
 		int rc;
+
 		rc = s2255_cmd_status(vc, &status);
 		dprintk(dev, 4, "s2255_cmd_status rc: %d status %x\n",
 			rc, status);
@@ -1191,6 +1200,7 @@ static int s2255_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct s2255_vc *vc =
 		container_of(ctrl->handler, struct s2255_vc, hdl);
 	struct s2255_mode mode;
+
 	mode = vc->mode;
 	/* update the mode to the corresponding value */
 	switch (ctrl->id) {
@@ -1292,6 +1302,7 @@ static int vidioc_s_parm(struct file *file, void *priv,
 	struct s2255_mode mode;
 	int fdec = FDEC_1;
 	__u32 def_num, def_dem;
+
 	if (sp->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
 	mode = vc->mode;
@@ -1692,6 +1703,7 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 	struct s2255_framei *frm;
 	unsigned char *pdata;
 	struct s2255_vc *vc;
+
 	dprintk(dev, 100, "buffer to user\n");
 	vc = &dev->vc[dev->cc];
 	idx = vc->cur_frame;
@@ -1840,6 +1852,7 @@ static void s2255_read_video_callback(struct s2255_dev *dev,
 				      struct s2255_pipeinfo *pipe_info)
 {
 	int res;
+
 	dprintk(dev, 50, "callback read video\n");
 
 	if (dev->cc >= MAX_CHANNELS) {
@@ -1916,6 +1929,7 @@ static int s2255_create_sys_buffers(struct s2255_vc *vc)
 {
 	unsigned long i;
 	unsigned long reqsize;
+
 	vc->buffer.num_frames = SYS_FRAMES;
 	/* always allocate maximum size(PAL) for system buffers */
 	reqsize = SYS_FRAMES_MAXSIZE;
@@ -1948,6 +1962,7 @@ static int s2255_create_sys_buffers(struct s2255_vc *vc)
 static int s2255_release_sys_buffers(struct s2255_vc *vc)
 {
 	unsigned long i;
+
 	for (i = 0; i < SYS_FRAMES; i++) {
 		vfree(vc->buffer.frame[i].lpvbits);
 		vc->buffer.frame[i].lpvbits = NULL;
@@ -1961,6 +1976,7 @@ static int s2255_board_init(struct s2255_dev *dev)
 	int fw_ver;
 	int j;
 	struct s2255_pipeinfo *pipe = &dev->pipe;
+
 	dprintk(dev, 4, "board init: %p", dev);
 	memset(pipe, 0, sizeof(*pipe));
 	pipe->dev = dev;
@@ -1985,6 +2001,7 @@ static int s2255_board_init(struct s2255_dev *dev)
 
 	for (j = 0; j < MAX_CHANNELS; j++) {
 		struct s2255_vc *vc = &dev->vc[j];
+
 		vc->mode = mode_def;
 		if (dev->pid == 0x2257 && j > 1)
 			vc->mode.color |= (1 << 16);
@@ -2008,6 +2025,7 @@ static int s2255_board_init(struct s2255_dev *dev)
 static int s2255_board_shutdown(struct s2255_dev *dev)
 {
 	u32 i;
+
 	dprintk(dev, 1, "%s: dev: %p", __func__,  dev);
 
 	for (i = 0; i < MAX_CHANNELS; i++) {
@@ -2028,6 +2046,7 @@ static void read_pipe_completion(struct urb *purb)
 	struct s2255_dev *dev;
 	int status;
 	int pipe;
+
 	pipe_info = purb->context;
 	if (!pipe_info) {
 		dev_err(&purb->dev->dev, "no context!\n");
@@ -2080,6 +2099,7 @@ static int s2255_start_readpipe(struct s2255_dev *dev)
 	int pipe;
 	int retval;
 	struct s2255_pipeinfo *pipe_info = &dev->pipe;
+
 	pipe = usb_rcvbulkpipe(dev->udev, dev->read_endpoint);
 	dprintk(dev, 2, "%s: IN %d\n", __func__, dev->read_endpoint);
 	pipe_info->state = 1;
@@ -2245,6 +2265,7 @@ static int s2255_probe(struct usb_interface *interface,
 	init_waitqueue_head(&dev->fw_data->wait_fw);
 	for (i = 0; i < MAX_CHANNELS; i++) {
 		struct s2255_vc *vc = &dev->vc[i];
+
 		vc->idx = i;
 		vc->dev = dev;
 		init_waitqueue_head(&vc->wait_setmode);
@@ -2335,6 +2356,7 @@ static void s2255_disconnect(struct usb_interface *interface)
 	struct s2255_dev *dev = to_s2255_dev(usb_get_intfdata(interface));
 	int i;
 	int channels = refcount_read(&dev->num_channels);
+
 	mutex_lock(&dev->lock);
 	v4l2_device_disconnect(&dev->v4l2_dev);
 	mutex_unlock(&dev->lock);
-- 
2.25.1

