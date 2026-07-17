Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175F63CEBAA;
	Fri, 17 Jul 2026 09:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280378; cv=none; b=bLJglFkxcqYjvQn4dtEP3cU+9OnZwBpBvteZAuU+mHrEm92nUBLvJIP6SapukkzFbEYiAOOv2On5r96I2qx6dW4pl14VVUC9QB5+Uw/KbbC7zIPm1RceiuC0F0A/82edh+LHDmVK6wZparQn6dS8/vM51Nm+UJ1EwuqwjRHFFvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280378; c=relaxed/simple;
	bh=5Hpz7MrQj3squtNyoYSeXmZwwof2JaRnG7LpRom+XHU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PWQcGhjasrSCRUzyxesP7UGWvXkm88J4G1UtwOLbPuKV0DG9nyIf48yfnSQixQgsjqOFfj4+05flm5muDa31+EGxjD8FZND1pKVmElez5i0oUPDa4lQXGv1NcyyRGBVKytEuSxqQTpdepAYj02iZnpalIxIaLjpBcfSBAkyf45k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iZ9tqrFX; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="iZ9tqrFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=DX
	LId8OHALQ2WXaTMtU7EWEwKVPSQqfR0oc12STIBxA=; b=iZ9tqrFXyDN/4ttvGV
	x+/KCI3iOMqs1p6ls6Sue/ke1dDgKFmhk5XrI+xdQs+9fRGhGq28I5HIL6uuqWnI
	o42l638ehl4/XeeZFJ77hCjINoX7ZdQMNkzVBb4x620iixQfk1LyMnY5K3i1kZ+g
	qm5Seu1TNYvaDBpIGPC1axTzc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wCnxF8n9VlqXUs7KA--.62148S2;
	Fri, 17 Jul 2026 17:26:00 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH 13/16] media: s2255: Remove unnecessary return statements from void functions
Date: Fri, 17 Jul 2026 17:25:58 +0800
Message-Id: <20260717092558.687064-1-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCnxF8n9VlqXUs7KA--.62148S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFyDZFW3Gw45Xr15Xr17GFg_yoW8KFykpF
	Z0qa4YkFWDA3W5Xay8AanrCFn5Ar97trW8GFW7K34Fqr1DJ34DJFZ0ya42vr98JrySk3W7
	Xr4qqrW8Gw409aUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8ManUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC0gh4b2pZ9ShBPwAA3d

From: Lei Huang <huanglei@kylinos.cn>

Fix all 7 'WARNING: void function return statements are not generally
useful' issues reported by checkpatch.pl in s2255drv.c. Remove
trailing 'return;' statements that immediately precede the closing
brace in void functions.

Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 543155fe75a9..78c78e55d180 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -450,7 +450,6 @@ static void planar422p_to_yuv_packed(const unsigned char *in,
 		out[i + 2] = (fmt == V4L2_PIX_FMT_YUYV) ? *p_y++ : *p_cb++;
 		out[i + 3] = (fmt == V4L2_PIX_FMT_YUYV) ? *p_cb++ : *p_y++;
 	}
-	return;
 }
 
 static void s2255_reset_dsppower(struct s2255_dev *dev)
@@ -460,7 +459,6 @@ static void s2255_reset_dsppower(struct s2255_dev *dev)
 	s2255_vendor_req(dev, 0x50, 0x0000, 0x0000, NULL, 0, 1);
 	msleep(600);
 	s2255_vendor_req(dev, 0x10, 0x0000, 0x0000, NULL, 0, 1);
-	return;
 }
 
 /* kickstarts the firmware loading. from probe
@@ -534,7 +532,6 @@ static void s2255_fwchunk_complete(struct urb *urb)
 	} else {
 		atomic_set(&data->fw_state, S2255_FW_LOADED_DSPWAIT);
 	}
-	return;
 }
 
 static void s2255_got_frame(struct s2255_vc *vc, int jpgsize)
@@ -1563,7 +1560,6 @@ static void s2255_video_device_release(struct video_device *vdev)
 
 	if (refcount_dec_and_test(&dev->num_channels))
 		s2255_destroy(dev);
-	return;
 }
 
 static const struct video_device template = {
@@ -1868,7 +1864,6 @@ static void s2255_read_video_callback(struct s2255_dev *dev,
 		dprintk(dev, 4, "s2255: read callback failed\n");
 
 	dprintk(dev, 50, "callback read video done\n");
-	return;
 }
 
 static long s2255_vendor_req(struct s2255_dev *dev, unsigned char req,
@@ -2093,7 +2088,6 @@ static void read_pipe_completion(struct urb *purb)
 	} else {
 		dprintk(dev, 2, "%s :complete state 0\n", __func__);
 	}
-	return;
 }
 
 static int s2255_start_readpipe(struct s2255_dev *dev)
@@ -2190,7 +2184,6 @@ static void s2255_stop_readpipe(struct s2255_dev *dev)
 		pipe->stream_urb = NULL;
 	}
 	dprintk(dev, 4, "%s", __func__);
-	return;
 }
 
 static void s2255_fwload_start(struct s2255_dev *dev)
-- 
2.25.1

