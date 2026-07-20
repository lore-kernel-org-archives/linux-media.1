Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F172D1A9F91
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 01:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784509837; cv=none; b=d+VHh3s9fH9Vd9OBXsQxiK5zo9uT6G9CVCuHXk0/srDaeu/zFMX4xlbvHeS+aqId9fXx4tH3zOOOdJbtpaiFIgZnLWxV/84odxbFxne4zXaS+m5SCvTNoM0kV9MBy6Dm/m4FP1hYJ0TNG4LzhZr0xM+E1Eg0Re7ZcsowWapn+WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784509837; c=relaxed/simple;
	bh=e4GlNve3MTDtXTXIxRx2g+qaaxInx4VOmi9G2vT3rTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X7iv94LlVziJRfihwQT2kIIZGG8EWExpDxmcH6ma9VBFFaHYEcpQGiGlxhDzVRIy2BbUIcQZr21IGjV0pHLZJYdi/lmaqKPGMPKVUJVxAD2ltZo4tylKWlYTUhHzY9xMlTHn5wrMpQyIjKAAIOssTKzdlCyjcnCH+zjj08bs86g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUL3MCnl; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUL3MCnl"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ceaf8a1265so92437695ad.2
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 18:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784509835; x=1785114635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EBcY1E9KE58ECU0V3mHdtyaPCmVSbHpxjR7JF4DvDds=;
        b=KUL3MCnlDaAwsg4LTz2UvvGqawByymTpAe0loaYNR33LcdBBkVfZXdMcJgb23GJdMy
         G0PTUsUKEpQ/iS1Fu1NQPKH23jgeQMwf8hpivQI3HTib1HfofS5iNYognWsRzIubQdpW
         i5/wWMym4T0IYHM4N8SLM3p+akVWRAwqFrRcKnT77/tXalH7Aib4TNCOTUAT3KrRTvuD
         uS183wx08PXFuxv7lDrEVEjp700Cy3fNsdE4sX/HMpumv5nzqL/EtjlUi8Msix06BbiF
         19hgf1M6ik9nME4jFSCzKhoh+7UpOJ21fcighagtyhbGyRqu/x6sfcdSEolZDWQ2k+1v
         hxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784509835; x=1785114635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBcY1E9KE58ECU0V3mHdtyaPCmVSbHpxjR7JF4DvDds=;
        b=gCSr3tcy2pQtweQ7xEyg2Gx3R9PFdEZRT/ZcoJfxF0C44Ea068Ki3ycnusSRVWd9ey
         +hzrOdvBgZja1nz7DT/DTatky5c0oONPVquFskZIpAL4f5UqYd2TRbrUDO9rTmwQcZzN
         KEr19dm/L/S9ZqvzUK3FRq51amHvx9NwtF0mB66pzBNDt/t0dcpAlX3ktIonE3l0yCKF
         jRXGqs7FNLxFZsI6TgPU6wz5gFWxcfe2bIsMt2iku/GAgiNVXzoRFb92CY6wdeUf0x8a
         OWi5b8zpeXzNB/pS8ak5TiHtc1F44UZdxrdFaywsauT3IMjXEtZokxF4fVoQXvb4UQ70
         6FMQ==
X-Gm-Message-State: AOJu0Yzw/xJ4DdlLKEneRb9xAlbyeP7qtVsNDXEAtrIH2QSGEJaRN5zu
	Em1fQ9kjCVnjxOybl34amqnXgr0Hd3e4f6Ke4MXNEZoZCVY1LV8Sl51UszLv+tzS6KY=
X-Gm-Gg: AfdE7cmf04jl7DqaruqFsivZhUWK9IM0gTlcnC+Q5QIX++UdQ4Acupl5EuNA/hNDneT
	sad/GF90ZCHitnsMAX5ECeNv/Xigic7WDiEesJaIar2XHcPsqylRcDRhwPURwUDWX6x7P/maVDk
	a9hHJM+veoRYnYTc5Wj3Ra7iUEkQOmi8zclPTfkX0WQ9Gs8hv1ymrLyjBG6R9u0RgvZf7t15eBX
	N/ocqLYi7oxyKxXdVj2Ut8JdQx+QFQrJlW2IB8v9n5f2O1vQj5qPQ6cD585W1Lh9QlW5jms4/MI
	d/rWQUseEDaunEqr8Z9IBjHP1FpObkRsgAHywrryQUZ7js00wrfYbDXUQcaACdV/T40Vw25F8Oh
	/6peDqtNfCE6AC2jYTyR5PRgUrs1lVTb26VYSwXt2KmW9hgVEC4NaE0xNrkRgh+gc1Uo5447hG0
	6fvM1K7E1n4S9eXAAGP2SKDiMpsTx4
X-Received: by 2002:a17:903:3bcf:b0:2ca:ed41:d33d with SMTP id d9443c01a7336-2cf34a80342mr139510125ad.45.1784509835291;
        Sun, 19 Jul 2026 18:10:35 -0700 (PDT)
Received: from White.tail445f11.ts.net ([45.119.30.153])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbaf6sm27141680eec.17.2026.07.19.18.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 18:10:34 -0700 (PDT)
From: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	kees@kernel.org,
	stoth@linuxtv.org
Subject: [PATCH 1/3] media: dvb-frontends: cx24116: propagate firmware status read errors
Date: Mon, 20 Jul 2026 06:40:15 +0530
Message-ID: <20260720011017.11363-1-nikhilgurudasani314@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cx24116_firmware_ondemand() tests the firmware status read inline. A
negative I2C error fails the condition and the function returns the
zero-initialized status, reporting success. A short transfer is returned
as a positive message count and is mistaken for a register value.

Normalize short register reads to -EREMOTEIO and propagate failures from
the firmware status read.

Fixes: 0d46748c3f87 ("V4L/DVB (8986): cx24116: Adding DVB-S2 demodulator support")
Signed-off-by: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
---
 drivers/media/dvb-frontends/cx24116.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/cx24116.c b/drivers/media/dvb-frontends/cx24116.c
index c10053a7cb82..04b8f2fba4b0 100644
--- a/drivers/media/dvb-frontends/cx24116.c
+++ b/drivers/media/dvb-frontends/cx24116.c
@@ -258,7 +258,7 @@ static int cx24116_readreg(struct cx24116_state *state, u8 reg)
 	if (ret != 2) {
 		printk(KERN_ERR "%s: reg=0x%x (error=%d)\n",
 			__func__, reg, ret);
-		return ret;
+		return ret < 0 ? ret : -EREMOTEIO;
 	}
 
 	if (debug > 1)
@@ -468,7 +468,11 @@ static int cx24116_firmware_ondemand(struct dvb_frontend *fe)
 
 	dprintk("%s()\n", __func__);
 
-	if (cx24116_readreg(state, 0x20) > 0) {
+	ret = cx24116_readreg(state, 0x20);
+	if (ret < 0)
+		return ret;
+
+	if (ret > 0) {
 
 		if (state->skip_fw_load)
 			return 0;

base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
-- 
2.43.0

