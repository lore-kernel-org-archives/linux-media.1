Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BB23F6C55
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944726; cv=none; b=Z+bk3NHhuXin74EJyaCcBU1ktqOwNMv2zsars9umjw62mVIICFEJMEcrlDSUD95cspw35b+km36XXjQxH0GD3Gnmkdguqxn0T0z33iLaujPi+WhzTz6S+/D+y3GhyycMEtKYBl/wvxZnr6AqpNRfT6VXmu2lHRSvpWmqW8MGIOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944726; c=relaxed/simple;
	bh=ONUAUDigrwjdBwgyupNLuYzWtO9nh/4QSdLBbjitlQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H1/XgwEpgwYJLO+YdTI2iBGGuwRz8qrY348OknztI3ahpPMlOASzec+O1v9lqWI3IEZpafR/CrtRssqFBDgWSwqJl8I9AvovvizRHbMGnFro4D9Bfl8qE2H5yJuBvKtHNfpEluvMQ/ga4y5Nom1Li2HvzKMa2H5Dxho0ajaYsPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ToBF5qWG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToBF5qWG"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cc61541f8cso45632005ad.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944724; x=1784549524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPxreeozyC9OlzBX8SeJZagWhfw9u0AGRhVPID7x7h0=;
        b=ToBF5qWGHIg+CdCXfSqmPk+s9FAw8hpBtFNby9gelAHd6c3Y64mGcgQefkCVt018fH
         y44qTxs7wbacKnS30OdwiOK+Q5zk957zJLAG6fqY3Z1dQck2O5DswOQGOpmGjIYAcRES
         Ry1FW5TECKskJbcWyAlpt1BEvcwfvXH8TAqfarCVkzLcuafVs6rRdfYFt58NdVzav9+q
         KBuyzQJc8AFaLxMoqX2J80c1XWPWkdSKHXcJhDF9TdrFdmlb/yarASqrFqXFAFzZklkq
         QXKpv4KqUi3kjoG4SPKD4wcz8qH3O9abMR+Lrk+zu+ae9eBLNM8X3xuEHzv5KKwW/gqK
         Cumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944724; x=1784549524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yPxreeozyC9OlzBX8SeJZagWhfw9u0AGRhVPID7x7h0=;
        b=FcFAISuhR5qOHT/JTI1rGki/s9577O6agZNilAlF3/J3fXfrTHRF+uyqerrB7mVdZD
         S3zdwtdtTP5BCRE+kvsemeWYdBuZIV2jTBAblVAeGz5uRmiyvwBgWm/u+N04u69PPKSK
         YorGsCMHi9kiMDAo17bS+mF9y3wNou0glakS1Q1G7DtQCdbj903E4p0xSdClKQS09Rwn
         vBFRE8sc/OjLwFpd3HcVvVmqU7JVXhNqh6mZN9NwvaVuslYr7sgfkjpCIkwC/A8Mf5m7
         R7mtge7d4VxnS5HUoZN50E0Kx5XNKCncikCNTrXhqt/8lyZREO1rec28j2khaPs+xE1M
         UThQ==
X-Forwarded-Encrypted: i=1; AHgh+RoSdndpzK/xCP3ecuEFHj7Q216RgpIfD0/z3CYR9In961ij69A4sH4eXmE+hwU6bhPAsV49nnOhEMxxVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFZ/EgN0OlcBVRdtmlDy+H8+RExIEINogyjf3eM9eGuDtLGCf9
	hYp7apt5SYlWj5tC1tTcme8BGtzsvEntXQ8vJn9bfvmgrg7xea3wo5tG
X-Gm-Gg: AfdE7ckhIPbWDHAR1nWWZG5co/JPpvBaNXz4gXpzrfkKGftRhqmt/R0D6L4Qs8l9DWr
	L40y/NAYj7tiwsbxWJmuhU1p+lr/BMFS25zwVTN2Q1hPeuxH5YeSnrYDB2h3jASMkXLjdO0hpu2
	bc6pIQsKLFrvGMsBniFGxzQ/WOisdj2yYDQl4fGxqFHsAP+edvZDPdjjbZC00JPMuuDTIWei4vR
	UGSn1qIAQGjxejXcDAyTXP0mIt6g7/ekOgk6C2EU1aMdbB5w+vLS8Lsi68xgSsQLZ/QgF0Ov8GC
	9WeTUWAoDem9N20kMKxEafxJV3rXf4rkldVEWC0Vt3ccqXj5opWW1YV554O7S7Hx3fsgJ88AN9n
	6SJ93jZgjLs1OQ02LnkRD/GT/68/MpgcL0FBOxF5JUTFZvCJDg0O66lQTgw/gbAvpIJV93DHKV5
	+311C+YW3Q7v0dpHKHoOaevGgCFqdq2jI=
X-Received: by 2002:a17:90b:4cc7:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38d13768de2mr15332791a91.4.1783944724165;
        Mon, 13 Jul 2026 05:12:04 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:12:03 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v7 18/19] media: meson: vdec: Increase VIFIFO buffer size to 32 MiB
Date: Mon, 13 Jul 2026 17:37:13 +0530
Message-ID: <20260713120840.17427-19-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During 4K video playback, the hardware Elementary Stream Parser (esparser)
can rapidly push massive burst data payloads into the Video Input FIFO
faster than the VPU decoding block can consume it. This causes a buffer
overflow when stream usage breaks past the allocated hardware boundary:

[ 1852.587956] meson-vdec ff620000.video-decoder: VIFIFO usage (16779003) > VIFIFO size (16777216)

When this overflow happens on Amlogic SoCs, it triggers an invalid memory
state, leading to stream corruption and fatal kernel panic lockups within
videobuf2 error rollback handling routines.

Double the parsed bitstream swap exchange memory pool (SIZE_VIFIFO) from
16 MiB (SZ_16M) to 32 MiB (SZ_32M). This provides a larger canvas window
to cushion high-frequency frame reordering spikes and prevents the VPU
from crashing on demanding modern streams.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index d33cbebc4453b..824e2f156adeb 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -29,8 +29,8 @@ struct dummy_buf {
 	struct list_head list;
 };
 
-/* 16 MiB for parsed bitstream swap exchange */
-#define SIZE_VIFIFO SZ_16M
+/* 32 MiB for parsed bitstream swap exchange */
+#define SIZE_VIFIFO SZ_32M
 
 static void vdec_free_canvas(struct amvdec_session *sess);
 static void vdec_reset_timestamps(struct amvdec_session *sess);
-- 
2.50.1

