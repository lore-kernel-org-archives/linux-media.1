Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED95239C632
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 04:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789013195; cv=none; b=mMnYfvnW8x5tUstF0QLrj3dnSvNn1QJ2zRXssKtdTZ3FNtxuOgWqhgfYEN8xo3207Gu5jknspCtHNyEPvTkAMuKPOG9RBUVZJNWlSjOeIhbaNBz/A2xCe1fI/D639CEqG8cOlNElVzA6AfTxl1H6vATEjZ9d4+0+mUd09UPdew0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789013195; c=relaxed/simple;
	bh=gRm8k0lA6+IZmwfDi7QHofPJ1tCqLQVpoNOipJBhfV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IAvlpIUc7xH2CCQ+kP4spRApiW8h1dG3l28d1BXBGnJErANs5xV2+MbuUuHxDtwjQPu22bc4pyfdXFOLSZyBouz084YNFz9wqwyb0CCqjFJswnR0flPGFTw6ZMeduwT1x+grJXdjFfhdLbV8eUMx29jbf6P1VHHl7j+YB9DyQZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLhIpnvY; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLhIpnvY"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39b9a99469fso2566757a91.3
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 21:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789013192; x=1789617992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4T51EgZly4ibicIo5lw/2SC/Zwq/woe+QZug39a3X1M=;
        b=HLhIpnvYzb71n28WQCBucRJ88u/CTHCRMbct+bbXyAGOplZJdIIed4sFStTIGN9wwg
         N+XLzkhfwbnuSwYFyH3h+QQlH1cyAxv6Us2PGrydzJwFWwzvmSQbpHU+0vfEvrlriRJv
         2w1E8VJHkDB/vuIvPtL5gkREx2n771DRev4DoWlZcdcdzG8sBeLXTmXG9zTmP1lrrbkB
         py0GdHsyPNzWCMP4+3FIcHgNpJ85KusJ9HcGjqToca1R9ORxHP6imELNFqhe9rUQjUlV
         ia7JRNHB6e3m4sUNolnrqw32KJ/SmS510dEeqf/RlDYY8VeMBxAnW8//JIplHuwPoBjk
         BNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789013192; x=1789617992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4T51EgZly4ibicIo5lw/2SC/Zwq/woe+QZug39a3X1M=;
        b=oBUUCv/GLNC8eXTG5QFKq6MCRMPimZDBr9F+U7Z5/kpX/6RtxLJWdbXg8qtPwxYWX2
         jFaC1X7R7nvJyYmVGOoDvzW3NaFeMNrIPTRBDoPhctlzmvz5VOdAmYfCYiibvrG0OLtK
         +ze/vmXuppaH5kouh+5HzYEo3NmTmj3JZnTUAZsiHYFzYQ53oCA4zf/pVHMFm+Ham31v
         MrtdpnnlI+F0sPICQdBHEq4UZ6ZUffVDBlVkLrZGvPVkvnSEpxmAQwv2ddbc8QA7K1jq
         1dSWVj0T9DkdrrMiXmLHQATN8d+maR2ZtNADPAcbdplzgHMzEooaXGrNmmOBr9WvgxuM
         SMSA==
X-Gm-Message-State: AFuF++mp+JfmuBAkD/g/HwS7JTutyj4B2qgDuns9Z3vdFvrs70pZnhUa
	lvJ4XVenbfl2O5yQS5olnP08UlemVTMRXCujRDnxZw4WzoCCnHDeu0cH2NEdj6nxgts=
X-Gm-Gg: AYBFou3hRyhzIMRdcR/A3tbGrtBH/bddx0N7I5eaALDgMh+MGronz6WAUFB6GPo2YZH
	BeGWrhOacV8jTuYwKZ2pQFj8pf89Vc/hyLCyxknCOtW9C7LxQOyqxXkN+HpCXcoHVcgLglOFax5
	neSisJk+2A3zCoTohSqaPoW+AfgQQ/Evhp/ab2llwFeKGk7mq8pVVtTZevPVM1LbVK/vJFC+MBG
	EUYBGF+03KwFtzUVcjgk9UhI0Bln8Smjxx6BZXXocvxO9QQiSx4R7Zqs4C0Scz6qsft0NtVu1yy
	U5ta5orTF+uzragkdMr35+ZYNez4H5ZNhs+ZbZOgdnmUfbUm7UH8Ix+x2o6ZNZH9LeHVIuhkUSg
	JbLtPoy2PIQbZA6UkOcwhcI+PM/HkA1Gsvi9mVMH4DgOft3B7azeoNdkpv3UAmGsl9O01b7Wcl8
	BLLeqVQ/Qb3k+O9YmqO6uNkHgBNZGhdUYgV6v6TpWIV7HPXCpLtEqooC25aDBId/LAzAqAu6SEU
	WI=
X-Received: by 2002:a17:90b:1dc3:b0:398:d6f4:c61a with SMTP id 98e67ed59e1d1-39b26207ee4mr59834307a91.17.1789013192044;
        Wed, 09 Sep 2026 21:06:32 -0700 (PDT)
Received: from ali-laptop ([128.106.179.207])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d776184fesm2902396a91.17.2026.09.09.21.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:06:30 -0700 (PDT)
From: Syed Ali <ali.2012.asghar.cool@gmail.com>
X-Google-Original-From: Syed Ali <syedalia1000@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	vebohr@gmail.com,
	linux-kernel@vger.kernel.org,
	Syed Ali <syedalia1000@gmail.com>
Subject: [PATCH] media: airspy: Replace deprecated V4L2_TUNER_ADC
Date: Thu, 10 Sep 2026 12:06:12 +0800
Message-ID: <20260910040612.23253-1-syedalia1000@gmail.com>
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

