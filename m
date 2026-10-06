Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B00C3D6CB0
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 23:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791330170; cv=none; b=odKjIySzdkdaxrrXHE9OM/ZrndY0wAQzbQdyA1guC3nduVjvpAB1cl5jQC0t5qZ5t8Fk9kSp2PmHRDvyXxYBhuzKjGzS+RFJBvdAzFieVeP+ZTrTF1VkmOz4dU3jiagm7yfMMFj6NyfVFU3T7amfEeT7nfpA+p7fK9JqbBM+kTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791330170; c=relaxed/simple;
	bh=zSrJCZPoRul1DOXV63HB0EMGcIr9n+Es/G6flmAK36g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sfbzqKVKdkGohtzm/stY9PQVpO1lJa6aaymzzgwAEwqE3kwGVUAW/c0NLuUuwoZJNARY8EcHaxeCbrVo1IQ+y/HfQvvpzhN9T6f6RfM4RrvfXe61cuZdSl5Ped+OWC8ZpdtzEZ9Yi3TO8QYHoiWpEU34Mcv4yoFIukLeIydcGTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vn5WGzl/; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vn5WGzl/"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c20ce3c118aso261453566b.0
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 16:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791330165; x=1791934965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xU991IjfKpIZ/ogot2MMSRdI0Hykr6YS2Y64+ubMJOM=;
        b=Vn5WGzl/e8+v7u4bD4W/jgVqvVnZT/HSQaxUIp0mbiO2SIwfzU31SnouxZFqKqZB0Z
         30Doy+ULD8ZI/mjFbjkeOMgOk0r3DNjQzKqIpachVhN9CCWK3jmiXeIM/J0DleNtOLoz
         5iOlx1bry/2AspKNXzyYpIXn/MwN1ELjrTms3loaa2uAKxwrCtGwoMuo0wzxQYknPTPT
         VuMp+9O9cffDP5GFK15QOaS82GS3uGGJR9bdqeB+tjxrlmC7t8mBKwZjkjCv/IjfCSsI
         LuiYJ/jFnSa4cUWx7zhvyaV0LyMfehDrcwvwXoURoS9D1YLd1cRGqIZF9LhgWe2i2Wlk
         a56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791330165; x=1791934965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xU991IjfKpIZ/ogot2MMSRdI0Hykr6YS2Y64+ubMJOM=;
        b=n7veZfw/Qbg40H/ELldou5oRgIRqgKGA8AwVXt3tWSyndwfTCBZoo8tUyM6TedKCAO
         S4M/p/WV3GW86T2TTgIxL3NpGx0aBtELGEJDOOCsebb1RnB6CFzIwn66PlMHywEIi39+
         o5KILtcEyd0HtFDCNhzKoZunmfH7iDbNtQJaawrtCETdTngsTH5bZNG2zUFRIlp2e059
         uO2pm4FkDdqtG/NBb7WPSw3dbURhZ14kJEqEWf1h8WKNOsXNMsgz9r15jGPBVcmutRK5
         f2F3MS7zlcln/vXoUZEtFI5kKhPGg6LqsV1Qk/ZKaOLSAdvLDGZ0z305uD0/oyYheJDV
         +ceQ==
X-Gm-Message-State: AFuF++lM/oft1wZoFrpnbmhLFgap8aDaDiowVd5BGpZhUyjqCsy7O6Xb
	i6vTX1maIavxuXq7yF7yBKn4C2Y8YdxOOTkV/hTasNlVIEi140OG4LZd5iF2wQ==
X-Gm-Gg: AYBFou1WtToEUelL12aHvWXVWktE3rP9hVVjzQJz3ROSA7noC0tQTCvjSGKTdymMlOG
	i9K15UimmVO+NHjY8IarzD2KWD1lFSuZIujdfHhUBDzLVc/qM8hdDKMP8ReCg7EFg+Kn6SYAF+g
	n6V1C1Dh2p+jsAPeJCyjRbGrxOtZNBCKPcEjadZJGAlYzC8O2+yitUxslxWVNe9watJ7Kt2v5nX
	C9Xh6GpGN3WbKd/07bKrDaaVR3tCFXgxlYGoF/D5aqTKx9rkD87RBbbxAYxQoB38XBFVnEe9caD
	Ut8T3ZJ9QDcHOdrn4Fe20/JVvJVSmqP3KLku0Ug1fdLb9d6niAbbO12TV0pLSDNJB8NgEsb3e58
	J9o56XvF0iAmI53vpCh2Uy2avWTKPT8aTWV51K0XWjC2NTaeUtjyvDx2/bNA/mHPC4BS1JubXYD
	m/YU9pEUnk1krd20csGPaIZ//mxMsiTxbdaFXo7VRjANkfo5CTU2B5I+MwpszQOZmFZFD4YM0+v
	XI1NCjGsrqIMcVgCnzav5wuSF72gc8wBfiGktQRjfg+suvJtzo/jjTRKr0=
X-Received: by 2002:a17:907:3d09:b0:c31:5918:86d1 with SMTP id a640c23a62f3a-c317bdbd08dmr65077466b.10.1791330165265;
        Tue, 06 Oct 2026 16:42:45 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c317c33e313sm18823666b.70.2026.10.06.16.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 16:42:44 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org
Cc: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: mali-c55: Disable colour space conversion for RGB outputs
Date: Wed,  7 Oct 2026 00:42:27 +0100
Message-ID: <20261006234242.11934-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The colour space conversion block is only programmed for YUV formats,
and its configuration is kept across streaming sessions. An RGB stream
started after a YUV one thus still converts its output to YUV.

Clear the conversion configuration for non-YUV formats.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-capture.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
index ff01553026fb..2425a069a939 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
@@ -577,6 +577,10 @@ static void mali_c55_cap_dev_format_configure(struct mali_c55_cap_dev *cap_dev)
 				MALI_C55_REG_CS_CONV_CONFIG,
 				MALI_C55_CS_CONV_FILTER_MASK,
 				MALI_C55_CS_CONV_FILTER_ENABLE);
+	} else {
+		/* Don't inherit the conversion set up by a previous YUV stream. */
+		mali_c55_cap_dev_write(cap_dev, MALI_C55_REG_CS_CONV_CONFIG,
+				       0);
 	}
 }
 
-- 
2.55.0

