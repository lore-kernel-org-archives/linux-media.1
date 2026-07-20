Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FBB42B733
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 14:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784557767; cv=none; b=eyc5B8cgmb81wO2YpAJDV8a7Kq1IhGEU04bkeoXMiTfLwDjerrjJaa8d8hu+2x1lx0pWd72x3SyKrtyVGd+YpNfzVgw5lof35M/XKKTbSXqb+XpvxPZoRbMB6oe6EB1Kw8jbQUbeLIyPb8+nBZwR1UPGknneI9e15XuF+BHssVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784557767; c=relaxed/simple;
	bh=/xxjhTeTYlPskVvcuW8vsxe5iugEc5NZC/WrGRNyeqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TarncN3ijTtoaJHOZefB9+XjWcRLqks3V9p16WFcMPV0exbHup1Mm3Wvj8rqMtyVWicVt8U3QslrhQJ7txrSPhHmhymPbjLuwSbLRhYS6KN+Tu28iI2+EW+RFZJiBPumD1jkRTDc8QBEXEUOE7iorycwz9IoZcAiUVcctjUibyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm; spf=pass smtp.mailfrom=berg.pm; dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b=lYGFnjyx; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berg.pm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b="lYGFnjyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=berg.pm;
	s=protonmail; t=1784557755; x=1784816955;
	bh=qMxNineG/nldiihWlEY9FdiQ6QC7kxpKIqji2f+Qolk=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lYGFnjyx5IXHHPJCdH9BGlOhLSHTPCHJcyJNDTKFif2v34KMCqZdyBKUx+bxiw+8L
	 /iT6lVfEhCjUo0YE/kGX4BK8vnulcLOmA2rfSUscbWaSEyAwyvInwzXoylVa4XJQOP
	 MfzthV7+l4T9bx+xRvfDuH6VxB2KkPDBA8/lF/btYBYw7pt9S7XgQO3++hAC7PhP3m
	 4oUsaFrtBRuS96oVTrfnOm4G6W3+Dlb26hxe5pZt21dS9K2x/Ni6CPSIPCK+KG/OtW
	 BiWbaijjdKRynvQ6nGEAM+ykM2UwamNRMxkLPg/DWmQ/minW30jC0K1lEK3GQdNRFy
	 OIHABk+mI1yug==
X-Pm-Submission-Id: 4h3jZJ3V3fz1DDLl
From: Jakob Berg Jespersen <dev@berg.pm>
Date: Mon, 20 Jul 2026 16:28:40 +0200
Subject: [PATCH RFC 1/2] media: i2c: ov8865: fix horizontal flip control
 polarity
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-sp7plus-ov-flips-v1-1-5f345b0673de@berg.pm>
References: <20260720-sp7plus-ov-flips-v1-0-5f345b0673de@berg.pm>
In-Reply-To: <20260720-sp7plus-ov-flips-v1-0-5f345b0673de@berg.pm>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, 
 Fernando Rimoli <fernandorimoli11@gmail.com>, 
 Tooraj Taraz <tooraj.taraz@yahoo.com>, 
 "Joseph V. Lavigne" <jlavig88@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jakob Berg Jespersen <dev@berg.pm>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784557750; l=2010;
 i=dev@berg.pm; s=20260719; h=from:subject:message-id;
 bh=/xxjhTeTYlPskVvcuW8vsxe5iugEc5NZC/WrGRNyeqc=;
 b=t+gXxG2gCVslmYEuL0qk4Q4FnaUBzKDZbDNV8toBc5ZSTvi9QJYjoeAzyLJCM+AoLcKmNJObd
 5IXZzYShbrCDt/T1wEfvgybWUDqRnFWeb4cQrC8FjnfxYO9LlQLxfY+
X-Developer-Key: i=dev@berg.pm; a=ed25519;
 pk=b1r+eoJThwSQ/r5DjO7jrcosyrIsyhlOuKk9CBdvBxs=

The ov8865's native readout is horizontally mirrored and the
FORMAT2 FLIP_HORZ bits (reg 0x3821) un-mirror it: with the bits
cleared the image is mirrored, with them set it is not. The driver
maps V4L2_CID_HFLIP=1 to setting the bits, so requesting a flip
produces an unflipped image and vice versa.

This is user-visible on the Surface Pro 7+ rear camera (mounted with a
180 degree rotation, SSDB degree=180): libcamera requests HFLIP=1+VFLIP=1
to undo the mount rotation and gets a horizontally flipped image.

Verified by a live 4-state flip/image matrix on the streaming sensor:

  hflip=0 vflip=0 -> 180 degree rotation (both flips)
  hflip=1 vflip=0 -> vertical flip only
  hflip=0 vflip=1 -> correct image
  hflip=1 vflip=1 -> horizontal flip only

(vertical flip = reflection over a horizontal mirror line, as on water;
horizontal flip = reflection over a vertical mirror line, as in a mirror)

which is only consistent with an inverted HFLIP and a correct VFLIP.

Invert the polarity so HFLIP=0 yields the unflipped image.

Signed-off-by: Jakob Berg Jespersen <dev@berg.pm>
---
 drivers/media/i2c/ov8865.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index c6d53c3d55ca..901ea7c16395 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2204,8 +2204,14 @@ static int ov8865_flip_horz_configure(struct ov8865_sensor *sensor, bool enable)
 	u8 bits = OV8865_FORMAT2_FLIP_HORZ_ISP_EN |
 		  OV8865_FORMAT2_FLIP_HORZ_SENSOR_EN;
 
+	/*
+	 * The sensor's native readout is horizontally mirrored; the
+	 * FLIP_HORZ bits un-mirror it. Map the control so that HFLIP=0
+	 * yields an unmirrored image (verified on Surface Pro 7+ rear
+	 * camera by a live flip-control/image matrix test).
+	 */
 	return ov8865_update_bits(sensor, OV8865_FORMAT2_REG, bits,
-				  enable ? bits : 0);
+				  enable ? 0 : bits);
 }
 
 /* Test Pattern */

-- 
2.55.0

