Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795887363;
	b=CrAfN+3nft4lECChumsO0vdSOeJtoVSWfxNs+VnCnr2FilrFDPtPjmVpHRGn+qn9hGES
	 fZRvKzn1foiq3rCiXGIBWo64PrPtaPj5etUNpFja2v8focuWwXSUvuVD1YOKF395SUJeK
	 qvXLS2UG+TLJjHaOSk/H+hyzY2RBeR91v81IAaGIo2YdgJ94TQZ0n+x2OOoxblwt2AInk
	 +ttkF35eVw7oJnRjeT2aRUWe+/rCI7nU7Ezsm/ZauyiJslak9It7uV6tj8BL531+/zKEy
	 d1vQ5oxub4q0czRpqQsSsHdi9JI9t3ZZLEyk9LpJ4Y2DmxXsuy1B0m1tcZolG+GDH5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795887363;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=d8XxXH3FhCbbzy8plj8wG/xWGfVNQxE3P+idx9y1B/I=;
	b=jMxofnbEdWy7pOsChnJEnQEwrEfT5knvhAjSWj/uqyTewuVmTpST87yb8GIAze7CJSlT
	 7WjyEBA96tf5ZIOtX5uequ5GlOqFjJ1Azr+gQjcI5O6PBxR50otko1rVcvzgmk71yXxO5
	 0sXK+3jN4+aW6PL5JV1mIb3nFGddsSk6BfERABVF0KC0YhLI9wQwwGfBCd39hHPr/GvKv
	 jFKnnVIKbIj9XHtTC9YeEHjLwu9khg2VeSJCRDsAboxyiFFOV/At8gfNQ10m8VI6ulejk
	 /Ye3B96ELlmaYY4cmDHOf3s22OpSmMAprJXLbukkdeoEt9vG26rRKN2k3o3agUPvkTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EgFDPkLN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AA0606A321;
	Sat, 28 Nov 2026 17:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EgFDPkLN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795887363;
	b=U4ZtNH2jCYmKyFM4h2DeAVykIYYKv1gupR7yr4TKZ8vrMatSA+PiZGQKB20wL3+K6MYx
	 CE+GKBN6pufF/f5HxbNrRN7umn9a06Tx9wyC3rlvLcaBqCm1q1P3FLfXOAF18Rb4qpS3p
	 nsgaUb1OdHThxzhWGnpsb7Yei4LMZLwI++1UvnsziMJYQgCCBtIqn4Dsw9taMJxtLspgB
	 ryOLZrDOHPsvjPfV9h5E12s+ZhwJaFc5r6vsmTEkajrYPz5Afo3VZPhDaCrcCk27AZZnn
	 nWOmue3Q6Y33Z0aUQii9+g9LE+9ifhrBQvmFK8gcgnxh6Q8flaN5XrrN0OT4+eLKArg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795887363;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=d8XxXH3FhCbbzy8plj8wG/xWGfVNQxE3P+idx9y1B/I=;
	b=g74FMz0UgLB1ATVd8EkTWAPIrefOalkXjM/+5xsPwWiOtBP9IYwWkZTJjnPAlN5VecFW
	 KS2i+HZKwHFDuVRT3FeaBE836GxG3DzcaMQjyIUPGmcnJYKM9NVJPJtD/hE4lvkBmccDn
	 F1z5fAzSIQnsYQ+aiakz1sjP+HMP4G18cXhDmxj2yapFyayDONvjLJA0ES8J1crVBgm0X
	 wfsRRqvGrahIoQ/JKVwCzQKjnXL6yHGstEb0gmtaV7DCfITKbX/6H2FHqBpkUPu0VUyOg
	 qNJhLpynvG3unHl29IyQCBJwx6ZJIfYvSWTgDBrwbYpXLmIzYDy+S4aPLqOj8XUw3pQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 221781F00925;
	Sat, 28 Nov 2026 17:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795887363;
	bh=d8XxXH3FhCbbzy8plj8wG/xWGfVNQxE3P+idx9y1B/I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EgFDPkLNkdIvOEyhlbOvobkAaY7R//heYBAukt5geRWBaerxWo64n7zCqM7SrjWei
	 Q7t2GwikBGoz1/a8aVxiK000qzTf5GMO4IiJKfAJYPsLazdpfz+Wb95XuiDM7l/w3N
	 jTG0zX8mbREd67M2bvonJcVMO3ZCk2y1lukY1ua9+5BC9Bv1yMQMTFnQXucyTf0PO4
	 5o4Ygs9/iIi70ZViKJWXlR32OzBjivs25ee0cD0AOyMfVA56Ft2KESeCfxRprdHxrS
	 GYWq4tY/VwzMIoTaaWbNgeLQmizBZG8XScOcLGsMlRKP5KPO0euwOmR1+xPQqsRq/8
	 VEpypPBdTb2AQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A89934E183;
	Sat, 28 Nov 2026 17:35:52 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:35:53 +0000
Subject: [PATCH v2 2/2] media: cedrus: report only the picture as capture
 payload
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
Message-Id: <20261128-b4-cedrus-generic-fixes-v2-2-af8472be660b@gmail.com>
References: <20261128-b4-cedrus-generic-fixes-v2-0-af8472be660b@gmail.com>
In-Reply-To: <20261128-b4-cedrus-generic-fixes-v2-0-af8472be660b@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795887352; l=1509;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=FP6Lm3fHTfm6zAAHrW3o7Y6Gw9UVBp+bRwgni+SH+6A=;
 b=hopLpEAIwrBwxe2SeBvid6cQFivWi2rGxLd/TsBXBzdyUctPiAdC7cDaAL//p7juLiEsakXNM
 I0PsnauJlxbAzEpsZebUZlOdwA+Y0+T8BZILxmwqodxstcD1dPLusgd
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

For 10-bit H.265 the driver appends the low 2 bits of every sample to
the capture buffer and counts them in sizeimage (extra_cap_size).
buf_prepare reports the whole sizeimage as bytesused, so userspace that
copies the payload gets the private plane as part of the picture.

Report only the picture; sizeimage stays the allocation size.

Fixes: 65429ba82572 ("media: cedrus: h265: Support decoding 10-bit frames")
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 9b2d24e77fdb..b7e0cbe548e6 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -511,8 +511,15 @@ static int cedrus_buf_prepare(struct vb2_buffer *vb)
 	 * (for OUTPUT buffers, if userspace passes 0 bytesused, v4l2-core sets
 	 * it to buffer length).
 	 */
-	if (V4L2_TYPE_IS_CAPTURE(vq->type))
-		vb2_set_plane_payload(vb, 0, pix_fmt->sizeimage);
+	if (V4L2_TYPE_IS_CAPTURE(vq->type)) {
+		unsigned int payload = pix_fmt->sizeimage;
+
+		if (ctx->current_codec->extra_cap_size)
+			payload -= ctx->current_codec->extra_cap_size(ctx,
+								     pix_fmt);
+
+		vb2_set_plane_payload(vb, 0, payload);
+	}
 
 	return 0;
 }

-- 
2.55.0


