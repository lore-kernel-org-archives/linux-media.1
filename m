Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370843;
	b=SqA3s7qdMee0VfuGzRi2Q/3c872iD9OI/tZ4p5OEEr1ydTXB3CRoYsEj9xPpvbKzc0T9
	 8De3WHV9yhzlzYA2JBeLRFHC+hdCguTvfvfRRDBzWZ00Cm4uKAVJffpRYNeYAolr+Kano
	 1evxtqMI5Iulm6aTL4QfbIPAqVBCMSCWhjA2C+izg6WwpjgdoUegtYqVLtsV4BC/jNdgF
	 S0Zp+p0rPvrRcL3un0aXZP6sj/wer5j3YZhqg9M0BFxP+GTazflQBwsS5gMQeZCQKFjEE
	 T7UVpBP3kgQj/LiBJhncPSTgN4Y/kX1nwgWQAX5lqLDyQRYxrs9wXm3MInBu/2FNqPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2y/k0vv1KZWvdv/tcZ3kHN2M7tA63Ao7aQ+R/TLoEBY=;
	b=jLpjNbF56k2fsDuujWnduwdxC52r1HeCZURZIS22elLQCAacH289+Q4t29SfGGXE7yQN
	 yDUEd3p5JnC9IINfSfS+9i4ArxvpG2B7SaHpU0GET26JY93/PXKrKU9vbZmjmrCQ286BI
	 DoiHomArx4mR2il1SEHmut0XrIzCHRhrjYHbYevYwmwFWHpGdcalqFdudGDDmJzuE2OhX
	 hYNEt5W9FkY4ws9Su7P1fxXNZG6RsIHLf7+bFcK5s5YvcLZG4Z7efhquaY4IEJx5QvXwY
	 gAiLHlkHsKOLLxhRKS28CAtnVlc79DvQSB0REdKrPPEyXHgDDOAZ55SMmbmVJEIiuAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uYDcDVWe;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8BA606A327
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 04:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E8BA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uYDcDVWe
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a070781f63so1269798b3a.1
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 20:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794370843; x=1794975643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2y/k0vv1KZWvdv/tcZ3kHN2M7tA63Ao7aQ+R/TLoEBY=;
        b=uYDcDVWeZFrbHF9vMV26+UGVFxPWRvQtoJIqvx4qNzOIngOFXdhm8vzZZS1gQ3fLAr
         JX0y8XI2F4z6eD4bqeXVvyLZNZnW332lc1+gbGjBffXKFTqCtgNPtHKnXilCmBQj0pRj
         Xmt5hAVOP0f/NAKzErpgM2gEZrRrggBAyor6jJp+a0iUAMb7DnoeW1bIBttmTa7P7Ana
         OtCzGqSCpUb9fbhZ5pfg9/3WLAzlucpqWbPARzhxp2pJlPFbu2P9TsgPIdBTx4Xwk6yJ
         F9x0H4woEb4gS85UMTVPzQArwPBs8/7QmVVF1Fd80irwKP4l9yFFUgy9Fa6z691zLIxj
         zVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370843; x=1794975643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2y/k0vv1KZWvdv/tcZ3kHN2M7tA63Ao7aQ+R/TLoEBY=;
        b=qum1iLmC+jCWVukkhCNH1J8sBcT4HCh28ILt8UAK4Fxxu5y/E8juNDz+DdmYJNLMpV
         ohWbU3PUnkFpGTfRd57QM1omrYrZvu1sgitmyKFEdH4m8hGiJS9VHhxZ8YZ6lvq4fCEK
         /gc2LSTXMQHjKCeRxBR/GntPAoZdDYAOP+5lOV5dZ/cV38mgmfAX0CToSjdjIQkNIKbj
         rtIANXNVZO+Ynq5WkOzLy8euTnfCNM9r3bN0YBwnuBKC2gzJwcMNXgxfLVJZsr3ZZ4sp
         n3BeeFdOZHXA3izB+BpgtaxIx/ILd02N3O1EK6Y0V4DEtJr9smInF5T2LDMU3V+b+Pq6
         EPUA==
X-Forwarded-Encrypted: i=1; AL+hErGfVyEt6hUWyeVzfJG8oq6YolGCVwsiTDlblw526siOU+Ytm3RaEsTCW/uLvhwNnNA+WCBvm2hN9if3BA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+1qAvdsf9PUk3Nh88qX/L76J45jj1/Yf33VxmIEE5IK66gOOkg
	0NkOSNxxRcWb9pz25aK7yx2oLXW6IcgdjyIRUTGrSLnrREJeBPpCxlHc74jxdEsFpYc=
X-Gm-Gg: AYBFou2k+UU5OCr2s8Vw/dDkx1qGydsEnhUfm61x72kGfxgeJvwzBwMu7hx949qbl58
	LI4OlC4W5a5lNEuzzKd+DUOlmjHdzkawseGymLFJL6aMj1yr1eIdHGDbITYzBisIj2Cct2HsF94
	372ba5nR13fRxUMqNjUhzyRdwu0wV1wm8ng+DDvtlDEXcLoB2lC1+7tj9uCeegnYJqPtsrco3Zu
	BRw07CH9UKz94xb+jzCUN+5IzouX8AOLqPls0caOZoa1dVEX8+pFiuEH4MqPenWeIrtxWJM3BeQ
	rEDUGmcnRs7GJWFBgVbXa50HdBnPwiMd91SBZnCunpkCJL+qZAbRbd/lMke+JihRZSMUmVNf+98
	Azjrl7o9w66mSqw7SShLbt0PLBOyUCB+uj9svKWzmGh85gFzbYvohe9x5IWsnDevozgYAzDNBRH
	rcsfizqprKmwK6c8HyVfMcO0TkqR5M53GXbuoahy05D7VTz+a9SUwzzFViycIvvwifl3uCO8llp
	FL5jFNkaJdELavlMn2/05LlRtGhdJSDd1u4kZ1mrZylH1rjXuj0fpmMBhKEsmw8nUf6oU3Kau2L
	0P05qzNfw4Xa3bZOGsk=
X-Received: by 2002:a05:6300:220d:b0:3eb:affa:32c9 with SMTP id adf61e73a8af0-3f2f72992e9mr1463244637.0.1794370842730;
        Tue, 10 Nov 2026 20:20:42 -0800 (PST)
Received: from oslab.. ([101.6.42.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d7dd5bbsm1319947a12.30.2026.11.10.20.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:20:42 -0800 (PST)
From: Tuo Li <islituo@gmail.com>
To: mchehab@kernel.org
Cc: Markus.Elfring@web.de,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tuo Li <islituo@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: dvb-bt8xx: Fix double-free in dst_attach()
Date: Wed, 11 Nov 2026 12:18:43 +0800
Message-ID: <20261111041843.1278057-1-islituo@gmail.com>
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

Fixes: 6792eb0cf931 ("[media] bt8xx: fix memory leak")
Cc: stable@vger.kernel.org
Signed-off-by: Tuo Li <islituo@gmail.com>
---
v2:
* Update the subject to refer to dst_attach() instead of frontend_init().
* Add Fixes and Cc tags.
* Thanks to Markus Elfring for the helpful suggestions.
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

