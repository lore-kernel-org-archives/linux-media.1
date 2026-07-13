Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6049B40242B
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944643; cv=none; b=F4PSi75k/42BW7HZbwIbWqJsVoQARad3aPlkpvX1WuFKAz/JHvdmBFKPOaymR218CriwO7gYB/UOgpzClZE/1uKQrPnmfqevNqYQDjmKpDAuByd0Ze3SCZnM85HJZOu1m2mFLVpDs7aZUpjAu8vCqQlNzK0GmGT+xAdK4qfUqHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944643; c=relaxed/simple;
	bh=vz3zl/3kAgDjGicZo1CQ74cjgKIrvemajTZVBVpOX4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y9NuAJmHIuGBRkQli2n7/kbpTNZ1iWRHyBP8D5PNSlJHbfBnKqjtDVY24VTv6y+I2l765i3LrhE4D+J6V0l1Efi71XsXSo0mZ8DPPqstt1/G1aFcaQ9LOS/T8MQmMftTY1jpJ/Quid0fBFB8ZgWCadi7uJ2NLQyA/gCzsyKL7/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+ouIDbG; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+ouIDbG"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso427368a91.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944640; x=1784549440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GCAuneNa/1gKb9DW8CBD7WKj6dTVzcbk/e+PXY8YBw=;
        b=W+ouIDbG7OiYONbX9KveS9FAM0HVQhzJrOd8eKEBZ/TuZbOu937FEKKHswFpPbmgFu
         +CQaFgSiEFWQMJoqAYotqB4XMykUyQsYOpUED6oIWtCwTXRd2G+n1Qv7tZzEhfePAseV
         qOorlMS5O/5ETrsSJbK86HFenW0mKQuy/YP4VKcppK8k7o0LHQAANO7031e78kWzuX/z
         rmZS7NFTwgtu9StAaPETNwqrmFoncXMFHOKY5iKgrYju4KeuRnZYF7COqK1ixMDlHETw
         jwQVols77B0KUT6jmiETspfqBRhibZ8D4G2zQasGqYzBF84bTiysbLwE/rQRe9IU3fHH
         jEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944640; x=1784549440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6GCAuneNa/1gKb9DW8CBD7WKj6dTVzcbk/e+PXY8YBw=;
        b=Y+C5R0/IgbhLAYJpqUikHTxtlOanmffxWfXmEwbjC3Ue5Tk7J1k1hek6eY2zu2DSFa
         onzzsMzJbP2wp8QzxNE3Rl5iFFGGv0kADcuzZu8zhOBCoao27HRX2jdds34JvmC0mcvy
         CO9S+0zdRejPt80t50iBb6+c6bSQMG6AsII+/o9+kNvfInRGpzPb6Mcf0jbw5/CyNOPN
         /jnc4T3Nym7JsTo8A3Z6FTy4FsRFd3SYpETePHapzByayPujCnNNjpKYQJxzaKIcgrDU
         mgdDDyFf1EIUZ71/qvm30pBjWVphfm4k1JAUAM3asz/h3Xs96AroNILoSw27l9mt4z1/
         dcLA==
X-Forwarded-Encrypted: i=1; AHgh+RrAmSAJ24zifyU4iw9v8uCGeQ7R7uaitRLvbO4jQ5gCsvUD8oASufplk5Oh+TegcDl47cqs5K7SSaW4qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxla4JeHNr6Z1UgdU7jhErbaZoV+rKRjtIjrkC0sgLi6atLsOpQ
	EXEQuTeltlc0+4+4zz4JRS9ttfBjwQVT0yQdhLaja4/hagJFnAM9BUO0
X-Gm-Gg: AfdE7clkYChBASOJx7ryuHXkjs3WH/a8AEMWUF7n+WguyVBeW5+4bns0aah2la0e7+d
	2yenE8+Ot00AeBW/3RDcmOQhTZVZl6j0XhJKjOfExBG5h+jHGdV64U7Gw4+MQGNStRtN8Jegyne
	ZuAAlGdxbefOxCJuVmhUXTRWp8CWXC71WBc0imMyST2u0k8mFMiWyyB7vLXXXH8A95Ze4oc4Tog
	zMRvvRPfWCOzCsfqL/n21aFS3zPg8w5kX0VvE0ozMY3+ZvUFBbplVn/fcmNwzfSqMI1a67fB9zF
	6zwiVDmxVBmczE+9C/nSFC8fWzw+4oAmozG66UrMmR3IBfQwTSPLbBUhwYpaChV7KBP9LF6BOeZ
	nRq3Luspp8a0m+RR9hB6tzy+DN0oXS5DkFPZu80nlXG9t+N8dn972qXZKLusAUDgxHQXvug4D0w
	UiFCT79dTGbA==
X-Received: by 2002:a17:90b:4fd2:b0:38d:a76:6470 with SMTP id 98e67ed59e1d1-38dc77c61d6mr7650924a91.39.1783944639617;
        Mon, 13 Jul 2026 05:10:39 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:10:38 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v7 10/19] media: meson: vdec: Fix race conditions and leaks in esparser pipeline
Date: Mon, 13 Jul 2026 17:37:05 +0530
Message-ID: <20260713120840.17427-11-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a circular locking dependency (lockdep warning) and a potential KASAN
wild-memory-access race condition within the asynchronous esparser queue
by restructuring register write and context evaluation blocks.

Previously, evaluating hardware ownership checks outside of core->lock
introduced a time-of-check to time-of-use vulnerability, risking register
corruption during parallel stream initialization cycles. Additionally,
abruptly exiting the payload queue loop without sanitizing timestamp
trackers left metadata dynamically stranded in memory, triggering regular
kmemleak warnings.

Fix these flaws by moving the hardware session ownership validation and
atomic stop signal checks directly inside the core->lock mutex region in
esparser_queue(). Ensure that presentation timestamp pointers are cleanly
removed via amvdec_remove_ts() on all early-exit routes. Finally, refine
the VP9 payload evaluation logic to correctly catch negative error passes
from vp9_update_header() and pass the session context explicitly to the
padding helper to secure memory operations.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c | 29 ++++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index edbfc829e2da8..b9f36fef4be12 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -199,12 +199,16 @@ static int vp9_update_header(struct amvdec_core *core, struct vb2_buffer *buf)
  * the ESPARSER interrupt.
  */
 static u32 esparser_pad_start_code(struct amvdec_core *core,
+				   struct amvdec_session *sess,
 				   struct vb2_buffer *vb,
 				   u32 payload_size)
 {
 	u32 pad_size = 0;
 	u8 *vaddr = vb2_plane_vaddr(vb, 0);
 
+	if (!sess || READ_ONCE(sess->should_stop) || !sess->priv || !vaddr)
+		return 0;
+
 	if (payload_size < ESPARSER_MIN_PACKET_SIZE) {
 		pad_size = ESPARSER_MIN_PACKET_SIZE - payload_size;
 		memset(vaddr + payload_size, 0, pad_size);
@@ -313,6 +317,9 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 	u32 offset;
 	u32 pad_size;
 
+	if (READ_ONCE(sess->should_stop) || !sess->priv)
+		return -ESHUTDOWN;
+
 	/*
 	 * When max ref frame is held by VP9, this should be -= 3 to prevent a
 	 * shortage of CAPTURE buffers on the decoder side.
@@ -349,24 +356,38 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 	vbuf->sequence = sess->sequence_out++;
 
 	if (sess->fmt_out->pixfmt == V4L2_PIX_FMT_VP9) {
-		payload_size = vp9_update_header(core, vb);
+		int res = vp9_update_header(core, vb);
 
-		if (payload_size == 0) {
-			dev_err(core->dev, "esparser: VP9 header update failed\n");
+		if (res <= 0) {
+			dev_err(core->dev,
+				"esparser: VP9 header update failed (%d)\n",
+				res);
 			amvdec_remove_ts(sess, vb->timestamp);
 			return -EBADMSG;
 		}
+		payload_size = res;
+	}
+
+	pad_size = esparser_pad_start_code(core, sess, vb, payload_size);
+
+	/* Protect hardware register writes under core->lock */
+	mutex_lock(&core->lock);
+	if (core->cur_sess != sess || READ_ONCE(sess->should_stop)) {
+		mutex_unlock(&core->lock);
+		amvdec_remove_ts(sess, vb->timestamp);
+		return -ESHUTDOWN;
 	}
 
-	pad_size = esparser_pad_start_code(core, vb, payload_size);
 	ret = esparser_write_data(core, phy, payload_size + pad_size);
 
 	if (ret <= 0) {
 		dev_warn(core->dev, "esparser: input parsing error\n");
 		amvdec_remove_ts(sess, vb->timestamp);
 		amvdec_write_parser(core, PARSER_FETCH_CMD, 0);
+		mutex_unlock(&core->lock);
 		return -EIO;
 	}
+	mutex_unlock(&core->lock);
 
 	atomic_inc(&sess->esparser_queued_bufs);
 
-- 
2.50.1

