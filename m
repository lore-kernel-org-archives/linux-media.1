Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA16332621
	for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 13:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379784; cv=none; b=NEyMic44OjV0nVjBWYx0VzUvwaQNJGvE4s8uN2o7gj7LYReeYow9Bp/ufCDZBwmZ00NyaONLS05d6TsUt6F2N7ZajCBOx9fiD/C8gLOBlyIcMg3Z6JBWfGLFuz1lFuIIVRfNThsk7P8qlNN+itJF7+lxL0mv0v4VLGtP6xXCdM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379784; c=relaxed/simple;
	bh=+Grdugcauc4mZVTbOs5VT+LBzVeVXGJ51Rt+36hFDMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jYdbmzBnDwQQSZ/UpbVhUmIbLwCRVFDai/fbAyCVgK/1ICzVutYwjUtYYy9g/9Z5IA1TwRPTLy2853QoXgBX8yUi2ESntfZ156AliKpAmXd3KNONP3pD3TBXB84iIRa3cEAqtrSia1NMaB17f7mVnHv4+urnkKV1qni2HM9MbNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUhkzExP; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUhkzExP"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca12086c06eso7207929a12.0
        for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 06:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784379782; x=1784984582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGP+4K0uZcwD2O//SMtKKili1zVc41sNCrJ+p97Mo6w=;
        b=QUhkzExPQAkboYcdGo/qzGdaYT3v6QFOakvBNceSHlHVu9v2k2hcFbDgNZBWvgnKdc
         sGoYit0sf0QaYvGRB7kWevJOsEWX9AET6Oec4QiHNttl1mKSpExNnw84eqlWeKHL9w4W
         27WWYLy1QB+wXH7rueRZLgF6VCjjuy0DE5bb4j6PfjDGgTmlGqSzn3sPVs3mKARTX45Y
         TVjKOiN+X7Li80IKXV7ZThq7ms42fbRkwqFj1btnj4Hz1PfFeCttHjqthVpHkFztR/T5
         LdV3tAD85NN0kBBuBCtR8Nelnl4CtDGs6a+WmEt0NA7VQqwaLwpKIWhIDTcYZts6Bgjx
         4KvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379782; x=1784984582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UGP+4K0uZcwD2O//SMtKKili1zVc41sNCrJ+p97Mo6w=;
        b=E+P6TO3eu44nlo1wg/pb26Zbw/6N7T5fqRNt+mmcDF+XmFs/hGnKMMcWjHURDvwKSw
         o80VWG6Jd7MPEjKdD/vQeZG970JVODn02twoNwCYSU2N2A53wsdMyZ4aG41TFRAjDkg5
         BMddqDq8+NrINg0cOiNJ1xeL+l2DFM5ehU7Vvm+KPWE2rmxil/30xSac9rHnxUiJ5hnQ
         RkVCZzrZOcrGyQUFjQXOlqtK87HjfXljfxR+cuAVEOEmaUFsAlcMTRw8HUIXZVEe3g7S
         sLpmBTRm7sJldLj4sv8HotvX9FcTU3wBnsiDF7U3wSZ5z8BKcLrBgnir8UR2fDEAj8R0
         lXFA==
X-Forwarded-Encrypted: i=1; AHgh+RrG82cZ6RZtfnTBoBCdO0lLVZPnybZVNyf/mid2Y9bnxmodfllMuDw71kUoDBepaxnkujASyNj0SkKAqw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2oSF/aNEaqe8eOBZOZxyPMA2kyXrz5UN4l+jjmQWmr2vReYWz
	9TP38ahkD1rEmEhRTQW/CD1A1E0hud4VrzcJB4Y81LSxI9zN+jE4/aaN
X-Gm-Gg: AfdE7cnnRNShBmeuU7M9+tUIxnk4jkFMeGi0g3QVe5zcC6Yrux9+2yTWeZ9SobDb4zA
	9GMqELY8vpB5TJrREDoQf09IfntAt6r+T+P1LOdQLFGy5qMfkcfjECYdchXWGg8fqBX+9nTjgGh
	WLKeaUQCfh3Ty0Leqe4CzeKuA2dSeMA+3jJChHA+R8quvLp7o6pJ/34WqJwrHI9a5jiy4GeOZQ8
	3i04ZuZ+iPcCVCJgQ1aDs6mpios2rV5lxMbg4h11YaLiC4EZCc6eiyovGugmrhgFcVDqW86UwgQ
	3pTdXgiL4VBxV9nDzf9jojQbHIt0fI3KL/EwcgD+7GotdKclIHHZ7dQtTaZGh6NrgF22SsffQoN
	deEsH2JsAXx64J0vkD8htXrnn651KxGf+jKbCxi+CyG12AYEgzfGa8znT2Gha
X-Received: by 2002:a17:90b:1d10:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-38e659bf4d8mr1058381a91.0.1784379781912;
        Sat, 18 Jul 2026 06:03:01 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4aff383dsm2766845a91.8.2026.07.18.06.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 06:03:01 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH v2 1/2] media: chips-media: wave5: Check decoder qbuf runtime resume
Date: Sat, 18 Jul 2026 21:00:36 +0800
Message-ID: <20260718130037.3306626-2-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260718130037.3306626-1-lgs201920130244@gmail.com>
References: <20260718130037.3306626-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wave5_vpu_dec_buf_queue_dst() resumes the VPU before it may clear a
decoder display flag. This is needed because clearing the display flag
accesses VPU registers.

However, the return value from pm_runtime_resume_and_get() is ignored.
If the resume fails, pm_runtime_resume_and_get() returns without holding
a runtime PM usage reference. The unconditional
pm_runtime_put_autosuspend() at the end of the function then drops an
unmatched reference.

The failed resume path can also continue into
wave5_vpu_dec_clr_disp_flag() while the device is still suspended.

Check the return value. If the resume fails, complete the queued buffer
with an error and return without touching the hardware or dropping an
unmatched runtime PM reference.

Fixes: cbb9c0d50e47 ("media: chips-media: wave5: Fix SError of kernel panic when closed")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index bb2ba9204a83..03d108b808ba 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1290,8 +1290,14 @@ static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret < 0) {
+		vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
+		return;
+	}
 
-	pm_runtime_resume_and_get(inst->dev->dev);
 	vbuf->sequence = inst->queued_dst_buf_num++;
 
 	if (inst->state == VPU_INST_STATE_PIC_RUN) {
-- 
2.43.0

