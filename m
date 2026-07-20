Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E793A380A
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 14:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784557764; cv=none; b=NUFSQosdr86jYxG484Xe+9fFWwnATWNCEGm02FA65BBEXfDoyUG/p+7KuijdyIID/R5OO9Psxy4DFZjBgX+iVpdVis9uESaCI7PLlY8UdKqLb5k+cSxH/WjfLc6TV1pG57IfCPDlkuQtknqBKq9IkH7HX4EG3VpdsT7lGow9wNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784557764; c=relaxed/simple;
	bh=1eY9tAkEvPPuQJSxLFf9+C++D+iIDA3Q9citWB/XFqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LfDSjJIMAezkg0pMd9TBUtGLnBeDr8fRlWhFhfNoKmx03jdbEFhUTC32kN3xoGqLvFviiWiT3EA2VW7VjWpEHIwGeL8q9Vuyj5efHJV34uAliIHwbcD1Jau0AZ4bXx7r+C7s/bx8/lR9LcFoWJ1Lk41XmcDBChW9o3e3vkbq0x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm; spf=pass smtp.mailfrom=berg.pm; dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b=eZC/Y0mo; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berg.pm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b="eZC/Y0mo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=berg.pm;
	s=protonmail; t=1784557757; x=1784816957;
	bh=j+LVHoTpL8nxBUUAk+O7qsyoV75A13acO9XcZV3Od00=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=eZC/Y0moEajO8WQw0aYceJqJIyJNxu/aciegaXa2nO1SPJyuufyvFuZgBtNjY/HC7
	 sQMg+vc+EoscTjQSVcj1LxGh5swkYeo0FRL7g/GVs/M8LvTZsF0AiMwi4/0sjwyD40
	 ztfwBmLGbLAuxnSPCsv0sjTSQ84rtOAfpLX+VWLDQ9O3PzjbrFYpVuriqq6+oMwY4c
	 okqvHlCeNSnMHW1qSuez+bWghG9VkGCWZpQDQwCICZCYWBlBV+8Khxief2cXB1u3xj
	 I8BgeyNvqt8mSe2oVfdbDJJrT6Gz06Kknfqds9DRog8tWy94+TLYKRZHpUre0uzA41
	 ezzOAI4MGZidw==
X-Pm-Submission-Id: 4h3jZM1ktTz1DDp6
From: Jakob Berg Jespersen <dev@berg.pm>
Date: Mon, 20 Jul 2026 16:28:41 +0200
Subject: [PATCH RFC 2/2] media: i2c: ov5693: fix horizontal flip polarity
 and Bayer phase
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-sp7plus-ov-flips-v1-2-5f345b0673de@berg.pm>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784557750; l=2974;
 i=dev@berg.pm; s=20260719; h=from:subject:message-id;
 bh=1eY9tAkEvPPuQJSxLFf9+C++D+iIDA3Q9citWB/XFqA=;
 b=0ECAa2GAtrMIzstlkChlbyDn7OfaIT+ak7+8PK/2PZIBzT9TjQmwwuQEcUbAmesdaTAPI69ym
 5iHscq6aCFTCIy2+5ncGisD51eUH+EpsAscQZ/+9XhA/c0UU9Yu0S48
X-Developer-Key: i=dev@berg.pm; a=ed25519;
 pk=b1r+eoJThwSQ/r5DjO7jrcosyrIsyhlOuKk9CBdvBxs=

Like the ov8865 (see previous patch), the ov5693's native readout is
horizontally mirrored and the FORMAT2 FLIP_HORZ bits (reg 0x3821)
un-mirror it: with the bits cleared the image is mirrored, with them set
it is not. The vendor init table sets the bits by default (0x3821 =
0x1e). The driver maps V4L2_CID_HFLIP=1 to setting the bits, so
requesting a flip produces an unflipped image and vice versa.

This is user-visible on the Surface Pro 7+ front camera (mounted with a
180 degree rotation, SSDB degree=180): libcamera requests HFLIP=1+VFLIP=1
to undo the mount rotation and gets a horizontally flipped image.

Verified the same way as the ov8865, with a live 4-state flip/image
matrix on the streaming sensor giving the same result: an inverted HFLIP
with a correct VFLIP.

Invert the polarity so HFLIP=0 yields the unflipped image (bits set) and
HFLIP=1 the flipped one (bits cleared).

Clearing the bits also shifts the Bayer sampling by one column: the
fixed SBGGR10 mbus code the driver reports is only correct for the
bits-set orientation, so the HFLIP=1 state has the wrong colors.
Compensate by shifting the ISP output window (reg 0x3810) one column in
that state only: OFFSET_START_X = 1 when HFLIP=1, 0 otherwise. There is
a spare column to shift into because the crop end is programmed
inclusively (crop end = crop start + width). Validated on the SP7+:
correct geometry and colors in both flip states.

Signed-off-by: Jakob Berg Jespersen <dev@berg.pm>
---
 drivers/media/i2c/ov5693.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 4cc796bbee92..95dc6af45125 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -375,8 +375,28 @@ static int ov5693_flip_horz_configure(struct ov5693_device *ov5693,
 		  OV5693_FORMAT2_FLIP_HORZ_SENSOR_EN;
 	int ret;
 
+	/*
+	 * The sensor's native readout is horizontally mirrored; the
+	 * FLIP_HORZ bits un-mirror it. Map the control so that HFLIP=0
+	 * yields an unmirrored image (verified on Surface Pro 7+ front
+	 * camera by a live flip-control/image matrix test, matching the
+	 * same behaviour found on the ov8865).
+	 */
 	ret = cci_update_bits(ov5693->regmap, OV5693_FORMAT2_REG, bits,
-			      enable ? bits : 0, NULL);
+			      enable ? 0 : bits, NULL);
+	if (ret)
+		return ret;
+
+	/*
+	 * Clearing the FLIP_HORZ bits shifts the Bayer sampling by one
+	 * column relative to the orientation the init table (0x3821 = 0x1e)
+	 * and the reported SBGGR10 mbus code assume, which corrupts colors.
+	 * Offset the ISP output window by one column in that state to keep
+	 * the BGGR phase; the crop window always has one spare column
+	 * (crop end = start + width, inclusive).
+	 */
+	ret = cci_write(ov5693->regmap, OV5693_OFFSET_START_X_REG,
+			enable ? 1 : 0, NULL);
 	if (ret)
 		return ret;
 

-- 
2.55.0

