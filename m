Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0846041D10B
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 08:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789027503; cv=none; b=ChOOo4JyHQ1rm4+nPd1bt5CAGhT/fchiElY1StOjSNODMncnfLA6IlQVAI3B4eD3OpQf0B0cg0nhCjiZ2V2MA8eS9b8VVDWi01NdzcaSC9/xSJCEpHUg+lI4XBTuJrmaqyUAX8R/c5DAUPTQf9e68vsjhn3p6U33lzDUvRtb1zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789027503; c=relaxed/simple;
	bh=gRm8k0lA6+IZmwfDi7QHofPJ1tCqLQVpoNOipJBhfV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZqTqxjpInC1tmP0yY8T0IH5MNcScqjYswhD/aEBbQ+KqwMz1R6DhKT5qLL4DzieIqTtZcFzFFeItlDNsz+0QMwlfWKcGXcKLJgIwaUDtDzyUwIMiSTIEun7Hp5cP9IOTB15th5A/T3ro5uDouudOJhrvvaw2w8I2CNY+C/84ToY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hk2/+M/6; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hk2/+M/6"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39b9a99469fso2712792a91.3
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 01:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789027493; x=1789632293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4T51EgZly4ibicIo5lw/2SC/Zwq/woe+QZug39a3X1M=;
        b=Hk2/+M/6OqWHRRLGIFPQBmCMYQtQD465y/yLQe0m5li2xUsqYKK0ZjWkcEPjv+CTKA
         jTOZMmUcXpAiIzPpwXdKmCswKt8adCAhRAoOybV6H/QhUcf35Y1UgumhkqvGYeqdU6to
         j9B/aIUKkNKniJMmn8KzmEuJdmsFVn4HmoJ6kUuQsXEUj+wR4nFz87N6ZJcJpcfWj6lt
         jju0gBTI/JMg9JIk1wDFa8Hxr69ynbXQqurnotSfn4/AsX1lrlS5lJ79ua/baZDdskQ9
         NSLUe8lQYW3tTcaztncGZawsAEsM1ANITj5Hmpq3Q0ebqKzw/a/phhK903AETnAJxO0a
         wjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789027493; x=1789632293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4T51EgZly4ibicIo5lw/2SC/Zwq/woe+QZug39a3X1M=;
        b=NG/4HBuROARlBN3c+gieoDH1beMkQWR8AN7inknkzHIgDeo2NbXVvG2GXY+m15POaX
         tRFh6do+ct3ucqmHJNroyr/5UqxB2A9B/sgR3CFOLcq6IXlae5+rL28GmUgxhVC1KX5n
         xTksnlRtodLs/Fax0tetTKBulYyruk0XQ4A3jrQzz8ycUiBK7UvnNhh3w65JbkNmV4bN
         WFiDd65aS3Y/ZtBEkB6KtllYUX0RhOjQI0xr+OuJJu21JMRKg7iQW/PbNaUkO1gpXLG0
         mF59usa0dENgAvWkHiWnITHKotlUS/YOSfM/7bey2a2wjMBjXHdbaLextvuLlS3wF0NR
         MTVw==
X-Gm-Message-State: AFuF++kTIOFqaLG9VvD9xjAPuOyJux1D8B8cGJNJ5F+/YptCR9aeWSdZ
	3Ryr8E+A/qao4iIxC7elK/DlkBHHNZ9WXCbl5xRZzWuYu8kdPw2AdXjb9J13n+eUvRA=
X-Gm-Gg: AYBFou33hOEKoUScYO2tuL8gzAUPvAdUXL/zUucpqjwc7Fq7NrrN8sZYjTLda0I/xyK
	RsXWUYWhzI2vIP1Y6/gXit8zCruW5vdX4AG411JW/gZbK9ixi/LW4TsNDA1D8rYkPymqQvl2AAD
	Pc6X97NaqgHNfIJ0DrpJ0G//4XbJqLFZFTznCEg5e7eZVTySU4QYh5OSI0FqFStYJ8yRs8ns77L
	nNm9cmJMSS2hCeTNhmx/qCgHGLjlzj3vMMLnDWV5mHUjiyGC+FzQ1QRFpIVo+Qq+VN0Gxzqtx+8
	/ax150pCe9lvH320lW4w2OBfyar30AW6EBezWVqmkluxhxdl5YvaCHtrGmQVXt1qUnL2kpSk5jC
	Msl/NrmxnrvVU+jcWmgMjeXnPnndTK8XL6K+X5F11X2e8fUKoMqFZspr6t6FOhGfkmjeB38hlKk
	r0PaXGa5RXTjAzV4zqbMCqiq4abzEjpl3J0ezwye4xXsFyncViBLdEc9aJKN9XR5ugbjrhTXC4
X-Received: by 2002:a17:90b:4fd1:b0:398:bd37:6a49 with SMTP id 98e67ed59e1d1-39b261cfd8cmr59864613a91.12.1789027492801;
        Thu, 10 Sep 2026 01:04:52 -0700 (PDT)
Received: from ali-laptop ([218.212.161.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cd20b187asm2710589a91.4.2026.09.10.01.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:04:52 -0700 (PDT)
From: Syed Ali <syedalia1000@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	vebohr@gmail.com,
	linux-kernel@vger.kernel.org,
	Syed Ali <syedalia1000@gmail.com>
Subject: [PATCH v2] media: airspy: replace deprecated V4L2_TUNER_ADC
Date: Thu, 10 Sep 2026 16:04:43 +0800
Message-ID: <20260910080443.28080-1-syedalia1000@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

V4L2_TUNER_ADC is the deprecated alias of V4L2_TUNER_SDR.
Use V4L2_TUNER_SDR directly throughout the driver.
no change of function.
Signed-off-by: Syed Ali <syedalia1000@gmail.com>
---
 drivers/media/usb/airspy/airspy.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index 358a66ab8e48..85587c0fbadf 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -50,7 +50,7 @@ enum {
 static const struct v4l2_frequency_band bands[] = {
 	{
 		.tuner = 0,
-		.type = V4L2_TUNER_ADC,
+		.type = V4L2_TUNER_SDR,
 		.index = 0,
 		.capability = V4L2_TUNER_CAP_1HZ | V4L2_TUNER_CAP_FREQ_BANDS,
 		.rangelow   = 20000000,
@@ -713,7 +713,7 @@ static int airspy_g_tuner(struct file *file, void *priv, struct v4l2_tuner *v)
 
 	if (v->index == 0) {
 		strscpy(v->name, "AirSpy ADC", sizeof(v->name));
-		v->type = V4L2_TUNER_ADC;
+		v->type = V4L2_TUNER_SDR;
 		v->capability = V4L2_TUNER_CAP_1HZ | V4L2_TUNER_CAP_FREQ_BANDS;
 		v->rangelow  = bands[0].rangelow;
 		v->rangehigh = bands[0].rangehigh;
@@ -739,7 +739,7 @@ static int airspy_g_frequency(struct file *file, void *priv,
 	int ret;
 
 	if (f->tuner == 0) {
-		f->type = V4L2_TUNER_ADC;
+		f->type = V4L2_TUNER_SDR;
 		f->frequency = s->f_adc;
 		dev_dbg(s->dev, "ADC frequency=%u Hz\n", s->f_adc);
 		ret = 0;
-- 
2.55.0

