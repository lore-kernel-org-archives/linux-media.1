Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8AD2E1F06;
	Mon, 20 Jul 2026 02:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516139; cv=none; b=HL88BWxKUFOb9y9aF1U6WYfGOzgzkaFhaW8goLxlz3T/q1nr28gv2/z2Iq1UIYhVV8qNE5r0geRwPEVLksXgVa7t4QBbLksxFWsfAaHb/p78b2grculB84fHNqNAkTQoGMA1mtlW7ICG6NFttVK6N82egcQsQJwXyau/ny59Fac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516139; c=relaxed/simple;
	bh=5Hpz7MrQj3squtNyoYSeXmZwwof2JaRnG7LpRom+XHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OZcj88ejaKddYmzJmuOJfynPgkBVoDeanZowMAqPiNgAvdzF66Ihj1CaWdwodHaekGemKLPG0YAQpdKe2Cn2PMULTYH1SkzvYbS683xuQj49942sRpmRV7DdsWGfP+9uP4skaUb8+9aE/B6toeN2gbm3I+igx4aufeIoJmNobBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ec8M1s0V; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ec8M1s0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=DX
	LId8OHALQ2WXaTMtU7EWEwKVPSQqfR0oc12STIBxA=; b=ec8M1s0VBBAQ+z/vkx
	oT44qdegejZFWhr5kHJF7WIaN8FhSPANI+WFhdc5XQ9XTwmtVK1vydTW4MDlUTEN
	zs53Uctq1fV3yu5d2+OpkopnV4X2wIZozjLHVQKrLg9eA3c1LvOBMIqY55X6oCNP
	WPCQiO2q2xD90T+tXxibjLSlw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnZIkOjl1qWxR+Kw--.19016S6;
	Mon, 20 Jul 2026 10:55:13 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v2 14/17] media: s2255: Remove unnecessary return statements from void functions
Date: Mon, 20 Jul 2026 10:55:05 +0800
Message-Id: <20260720025508.207815-5-huanglei814@163.com>
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
X-CM-TRANSID:_____wDnZIkOjl1qWxR+Kw--.19016S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFyDZFW3Gw45Xr15Xr17GFg_yoW8KFykpF
	Z0qa4YkFWDA3W5Xay8AanrCFn5Ar97trW8GFW7K34Fqr1DJ34DJFZ0ya42vr98JrySk3W7
	Xr4qqrW8Gw409aUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jcPEfUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC0hGZkGpdjhFwBwAA3V

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

