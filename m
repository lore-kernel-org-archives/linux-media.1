Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8B8304BB2;
	Mon, 20 Jul 2026 02:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516136; cv=none; b=mw1VhyOZ3lTW2GV0CoNJHtHvcuuE5qB5dIwcGx13lgOxKB0h/wZ6zkrY9ietOdxIaV2HDPSHj9hktRRHj70b1FpeIV460x+hOIW7wy4XVQYyCfVRORLo+Kc8RyBmYd4y+9NtuE33tqXwrD/Jt+59l+lfQ9DM8axNvbaDcm1L05Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516136; c=relaxed/simple;
	bh=WklQwgCcY8NaqpQUwF10uWWl6iMBxFXZ6VqV6p2mmYg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aqVh5MJqYUiOliyWS36OWufmaCatxwK/gr+sSdwQVT8xTlXCp0UWvpu4AJff3zAvxReSrgH/R8pLX3oA2lEFzhIRgDMyNmmOLLwNtCsj+aqAeBZSe9hoImdayKVetCOuVi2s1Of9/D+qwWcMI8s70rfjsvc9AylvsdlIUzruTe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Q/+v009J; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Q/+v009J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=U0
	6s//FcangayRz5TPmdLXncqURKjDnR4HO1WoPel1Y=; b=Q/+v009JvfVWg4MpZ/
	1JbRUgN+6L7RgYXNulaNhJ+2OZoivL3Nw/Y1bV+WxHkDp+3sfeqVWZlKtZYQvPDy
	8qUxatCYhaR+5Ev8Kz5NqnAS6v3+CEmyrBkHmw1oq8f0U/DfcoUQBecHf4f+TcHO
	/ZA1Cds+d/fF7ShkQh1d59bLg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnZIkOjl1qWxR+Kw--.19016S2;
	Mon, 20 Jul 2026 10:55:10 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v2 10/17] media: s2255: Remove unnecessary parentheses around conditions
Date: Mon, 20 Jul 2026 10:55:01 +0800
Message-Id: <20260720025508.207815-1-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnZIkOjl1qWxR+Kw--.19016S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr4UAr1DAryUArWrGF47CFg_yoW5Cr15pF
	Z8Cr90kr15JF15Zws5ta18JFy5KF95t3y2g3y3G3Wv9wsxCFyDXF1Ik3Z5uF1ktr97A3W2
	qFs8JFy0krWqyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Um9aQUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC9A6Yj2pdjg7L+AAA3p

From: Lei Huang <huanglei@kylinos.cn>

Fix all 11 'CHECK: Unnecessary parentheses around' issues reported by
checkpatch.pl in s2255drv.c. Remove redundant inner parentheses from
if-condition expressions where operator precedence already guarantees
the correct evaluation order.

Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index ee69492ba8b9..c65cb794599b 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -566,8 +566,8 @@ static const struct s2255_fmt *format_by_fourcc(int fourcc)
 	for (i = 0; i < ARRAY_SIZE(formats); i++) {
 		if (-1 == formats[i].fourcc)
 			continue;
-		if (!jpeg_enable && ((formats[i].fourcc == V4L2_PIX_FMT_JPEG) ||
-				     (formats[i].fourcc == V4L2_PIX_FMT_MJPEG)))
+		if (!jpeg_enable && (formats[i].fourcc == V4L2_PIX_FMT_JPEG ||
+				     formats[i].fourcc == V4L2_PIX_FMT_MJPEG))
 			continue;
 		if (formats[i].fourcc == fourcc)
 			return formats + i;
@@ -659,10 +659,10 @@ static int buffer_prepare(struct vb2_buffer *vb)
 	if (!vc->fmt)
 		return -EINVAL;
 
-	if ((w < norm_minw(vc)) ||
-	    (w > norm_maxw(vc)) ||
-	    (h < norm_minh(vc)) ||
-	    (h > norm_maxh(vc))) {
+	if (w < norm_minw(vc) ||
+	    w > norm_maxw(vc) ||
+	    h < norm_minh(vc) ||
+	    h > norm_maxh(vc)) {
 		dprintk(vc->dev, 4, "invalid buffer prepare\n");
 		return -EINVAL;
 	}
@@ -718,8 +718,8 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
 
 	if (index >= ARRAY_SIZE(formats))
 		return -EINVAL;
-	if (!jpeg_enable && ((formats[index].fourcc == V4L2_PIX_FMT_JPEG) ||
-			     (formats[index].fourcc == V4L2_PIX_FMT_MJPEG)))
+	if (!jpeg_enable && (formats[index].fourcc == V4L2_PIX_FMT_JPEG ||
+			     formats[index].fourcc == V4L2_PIX_FMT_MJPEG))
 		return -EINVAL;
 	f->pixelformat = formats[index].fourcc;
 	return 0;
@@ -1296,8 +1296,8 @@ static int vidioc_s_parm(struct file *file, void *priv,
 		return -EINVAL;
 	mode = vc->mode;
 	/* high quality capture mode requires a stream restart */
-	if ((vc->cap_parm.capturemode != sp->parm.capture.capturemode)
-	    && vb2_is_streaming(&vc->vb_vidq))
+	if (vc->cap_parm.capturemode != sp->parm.capture.capturemode &&
+	    vb2_is_streaming(&vc->vb_vidq))
 		return -EBUSY;
 	def_num = (mode.format == FORMAT_NTSC) ? 1001 : 1000;
 	def_dem = (mode.format == FORMAT_NTSC) ? 30000 : 25000;
@@ -1822,8 +1822,8 @@ static int save_frame(struct s2255_dev *dev, struct s2255_pipeinfo *pipe_info)
 		vc->last_frame = vc->cur_frame;
 		vc->cur_frame++;
 		/* end of system frame ring buffer, start at zero */
-		if ((vc->cur_frame == SYS_FRAMES) ||
-		    (vc->cur_frame == vc->buffer.num_frames))
+		if (vc->cur_frame == SYS_FRAMES ||
+		    vc->cur_frame == vc->buffer.num_frames)
 			vc->cur_frame = 0;
 		/* frame ready */
 		if (vb2_is_streaming(&vc->vb_vidq))
-- 
2.25.1

