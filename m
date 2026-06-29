Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA81D3B14CC
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 06:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716246; cv=none; b=pERCCs9eBi7Eso2p+BwQNk+VFU54me79g5xo1VOhXAZpCDHgBcRWfGLOFmxViZsE7xvXBcNVFEsI8FkqAiNyrpYnJ6kiFxttX21K23eCIOmpmN1APCvF9VGrpFZdRsx0HWunDiuEvYprI1pyBSIVnaihE1bLaB3qGAav9+oAyeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716246; c=relaxed/simple;
	bh=hsZf0EtgdsY+tWmPn+scM9xPWdp5oFjg082oWGMeWQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UYTfULqeMsASrwP5QqrhpeoLF5ZhTl/WHsD5iTi1H4Lj0qHj2jw+/GG0MFJu+Upxn/STfmN8zJ5A9iII4ub54bgK4r4HtKPj1NIKnVre1QnaqF944yJ4BqJ967wakom7e51vMyxDLZyBAjtD6CW+WQkxPlkIheLvDVSRhwprpkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AlCtNBe+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AlCtNBe+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF3E1F000E9;
	Mon, 29 Jun 2026 06:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782716245;
	bh=gANALSEiqY4rRDTNTvQxyErofkii+swW5WUvk8t6Gys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AlCtNBe+a2l4C9ScSuwsaM3RnoCWyc5MlUkv3szDkkBS6ZO5o7g4YU8tZAxtoXoV/
	 xqpsQEy3WYzaKTud9fC2baOX39JWUPuPclLmwD9vREhR3yHFDGFPH01zYXezVFDHIA
	 y20pXdTfp82cB+H/pZ2SbNTU2BPoPpFPmm+tCsdWJWW35BZyePbR1uiPyI+VocwA6/
	 WTr1ZZPDaGOR6ZbGZ+8/kIfVec97Uj698AofS2QRyA0E4mleLG2Mqk2r9afEoF0k09
	 tpIXmnvdkyxyzWR4F3uerxgluhH8KDNn3lDzyMN78K+LL1lACNQk7WCbCpkA+AGvu1
	 iB3qrifaDNOHw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 6/6] media: em28xx: requeue buffers if start_streaming fails
Date: Mon, 29 Jun 2026 08:55:54 +0200
Message-ID: <6ababb5d221f99c7acfb0e6ea69ff8f04e1cabb2.1782716154.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1782716154.git.hverkuil+cisco@kernel.org>
References: <cover.1782716154.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If start_streaming fails, then all queued buffers must be
returned to vb2 in state QUEUED.

Otherwise it will trigger a WARN_ON.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/usb/em28xx/em28xx-video.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index e4554d015944..c418add65bb5 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -1213,6 +1213,9 @@ int em28xx_start_analog_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct em28xx *dev = vb2_get_drv_priv(vq);
 	struct em28xx_v4l2 *v4l2 = dev->v4l2;
+	struct em28xx_dmaqueue *dmaq = vq->type == V4L2_BUF_TYPE_VBI_CAPTURE ?
+		&dev->vbiq : &dev->vidq;
+	unsigned long flags = 0;
 	struct v4l2_frequency f;
 	struct v4l2_fh *owner;
 	int rc = 0;
@@ -1227,7 +1230,7 @@ int em28xx_start_analog_streaming(struct vb2_queue *vq, unsigned int count)
 	 */
 	rc = res_get(dev, vq->type);
 	if (rc)
-		return rc;
+		goto exit;
 
 	if (v4l2->streaming_users == 0) {
 		/* First active streaming user, so allocate all the URBs */
@@ -1250,7 +1253,7 @@ int em28xx_start_analog_streaming(struct vb2_queue *vq, unsigned int count)
 					  em28xx_urb_data_copy);
 		if (rc < 0) {
 			res_free(dev, vq->type);
-			return rc;
+			goto exit;
 		}
 
 		/*
@@ -1275,7 +1278,18 @@ int em28xx_start_analog_streaming(struct vb2_queue *vq, unsigned int count)
 	}
 
 	v4l2->streaming_users++;
+	return 0;
 
+exit:
+	spin_lock_irqsave(&dev->slock, flags);
+	while (!list_empty(&dmaq->active)) {
+		struct em28xx_buffer *buf;
+
+		buf = list_entry(dmaq->active.next, struct em28xx_buffer, list);
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
+	}
+	spin_unlock_irqrestore(&dev->slock, flags);
 	return rc;
 }
 
-- 
2.53.0

