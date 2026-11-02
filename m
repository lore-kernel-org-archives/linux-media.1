Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639009;
	b=n/I/wOi0CuY72VJEeSN8Q8A7yapj4gecwkJauGps2Sl+GHcDnpxRn2bqsfqyvbuqR0uT
	 G/3+97gGONaUJIA1sUIlS1opQsYs5TI1A5ImTxEj1RgDCZT6nHlvqaiYIMmEaitkGEs0Q
	 VEhbT/VDkaUWGIRVI2XhRBDTaqfzwoDZ7XgN0jGOsA0cRw9dgmGGopWpaeD9r9n4sLrT6
	 r+6J6M0YV7uaaMMZ+8dRpf0gRCQ0FfDmwfgt9pogwrjKLOnEZgRWQQxcnPkQCBW02akEZ
	 PHs2QjwRdZHiPKOkDYGgq5x++5r8a7psWQ+meLrSe6fiiQ/RxWc+UXjThgXlFUIRJ5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DB2KcGsKCTwj0N32grxyHjYPqw3VEDsJ25BOlOdNqgk=;
	b=E/esRR+dohyNE9GeTRVyjimembiH1q49IUY3U0cO+kMDfUPeMuE/GmECVe+VRMneihUA
	 wPvq8XHjKHetCmgZ9tUyWPzNHZKFQRoDxxE7QEEd/LSZDkB9BCA6Zrqo8z9+i6l5LP4K4
	 H3MaRtb1Sueo/3QN6jb42AoMGpwcKMmhqdRvjEd1hjp4U6+0QvW5zs2iCPGY5BxQPIVIc
	 5cFwEJwcUk4l6hBAk2UrVpHz69v8PUSAMGP8jGSbLlyxs0LPdWss1uEhi5Iz/tu8r9oph
	 nRoJ/cCaTr3Az8u7/2RLe268x3ykobjB5d2VgtK5RQViBfH27djtVdPRGXVzNomQ7Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cm9gq9ww;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7D96070391
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 17:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB7D96070391
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cm9gq9ww
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so523911266b.3
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 09:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639007; x=1794243807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DB2KcGsKCTwj0N32grxyHjYPqw3VEDsJ25BOlOdNqgk=;
        b=Cm9gq9wwQ4rD2aP1yck1bGsQmh+WCp6/4isOqOAaJ2qGmWw7E3QxiykK2KHnrEIfrD
         NMKWQxl7Ws4ptM2SSdrVXg4ij9oKHJhAYJT3ooOrrZ5kosrTekxPrSViZLCcDNNlBCPj
         KtrKNbRaDFbpgD/UxlVbCmk3d/NBGEKue44aOy/m5ZS2A18KXuDz632mIEs5/eJ50ISu
         RME/ypoXhy0/rpVXbKuLNGZRHm1IBS7ePvdeogu4i5GsFN9hWT7ULi/K6O3qfzfDalQR
         kMwQPZrhWy0AyFbUR2aVO+sJcJAgig7BZBlihEtG4+7bDWPkE0Hz2pVAuTp73G5sp+dj
         NVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639007; x=1794243807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DB2KcGsKCTwj0N32grxyHjYPqw3VEDsJ25BOlOdNqgk=;
        b=U97OmNpDEQ0tdyZjVP3VHy1fMH3pkyJtKM3KV7UBPM6YK0WTySSEgJgLVzYuf+/DnC
         6MaBeSL0BzZKT9/4clGti/Q6baztUrXKiDarg6lHTf7CvfapbJ6iWPtZ6eQtbmizYlDp
         /FFbdrSzTYaSWzX3zCkZzH84M3AQ9nzzPpH0y42qyDl6BbZCG49GYGnBaBKVvTLEHp52
         4wbwHC2WTaIb5NpOwQdbUiZl82j840S4AfSxGu3OJJOyyx9i1R2ceGvc5y6mZgKB6yZE
         khbOfyv7zyU1v9HxV85FviMl+8c+g0g07gU7BZmwrmjJg0BiFToWokePUZdM+0EzB1xg
         Vahw==
X-Forwarded-Encrypted: i=1; AKwUvByVWLmNh6hXLkgtsKMq3FFgXqhof12ie/N6SrIc0GD9n5FX+CqbfufTMrP9NXP4F3ABdu1AMktIqJP78A==@vger.kernel.org
X-Gm-Message-State: APuU4Z886bW4s04R00YB3+dyCWUWJSUu+Bbq6YYtjJel4y8bHMpPNt7R
	8qyaqqCLyAFucYtErXIKvNVGIMkvjTRr1w/FGwGLXFPks8gwVFKQn1MI
X-Gm-Gg: AYBFou2+xiL7EHGF52fZlziVBSWEmWGu+Yr5PenVF/bObbPDPe+s3AwmZcZy4IYueGe
	ctnGCMplaAEV1Humwzj07ZUAL9yJjrBaqDgClC4tLd/12FhmjXHiu6I3aO+8uUEM8E5iZvxYzsU
	qpv6K/doxOggRaqvrX6cWJi7LJORbVA4yfus1sWtCCE6Fs1DxjjvmSZdKoAOb2Iw3caMPF1/BD2
	tzTfp6U5qPQzbHuOq5kVMpsukb1FRg+rT5ODHJhaPKVgTzMh7JzdWfuoVmFCLhn6Eca9ghrR5SR
	ViF5vVCQgIcRC3Jja8wJWvii4CXYxqZtqumu/XkWlPd6oTsDHYewI0DaoJlV/f+n7EKnWCuziny
	JbQkGXnPQl9cKDZDNyxj+FieiEgyGD4HwopckObK0q6MzzO9KHaFFG6XsCiryk0FliHzTcV8Wl+
	ChZVPNb73jWgL4CylDI0laLAqNyB7gbHjG84IZYsdIW3f4MIhZwxcaErJfe+ZeNb5Am/zEt6v6X
	hvGhHmCj4Ueriwrn9scxr22lKO5/cUx8vOoceFQCMTRJ12WqbpPUg4V0OQa5PgZWjMeXYdLzlRO
	fcNx3HeTBhI0GnpYuRlKb01JQo/qfyGU0JX0ahGJ8UbpVzVr/Am49CiDzxKJDyvJUzXtLJSCJ92
	hUuuKAiSEcMxs9wDypesa88UpdXQ6ZV755Zs6wuFph0oi6lif8b3LONhUQzBfGc1Csgii3/azEj
	lS4D0BcS3m/zoctmn/cNkTrv2JwzSNt6ZWW4HFYGh31PmAfI/2/DWCTssFGQiW/+/1ETZb8km1m
	SrxeeTWREIiB7abDnlt2GAckWdawv334MwFdDhoYSeXCdUXkA==
X-Received: by 2002:a17:906:ef0a:b0:c3e:cb50:b7c8 with SMTP id a640c23a62f3a-c4ca7a1997amr921711866b.12.1793639006912;
        Mon, 02 Nov 2026 09:03:26 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:26 -0800 (PST)
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
Subject: [PATCH 06/10] staging: media: cedrus: mpeg2: fix the references of field pictures
Date: Mon,  2 Nov 2026 18:02:59 +0100
Message-ID: <20261102170303.1973892-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
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

The second field of an I or P frame can be predicted from the first
field of the same frame, which the hardware takes from the backward
reference. The driver programs the backward reference passed by
userspace instead, which doesn't point to the frame being decoded, so
the second field is predicted from the wrong picture.

Use the current frame as the backward reference of I and P pictures,
like the vendor library does. Also fall back to the current frame
instead of address 0 when a reference buffer is missing, so the
hardware never reads from an invalid address.

Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 4c8accee5389..0a2f8e77fb29 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -56,6 +56,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	dma_addr_t src_buf_addr, dst_luma_addr, dst_chroma_addr;
 	struct cedrus_dev *dev = ctx->dev;
 	struct vb2_queue *vq;
+	struct vb2_buffer *fwd, *bwd;
 	const u8 *matrix;
 	unsigned int i;
 	bool field, tff;
@@ -147,15 +148,29 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
 
-	/* Forward and backward prediction reference buffers. */
+	/*
+	 * Forward and backward prediction reference buffers. As the vendor
+	 * library does, I and P pictures use the current frame as backward
+	 * reference: the second field of a frame predicts from the first one.
+	 * Missing references also fall back to the current frame.
+	 */
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
-	cedrus_write_ref_buf_addr(ctx, vq, pic->forward_ref_ts,
-				  VE_DEC_MPEG_FWD_REF_LUMA_ADDR,
-				  VE_DEC_MPEG_FWD_REF_CHROMA_ADDR);
-	cedrus_write_ref_buf_addr(ctx, vq, pic->backward_ref_ts,
-				  VE_DEC_MPEG_BWD_REF_LUMA_ADDR,
-				  VE_DEC_MPEG_BWD_REF_CHROMA_ADDR);
+	fwd = vb2_find_buffer(vq, pic->forward_ref_ts) ?: &run->dst->vb2_buf;
+	if (pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_B)
+		bwd = vb2_find_buffer(vq, pic->backward_ref_ts) ?:
+		      &run->dst->vb2_buf;
+	else
+		bwd = &run->dst->vb2_buf;
+
+	cedrus_write(dev, VE_DEC_MPEG_FWD_REF_LUMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, fwd, 0));
+	cedrus_write(dev, VE_DEC_MPEG_FWD_REF_CHROMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, fwd, 1));
+	cedrus_write(dev, VE_DEC_MPEG_BWD_REF_LUMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, bwd, 0));
+	cedrus_write(dev, VE_DEC_MPEG_BWD_REF_CHROMA_ADDR,
+		     cedrus_dst_buf_addr(ctx, bwd, 1));
 
 	/* Destination luma and chroma buffers. */
 
-- 
2.43.0

