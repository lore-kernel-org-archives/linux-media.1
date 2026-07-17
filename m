Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0B93B71CA;
	Fri, 17 Jul 2026 09:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280281; cv=none; b=HSYkLGwHJNhRA8C4JEhMsnXThon97SB83AtrzS1cdOyDkkBEBFyL7Em3ZmGpbw2WkmpxiuLpkl8ZW60pkN5PqyU9rc6Va/hFYYpolvBu9jKS/2l207xS60OZlzL9gHnS71ZV+XUf7ULnJA7YSZn+4k3ENVc/sXhIRR12EaMKEyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280281; c=relaxed/simple;
	bh=DUdfb7d4OKEMCkJJcaNdPLA4LTKwI3kX0SCUubtO7JI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t18u95mLlwJEfJaivCz3fgPGrUtcOH5c4mUkkl7QNqrWpNBU0doUpNZEvc2Qv0X8kvWhj8nTm/QCG2JVga5Rijo1z6ClQPLWtrc6Z7oefa7b9oDxCK5MTqN6vgJyCUTsvUMeK5yEXPvCA8xqtHqvtYMhTc9pNCd4NIrMbNb/OEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Ybo2rO8c; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Ybo2rO8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=/v
	7GlNTYHme3fqhDFM99RttUvH+K+kjKWV9cwUnU7P4=; b=Ybo2rO8cX1cXVBQHlK
	N/JYrx0B8pk/PxqfGAYHj/LxI7mfvQp0YVMxhH+iOklsZEw8kTqlj1mR7Gv1TpBB
	VcdsgEe88hiSgPGmvxAKH1Z7LwoPubdrAEiFYd+sxCQKFQ49tp5kbzM6qOyNesuJ
	/EoUN4pBbi5uRru1bH6zApiCc=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCnESG+9Flq5w+gHg--.17942S4;
	Fri, 17 Jul 2026 17:24:20 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH 02/16] media: s2255: Remove unnecessary spaces after casts
Date: Fri, 17 Jul 2026 17:23:35 +0800
Message-Id: <20260717092349.684342-3-huanglei814@163.com>
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
X-CM-TRANSID:QCgvCgCnESG+9Flq5w+gHg--.17942S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFWrtrWkXFy7XryrCFW5Awb_yoW5tFy8pa
	yYgFWYkrs8Ja15Gw48Jr1Durn8XFn7X3y5uFW7Kw18Kr98J34kZF1vv34xXFyqvryxK3Wx
	Ar1qgFZ7W393t3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j6BT5UUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC8wRfVmpZ9MR35AAA3u

From: Lei Huang <huanglei@kylinos.cn>

Fix all 8 'CHECK: No space is necessary after a cast' issues reported by
checkpatch.pl in s2255drv.c. Remove the space between the cast type and
the value being cast.

Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 0f98a4cc18a4..78011f5fe99c 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -521,7 +521,7 @@ static void s2255_fwchunk_complete(struct urb *urb)
 			memset(data->pfw_data, 0, CHUNK_SIZE);
 
 		memcpy(data->pfw_data,
-		       (char *) data->fw->data + data->fw_loaded, len);
+		       (char *)data->fw->data + data->fw_loaded, len);
 
 		usb_fill_bulk_urb(data->fw_urb, udev, usb_sndbulkpipe(udev, 2),
 				  data->pfw_data, CHUNK_SIZE,
@@ -875,7 +875,7 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	else if (mode.format != vc->mode.format)
 		mode.restart = 1;
 	vc->mode = mode;
-	(void) s2255_set_mode(vc, &mode);
+	(void)s2255_set_mode(vc, &mode);
 	return 0;
 }
 
@@ -1001,7 +1001,7 @@ static int s2255_set_mode(struct s2255_vc *vc,
 	dprintk(dev, 1, "%s: reqsize %ld\n", __func__, vc->req_image_size);
 	/* set the mode */
 	buffer[0] = IN_DATA_TOKEN;
-	buffer[1] = (__le32) cpu_to_le32(chn_rev);
+	buffer[1] = (__le32)cpu_to_le32(chn_rev);
 	buffer[2] = CMD_SET_MODE;
 	for (i = 0; i < sizeof(struct s2255_mode) / sizeof(u32); i++)
 		buffer[3 + i] = cpu_to_le32(((u32 *)&vc->mode)[i]);
@@ -1038,7 +1038,7 @@ static int s2255_cmd_status(struct s2255_vc *vc, u32 *pstatus)
 	dprintk(dev, 4, "%s chan %d\n", __func__, vc->idx);
 	/* form the get vid status command */
 	buffer[0] = IN_DATA_TOKEN;
-	buffer[1] = (__le32) cpu_to_le32(chn_rev);
+	buffer[1] = (__le32)cpu_to_le32(chn_rev);
 	buffer[2] = CMD_STATUS;
 	*pstatus = 0;
 	vc->vidstatus_ready = 0;
@@ -1078,7 +1078,7 @@ static void stop_streaming(struct vb2_queue *vq)
 	struct s2255_vc *vc = vb2_get_drv_priv(vq);
 	struct s2255_buffer *buf, *node;
 	unsigned long flags;
-	(void) s2255_stop_acquire(vc);
+	(void)s2255_stop_acquire(vc);
 	spin_lock_irqsave(&vc->qlock, flags);
 	list_for_each_entry_safe(buf, node, &vc->buf_list, list) {
 		list_del(&buf->list);
@@ -2129,7 +2129,7 @@ static int s2255_start_acquire(struct s2255_vc *vc)
 
 	/* send the start command */
 	buffer[0] = IN_DATA_TOKEN;
-	buffer[1] = (__le32) cpu_to_le32(chn_rev);
+	buffer[1] = (__le32)cpu_to_le32(chn_rev);
 	buffer[2] = CMD_START;
 	res = s2255_write_config(dev->udev, (unsigned char *)buffer, 512);
 	if (res != 0)
@@ -2151,7 +2151,7 @@ static int s2255_stop_acquire(struct s2255_vc *vc)
 	chn_rev = G_chnmap[vc->idx];
 	/* send the stop command */
 	buffer[0] = IN_DATA_TOKEN;
-	buffer[1] = (__le32) cpu_to_le32(chn_rev);
+	buffer[1] = (__le32)cpu_to_le32(chn_rev);
 	buffer[2] = CMD_STOP;
 
 	res = s2255_write_config(dev->udev, (unsigned char *)buffer, 512);
@@ -2282,7 +2282,7 @@ static int s2255_probe(struct usb_interface *interface,
 		retval = -ENODEV;
 		goto err_fwmarker;
 	}
-	pdata = (__le32 *) &dev->fw_data->fw->data[fw_size - 8];
+	pdata = (__le32 *)&dev->fw_data->fw->data[fw_size - 8];
 
 	if (*pdata != S2255_FW_MARKER) {
 		dev_err(&interface->dev, "Firmware invalid.\n");
-- 
2.25.1

