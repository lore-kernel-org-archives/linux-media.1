Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7732E54A3;
	Mon, 20 Jul 2026 02:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516137; cv=none; b=Cm3I15tQCkJLA6oT7u9wgq0qHa6bmfEr0YggCTQ8qB98W+fHvau5+puW27m7/6a8/+NYeN3k3s2+P6/kiJJd0bYaUiK76NQKEJLIwrkzPq/w9RIy33L0I2BOlz+ahiUY/pJgBqRxbYK+ZY6+0Q7vzCDEtghegpLB3o0MovaXAqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516137; c=relaxed/simple;
	bh=yphcsMms8/bxNxlQgL6ssuuj35N3Sn+NmJe9wV7ho6s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F8KHiJ/OntFZv2Sxz+mer8bPR6jU885Vf36G7qNULPGePKtTL3RwaiWlIjPTCJPN9rJzcXlMsOWAXwiW7HwMPGqVJMbEEEdZr7qEp4yS6hmFbEFHpYFThpkwz+AGeaZjrjVjp89KpIHYaXM1vWWR7QNGu//Gg1BDZVs9LlPUy0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nkYi5kaT; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nkYi5kaT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=cq
	ZzGjtVU+DPIP4tEa1SCltBwGYL2X0t8QYtd9auucA=; b=nkYi5kaTM2tUYUoar8
	ops6PQqD8SahypL8K9xeBfMAyEMLtXH7EuwEWKGdjtYaI+qn1m3X6iwrYsU0Schy
	lnACQqNppZT0d9bzevSRroObU8WUCg4mXjIROa5FDYr16Hw0OktAccqq/ss2BL0e
	n16meXhAtVDN1GNrfoQQeQ2Hc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnZIkOjl1qWxR+Kw--.19016S5;
	Mon, 20 Jul 2026 10:55:13 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v2 13/17] media: s2255: Fix block comment style to kernel format
Date: Mon, 20 Jul 2026 10:55:04 +0800
Message-Id: <20260720025508.207815-4-huanglei814@163.com>
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
X-CM-TRANSID:_____wDnZIkOjl1qWxR+Kw--.19016S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3GFWDKr4kKw17Kr47ZF47urg_yoW7XrW5pF
	WfJF42yr4DJr1UJry8Jr48G348Jwn5J3y5Gr4UJw18Ar1Yyr1DJr1xXrW8JryDJryxJw17
	tr1DXryUGr9rtrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jL3ktUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC0hGZkGpdjhFv8gAA3-

From: Lei Huang <huanglei@kylinos.cn>

Fix all 'WARNING: Block comments use * on subsequent lines' and
'WARNING: Block comments use a trailing */ on a separate line'
issues reported by checkpatch.pl in s2255drv.c. Convert block
comments to kernel-style format with leading '*' on continuation
lines and '*/' on its own line. Convert banner-style separator
comments to single-line format.

Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 50 ++++++++++++++++--------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 501ac7cf31b3..543155fe75a9 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -110,9 +110,9 @@
 #define FDEC_3		3	/* capture every 3rd frame */
 #define FDEC_5		5	/* capture every 5th frame */
 
-/*-------------------------------------------------------
- * Default mode parameters.
- *-------------------------------------------------------*/
+/*-------------------------------------------------------*/
+/* Default mode parameters.                              */
+/*-------------------------------------------------------*/
 #define DEF_SCALE	SCALE_4CIFS
 #define DEF_COLOR	COLOR_YUVPL
 #define DEF_FDEC	FDEC_1
@@ -480,11 +480,11 @@ static void s2255_timer(struct timer_list *t)
 }
 
 /* this loads the firmware asynchronously.
-   Originally this was done synchronously in probe.
-   But it is better to load it asynchronously here than block
-   inside the probe function. Blocking inside probe affects boot time.
-   FW loading is triggered by the timer in the probe function
-*/
+ * Originally this was done synchronously in probe.
+ * But it is better to load it asynchronously here than block
+ * inside the probe function. Blocking inside probe affects boot time.
+ * FW loading is triggered by the timer in the probe function
+ */
 static void s2255_fwchunk_complete(struct urb *urb)
 {
 	struct s2255_fw *data = urb->context;
@@ -507,8 +507,8 @@ static void s2255_fwchunk_complete(struct urb *urb)
 	}
 #define CHUNK_SIZE 512
 	/* all USB transfers must be done with continuous kernel memory.
-	   can't allocate more than 128k in current linux kernel, so
-	   upload the firmware in chunks
+	 * can't allocate more than 128k in current linux kernel, so
+	 * upload the firmware in chunks
 	 */
 	if (data->fw_loaded < data->fw_size) {
 		len = (data->fw_loaded + CHUNK_SIZE) > data->fw_size ?
@@ -634,9 +634,9 @@ static void s2255_fillbuff(struct s2255_vc *vc,
 		vbuf, pos);
 }
 
-/* ------------------------------------------------------------------
-   Videobuf operations
-   ------------------------------------------------------------------*/
+/* ------------------------------------------------------------------ */
+/* Videobuf operations                                                */
+/* ------------------------------------------------------------------ */
 
 static int queue_setup(struct vb2_queue *vq,
 		       unsigned int *nbuffers, unsigned int *nplanes,
@@ -949,7 +949,8 @@ static u32 get_transfer_size(struct s2255_mode *mode)
 	}
 
 	/* total bytes to send including prefix and 4K padding;
-	   must be a multiple of USB_READ_SIZE */
+	 * must be a multiple of USB_READ_SIZE
+	 */
 	usb_in_size = out_image_size + PREFIX_SIZE;	/* always send prefix */
 	mask_mult = 0xffffffffUL - DEF_USB_BLOCK + 1;
 	/* if size not a multiple of USB_READ_SIZE */
@@ -1141,12 +1142,12 @@ static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *i)
 }
 
 /* Sensoray 2255 is a multiple channel capture device.
-   It does not have a "crossbar" of inputs.
-   We use one V4L device per channel. The user must
-   be aware that certain combinations are not allowed.
-   For instance, you cannot do full FPS on more than 2 channels(2 videodevs)
-   at once in color(you can do full fps on 4 channels with greyscale.
-*/
+ * It does not have a "crossbar" of inputs.
+ * We use one V4L device per channel. The user must
+ * be aware that certain combinations are not allowed.
+ * For instance, you cannot do full FPS on more than 2 channels(2 videodevs)
+ * at once in color(you can do full fps on 4 channels with greyscale.
+ */
 static int vidioc_enum_input(struct file *file, void *priv,
 			     struct v4l2_input *inp)
 {
@@ -1228,9 +1229,9 @@ static int s2255_s_ctrl(struct v4l2_ctrl *ctrl)
 	}
 	mode.restart = 0;
 	/* set mode here.  Note: stream does not need restarted.
-	   some V4L programs restart stream unnecessarily
-	   after a s_crtl.
-	*/
+	 * some V4L programs restart stream unnecessarily
+	 * after a s_crtl.
+	 */
 	s2255_set_mode(vc, &mode);
 	return 0;
 }
@@ -1436,7 +1437,8 @@ static int s2255_open(struct file *file)
 	case S2255_FW_NOTLOADED:
 	case S2255_FW_LOADED_DSPWAIT:
 		/* give S2255_LOAD_TIMEOUT time for firmware to load in case
-		   driver loaded and then device immediately opened */
+		 * driver loaded and then device immediately opened
+		 */
 		pr_info("%s waiting for firmware load\n", __func__);
 		wait_event_timeout(dev->fw_data->wait_fw,
 				   ((atomic_read(&dev->fw_data->fw_state)
-- 
2.25.1

