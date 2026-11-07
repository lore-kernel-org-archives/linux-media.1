Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013321;
	b=dG+POB2KSP9vibQ7y8VgOhGMnsnR476Crnkqx8WgPKE1N1juKhLSpgc/I0vpr54O+uP1
	 ckMhmOAwqaATI+ZoihZ9w/163a/KStaNd0F79DRHQqAQoj/zSd6HkE3qQTmjE979O6I+2
	 Ry4BDfCCqtG1D87x2wxLeI/jpBBJAKUaUk1USXU+70QFnt1EihaHF03f7seyLCbvZGjOG
	 q0M6TQGKOOLp7Ylg7ZkSA3O5aIY96egwXqzMdlULbpCgoRizKx0xHjLrPsYrBxYpCtIXn
	 8N/n3fsRgjpQuTtclyzjPMcr5URcK/M5j2SCzCu+tTBmdrrLI+yiiNHpdp1jRpeMjFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pLrJ5gOP6rxYIUYYRq44GlqBmOdL3nMZ2eWc5poqwpo=;
	b=SV23A2jQ3gcDej7qVThYVseI9ds+/exGN5qRTi01/A6bWez6D9K76hnysDyAfW1zLVh/
	 ofdtLhPEd3Lg3JAwevZgbZvSmnpKU3/kudZoOHbq8U9l057XRsWVwQbEHtvlJQarruRzn
	 kaqOOFmOqxGOjFX1tFVFrkxsXtGmBNqzqblu5n2P+4tLshXTPCGsG0/LODK8T7jU7J5VY
	 HRtnd7iXEoIAMciFoXSCqMyYrB/SbHgfkWd+UxxqXuDSX/PKClReAprOpWvsLVWCYsG5Q
	 +hLHdo7KAcSMrTEofd6Ul6gN/kgDCfP9ePu8/q+4pxc/Q0gxpgdmkzpoS4JoNXvRyRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="scQC0/Z3";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8BC606D81D
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 01:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB8BC606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=scQC0/Z3
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4918c2d727fso654767f8f.3
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 17:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013318; x=1794618118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLrJ5gOP6rxYIUYYRq44GlqBmOdL3nMZ2eWc5poqwpo=;
        b=scQC0/Z3N2Eu1D4Wq9LqZbo9ZP3C9hOJmtnL/9thIMgxwF1EeMT4jJY5Ig3F+rcXSk
         /o5usjB/wiJkV0eon3j1ufnb1riextdUjm2d9uh7nNmfVghVVh0xkPUybEQInBXCURoO
         2bo+u3jVtVrxsQcc2k3tczOT7p7cRFI6TqjBfsQx5l438kj1OfJFxeb033FCheflol7x
         T9iRwtYt9zXgxg2tyKkgDFb27IFcuCEmZ4HSRJtvvEIMJPBjGrT7WSZ2EX8gPXpLCTMq
         97h01UsjzcdGYTVsTNdtd4v+ySQeRa3pQzEAewDrOxsLJO+2SKUrIIDMSPR3BLX7h36L
         qlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013318; x=1794618118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLrJ5gOP6rxYIUYYRq44GlqBmOdL3nMZ2eWc5poqwpo=;
        b=rGLUyDTCBndmisxgVU3hbmloFGDshlvejSsJ9a8Yrj4XzQl0JSwBotKgNzcO6k7WzE
         F6hKakZx6eHqMCkS+qpAjUHZCg1DYDIg6FRneqIUGd/qkR9UmlKH0uYEWFhWddgenWx4
         QeIii3xPnwkojL7xAswgGNl6Cccvt/BljJiPljkhs2aXobURLR4gzS2+BzvfL4aX62AV
         TC6ZGbPv5lVSVVSH409z6hwX6aPDGZr88Ah86U68hjxcHqHrnAgbDzRHiv7LhS78OS2J
         u51IIYeHQTWbfBcZ6iUHohoajyUTPETyDxse7U/25L9XR1tdiTPnJN9/J+TEStnfZo5I
         +eBQ==
X-Gm-Message-State: APuU4Z8LWAn++qmk/Gdbi01egiABUsVlte0VM6mkXpr3XWKORP80oC2Y
	IcuPQRWoCbMf6otfj+l0ftWCXC5oroDz0rX1fzih4BKS47ynAAHGcVSJOmo7EyMGMLSuQOWIXZf
	VhU3G
X-Gm-Gg: AYBFou2RC8b9MKhM4juYrISKJrHC5BKXKZXzXDVmKjV/iUlZd4eQ9pZj//7ytwmBlNk
	Hcu1nTTiyXKQW7J+NMVjPW7Hs4CpCF7NFkcAc42KaoefLbWY2MaFIBSE6ckgzZqMM6N38nPC7AG
	/EQGM72WjGB9oYZ8J12MiVWNr9D4YsgretW13CxyP471bj/v8PvjutBQO/Po+mkm/M6yohIUx2N
	yMrfUJP68n/2jiKk4I8GM4RON1GoHTCo2Li3tmt664EeXmE1Jcyo6ZuSZCb7f3LzaShUR30Hs5X
	Gflifa/pU6Z7ADOfMz4S6JyZgq/o1M7VPPrYVi8orkqywHDLsbC/YhXQaeWgTNxjNoD0tPr+WeW
	niZ7+sznmLSOJum8jSxwNf7CxyPuVxPqRyAPqTcCGfXgCVIYaIC3ob2m0DL4ps45dk5yKjQwH0Q
	7BmLxlWZq+XicfZQ0BOOlyLGZT1mBX/yQBKPQ/omQYFvfEbz6rTId83R1VL/SSPBXefmYEgPL6W
	dR7ZPvMK6GelbDQP8+f6WL8ytchCKz8JeeR58FUcKrU8U123OHjFu3B3gKMQzRrFTaWhpjQ+IiI
	0CteObkBICfW6IVIMVYJLZM=
X-Received: by 2002:a05:600c:4f81:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4b6de69168emr59878395e9.20.1794013318246;
        Fri, 06 Nov 2026 17:01:58 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:01:57 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:46 +0000
Subject: [PATCH v3 03/11] media: qcom: camss: Use SOF sequence tracking for
 vb.sequence
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-v4l2-frame-sync-v3-3-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4789; i=bod@kernel.org;
 h=from:subject:message-id; bh=JGr52XC0KJpTg82YxpqeHAQ9Fu52VhhcuMjoPOZQCxM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh9dZbd3fPRuoeFHpwgEKfWl3byocYO+8I29
 tJCA3el7/SJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54fQAKCRAicTuzoY3I
 Ohs8D/4+q257p9dVJwSht9VbwKjtdYjE9JKw63jfTm47W+x5Qku4mYeJLCmjt6QK0dtgS2wDpar
 zxG+nLQws10qL8pcqDtrohM05HSplFpiZkkNLeSDQKqViFf3xf3xtTbZv9Fp+LJuDLa4jxqy/33
 j5vulkwssoebFX/031QCHgCq8CkFvRGZ+VgfniEhgKkmn6DU1BjZOWbliQs72Gk+Ug2hbF50+Qw
 wcnvyVRhX/UkUlFa7Y6XxdAYN0BTFtiebqbsyAB/w0481JgFbRXkWfaDcKzlWrBM7uK3N8+7pr+
 c42c9f/mif5vxHH/8QNAeFs1o2nNm1wcT9Cb9B75Fs0DciH/ZxD+L1JbaxpKI//ll2uOGavzL0b
 aqJSMawIfpcbJxme+MiYDoL/S8jZfSFsz4k3sS1p6otgu1CcyQyuf+YCp8eySIFO1L4qXBZ2a07
 bQcnikRgmrUixpjbRkA7X5Cwnscs+g8r6obm4D+45XNAZdkjlDghSiS9NheccL0JTnNqm7zzeCR
 VSySrbZGrLlU9SJQex12BN9BF5WMPUNKmLREzZAN0spiKchOvt1CI+MauCEaLf3wPvEHvEaK34f
 1jCpB5CUrxk4qXUdv/leI9r2sY/tiyYXnX4FWo/xs82CrxNzh4aHwA9IBDQ/c0X+KwAoLcWEyY1
 PyXfFGjsyBDVZLA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

We want to correlate statistics buffers with data-buffers. To do that we
will need to have a sequence number driven by the SOF signal.

Rather than incrementing vb.sequence when data arrives, we should increment
when SOF happens.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c    | 14 ++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h    |  9 +++++++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c |  5 ++++-
 drivers/media/platform/qcom/camss/camss-vfe.c     |  9 ++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.h     |  1 +
 5 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 7f33fb81ca8cc..588122beec854 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1356,6 +1356,20 @@ static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
 	return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
 }
 
+atomic_t *csid_get_sof_seq(struct media_pad *pad)
+{
+	struct csid_device *csid;
+
+	if (!pad || pad->index < MSM_CSID_PAD_FIRST_SRC)
+		return NULL;
+
+	csid = v4l2_get_subdevdata(media_entity_to_v4l2_subdev(pad->entity));
+	if (!csid->res->frame_sync_en)
+		return NULL;
+
+	return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
+}
+
 void csid_sof_event(struct csid_device *csid, unsigned int id)
 {
 	struct v4l2_event event = {
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index a9d88909d37fc..8edb258b0ae58 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -260,4 +260,13 @@ u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
  */
 void csid_sof_event(struct csid_device *csid, unsigned int id);
 
+/*
+ * csid_get_sof_seq - Get a pointer to the SOF frame sequence variable.
+ * @pad: Remote pad of a consumer's sink pad
+ *
+ * Return the counter or NULL if @pad isn't a CSID or the CSID doesn't support
+ * SOF tracking.
+ */
+atomic_t *csid_get_sof_seq(struct media_pad *pad);
+
 #endif /* QC_MSM_CAMSS_CSID_H */
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index 62c2405359a06..4972d3ab65078 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -491,7 +491,10 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	}
 
 	ready_buf->vb.vb2_buf.timestamp = ts;
-	ready_buf->vb.sequence = output->sequence++;
+	if (line->sof_seq)
+		ready_buf->vb.sequence = atomic_read(line->sof_seq);
+	else
+		ready_buf->vb.sequence = output->sequence++;
 
 	index = 0;
 	output->buf[0] = output->buf[1];
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765f..da373024c847e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -474,7 +474,10 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 	}
 
 	ready_buf->vb.vb2_buf.timestamp = ts;
-	ready_buf->vb.sequence = output->sequence++;
+	if (line->sof_seq)
+		ready_buf->vb.sequence = atomic_read(line->sof_seq);
+	else
+		ready_buf->vb.sequence = output->sequence++;
 
 	index = 0;
 	output->buf[0] = output->buf[1];
@@ -508,6 +511,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
 	struct vfe_output *output = &line->output;
 	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
 	struct media_pad *sensor_pad;
+	struct media_pad *csid_pad;
 	unsigned long flags;
 	unsigned int frame_skip = 0;
 	unsigned int i;
@@ -523,6 +527,9 @@ int vfe_enable_output_v2(struct vfe_line *line)
 			frame_skip = VFE_FRAME_DROP_VAL - 1;
 	}
 
+	csid_pad = media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_SINK]);
+	line->sof_seq = csid_get_sof_seq(csid_pad);
+
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
 	ops->reg_update_clear(vfe, line->id);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index ae9dad353a378..0e2dfa58421ad 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -94,6 +94,7 @@ struct vfe_line {
 	struct vfe_output output;
 	const struct camss_format_info *formats;
 	unsigned int nformats;
+	atomic_t *sof_seq;
 };
 
 struct vfe_device;

-- 
2.56.0

