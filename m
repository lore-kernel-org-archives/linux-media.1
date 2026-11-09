Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246674;
	b=M6WcNANEAotTQHCaeEM9sDIikpTvjno3gnG7tZ+eXnejMJnWIcrGZOXkVWrDUGNMFH4J
	 qgN/KKju3n42nMO7q7W6f0e8VpMUPMrPUEm2FDwK+FqkajmVdLBm9kG6Fzjg7wxrtcWBZ
	 Ul1FKngcurAe+IY5HH3tzVVb1Ka/Khd9H65NSu/+3FuaBE+Ob14BMV+ZVracOo+pv9hE/
	 6vlVeOylavVyR83Fr0Ay/2v+4LRzNOjPMu8lfcgjPcM2KFwHErWa1Acz7Vvo3o749OlI8
	 w3IGZiYgfMv89asQwVB5pDx2KzrCvjrc1XZk21l7XOC2WiUYg33qhXu5IaD8FBOAT7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EMH3OXraqN/u0b7tImF7Qn3xU7G/zv7ZwqiQdfYEX2U=;
	b=mf7iWUfPs2BoH74obL9zrsysAvm4PIZXlNyDb/FZNQrvEtXpYbuQLqlH47tc/9V7u49Q
	 5zQ5hygyak9vmW6WXCyqvRI+X0oVAg2VMFp36FNQuo+jNIt74aVsYXFnXRqjn/okjMubS
	 a/bKyCad20c8ayBnVWKXq9X8B7ZIG07Z4I1DHON6wD6zP5toO+q21rNr9ibOHX40cdkAD
	 pyKzwQMJ7XW9fzHD/RgWvWYxkWh/MESeKKiqBVCuJ/odxld3UULqDU1kOAeWw1ac/joRC
	 1kweuORSHg3PcBp2PNxRsI8qEdaRvu9PDto+UeGLJLfGC2Oik6Dv+Yqnv0wGC20WFwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moAnIuGC;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C711660A3821
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 17:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C711660A3821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moAnIuGC
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso12748675e9.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 09:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246672; x=1794851472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EMH3OXraqN/u0b7tImF7Qn3xU7G/zv7ZwqiQdfYEX2U=;
        b=moAnIuGC/sD2YwtcreaQOJJCH6tTrMmgzZNXQFIZa+F/p2rwXs4PRlGzvmTTl8tb+J
         R8Sr3alHVkQVnxX5Yr2u8dm+I7ILfhu7SIBaBkD1KXDIABOk8O0YNvFzkMa4orRSx7jw
         1GWQefqQV4IQcsTIcxh8c9sVJgZ25m+Z/ruu/FQ/sMp/63+hUEAvMVm5PP/BPf00JRWt
         PFOllp0c+WYJndhAeZqi2KWac3TEcX8e0IVmHL82hiuRxXQ0aIoOFHoW7vM5E0g57uPT
         kE1pazNcr/bytWFcYIAWAZAG8ryrxleurkojLZM4VINuIE6cQ4f5eBmXsdVlybPycXOw
         p9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246672; x=1794851472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EMH3OXraqN/u0b7tImF7Qn3xU7G/zv7ZwqiQdfYEX2U=;
        b=z3VnM28DHnffRulqtu0AzbmPzA17YSB5q1o70KqFiU+0YoqjKwEiPEtn+hxEuIr0cO
         GEqvOSLcSvBnKD0B1iyo0chwP/AITYkYraS1kTB6BnG4WnvhlIC04sNr7Mg0TvbvEufo
         5wTCokQyZ7y41PRGi9HVsCLXQfikT5SpU+HNQu+vpOSbpUa0EEUuM1gGNx2pH5aZ2Yu1
         XJmVRLDvedkYHL/OsplyjvLDhsLbNNNs9c62uDaejFAOmg7uvuqtKFCbEit5tk1ygWzR
         zaqkDEffCBATx04ASVlanJjESyFhiK/Vt7eA2hyFFZ6ugvUNlBlj0IYnDWMnOcOJyvnT
         s2WA==
X-Forwarded-Encrypted: i=1; AL+hErHNB9Cq65z4lq8xjkmsJ0r9fUqAf76r6ACa2WB2Iy0sF2A8BG1oUet/7ouhtxouVKG3GrQATEQswaSR4w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/rJXKYUdHWNzyOwZL4PE3sA4eu5eocTpOUOAGjeSj0OXUbzR77
	j8R3Nb55bp+baQOzkiZNN2wPBBcbY+bG8fYD0KzisPX4nrGDPg9JBu+4
X-Gm-Gg: AYBFou2tjF/FbDxDNcBRvpUZhUYYT2x7ARLrVWKLCLc6Efe3W1Khu5zmrod6916asqo
	90LxRyyLsHNLAyp3+A1ZV7xywPEmP2iIYCrbKqCIdX2GY0QYcViz0XHqQP5EbyZx+rLY7SE3HIz
	zOjC5eOqOMTq5WqX0qxUXrPv2jJeaswv6TF41vsMnERU/xmi7ZwMKGHtJz5RrMm0fKRGWnPuy9O
	L9MgjFNBYc9Izv6J5ScFFr8N/e+JktdtpFlLFy7l0RWI6u/pICKUAvHuXnGEbq2MrWQ7TpSpgs2
	G2fRJ1yqiV/YEkmbheIKG5w+J4su9yD/GjbCpOWAeEz9dX7L94J8jvRcpAMX3XvvMeczLkNqNTJ
	nHgOUhb71vP8bDXw9G8wSf40c//Ft2R6qA59UsalpHEJ8N61pZMiMxLaIw3nkpihf4izN+FNhzw
	wSTmDfAAaSDJHhm/1RXpGgbKZXteSCYcXkpwXzKejgJi50HB9Zwsh8GuOV6laAU/KCet02U3D/8
	2woBVwVEX3L9PYAbGQlWniUMWo3Oc5HWul4qXCs3eatMW74UqOutcZ2BQY9RX/lHKm60hdY7hsF
	OfYSUOj7JXGVQ4yIhuL/GoGblOYlnCsSfJ+9oAkSiYMQcqnERV4xWMRsUR+cT1Ldxpe5W+d0rH3
	qMjARnzDIido51eldKrgp1Yld6IND4oOab1XrsK7UoZA980Ljv4E8tty0vh4eCZxwhPikQJYwZ7
	1bFR49jXrh2J6h3sMnIw+aPOt7t/hEIeD/5fZQESkHt69MOaWNkv83zsw+xHBwLvXLl9anKplKM
	ZsK7T2ZAXsGkX60H1QytJdXMLU5khY9NlIGOHSu1r1so34QBZA=
X-Received: by 2002:a05:600c:4ec7:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4b963c8591bmr96421945e9.15.1794246672153;
        Mon, 09 Nov 2026 09:51:12 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:11 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 05/11] staging: media: cedrus: mpeg2: derive the field order of field pictures
Date: Mon,  9 Nov 2026 18:50:10 +0100
Message-ID: <20261109175016.42061-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
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

The hardware uses the top field first bit of the picture header to tell
the first field of a frame from the second one. However,
top_field_first is always 0 in field pictures, so userspace passes
V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST cleared, and the second field of
every top field first pair is predicted from the wrong reference.

Detect the second field in the driver instead: it has the opposite
parity of the previous field and is decoded into the same capture
buffer. This works with unmodified userspace.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  5 +++
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 32 +++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index c2318521d7e5..572e70a94b3f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -144,6 +144,11 @@ struct cedrus_ctx {
 			void		*entry_points_buf;
 			dma_addr_t	entry_points_buf_addr;
 		} h265;
+		struct {
+			bool		pair_pending;
+			unsigned int	pair_dst;
+			u8		pair_structure;
+		} mpeg2;
 		struct {
 			unsigned int	last_frame_p_type;
 			unsigned int	last_filter_type;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 8252a47994aa..315b0e5b3c88 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -58,7 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	struct vb2_queue *vq;
 	const u8 *matrix;
 	unsigned int i;
-	bool field;
+	bool field, tff;
 	u32 reg;
 
 	seq = run->mpeg2.sequence;
@@ -87,6 +87,26 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 		cedrus_write(dev, VE_DEC_MPEG_IQMINPUT, reg);
 	}
 
+	/*
+	 * top_field_first is always 0 in field pictures, but the hardware
+	 * uses this bit to tell the first field of a frame from the second.
+	 * A field is the second one when it has the opposite parity of the
+	 * previous field and is decoded into the same capture buffer.
+	 */
+	if (pic->picture_structure == V4L2_MPEG2_PIC_FRAME) {
+		tff = !!(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
+		ctx->codec.mpeg2.pair_pending = false;
+	} else {
+		bool second = ctx->codec.mpeg2.pair_pending &&
+			      ctx->codec.mpeg2.pair_structure != pic->picture_structure &&
+			      ctx->codec.mpeg2.pair_dst == run->dst->vb2_buf.index;
+
+		tff = (pic->picture_structure == V4L2_MPEG2_PIC_TOP_FIELD) != second;
+		ctx->codec.mpeg2.pair_pending = !second;
+		ctx->codec.mpeg2.pair_structure = pic->picture_structure;
+		ctx->codec.mpeg2.pair_dst = run->dst->vb2_buf.index;
+	}
+
 	/* Set MPEG picture header. */
 
 	reg = VE_DEC_MPEG_MP12HDR_SLICE_TYPE(pic->picture_coding_type);
@@ -96,7 +116,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(1, 1, pic->f_code[1][1]);
 	reg |= VE_DEC_MPEG_MP12HDR_INTRA_DC_PRECISION(pic->intra_dc_precision);
 	reg |= VE_DEC_MPEG_MP12HDR_INTRA_PICTURE_STRUCTURE(pic->picture_structure);
-	reg |= VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
+	reg |= VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(tff);
 	reg |= VE_DEC_MPEG_MP12HDR_FRAME_PRED_FRAME_DCT(pic->flags & V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT);
 	reg |= VE_DEC_MPEG_MP12HDR_CONCEALMENT_MOTION_VECTORS(pic->flags & V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV);
 	reg |= VE_DEC_MPEG_MP12HDR_Q_SCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE);
@@ -188,6 +208,13 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	return 0;
 }
 
+static int cedrus_mpeg2_start(struct cedrus_ctx *ctx)
+{
+	memset(&ctx->codec.mpeg2, 0, sizeof(ctx->codec.mpeg2));
+
+	return 0;
+}
+
 static void cedrus_mpeg2_trigger(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
@@ -205,5 +232,6 @@ struct cedrus_dec_ops cedrus_dec_ops_mpeg2 = {
 	.irq_disable	= cedrus_mpeg2_irq_disable,
 	.irq_status	= cedrus_mpeg2_irq_status,
 	.setup		= cedrus_mpeg2_setup,
+	.start		= cedrus_mpeg2_start,
 	.trigger	= cedrus_mpeg2_trigger,
 };
-- 
2.43.0

