Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067578;
	b=aYix26KvUv1G5jc+L1O16yBk48/nVFqIEWZERnVC7QMpp1ueBvhof62sWFDGSGFOBR4b
	 kpXccEXxlitiVA63pjcut8gb8ijB+lzVmiGyWk99zwXaAAklc6cokZytXqrEf6HgMQ9Tm
	 MUhY2n1RsU1u4hRIfq3AwfbfG2OgJBfsaFheQx/sMng2h3rGmpbBTGnTYye/3AYcG5Y5h
	 tO+JQPkJHrcmH+MWD7WJIEEGmh6o5KXJdoXClhmKQ9+kfH2PRaTBeViA8rA6gE3ulY9R9
	 3T1Fvvlf0yuvioiVrq57FXO4tlZx/fcyWIuD4CgP2dLUZzNIh0PYyPINmmPee0RhYzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+oGtn5HyH2tGay2E9emxXMcr59j7/7G6D6wMx8qk5mA=;
	b=l9rSvNC77Nw7UqOhBylfpMR7DM/OrZZlg0FUuk0maqSFy92kw+o1qb93UfAHa1MBgWd6
	 xbi608U9EcZm5NQHs5hIT26lNZjVKreaL/O9I1X/ZTA4I1E90rfGZDLnjxvROEwwZEk5I
	 28im8ZA6Z2T7H1wtNri9DdpdCWIMxSs5HGIC5xZjdcRF/beOsNLh391sO85BvJ+flm2BG
	 QYL9xNxDLhNuIHEMjhyfEa+HGJKLl0x8vRMT6YgaapqU7OSZmXyI15ugQlqSk+g1Bw8gh
	 v+mGYhJXd2xL5/d1myE3CiHtNcGmQvSnesrHmaogzKEB7Cy6Ln2AqLjE0PMI2cUiHUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LY4Oi5Ly;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C2D606A324
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 02:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4C2D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LY4Oi5Ly
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b125371596so4535597b3.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 19:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793067577; x=1793672377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+oGtn5HyH2tGay2E9emxXMcr59j7/7G6D6wMx8qk5mA=;
        b=LY4Oi5LyC2nqWp4QkFqzZNpPW6fsO85fRDIBN4RXcD+McXJeYu+Yq44Xss4ef2vDIc
         LyYsreCgEHwr8kP0luXzKJHXMi9iu9zH1KYngJEtkHYphSp+y8/mRZJ1AcE3UmdfoQ6s
         4ujHiJjcRcct2KAS3C3z1TD0m4W3J67QPoH2396fSM2BoEKaTu9+CmqADXOH52722yD+
         G7DZ3bPME5l60fCqh4fSE6nAzgE0V6HOsKayc6xCIv1MUwZqG9x2J2jssppuhd2kOzNa
         2dBV6jqpDBD72CUBgGj+bT5bj8uyFKShmmt05NLXX51jWU0rB3Dm00eq5NLoF9Pt9gxv
         IVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793067577; x=1793672377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+oGtn5HyH2tGay2E9emxXMcr59j7/7G6D6wMx8qk5mA=;
        b=OZZL7/i6nj593r2WBlPuUEYm9kNYnvgb2WX43T38cKxiw8VnRyVYt4rdem/jQQnuOn
         3AUTpUK5EzbbMiM1uDfIw1kyYNCWIiX9wgx99ysxoHZ7NrYiw1VpHh1hfeCpC62KAnWU
         +eVOfTNO1u248i2UQdMUmLah3EEf46wudLnS3v/Ov1UpV2WcvI2wxzJ66CMYPh+od3xu
         tNlcI5UJleLReTq1BjxBpbrsPafeiifM2n9zg2HbbE7RPz8akVizaNQcu9tQTcQdirDW
         jM24R1jGCOeJnXrqsc46JHkTElcgUPartz4lCE+3DFacYfIf30F+QZYU08HgtAPATvPk
         nLUQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5vBp2Ow3jPlHmTeQ2n/q5//loX4UT4U739Eaw1lgqlOjNJY7I8HvpiUjaFDUCmKlHu6OFfwmF2edSDQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKP33f5kXllqo78ihMnK0y94R17CjuSxQ/ND2rdFLdBL//wCyau
	hYh3UShPJorFqDddMvFZoolPMrgBLcSly/GuTu5IrfwNvxZRUwxA7X2n
X-Gm-Gg: AYBFou0h19R3rqh07DpHJ2LYOEdUHNQoKESHYG4bUyks8Sq/CbukecvRqS/fvCYC5/r
	KUtNR/FBjVkvsO6EWp7UHNOGqllsJM5+oRzmMu9KE13yNCzcQWmY731vVC+GZLQZljPS2A8fc5K
	xjPxXBdNoaWvJZw8o2wpsNLcUqDDj+ZiTD4JtRzm358WOgC9xmpJ2lPr7Wp060ApLnPYP27x41d
	edW+YcE//tlcoULlHzeCwrBhZtXWzPZxcIsHSds7Of/s+vzjBrrgt22aA53jj1Kp8yyJ5vBPkU1
	GebaMIEuYAu7lY3N4cVA/Om48GbnMDA5069oGvluMefe3ZpiM+VEAJ6sM3g1n6h6cTqndzrl63+
	SXToGdPGZF0TD5gKXGiYXkKOXIo4WrXZLWYaLAocXbfKqcWKunguA0KxX/tAhWRyD0enLvr2gyf
	LaR5TieEYePOBYSRry7CeidRUAH2iu3CUo7SYtY7qwSc+TWlgDGApz6mg0zS2S1mKIN+DJHGjh4
	zxjorGSekRYdjDEu5UFAUILkvn8jvdJsikpDMRB/jGiklmb1ZoIl43MXQZFEvA22lUh+cg8PJme
	xl7LBpqYgsdXLzQQdrDvpcEuNL8844bU
X-Received: by 2002:a05:690c:6807:b0:8b0:a01e:2ce2 with SMTP id 00721157ae682-8b19c9f2242mr11952457b3.15.1793067576776;
        Mon, 26 Oct 2026 19:19:36 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e5ca51asm5148467b3.31.2026.10.26.19.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:19:35 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 1/5] media: iris: Don't flag an empty source change LAST buffer as an error
Date: Mon, 26 Oct 2026 21:19:30 -0500
Message-ID: <20261027021934.22113-2-ccortner@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027021934.22113-1-ccortner@gmail.com>
References: <179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com>
 <20261027021934.22113-1-ccortner@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the firmware completes a source change, it returns the last capture
buffer from before the change flagged HFI_BUF_FW_FLAG_PSC_LAST, and that
buffer can be empty. iris_hfi_gen2_handle_output_buffer() sets
V4L2_BUF_FLAG_ERROR on every empty capture buffer returned while
streaming unless it carries HFI_BUF_FW_FLAG_LAST, the flag that ends a
drain, so the empty buffer that ends a source change reaches the client
flagged both LAST and ERROR.

The stateful decoder interface says of this buffer, as it does of the
one that ends a drain, that it "may be empty (with v4l2_buffer bytesused
= 0) and in that case it must be ignored by the client, as it does not
contain a decoded frame". With the ERROR flag, ffmpeg's h264_v4l2m2m
decoder reports "capture: driver decode error" and outputs a corrupted
frame.

Exempt HFI_BUF_FW_FLAG_PSC_LAST as well.

Fixes: 7adc11e6abf6 ("media: iris: Send V4L2_BUF_FLAG_ERROR for capture buffers with 0 filled length")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse smatch
---
Reference only, not for merging (no Signed-off-by); see the cover
letter.

 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index f0782c4b1e6e..b4fe9066fcb8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -390,8 +390,13 @@ static int iris_hfi_gen2_handle_output_buffer(struct iris_inst *inst,
 
 	buf->flags = iris_hfi_gen2_get_driver_buffer_flags(inst, hfi_buffer->flags);
 
+	/*
+	 * The empty buffer that ends a drain (LAST) or a source change
+	 * (PSC_LAST) is not an error, the client just ignores it.
+	 */
 	if (!buf->data_size && inst->state == IRIS_INST_STREAMING &&
-	    !(hfi_buffer->flags & HFI_BUF_FW_FLAG_LAST)) {
+	    !(hfi_buffer->flags &
+	      (HFI_BUF_FW_FLAG_LAST | HFI_BUF_FW_FLAG_PSC_LAST))) {
 		buf->flags |= V4L2_BUF_FLAG_ERROR;
 	}
 
-- 
2.56.0

