Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52CF2E7388;
	Mon, 20 Jul 2026 02:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516145; cv=none; b=ScsEV3rtCLqq9mZ5GXucNl2gIKaNAa0F2BQgEY1U2/ppzxQovVd1oOjOQWkpEWeOY6PwrxaCaOOpww4jOg3PELVasWBA3HAGYBPLCZ9WYzx3ua5oqSXXKwkGEeCRB/CcJSrCBkH5mEv4Q/eREuS515+uDdyUi5HBzhnjLWjy2Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516145; c=relaxed/simple;
	bh=4zWLFVNomFePmMF2BxhKBRrospAeZZG/vGZ7t4/x8jU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BcnlIcR/OOHZI2Y7xsrBjHjRDzYx29zT4bRJBQQtAyc2R68mzeMQ/68KJjlY/97WgkpleMp8vLP+QrpUp51JDa6ma1R3J4gvqxoYSEoMVLZuTTJZ/43XanzltqH84ap6M032ISzU97SFnY9HwhxFg+zFbYfifMYvTavF7vNAghs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=VFOnoVl6; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="VFOnoVl6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=N4
	5Icrhro654/GNeR8Fzgk0KDXvtXXsqVJj1N3N4CrE=; b=VFOnoVl6P6LYUuP5W4
	P+7+jZzuFHCGg/nTF9v92eXL5u3ZCFum47CViEw5TMJGvb7C71iXBmR1aU5UJ8nE
	WrYASf0KD1n/XKkxyW4C8hAfFMnEIC8HHFseEYPlGGXGJYdiDhrueiIObd0h6VCQ
	fqQP5Q+oEyIKwIE4H6K6UsXtE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnZIkOjl1qWxR+Kw--.19016S7;
	Mon, 20 Jul 2026 10:55:14 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v2 15/17] media: s2255: Remove unnecessary debug logging and out-of-memory messages
Date: Mon, 20 Jul 2026 10:55:06 +0800
Message-Id: <20260720025508.207815-6-huanglei814@163.com>
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
X-CM-TRANSID:_____wDnZIkOjl1qWxR+Kw--.19016S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF45Wr1xGr1kZF18Gw4DJwb_yoW5KF18pF
	WfKayvkFWDtw1rWrWkJF4UuFyrA3WktrWjkFW2k3sYvr1UJ3s0qasYya4IyFWkAryIk3Wa
	qr1DWw4UuayqgF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jcyCJUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC8xKZkGpdjhLQrQAA3+

From: Lei Huang <huanglei@kylinos.cn>

Fix all 5 'WARNING: Unnecessary ftrace-like logging - prefer using
ftrace' issues reported by checkpatch.pl in s2255drv.c. Remove
dprintk/dev_info calls that only print the function name, as ftrace
can provide the same function tracing information.

Fix all 3 'WARNING: Possible unnecessary 'out of memory' message'
issues reported by checkpatch.pl in s2255drv.c. The kernel's memory
allocator already prints a warning on allocation failure, making
these messages redundant.

Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 78c78e55d180..a9ed663cece4 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -657,7 +657,6 @@ static int buffer_prepare(struct vb2_buffer *vb)
 	int h = vc->height;
 	unsigned long size;
 
-	dprintk(vc->dev, 4, "%s\n", __func__);
 	if (!vc->fmt)
 		return -EINVAL;
 
@@ -685,7 +684,6 @@ static void buffer_queue(struct vb2_buffer *vb)
 	struct s2255_vc *vc = vb2_get_drv_priv(vb->vb2_queue);
 	unsigned long flags = 0;
 
-	dprintk(vc->dev, 1, "%s\n", __func__);
 	spin_lock_irqsave(&vc->qlock, flags);
 	list_add_tail(&buf->list, &vc->buf_list);
 	spin_unlock_irqrestore(&vc->qlock, flags);
@@ -1487,7 +1485,6 @@ static int s2255_open(struct file *file)
 
 static void s2255_destroy(struct s2255_dev *dev)
 {
-	dprintk(dev, 1, "%s", __func__);
 	/* board shutdown stops the read pipe if it is running */
 	s2255_board_shutdown(dev);
 	/* make sure firmware still not trying to load */
@@ -1939,7 +1936,6 @@ static int s2255_create_sys_buffers(struct s2255_vc *vc)
 		vc->buffer.frame[i].lpvbits = vmalloc(reqsize);
 		vc->buffer.frame[i].size = reqsize;
 		if (!vc->buffer.frame[i].lpvbits) {
-			pr_info("out of memory.  using less frames\n");
 			vc->buffer.num_frames = i;
 			break;
 		}
@@ -1983,7 +1979,6 @@ static int s2255_board_init(struct s2255_dev *dev)
 	pipe->transfer_buffer = kzalloc(pipe->max_transfer_size,
 					GFP_KERNEL);
 	if (!pipe->transfer_buffer) {
-		dprintk(dev, 1, "out of memory!\n");
 		return -ENOMEM;
 	}
 	/* query the firmware */
@@ -2183,7 +2178,6 @@ static void s2255_stop_readpipe(struct s2255_dev *dev)
 		usb_free_urb(pipe->stream_urb);
 		pipe->stream_urb = NULL;
 	}
-	dprintk(dev, 4, "%s", __func__);
 }
 
 static void s2255_fwload_start(struct s2255_dev *dev)
@@ -2217,13 +2211,11 @@ static int s2255_probe(struct usb_interface *interface,
 	/* allocate memory for our device state and initialize it to zero */
 	dev = kzalloc_obj(struct s2255_dev);
 	if (!dev) {
-		s2255_dev_err(&interface->dev, "out of memory\n");
 		return -ENOMEM;
 	}
 
 	dev->cmdbuf = kzalloc(S2255_CMDBUF_SIZE, GFP_KERNEL);
 	if (!dev->cmdbuf) {
-		s2255_dev_err(&interface->dev, "out of memory\n");
 		goto err_fwdata1;
 	}
 
@@ -2275,7 +2267,6 @@ static int s2255_probe(struct usb_interface *interface,
 
 	dev->fw_data->pfw_data = kzalloc(CHUNK_SIZE, GFP_KERNEL);
 	if (!dev->fw_data->pfw_data) {
-		dev_err(&interface->dev, "out of memory!\n");
 		goto err_fwdata2;
 	}
 	/* load the first chunk */
@@ -2371,7 +2362,6 @@ static void s2255_disconnect(struct usb_interface *interface)
 	}
 	if (refcount_dec_and_test(&dev->num_channels))
 		s2255_destroy(dev);
-	dev_info(&interface->dev, "%s\n", __func__);
 }
 
 static struct usb_driver s2255_driver = {
-- 
2.25.1

