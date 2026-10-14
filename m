Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F5C566C41
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 17:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000473; cv=none; b=n5xyHlcnSVU4ghSJ1OBJxeek4uWVe6yAWxdMAeQ+HsAAAgIExCI+0AKeBeBA8f1gsGVpXD4WB5DA1S4DaW6W3Gqhu62SB4PEZ1JYGZtOGSh4tBFwoEMyi/9y/3wpW1N/YbC/s2iTiNfBeeJ3/HAuIxklgAPnm704W7w1ZvsdnPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000473; c=relaxed/simple;
	bh=zKSuXRI8aMna5pQ3QoL4QnTlDfII69cLtILjo3bnSvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIa48RMOZjR6OG5SvudqmhHwGTaf+eN3Jyt0/uOesk+oqXPac2Y5hc4mQbsxqwy6o8g3tyZKU2WGMVjhEqtXxyFa/+5qSNNNItbdyDMYHxVJIabC7jARKNref/yP2eKVX0BHh+cgs+kx/0XvOot/yh/htei0lGfHfttn6M/QTTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=pO3RN005; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="pO3RN005"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so40348655e9.1
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 10:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792000470; x=1792605270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4qkq2Ot5KdEpoUe+1OGX5HpRdoidJ8DEnSvKe5Kbn0=;
        b=pO3RN005CLFuOiKCp3fMt4dWnKmVaL95Oa5o/J/EZ1fzj9neSB7GLJNo/W3z+09WV6
         56MjiNFhVYDLXOvmlBvcHWfJC1vSBbacUPllUOvkOCyt1iqoqWyucUXwA03rn6pCHImr
         hTz+EuEunEdRDod13x1tlgiAGZTw5zdGb8rS7uFZBCb6L5FJXs13Shgv+3dzoKbKOkgH
         FQ2q2DDTUda/dMxjArrjdtzbAbCoQUV6ZSyOeOo50WFqaIJgm8Cw2x7b5PTnykq3wPWx
         Uvlbz71Y66bBN+Um2b6AQYX+EnNSriLtUsCFQz76MS6HePOi5UojmL0uVHquom27LWfk
         xB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000470; x=1792605270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4qkq2Ot5KdEpoUe+1OGX5HpRdoidJ8DEnSvKe5Kbn0=;
        b=ySc8b+fF/fxqNZYVnuN0JrbuAuizcTgRtAPmXN/vDlLApSeNY3Kj1Ir0RdDyqT5urx
         GqmU/pFqfi1yh3LgPwip7+7/dvAZTRpqS5n+8vVk4f94Y8IOt5p4bQjIUAbCd0/jJaGN
         nb8MQIwYNDeX4g/JLFhCPRbLeKf+HdZmKyMPwbNX3lI/b6cUM46MD4CZEWHbpEC1HN+B
         2sbLj1IJHr4gzVwXHtiddednkdmLe3Bl8eNAPaDPMiv55C7uZi+C91sO0i33Eov/6UU6
         ohw+pJuYVdj71eTzf3qC8jJQq9UU87XSPfRqDc0NbZijjy3ELiDBcvzV2dKov9wG0on9
         Mdeg==
X-Forwarded-Encrypted: i=1; AKwUvBxUK5T4EOTgojRgmdPECjbzwt2r8j58NgtO8w33oDb6SjZVPlAFU/CqNTvEP+rWqCRkAVMUel8CPJWH2g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLx/n6OAGkZMZQsN2E5feFkESVvGWqvSRbacaaoufpozZ4qdu3p
	BzBfHTBf44vTvnHB44RdNixYb45qQGH0E+/eKVw+LPIqFzTgk9CIvN9OFhxvR3o+wFk=
X-Gm-Gg: AYBFou0/wnNqylFxPMrSKtOh9W1HDBNVhvGYs6RwgZ43PMYaNqRrkXYwbTWqJCXHxcT
	1NHbodj53rYLS5Ubq2/d99jx3DSDExIHoOngNkHb9XR9iUbziksle+8RuUe7rZVneO7DQyRa7YV
	DqSOU7kQkghGdvGdxGVh72e2uohgR8Mai630zwR/JPf+McToB+pjnro5pxdAGteVjaUSuorfQT+
	vA/JSOuQoUClwgFvL3Qrm2mQdCitUBm1aiVv2XquEyCSyR008Zu5+jMNBLa0buyZLuUL+bTI+gL
	/1XlJThXABydA58rdNQ3OTpmbafFlZqLgVYa0IhesCgg6lxmpIy54lgg3sdQmi2UnNk1zbLGDWG
	n3J9yD3FvPR8CePH8njWwBMdPQY8Bo61ITxfzUod68ACU5pGeIkzuggyGOwO+dklrKj8XkZHZHP
	eJy5zWQgiBU1VDHe4WKcGmcUqVp6UIU3rcuQs7XahQiOZwH6x7IQxYovEYVHaJw/lVI9AsZp7yH
	ea3pyQSFhgTOsGpYarMR5YbX8cTHHrFNcqBFOfKCIu2dHmZhg==
X-Received: by 2002:a05:600c:698d:b0:4a1:97c6:d2b4 with SMTP id 5b1f17b1804b1-4a197c6d614mr260052285e9.15.1792000469877;
        Wed, 14 Oct 2026 10:54:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm8188395e9.7.2026.10.14.10.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:54:29 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 18:54:23 +0100
Subject: [PATCH v3 02/14] media: sony-starvis2: Reorder link frequencies to
 remove lookup
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-media-starvis2-v3-2-c958362b5d06@raspberrypi.com>
References: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
In-Reply-To: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

link_freqs_reg_value is table that just reverses the order of the
link frequency enum.

Reverse the order of the link frequencies so that the table is
redundant, and remove it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index b4733990d03a..3656658e18a4 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -186,25 +186,14 @@ enum starvis2_lanemode {
 
 /* Link frequency setup (DDR: lane rate = 2 x link freq) */
 enum {
-	STARVIS2_LINK_FREQ_297MHZ,
-	STARVIS2_LINK_FREQ_360MHZ,
-	STARVIS2_LINK_FREQ_445MHZ,
-	STARVIS2_LINK_FREQ_594MHZ,
-	STARVIS2_LINK_FREQ_720MHZ,
-	STARVIS2_LINK_FREQ_891MHZ,
-	STARVIS2_LINK_FREQ_1039MHZ,
-	STARVIS2_LINK_FREQ_1188MHZ,
-};
-
-static const u8 link_freqs_reg_value[] = {
-	[STARVIS2_LINK_FREQ_297MHZ]  = 0x07,
-	[STARVIS2_LINK_FREQ_360MHZ]  = 0x06,
-	[STARVIS2_LINK_FREQ_445MHZ]  = 0x05,
-	[STARVIS2_LINK_FREQ_594MHZ]  = 0x04,
-	[STARVIS2_LINK_FREQ_720MHZ]  = 0x03,
-	[STARVIS2_LINK_FREQ_891MHZ]  = 0x02,
-	[STARVIS2_LINK_FREQ_1039MHZ] = 0x01,
-	[STARVIS2_LINK_FREQ_1188MHZ] = 0x00,
+	STARVIS2_LINK_FREQ_1188MHZ = 0x00,
+	STARVIS2_LINK_FREQ_1039MHZ = 0x01,
+	STARVIS2_LINK_FREQ_891MHZ = 0x02,
+	STARVIS2_LINK_FREQ_720MHZ = 0x03,
+	STARVIS2_LINK_FREQ_594MHZ = 0x04,
+	STARVIS2_LINK_FREQ_445MHZ = 0x05,
+	STARVIS2_LINK_FREQ_360MHZ = 0x06,
+	STARVIS2_LINK_FREQ_297MHZ = 0x07,
 };
 
 static const u64 link_freqs[] = {
@@ -913,7 +902,7 @@ static int starvis2_write_common(struct starvis2 *starvis2)
 	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL,
-		  link_freqs_reg_value[__ffs(starvis2->link_freq_bitmap)],
+		  __fls(starvis2->link_freq_bitmap),
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
 		  &ret);
@@ -1175,7 +1164,7 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	const u32 hmax_4lane =
-			min_hmax_4lane[__ffs(starvis2->link_freq_bitmap)];
+			min_hmax_4lane[__fls(starvis2->link_freq_bitmap)];
 	const u32 lane_scale =
 			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);

-- 
2.34.1

