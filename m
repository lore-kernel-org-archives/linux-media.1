Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCED3BBFA7
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 15:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734978; cv=none; b=oPvIBj79WNsKshPVexiGJtj5OvKuHT1ztppKFKQhq0MbllvqD5h5kaDQxBFFn7BAZ5fq4lau2CF8nqDqG6ZBXbxIdkRA6AQ/Mos/2XFUvPDC5Dz1IV2LIie275TkYpoemIE/q6VBrZ+zvsdNqJvU9ds7uRDnDCGPvGmpSVYyH4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734978; c=relaxed/simple;
	bh=6U37pSBUsFqGwWSczzhAZcH+3PB93yJspCigulFbK00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVw8QGLFiiJG06n5DoruksuRpXECZATXQN1XJn2SwHhVv1jxRX56WeNLKzWeyiktR9p5EnJw5XFQxdJa6jOvJHJnIPxtkg1ix/LjlrdaA+cEFxa0NSTGVoRyBhI3yEMIt3sfFGuhfhVEHMyOP8SMQsLD2HZ/j0K6y4s2pgQLCTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3tJv3H3; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3tJv3H3"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f633e6058so5161695f8f.0
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 08:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784734974; x=1785339774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtaD+wctm/flHKZdG+eEG/nGmQRGwK75GvDz6KLeZjc=;
        b=H3tJv3H3ptii/nnWwqTf7XoBCV6LvEJDaHwS5us7wjVT3xHdYaDXrRyL7iKL8oaSMX
         Ere4hvxiARb7cVSV6PAwPkBZJTu3LEDVs205kmBLPdwz/aeRTrGGKZjZ/vjZFnxFX6i8
         mFlVyMHG++2xOSgBvjT6WEir0X3FYFS9D9a9CBKApQ2CpTWBh0oPeIflp9JxV/Bill2t
         GGtIL9YTsJC0e9HOwqmxRYrn18YT/WK33C94ogr8AudomINKYlT3LLQmbpFs3Xytr7qK
         iQGB03n/OIX6xkPvm98utV4EYLnFNyKD7tSbvPn4g+05jcZWL2KPwF0LhDsl1Z+XwQuC
         95oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784734974; x=1785339774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtaD+wctm/flHKZdG+eEG/nGmQRGwK75GvDz6KLeZjc=;
        b=qtu5T9EtLoF6dUN2GAXkOEwYJ4EASjgn4bX1Cdq+b7JWhzHXXZcY9Lip8LVnG+CMl/
         C6qjC6kWwR8yv3lInnZq3HZxyd/GAqqMCYeICQJcPAU6C0nMoF+gymO1dk4UjP6olJv0
         EoNs//B+gWeVbCZEOOS7ju+U/sJYOeoPC6uSf+8c5uxfXAOgF79XVdvoPpbuVEP1tveJ
         5/RSEF4ZIBbBVyu//nRO8TvVAYdB00UBsnKXK6w8iR5QR0I5/HnhY3U1d71GcHpfoS+7
         5FfY8WzYCUrD8sNkIsEz+HbmCMfu0kxwV1uWSuxQxhNinVzfayPAJLqQGMw9x0aJWFV5
         GmfA==
X-Gm-Message-State: AOJu0Yw/5JLbll7FbCmSIeAXWuoWDxTOKYxKSfKPOq3zfMQHFjEguc1P
	Xzot3onnzgF/2aUL3yuJlMKQIg+UqvtVFzM2QvpVrF7dHqNiK7pZ0jWT
X-Gm-Gg: AR+sD12Fy9EesFkomRf+bv7QzP3Mcu9BrR9NcS6UvStTnb9VsitfRc2ldKekmcyd9HR
	3gPJ3lDS2tVJ6ok/SblM9jti7tVTlh+ewe9Toef3wjmwR9OIicQ+37K+j0/Qid/36cSiNLxkihj
	kyUdJ8E9KpBwG3bZLksreibB0L0gd2sJ4rDgAtun2EZTSOFrBqd22gCvwZ+cd8h1QAS3i5RuxHX
	u5uHvYHZWutIDrkuAjjs7uHt2T8B/IljZCaoF06E05ax8TtMx80a+r6uxFDpIc4HN//rhjnDE3Q
	bHe/uAm/yaWaBX2gt08kdb+9GLBV3gE+XjLv9bCQFXksz5S1kLEokCTQ4QY70legDTzw0kypKg7
	tujWFxwPFqilSir4Ioeo71A6RvcCAq04e8NfFls3YvMhBd+etpq+3oOeVV3fEnY7SIUYFzeNJtf
	B3o7Q=
X-Received: by 2002:a05:6000:41eb:b0:475:c946:36c5 with SMTP id ffacd0b85a97d-47f622fce56mr30653466f8f.9.1784734973852;
        Wed, 22 Jul 2026 08:42:53 -0700 (PDT)
Received: from ubuntu ([103.196.162.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm6889489f8f.18.2026.07.22.08.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 08:42:53 -0700 (PDT)
From: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
To: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>
Subject: [PATCH] media: tegra-video: Use BIT macro in tegra20.c
Date: Wed, 22 Jul 2026 20:40:55 +0500
Message-ID: <20260722154055.385164-1-mukhtarfaisal03@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warnings by replacing explicit
bit shift (1 << n) with the BIT macro, to better
adhere to the kernel coding style.

Signed-off-by: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e513e6ccb776..cdfd9f276d11 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -177,15 +177,15 @@ enum tegra_vi_out {
 #define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
 #define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
 #define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
-#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
+#define       CSI_PP_PAD_FRAME_PAD1S			BIT(28)
 #define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)
 #define       CSI_PP_HEADER_EC_ENABLE			BIT(27)
 #define       CSI_PP_PAD_SHORT_LINE_PAD0S		(0 << 24)
-#define       CSI_PP_PAD_SHORT_LINE_PAD1S		(1 << 24)
+#define       CSI_PP_PAD_SHORT_LINE_PAD1S		BIT(24)
 #define       CSI_PP_PAD_SHORT_LINE_NOPAD		(2 << 24)
 #define       CSI_PP_EMBEDDED_DATA_EMBEDDED		BIT(20)
 #define       CSI_PP_OUTPUT_FORMAT_ARBITRARY		(0 << 16)
-#define       CSI_PP_OUTPUT_FORMAT_PIXEL		(1 << 16)
+#define       CSI_PP_OUTPUT_FORMAT_PIXEL		BIT(16)
 #define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP		(2 << 16)
 #define       CSI_PP_OUTPUT_FORMAT_STORE		(3 << 16)
 #define       CSI_PP_VIRTUAL_CHANNEL_ID(n)		(((n) - 1) << 14)
-- 
2.53.0

