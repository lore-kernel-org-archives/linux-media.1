Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793539472;
	b=cYWkN6eMfYOfcgOe1T4ccaVA+keaELzyyXlgODENYL4D0fjgGEmBtC7nPywYV8zyt0DT
	 2KC6tpTx7FOLiAKVwJeGzTUtmaZjKU/YKOAPXgbp5sg4YFPHFpZxOna+60qpyCYenaZ6J
	 PRYUxzCv1dCedDTDMfowpi+0YvNERL0M4vGyoTG2hga6MJ2IsMF2ihmqzhm7lm7E7WYnV
	 Ru/l8Z5YpEKbKgaiMjUUFsKlTloxISH5M+FE6RzjUfXRICKybvLMh4CFwYvVgcjMwsBQ4
	 9kJcioxL6jQSXeD0kPSBlnn8GNrD4dDOYfouJFNlMqmaTfanuR4zXeECFKUIxxuBO1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793539472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LzlgOuGdib5YOq34P/i6bRldhrAYEuaYlkzFNFcIg4Q=;
	b=qgzJ9x5aOvHQb72DdNeCetOcMse4V1xXU+3SBJ/HMhfooG+0CwkCBeEmjZiNYtkecXUs
	 5yM8FfUrJI7y6n5YdV9kKohn++6P3ZL+euAzsAqoq5t3/sUygPTBFl/PafaSNfGdXfMpW
	 i33ueqIcRlvvUtTP12Qy2eBvSr25rkTnGBOmNZ4PazMmzkIvnTPICBKJ5psMs8QtkUjBY
	 OOU3r8gPAuw2gRbvV3GE8ekpDiCuCYk1Ht5J9inWNcsVjqQaWyTckeZe7d8+a226m26on
	 lQ6tlFBaP0LpA1IsK4emb02lRsPg5HCyx1dluuQPou0e3pT2yjFduzWsKMnDRK84xjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=ETepvLu0;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C18D606A32C
	for <linux-media@vger.kernel.org>; Sun,  1 Nov 2026 13:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C18D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=ETepvLu0
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b2d149693fso4045547b3.0
        for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 05:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793539469; x=1794144269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LzlgOuGdib5YOq34P/i6bRldhrAYEuaYlkzFNFcIg4Q=;
        b=ETepvLu0v3btKNzRkiQzA8a2GUrFc5vI1Pg6UN3Q759yFkLyQJh7sqyODCeM0gEGwi
         YFnwzYXL2dtvZ8q/IIGEb5bveVzbGBsLNLELkCbs/6ARqLbj4G0psW+zjvHZxqTwiGkl
         PDO1ZJ5sLqwfQB8MMpZ6UB7hwuSf32eYRbvK7rLwgRTBh8679DF+4Q4c4+NgCnxeAwT6
         ZpFYlyr3cc+eDFZqGot95/cQxNBt3nq3Dimr7tvTiNo4g/Uj8GA27s+YeG4KXWIZVHDO
         95HNmnIatqbqN4kwgwSbwggyr0tshtyyT++f+F5U319CEWlILSH7awfSkDFGmD3vOCK1
         atag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793539469; x=1794144269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LzlgOuGdib5YOq34P/i6bRldhrAYEuaYlkzFNFcIg4Q=;
        b=0OHD1mHowBQXg6H92KCuwdzI70hkEW0wfTZaUoy+5tFury/RMCwEHsDcjW/LKqS8r/
         2aeDtFLYz8eN2rPkIFlG2cJ5Oug3Xttw9Bpz9zkE2G8WZRv8+Thcu00ZFBJoq2SF/MEs
         hjc+/Mbcv9JCPkI7pcYIKTuM1JrTbWvfkpvrwaVpuQciSeZ/J9IqxXu09UJbCgSpcR2T
         29/+8kOurPxTk2WIbF5Kdcc1DxQ9QMAR7IXLGCx3eexEk2hQwIzWkGkinPGxhFEk3TOx
         t/48YdTF3Ii6R2imaa18S6zbllNrmqN9C+KBZAKuWbxqgBlOl5Qdj50M69sO1dKscVXK
         JxYw==
X-Forwarded-Encrypted: i=1; AKwUvBzOvOYSIZC0HfUCQ04Z9GcmpyQmoeVFEIKS4gWLyi/+8TmNMcNPyr6Qtfv5Wt3qt4zVMwz9jKnFy+uwaQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/W/Oul2AUhdahvlN5nDe1dovUWTSV28kkb6gIWY3nARoiDl99U
	lNtDhuD/7ZBfIFY4d0VTvFs5jG27quO+jGP9WuuHFsc9B/maWN1n8BuUDIMvDbDKGg==
X-Gm-Gg: AYBFou1HH85x/hIPp0owYhon/YStnMJrBL+Wtdyb2VROv/b2jCUGmvqe/4yFyeMSF5u
	h8m6+L1pHo4Hvk5ExzZFZD3yBda1ccIVAWQNxa2fXkOdMh1Efu49tpd4pD9zBytYw/nd7+SmXXL
	crWL3ldRYHXST2tvRBx5Pw41AKXjEu8Na45/zPsyPKTdCMQMcQZmdd1ueU4DNPPN5PwjhQCtHYz
	XfmrJUPNIYKqkxdpUYq/Q3BWKqsdRwiuyHyoLwZahuROCAuQO1V7TK/ZdaH+LehFHLgEymKRr9M
	v1b+hIXhzdS2jUVssN2hBVUSo/3utKwmBCoYE4VupP3VHGTIMlrajGgx3KyG8NdxEC7SEq8cCt9
	t3JMd8YcgCzj29jAgXyjQP1KeMFf3aU/RJKhSkSVsqf+PJBIi3mb8CbmhHSrbusAQDJxaGjsgVv
	m45a+35nCDPjEGnZaxADr5vlyOKlTGE9BqeY50NvrTv3kHuedWG4khQvmmTas6O6N7jx2skpujn
	zPF2Yj/h/iGlUCyc6ypR7vj98v2bfuW97ywhYC6GNYIqDKUWVZNUioS1lEjZ4R07d5B1sPW
X-Received: by 2002:a05:690c:4:b0:8b0:a352:f978 with SMTP id 00721157ae682-8b2b65af008mr40507547b3.4.1793539469488;
        Sun, 01 Nov 2026 05:24:29 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b716433bsm37301417b3.26.2026.11.01.05.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 05:24:28 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: rp1-cfe: Use IS_ERR() check for media_entity_remote_source_pad_unique()
Date: Sun,  1 Nov 2026 22:24:22 +0900
Message-Id: <20261101132422.1396104-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514193148.2357371-1-ingyujang25@korea.ac.kr>
References: <20260514193148.2357371-1-ingyujang25@korea.ac.kr>
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

media_entity_remote_source_pad_unique() returns either a valid struct
media_pad pointer or an error pointer (ERR_PTR(-ENOTUNIQ) or
ERR_PTR(-ENOLINK)); it never returns NULL. The current NULL check
therefore never triggers, and the "pad not connected" error path is
unreachable.

Replace the NULL check with an IS_ERR() check so the validation
actually detects malformed media graphs.

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Cc: stable@vger.kernel.org
Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
- Add Fixes: and Cc: stable tags, as requested by Jai Luthra.
- Collect Reviewed-by tags from Dave Stevenson and Jai Luthra.
- Diff unchanged.

Link to v1: https://lore.kernel.org/all/20260514193148.2357371-1-ingyujang25@korea.ac.kr/

 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 8375ed3e97b9f..91e9fa0341e06 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -1779,7 +1779,7 @@ static int cfe_video_link_validate(struct media_link *link)
 		link->source->entity->name, link->source->index,
 		link->sink->entity->name, link->sink->index);
 
-	if (!media_entity_remote_source_pad_unique(link->sink->entity)) {
+	if (IS_ERR(media_entity_remote_source_pad_unique(link->sink->entity))) {
 		cfe_err(cfe, "video node %s pad not connected\n", vd->name);
 		return -ENOTCONN;
 	}
-- 
2.34.1

