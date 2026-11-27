Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742594;
	b=vmyVGrJi4mPJtR2x7ckRvYQa9szFWlOuOA1JUR0h8+DMBpPVQIp+WAkSkO49nwYJM0lA
	 9vRwLuWZxPrJ9cdbs+tkhabq00Qk7pCGAsJNbKKoA1IDadusvpttHB28FvMe8mfZ/HIrp
	 3t3akg/4YUO9Re5cJEBUtsE3hey/FYrgS2oymQjJoGHIc6U/+z/QnXV4+xk0tApFM9bsx
	 R5nfi7TsgBl1xEGPN8h/zfTtE7dh9Ku8a9Rt3oNYWxa7jPHgdGHdnZ65NxhHWgul846X7
	 6gC8LTkEugPGVdNmVV96nVP0bwU16L2w71vOn/QzIHgiSm81Wi9e8+NzsaQCxAtFIZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IONrhUu0mCdKD6A1w26OhoHIerda2lYy4CpvhM/qUMY=;
	b=qNMPtM7MPiG8VK2Vsdme3gYSKRUmxDygXylEUFvD/R+Imih8Lwb3Q2HHwSgpXOz0W58F
	 LdKGL2OD07R3Uj1oHrogTGhWi+ajlSa6T7ajY+Uu3XA+AqTJK0nXQ2ISALdrw4tCUt8NO
	 U5wXlEDpOfuGWTNq/8vr1sFt6VJRskR2MjW21smKqfxEeSg8TMTxb5sfGRf3qVjHQhzpA
	 Eihm5yx0YSsp5o2OaWSgeAEuDnVzJdAKEP0/ilhXlKAd1quJsErDC81X2WsHcU1MZQ9kz
	 JEFWIYLY2LZ8F71zXk3hDgiaqChrC9V+jMFOcO0XZ1/+VdRZaBBo1Hcaz7aRWIGQf+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AkI6VSP8;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AC8606A31C
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 01:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67AC8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AkI6VSP8
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f046b0adc0so43216615ad.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 17:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742594; x=1796347394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IONrhUu0mCdKD6A1w26OhoHIerda2lYy4CpvhM/qUMY=;
        b=AkI6VSP8pJKt6qNLty8FIVIgENcCekEOL+G5BBn9KLhNlPqDlv/AZybFE6mFsJLv0C
         Eqt5Oogyrye+y7lWy6eezZwACITarWhvj53V1B1NEpsuamuep4VxUXXcLX9l02JH/FrP
         /Diov+B6Wmo2qHlpOGW9wLOnNrSr41McejHUjGtubZKPZBFC3GDazkkPQoCfJ06pKexc
         /ZF2BcOhgigZpY51dJBRY1QkU9vDtkPf1HZnebEdCvoK4pwIXZyy4VPMsfYM0povx5dT
         hPuR7cET+mzzNjcsEgy35xSRLC0TZoIbTPrCON+wyy1a6c86byOWCAivmEyNm8e71L13
         lAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742594; x=1796347394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IONrhUu0mCdKD6A1w26OhoHIerda2lYy4CpvhM/qUMY=;
        b=mOe5IUC0W4qEaFn5/gTAtFxRqVDpVgJZBvOip39l1/58y3DWoK6q+oRibA5qxSdBy3
         Q5FNiKvbdAxy/aN9SquSJfQdnUA08FaZ7SEIwYQpazFSgMtCwUQkOpAUeFC2Q+PC+OHF
         Uz8qHZXPyFUq3R52L0Mdp5DFZwexd7k9ob/fh4nj9rEAjs/R9KLzyXZOXDc2GrT5FyMy
         dWR4yBt5HjSGOIGhbb/Ng85wye9gHyALMJ9JScZpe4bgHNV4/ng2Ons2GO/0M6ZXpTzo
         dH+TnIyS3YlHopCQ4Z2D+iP1ZdfTWgkCeYMYr7jdyZ5fLejiVI9PtjiaSDJ0QdC69QSY
         OA8A==
X-Forwarded-Encrypted: i=1; AL+hErFKYOviDkEIU9P5PadjBZh3EwfthbDnZXKV4D2I+VQTe2205HlsyaJm3Ntx7emmkyOCFAdVlZhywYQmkA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+HorzDB/48/SfnZT1r5+3uVQv70VQX8EMkcR0dhqvaDn56/RH9
	OwcFIYSzS9labfRzBg2Rb0zSGGjQdViuom7t5RMJYCLb9WwntT8Ma2R5
X-Gm-Gg: AZFdTZcsN0op2OX3TFYwhfsF0yj8TC/iB3gpZONsgoLNf98f79qi8NEwEqfmYuoF3Gu
	Y9WGmwV2KRh17RuBM55T9cX+ObIDf5lWBkzvhqeiFwALiQLyX7ytVVhXdn51KzP7WanWcsbhl3X
	pY47Du4W/GijO8Y+NFVJBvRlAvZPYVtlNKucQBZrSALYZdjx79oFsCL+FqCw7VT9TX6R7HyTOwr
	KaYj1EFQB+mJqCb0yOaUXBDowwpkxhHlc9T6oRV2cKXlRanK2kRk3xru3EyD17+2CFkriKVEFiZ
	wPp6sByRIR26v2FoWJuR+NIOpHV1zGRToGRzkr4ZSEvCbDrkkS66m25UInvAEUZa1Q0RDfy+Ob0
	UauXdDgQQ123Hz3Gyuc8rb6+oXLKgahcBTEtBNdPJ25ek85jbuMSluD3HsqQc+5dhC+I6rvyNq/
	0P3kY2z6CRdwyWp8Tk2tXUSX3VGQbhHK/pM1dv+KJr8uZplv5QjmU7mPPDyA0uNSq7GQfJjz4mq
	1Hw2VT96NYooz8GNHL+60bobiiCVpq4FYXj8WINMr/Dg6kffoD75SkL7kClcNbNrbftVLLCImel
	EGhr8a/HlcxcvfAJSfwuoU9LHj73iXmnqgHZ3v3Egq16M9ZTZGnK7nOVB0edCtFun0A927vxGCr
	2yZsz3ME=
X-Received: by 2002:a17:902:ec8b:b0:2e9:7ff5:5462 with SMTP id d9443c01a7336-2f03f1187f6mr190865485ad.22.1795742593661;
        Thu, 26 Nov 2026 17:23:13 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-229-10-180.dynamic-ip.hinet.net. [36.229.10.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10866465ad.55.2026.11.26.17.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:23:13 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Roy <rongh7426@gmail.com>
Subject: [PATCH] media: pisp_be: Set the field of OUTPUT buffers
Date: Fri, 27 Nov 2026 09:23:08 +0800
Message-ID: <20261127012308.682831-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
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

The driver has no buf_out_validate() callback, so an OUTPUT buffer
queued with field V4L2_FIELD_ANY keeps that value, while the V4L2 spec
requires the driver to set a valid field on queued OUTPUT buffers.
v4l2-compliance -s fails on all three image input nodes:

  fail: v4l2-test-buffers.cpp(240): g_field() == V4L2_FIELD_ANY
  fail: v4l2-test-buffers.cpp(1608): buf.qbuf(node)
  test MMAP (no poll, REQBUFS): FAIL

The Back End only processes progressive frames, and its formats already
report V4L2_FIELD_NONE. Add a buf_out_validate() callback that sets the
field to V4L2_FIELD_NONE, as cedrus and hantro do.

Tested on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39, with this
change applied to its pisp_be module):
- after queueing an OUTPUT buffer with V4L2_FIELD_ANY, QBUF and QUERYBUF
  return V4L2_FIELD_ANY before and V4L2_FIELD_NONE after on video20,
  video21 and video22
- v4l2-compliance -m (without -s) passes 400/400 before and after
- with -s, the MMAP tests no longer fail at QBUF. They then wait for a
  frame that never comes, because the Back End only runs a job when the
  config and output nodes stream too, so the full -s run can't be used
  as a pass/fail result on this device

This change and its description were written with the help of an AI
coding assistant (Claude); the testing above was done on real hardware.

Fixes: 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
Signed-off-by: Roy <rongh7426@gmail.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 8fb7230..95c4f7d 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -847,6 +847,16 @@ static int pispbe_node_buffer_prepare(struct vb2_buffer *vb)
 	return 0;
 }
 
+static int pispbe_node_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	/* The hardware only processes progressive frames. */
+	vbuf->field = V4L2_FIELD_NONE;
+
+	return 0;
+}
+
 static void pispbe_node_buffer_queue(struct vb2_buffer *buf)
 {
 	struct vb2_v4l2_buffer *vbuf =
@@ -958,6 +968,7 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
 
 static const struct vb2_ops pispbe_node_queue_ops = {
 	.queue_setup = pispbe_node_queue_setup,
+	.buf_out_validate = pispbe_node_buf_out_validate,
 	.buf_prepare = pispbe_node_buffer_prepare,
 	.buf_queue = pispbe_node_buffer_queue,
 	.start_streaming = pispbe_node_start_streaming,
-- 
2.51.1.windows.1

