Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596AB32AABA
	for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 17:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781976190; cv=none; b=h426S7WR4z7PAmWOTpXEGObfjxL+Y/PFQZanWuhVJBYbwfZBe+M2c9FxRZXvQK5rEMPzi0B7B+587UF+T8NW4P55GhDJO5rTe2Od88ZoqM4tT8rxBq2WB380SOsR3ILYBnXMjFJhii3JIDaYYAeHfDuLoRfCCBYTGAo3+eUxmDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781976190; c=relaxed/simple;
	bh=kDBgNFRASlFF7P1mtcVmzVp9eI1IQrYyzrvaBcAnoeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bXuh3cxwkgMftmoVUh3XZLE4Fx8TY0HSbF0fWrLWXxOM6O5hf6hkP0JaSVuqwNX/IYbotE8DXmiRNSs3JQYZbNFP0JVk4uD1RA4geGd7KAxxueas3dLm2ChXlJfmvO+58EUSKgbYrTafK315JhjJdwn1oqtj03BUIF0QEYjSKdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIaQIwyP; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIaQIwyP"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-697763eeafcso1215429a12.3
        for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 10:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781976181; x=1782580981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1Hunz6+WbJGiyRvJSvPYBRGWeIqcnU6y+0jzl4SDXk=;
        b=XIaQIwyPaEWpDNs6Ecgs+CDwaZUEvuBeEjaq1l59QzKku5G7oVKStkBlqA5trFbMO7
         Cr0HQPgPyiZwnZQd5aqyiIkqDVplE7iF23KX1y62C64wK9ccpR27aXfEoxS5A1e3Qv49
         ajXF2iLHizJTZOPZDY/2j/3C6zY5wbS9+JrrdlglKbKZNFWiDOjTzWRsNQS4eaaheyfm
         psUZjV9iVbOFnhT5npvIXEynrJRQPivrczEqvCXMCNZmCQP7LeHn7aDdRSgGOfhFWbGG
         C5s6HhpIMS8o3tbRcFfg/TGAgjX8VkZg4B46q8K+jU1Paz8Z0oKI5Wj9PblrUkS96/gF
         7mow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781976181; x=1782580981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M1Hunz6+WbJGiyRvJSvPYBRGWeIqcnU6y+0jzl4SDXk=;
        b=T2bvNHxQABLJtaDI1ebE2JuEhXW1sLZTt3gh0dVS05xMxBgqSryzE3II56oELYS9cO
         s8Lt+UlmhWNWpo9xE2s2ANQINiBM2dKySAt+xUaJB0INbT9VGGNItgiqph1b+jMez13e
         QBnkTkrEYPbrJ0jQ/c0sE11nbUNvB0EPAaGaeTDM8FYLUcX41zAveeF0V24xdC4hvoEi
         KHca6ar4VPCxSUGqAD+wbFy7N1nR0e7OuqImH71eMudtjAQOz5qBSm77b1uv1D+0a4oh
         XMQrpdwub5GwLXHHN86wyv3RnVNLrcuxhnwaJTYUkBJVqziHw2y2FZbviFERrdgmfxXC
         HD5A==
X-Forwarded-Encrypted: i=1; AFNElJ81z0hIGE1rhHDm02DNtDThow+8oVRQ9rJlKyg0Jx9uRV883J3OaYph6Qz6OIcRWTXpHZ8/EazQrNhRZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyF/8W5pwZXROCNuVL2/Oh4qT0vLUUTSGurQK6GYFGJ6fxHSh+
	HFvJNBRwUXm/GjwCR/RynpA7/fTvO2mHQwdKuTfw/3CK2N2ptKia4Tpx
X-Gm-Gg: AfdE7cmZS1EGwspOuEDyZBbTGSuuM5nCYn191c4cbU70nAO1g1n1XoJcuoVSef3SE1K
	QxslrSTWZJ4IIm9JI6uVWejcT+R1/9PPxXIb1HjDvKk6q1Q+ZgaQ2WjYYtgIe3hBl8xw3XQXqYR
	ffnVs3sZg25gWbMtbrUBYCjf+yZRyJ39U7NrrfavyZfZlaISQst9gK8NpkPWMSO+imM/5nJgm4B
	Md/7BmDG7YNmgYavf9wuLhDpTbkKeGo10ZEPACqacF3yA0rVnJGhJyX3G2KboFRp6xmCwzkXZXn
	KjMKdLz3YojhWlX2s41CRpqeaiCGGOsWes1Mw5lcw84V8dQLjX/HhqV4wpV1MHbnDRfDn5xfmBo
	fu+NA/5UzSFwF5sT8ONiiPGgAxCU541AaSi5vlRchSl6awc6OfX95Zp23S1CGELtRmw==
X-Received: by 2002:a17:907:7ba0:b0:bf9:9c64:c8 with SMTP id a640c23a62f3a-c097adb1192mr419586366b.1.1781976180344;
        Sat, 20 Jun 2026 10:23:00 -0700 (PDT)
Received: from adr.. ([2a02:6ea0:c041:2243::13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60bc01d2sm117388366b.31.2026.06.20.10.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 10:22:59 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
Subject: [PATCH v2] staging: media: av7110: refactor av7110_start_feed to reduce indentation
Date: Sat, 20 Jun 2026 14:21:38 -0300
Message-ID: <20260620172138.10741-1-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ajZSd4RhjJgDqn1q@stanley.mountain>
References: <ajZSd4RhjJgDqn1q@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The av7110_start_feed function contains heavily nested if-statements,
causing excessive indentation and violating code style guidelines.

Refactor the logic inside the DMX_MEMORY_FE case by inverting the
conditional check to break early. Additionally, remove the inner
'if (feed->ts_type & TS_DECODER)' check, as it is redundant since
the outer block already validates this condition.

This reduces the indentation level and cleans up redundant checks
without altering the underlying driver behavior.

Signed-off-by: André Moreira <andrem.33333@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index e77be16f442ce..2e32acf897ffc 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -942,16 +942,16 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
 		    (feed->pes_type <= DMX_PES_PCR)) {
 			switch (demux->dmx.frontend->source) {
 			case DMX_MEMORY_FE:
-				if (feed->ts_type & TS_DECODER)
-					if (feed->pes_type < 2 &&
-					    !(demux->pids[0] & 0x8000) &&
-					    !(demux->pids[1] & 0x8000)) {
-						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
-						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
-						ret = av7110_av_start_play(av7110, RP_AV);
-						if (!ret)
-							demux->playing = 1;
-					}
+				if (feed->pes_type >= 2 ||
+				    (demux->pids[0] & 0x8000) ||
+				    (demux->pids[1] & 0x8000))
+					break;
+
+				dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
+				dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
+				ret = av7110_av_start_play(av7110, RP_AV);
+				if (!ret)
+					demux->playing = 1;
 				break;
 			default:
 				ret = dvb_feed_start_pid(feed);
-- 
2.43.0

