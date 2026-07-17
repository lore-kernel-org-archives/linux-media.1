Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41C13C1983;
	Fri, 17 Jul 2026 09:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280290; cv=none; b=L8wRTt9v9XxXRK/QjoeKv/JMWQJG6P3W8qm5DQUoWs3fIrRuJlAzs5G8qxHxaoXXkdiezqJLKi/kWdMSZTarXSQZO7SVH2oDKHqY1t2TdTEtwWt2e2xtmGjAQddcPTGspCIppGstFJ9CsGn1awtg436MfcAzcxrOTqFTVFrmNik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280290; c=relaxed/simple;
	bh=lofeOO3ifA3TRnLp8l6eJuSms2EsY7zELlTpfkPs2mo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oBAFr87e7imkElELy9Ffwzd1n+ouKK+yF5xtgitUk1LXIBU2FG4B18/irDJ7XW+A5kykswSqyAniCj43IQvt7sxXHQIiA5uTxEM5sCxLrEUtwJe0tB+7dtvk78Q9EY23EyiPJKIBwM1OebPYhka5NYR5C63b0MhGFfWNu30uyNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Dv59rq9j; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Dv59rq9j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=0p
	7mKLj+VY+cRvyS/XnOTQje98mrIJfieHHWznRloBw=; b=Dv59rq9j3QkRFFxsEj
	CHuhZr81aGq9NtqQL8L6R9aDHJQ0T7c8pfO0t2GWeyDgh+23pU1BzfjrF+lTxVfM
	wMiBJDNlEJ0sTUySt7a3P7AY+PR4Z5jV6+E9f6jwc6x66hJfjb8M173efvrSKXEp
	lwoN68/Tvip6r4vEK9voBmozw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCnESG+9Flq5w+gHg--.17942S8;
	Fri, 17 Jul 2026 17:24:25 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH 06/16] media: s2255: Remove multiple blank lines and before close braces
Date: Fri, 17 Jul 2026 17:23:39 +0800
Message-Id: <20260717092349.684342-7-huanglei814@163.com>
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
X-CM-TRANSID:QCgvCgCnESG+9Flq5w+gHg--.17942S8
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr17tF1fZFW5XrWfKr4rZrb_yoW5uF4fpF
	ZxJa42yrWUta1UWFWkJr4DuF15Jw1ktrWUGF47Aa10yr1qy34kXF1kA34xAr98JrySk3W3
	Xrn0qr18G34DtrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7qXQUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC8wlgV2pZ9Ml4PgAA3F

From: Lei Huang <huanglei@kylinos.cn>

Remove all 9 instances of double blank lines: 'CHECK: Please don't use
multiple blank lines' reported by checkpatch.pl in s2255drv.c.

Fix all 3 'CHECK: Blank lines aren't necessary before a close brace'
issues reported by checkpatch.pl in s2255drv.c.

Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index f3e4bd069f1c..dc3a9d69789c 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -86,7 +86,6 @@
 #define LINE_SZ_DEF		640
 #define NUM_LINES_DEF		240
 
-
 /* predefined settings */
 #define FORMAT_NTSC	1
 #define FORMAT_PAL	2
@@ -144,7 +143,6 @@ struct s2255_mode {
 	u32 restart;	/* if DSP requires restart */
 };
 
-
 #define S2255_READ_IDLE		0
 #define S2255_READ_FRAME	1
 
@@ -243,7 +241,6 @@ struct s2255_vc {
 	spinlock_t qlock;
 };
 
-
 struct s2255_dev {
 	struct s2255_vc         vc[MAX_CHANNELS];
 	struct v4l2_device      v4l2_dev;
@@ -284,7 +281,6 @@ struct s2255_buffer {
 	struct list_head list;
 };
 
-
 /* current cypress EEPROM firmware version */
 #define S2255_CUR_USB_FWVER	((3 << 8) | 12)
 /* current DSP FW version */
@@ -430,7 +426,6 @@ static int norm_minh(struct s2255_vc *vc)
 	    (NUM_LINES_1CIFS_NTSC) : (NUM_LINES_1CIFS_PAL);
 }
 
-
 /*
  * TODO: fixme: move YUV reordering to hardware
  * converts 2255 planar format to yuyv or uyvy
@@ -482,7 +477,6 @@ static void s2255_timer(struct timer_list *t)
 	}
 }
 
-
 /* this loads the firmware asynchronously.
    Originally this was done synchronously in probe.
    But it is better to load it asynchronously here than block
@@ -538,7 +532,6 @@ static void s2255_fwchunk_complete(struct urb *urb)
 		atomic_set(&data->fw_state, S2255_FW_LOADED_DSPWAIT);
 	}
 	return;
-
 }
 
 static void s2255_got_frame(struct s2255_vc *vc, int jpgsize)
@@ -637,7 +630,6 @@ static void s2255_fillbuff(struct s2255_vc *vc,
 		vbuf, pos);
 }
 
-
 /* ------------------------------------------------------------------
    Videobuf operations
    ------------------------------------------------------------------*/
@@ -881,7 +873,6 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-
 /* write to the configuration pipe, synchronously */
 static int s2255_write_config(struct usb_device *udev, unsigned char *pbuf,
 			      int size)
@@ -1663,7 +1654,6 @@ static int s2255_probe_v4l(struct s2255_dev *dev)
 		refcount_inc(&dev->num_channels);
 		v4l2_info(&dev->v4l2_dev, "V4L2 device registered as %s\n",
 			  video_device_node_name(&vc->vdev));
-
 	}
 	pr_info("Sensoray 2255 V4L driver Revision: %s\n",
 		S2255_VERSION);
@@ -1805,7 +1795,6 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 	/* skip the marker 512 bytes (and offset if out of sync) */
 	psrc = (u8 *)pipe_info->transfer_buffer + offset;
 
-
 	if (!frm->lpvbits) {
 		dprintk(dev, 1, "s2255 frame buffer == NULL.%p %p %d %d",
 			frm, dev, dev->cc, idx);
@@ -1840,7 +1829,6 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 		vc->frame_count++;
 		frm->state = S2255_READ_IDLE;
 		frm->cur_size = 0;
-
 	}
 	/* done successfully */
 	return 0;
-- 
2.25.1

