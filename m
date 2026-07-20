Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05AA2DCF55;
	Mon, 20 Jul 2026 02:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516116; cv=none; b=PPwZ/PzUtb/vQoac5qv6Se8PkFDlswDyRVqP40K7X+on+yGXd6O21NmgOtx9JNx54gJHrSTEoy6YYMtvAD3ax0TQ8pRZoM4k2+ffp+GT+i0hNiXep2mpuxmnWOYGM9uwJonrP9pIuB9jXajaYTPl4YTOWi4HSR80nis2wJMUFKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516116; c=relaxed/simple;
	bh=DUdfb7d4OKEMCkJJcaNdPLA4LTKwI3kX0SCUubtO7JI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cDDE2ghqsoaMvWR22+IBXBfSLo7+9MBnefhYtxMMtOp3zJULw0Z6ORKboeYshDzGBSyw/QaPbVIwOLkR3lJoGdlcawuzyw6LRUDNDFTRbnGYxXxkDxdYAynMsijHIQbAuvGTMUo5eRiKMWMZhn3XUjKHmQCYK6ze/zoNZy2aN3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=qUQvBG8x; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="qUQvBG8x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=/v
	7GlNTYHme3fqhDFM99RttUvH+K+kjKWV9cwUnU7P4=; b=qUQvBG8xt7bgMhBIkl
	8WFVzuFM/DNg+esPmzXsk7MmagI4XB5Vkpd5NZqBWfasDjf0vV8CxAALqEfWjaWz
	e2iMeieIr3Pzz6Qv2OAgTHZCJb/2tNnwUhgYcvLAbeMvgQ5uiSEeira5u8qon6OY
	luBSLHQUhR3ffxKHRJqyDAbjg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3v5rwjV1qaGtIJQ--.123S5;
	Mon, 20 Jul 2026 10:54:48 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v2 03/17] media: s2255: Remove unnecessary spaces after casts
Date: Mon, 20 Jul 2026 10:54:32 +0800
Message-Id: <20260720025438.207149-4-huanglei814@163.com>
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
X-CM-TRANSID:_____wD3v5rwjV1qaGtIJQ--.123S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFWrtrWkXFy7XryrCFW5Awb_yoW5tFy8pa
	yYgFWYkrs8Ja15Gw48Jr1Durn8XFn7X3y5uFW7Kw18Kr98J34kZF1vv34xXFyqvryxK3Wx
	Ar1qgFZ7W393t3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jlCJQUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC0RiTimpdjfjNLQAA3y

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

