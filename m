Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301464;
	b=R+2aQr7xRHvT4SNLsr5Ul9xlqX2tEYoem2JBgVCLW0X9AsBrrG3HkJiKGS6w8CJ/EKPR
	 tB1gw6C7QCZSUcbn7cJRmONZUmkFEPiwFUSmwsuIPTWK6jhcMSPbHRULYF2KYqac9oHxr
	 VIXq2WD47iYq9zrPd3mwRQI55blIhqwEao457IEaMvK9e0y2S0q2w1f+Kb6x/oDx8SzGa
	 +vqVmd2Yk9phrEKQ7MrM6YrkWwT1Yx+gLrkAV7egf4r2mb+oLWdjMFuy+anHAPn9oA/Wu
	 WcomCFB7rOmOJUKfd2X/r8Cjmn1Yq0yW4Lz4SkrTxWGFu6In5YoaSfiCGhCQR9gxiZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2U8BvVAz9intahmNBcPTvIKc7pOjctV7JcQq6cwhKEU=;
	b=TQD8BqUQ3R9YFGWfN1LBko8oPAwbP5IU4NZ0g7qil/K2lxn671vMThsUbuzWDvWFlyM5
	 qgCvBpJCMyqHGZF3hqQz7bUiYAdnmjBolcUEPot8rePFwRLcoGXBqpWoyAX66eiXJq2O8
	 3H59hdtkZMM4oVWV2u08t4YgxcIb96HG+gGXlTLTLJ5VtxnbG+iMz9NlXyK5YVg9QGofv
	 xxq5BorBhl9v82OyeLGR0hGzRdQUqKFwf4D/RMGGcBIcRQ6+/G3UMj5sz+qTxZRIGqkkv
	 mwxDrO8aFpZThdhImeiHM/uVN68DBOaFeJpFiJYIZrsWTGeQR7eNmir0+dNLk2LNJcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHN4HdpJ;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E9960A2617
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 09:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40E9960A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHN4HdpJ
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso1225681a91.2
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 01:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794301462; x=1794906262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2U8BvVAz9intahmNBcPTvIKc7pOjctV7JcQq6cwhKEU=;
        b=CHN4HdpJjhaw6yzpMGiBtZd8Cy0+I3sGP/qWTxIbR8Fokp5GKuXtar3nTW/rK1SStB
         CLiQKm5t0b1dfTfrauLTo60yJ8QRnk0lOWJZ9tkP/yFythccsI1AcUH6aTfxAqRhBi14
         gKSSL/rvAa5bLnmVhUrukJz+d15GIb6iQZfPzJURtDsAklciwRmGGYvXfCdVcaOYmpWN
         WZelPjBGO26Z7Xdg6j0jlmgY8n4Wum0Irl6YjGVdoRIiPwovhB9FRcrujvvZ8oTkB6Yr
         xbNDEafkzI8bseF2OvaohEXDfdQy9EixptAiQyEdE5UWQJobyRYYD/vfStClGpJDa8KW
         v3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794301462; x=1794906262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2U8BvVAz9intahmNBcPTvIKc7pOjctV7JcQq6cwhKEU=;
        b=a2jDD0co1qbBqt1mzvf9yREIuybCzxkta3XLXywi8+XSZtas5TE+D/nU8BP1Yxf3lp
         ySxOVql+yUGLQuMR5QNdLB6STsK0iGQFWMpagsg1Budw5LYylfWPAVVZMxSkaMXwWJfc
         lA4QoucOAuBKLv1AzNQOhZkQubiE+h2/RK3nwMYBptAvQ7sgrEWoca7DrgpsBxgQMX9a
         w8b/g/7FK0ht29nN5S0ogz2EpjcLDkqcAoQQWzsPxNdScb05r4zA8mDubetJ4uXt3RUO
         lKDmIJsVSDA4CvmEfgvtB4Oo06D51ieNCpzpNSi1iEvWQJDX2woHuHlO3WN88ANmW17X
         ulCQ==
X-Gm-Message-State: APuU4Z+8oxLieGQJSkREYTQWrTH+87y4yyHyQS0y5fCd9XYrnhgDsg1p
	KdYFrHzmYJb0gc/VZJ9PMHyvyHoIhnDDhTmuRthtIpYfota6jeM/mbkL
X-Gm-Gg: AYBFou168QI2qpV64it3eQmG34MhY4zHHoOxppQqT6IDVr94Z3tn+k8TGn9RVmDW/uF
	Eq6CeDQlOJ0+9KvcAA1m/e3E5FLpiZhLPZSLTkMeGILLx4UYJoILjE0Gy4fY/xT1++6MCq0/Epq
	I2YJoO6CUbMFWLOFVx0Ds1YOv2J4H7MUFfTUbS1RzwIvOuozbqLwRr/8VAMZ4OuK83i0WN4SrAx
	/mGgnp9Wgmqbztc/ev0xIif4XrA6aUrS+RotPSV9HLqsKAqjeMsU7qP278LVvI4HFuutKaJhaED
	S8jrOkR2oChKB2sQDSJxTQtl1YgTnzjaRVbofNeEfYr58Wfk/HIJk3OiE2GeA2nu1WjFFPcHhQk
	F4o5Cz74B/UN/7U6xgPSunq+9cioT49MBdkw4xVpsS5QltuDHH43gOnQldyQ2MCzqTEVcvKhFFY
	oH7Lqq2jXCTF+xhkDXODV1dCE2YgPbfj6wIsRwXSFlytybKQv0LuXGZPEgZVHMmRzakZNqjyvTq
	tyImqlVdfeKtpaWUh7bSfW8ZTByn/UVyjsh4zcPNppH5JaKo1OYubl94kY5Pv1FN8Y4K8/nNvdR
	8NcfdwqPmajYqKVLKVe/
X-Received: by 2002:a17:90b:1b03:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3b166c8486cmr2157706a91.14.1794301462591;
        Tue, 10 Nov 2026 01:04:22 -0800 (PST)
Received: from oslab.. ([101.6.42.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1676d83absm3051305a91.7.2026.11.10.01.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:04:16 -0800 (PST)
From: Tuo Li <islituo@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tuo Li <islituo@gmail.com>
Subject: [PATCH] media: dvb-bt8xx: Fix potential double-free in frontend_init
Date: Tue, 10 Nov 2026 17:03:43 +0800
Message-ID: <20261110090343.1245744-1-islituo@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The caller in dvb-bt8xx.c (frontend_init) already frees the allocated
dst_state when dvb_attach(dst_attach, ...) returns NULL:

  if (dvb_attach(dst_attach, state, &card->dvb_adapter) == NULL) { 
    pr_err("%s: Could not find a Twinhan DST\n", __func__);
	kfree(state);
	break;
  }

Remove the redundant kfree() calls from dst_attach() to avoid
double-freeing the state on failure paths. This keeps ownership with the
caller until a successful attachment transfers it to the frontend.

Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/media/pci/bt8xx/dst.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/pci/bt8xx/dst.c b/drivers/media/pci/bt8xx/dst.c
index 110651e47831..5cdf8a77260c 100644
--- a/drivers/media/pci/bt8xx/dst.c
+++ b/drivers/media/pci/bt8xx/dst.c
@@ -1694,7 +1694,6 @@ struct dst_state *dst_attach(struct dst_state *state, struct dvb_adapter *dvb_ad
 {
 	/* check if the ASIC is there */
 	if (dst_probe(state) < 0) {
-		kfree(state);
 		return NULL;
 	}
 	/* determine settings based on type */
@@ -1714,7 +1713,6 @@ struct dst_state *dst_attach(struct dst_state *state, struct dvb_adapter *dvb_ad
 		break;
 	default:
 		pr_err("unknown DST type. please report to the LinuxTV.org DVB mailinglist.\n");
-		kfree(state);
 		return NULL;
 	}
 	state->frontend.demodulator_priv = state;
-- 
2.43.0

