Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ACA3B05AB
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 14:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507002; cv=none; b=t7jpwH4s8DjgiIN1Bgqs/oETm+4oV/bAW10Yvw55wS7SKtBNpRuIAcRW1yDqCw4DaKI1duve4HJkTtL7vKQsrzzY2yUS0NJ+8LLZQsJsI8yU68+4LNQ8r41vYZ5ep0B3L2iVddN6KF2xuaMiMoub4iwG+/Ouz9VhC5GF+HnXBsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507002; c=relaxed/simple;
	bh=5qY/6592ZN6hUTDDrFmtMOeCukxo2QrAHDQySYUCnho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QhUbiWp/rlIgALhZcPeHRsiX9pe5ORGmVe94BZDgg5gIY6u7kKKSdeAFoP9SmR2JBXi7TyjN66YODhJg0oqczg/F/YwwdMp6ZBkEljbG5BLotyguNdKWTMP7hgqkrx9nkdOtXbz1DcyimIhJJyW08AI6jmPsVOukur40iwXngSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FezMA13M; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FezMA13M"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so927604b3a.3
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 07:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785507001; x=1786111801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMmR98zYdJ3/hNNg4PWjtIFCt0ZaQpb0CEXhOAdim3c=;
        b=FezMA13MgDg58lUSdzbbMSuGVsz5I9e1zDUYPKcwTc5kn1YcC+c2znGK/NS0U5n0/M
         vsCMiMLZdMbeSU9WljbTtrgL5Eu3zSfXJ5w5As4JaCJa3SzxWCAseYxyc9/VAfgKnYlb
         ItTdf0sufhv4jzl8MbSryPGwAv9ASBgb9eoWzYnMnTzSYVLPC/0ld8eOo4Z5EtrWt+jO
         ImYuq9dNax90/kUS/ePwh0avXsFuGjIJTBw7TdhyeNNewC8LLLeg+kSme8Puw0aLiwBl
         0p1g2y2Ph11CTc5cctgoD4SUgVwp6hUikVKRGg8eWeuCtIPt7OxjlP10vzYTSsW1AqQr
         56yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785507001; x=1786111801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMmR98zYdJ3/hNNg4PWjtIFCt0ZaQpb0CEXhOAdim3c=;
        b=lw+4xv3inU3BaOHQjYxQab6yEX5HtaS/B2K458w1VWkC3VCvQM0rM25jPuW4b0M+3q
         fxGGtzxAXzuiXlVyw8SbbNkI+UDqqJsNiVoubXClKquCLTvYTjwlAJImw+RbwvWn84Dd
         d1wi0gXg3xflnQ4NdJI+Ov4vSy14s+iH90huCSA4ui64I6mrw6FYei2q0OyBnc817E01
         sXnVXPLYSsaa8klqlOP68m0gdE9jmbV1+r0Eb1DpxcR4bP/TXQ+dLYnmiisqBiQM7J26
         R31b1bLDlYtdFeSvLk8m1dy+np6JcJrY+heWZZCE3F1pBUxH5zm4iQmENM+hbNuBHTUX
         xVqw==
X-Forwarded-Encrypted: i=1; AHgh+RpKswZpd5HOQdiVhdibqyY3Ip8q8uOCVgjLtr3MNOueirbFqZLpnM2NqSkfdB4/htOGEK6pXaRehVdwgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvABPLVvu2SjXexfEQb/JzUbuMYVHq98QF545F3IqdHhA2quiv
	jAaGeHGvo25qTWJQu57I0sz2HRxHdIGEwmvUjdrPmLiBcqEldWTGLy15
X-Gm-Gg: AR+sD11lJfxugDRaTG572rR7HkeJh/suH1W2wKcD0HODqCy0iK3W42QBkhGVUSA7EED
	RyiuCJYyWfCLeHClXOfftViat4lmv22c91UY843g4Pi5/cndt6myHf3UnkLWz8ceRl772Ct89oQ
	CqXZfDNF8BaBSD7reVWbfDIHOrMSdBjoRONDuvf8TPe8oPEgWuE1jua8jlfw282KXZwPa3u7Wa1
	pwUZQblQxK0j9RxDX8I2WlHL4PCdvXcc7AcVlOkqPMSqGJb3BwxN2y3pFtutmo279DikrlPfccL
	gD8obnCblb1CO7uUbRLVSdXxcbgaqhJV1Ht7vsyW3krBspCWyQ1Mz3t7GSnZ7uVsfaCGgL3J7Yv
	Hv89SY5izexVL9yPn7c2ba4ItavhPyg8wosUUHVFzIyOxYJrB2wKwmWNGFk2pTHTVGc/MFdYAIf
	d3Z1d8FIBEyun1vZwmBSjG9enu2gI5cFcgDM/j9A8OjWlNJhOOZ2XrXXUaWQ8H9iwv08Hx7Y3cE
	LNZr8bCrFBC3iXebGz19fHwRnlhhTtlyg5HSEfwx7Ayeb6pJdAi9pbDoXaXs8c=
X-Received: by 2002:a05:6a00:8997:b0:847:8b11:596d with SMTP id d2e1a72fcca58-84ed726695amr1276807b3a.41.1785507000538;
        Fri, 31 Jul 2026 07:10:00 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([2405:9800:b670:b64b:1c6e:95da:41c0:e7b6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc29ebbcsm506071b3a.34.2026.07.31.07.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:10:00 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] media: hantro: Harden MPEG-2 control access against NULL
Date: Fri, 31 Jul 2026 14:07:51 +0000
Message-ID: <20260731140751.1183-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MPEG-2 sequence and picture controls are validated
before a job is queued, so hantro_get_ctrl() is not expected to return
NULL in hantro_g1_mpeg2_dec_run(). The controls are nonetheless
dereferenced unconditionally.

Harden the invariant by checking the sequence and picture controls with
WARN_ON().

Found by code inspection.

Fixes: f329e21e9dad ("media: uapi: mpeg2: Split sequence and picture parameters")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Tested on a Rockchip RK3588 (Rock 5B) board with Fluster:
  MPEG-2 (MPEG2_VIDEO-MAIN): 23/43, unchanged

 drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c b/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c
index e0d6bd0a6e44..6a942f4b8a2d 100644
--- a/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c
@@ -161,8 +161,13 @@ int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	seq = hantro_get_ctrl(ctx,
 			      V4L2_CID_STATELESS_MPEG2_SEQUENCE);
+	if (WARN_ON(!seq))
+		return -EINVAL;
+
 	pic = hantro_get_ctrl(ctx,
 			      V4L2_CID_STATELESS_MPEG2_PICTURE);
+	if (WARN_ON(!pic))
+		return -EINVAL;
 
 	reg = G1_REG_DEC_AXI_RD_ID(0) |
 	      G1_REG_DEC_TIMEOUT_E(1) |
-- 
2.47.3

