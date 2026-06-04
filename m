Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC2D1F16B
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 00:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780532361; cv=none; b=geyeTPG2x1Q06Ws/T8oUtkKHrV62LidJ+e5OWICc+AHpXT4IzuVpRrLTZyTmkqQ5UQohtApzOSDDaTd/aFD5HumsX6F+ZdZafX9ZRgWsxDwJl+qOsANvaB8CHlaYMwbS8cq1trgFX6IQ+umPRZqvnaK7ylGfN/0ZZETmLFAPsV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780532361; c=relaxed/simple;
	bh=RoZxAhgVGfG73eFwtofeyMeDcsLxCMW2oDD0x5o15LU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f8B5NcOeKSvafgBtHhlZx5tTf6ETbenSRVT0IqZVVBQDa89Tx2Ycr6TocVel/dOdOh3fOo5S3EHqcQAb9X97UWLkZr7iDrlJaWzwYh4Nzg94ZQsYJj8p5vLJZmzhv/wowjqzVm9O4GtRQ0u9HcVZCFbbWQqSBf3XBhy9dHVEbuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UP6HcLXA; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UP6HcLXA"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-137eb0d76beso724806c88.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 17:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780532359; x=1781137159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z17zQzK8RwGzcJwJjulDGUCdQtyWeu3u7YyL1udHTck=;
        b=UP6HcLXAq4mh6lp1fg3zqqe5QoqNB8Hrl7accTh8oNGNOxVb8C3h/sinKXPzFQPmt4
         PhDplfE+61F0EB7wCAZRlWiFZLo/gc+uE0mbNqwbx+KMULggoOuutj8yjGaNT8FseF84
         LFWZ6WZw9OKC0E2E0U2JgIp8Hn4mhlyebynIaVKUUTlq9SOkFbxstC8kQXOFVhRgKVfD
         zqpflfgafkNccOD4oaesRVcPm+mUhQhQgMw8yKx3JgBJ+3jKATFjo5CCFZSH5P6s33ZZ
         Bt3jr09aKvaazJZKDBA488mfUO0vIQHIXV2XAWTV4A96VKf1wR6gBVtaBODdkPmKng/D
         yQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780532359; x=1781137159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z17zQzK8RwGzcJwJjulDGUCdQtyWeu3u7YyL1udHTck=;
        b=Pyw0xP32T2gPG/YRHBNnoiRjv2qwk7S8afWTxwam5ollrtae2cnmrn5zowlrlO9cLY
         mLcrKdF/G1s+tOBzpx+vvIBZ/6tHu6xsbklZuwUSDPlGARhAgk2D9Hh1Cf3mN9ER+L5G
         ET+fg9u/HNFiUl7HkPyV/G/1VxNi3SpstcksqNQNezVJldRRTFxbNht0CKTAl5dRPO+9
         CzAFvxEyQVP0kXJAbuJJlAqfob2zj++kou/B44kUcqajfQjfh2bbbQYI0MGA/tVZB5Se
         m6cXQxSLJ0LqbUap/GhkItLlW1JRq8iS9FcqfdTLhPMvFwiAPK6V+l3CRTWUymt5bxIV
         vjcQ==
X-Gm-Message-State: AOJu0YzmBZQ8Rn2Ffa9uho1R1KRrCHumRAaRCV7jDXF9dYYK8iXDWrXX
	R+dZjni8AlJFmOCnTWWzoK1/KTX1YoaxnawGjwE0IN6udVm8SS5CjZXZg8bCrF1Z
X-Gm-Gg: Acq92OGFs2EYtUq42QOTUPM6LG6Copr+MwIrFlXGdiMAwagdAO4XShmPXGOnqZ+RB1D
	IziqAWKtdH0riRh/If+2zZPvSqD/uSuBN0d0batUArEE8JUXId/ij9BGXCoRTaNLXF2L09zojzO
	CLloLRK6CATdZgtmP5JG+LL5Q8Zma0X5YpxMTmEJRnBu4UFFpuYCBmm9lZ+O94P7SG8aDV08+49
	+1oaHOZ7vhv257LR8eIdCsYc3dAXoC2gXt9FkOP7HNma3SwFbJ2o0miU1mYROmDsNJtFB9Glzoq
	gG0ivp9jiT3FKQYXQ2eqMSwotOEASPgwTf11Q8uT7230NOu9PPxwgA/ycZHSqDTp6N1C6ROQ82C
	4W4NY7kYnmHGB2mmPKxoWmRrZubaEFFKznngCMW0qTSASUE0fkFqfGezZzZD5T++kUsGE1Q+10S
	esaSRInCU3gyOqEuGvIRlMvFzHzcpr2YyGTqfWivToSfUQkJZBD2t8nB6wRqbHMU3pUQ==
X-Received: by 2002:a05:7022:ff42:b0:136:4bbe:9523 with SMTP id a92af1059eb24-137fdef3661mr707766c88.8.1780532358571;
        Wed, 03 Jun 2026 17:19:18 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5550bcdsm3064540c88.14.2026.06.03.17.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 17:19:18 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	bod@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: qcom: venus: add callback parameter names
Date: Thu,  4 Jun 2026 00:18:59 +0000
Message-Id: <20260604001859.33353-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Naming the callback parameters improves readability and resolves
checkpatch warnings about unnamed function pointer arguments.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/venus/hfi_msgs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
index 47b99d5b5af7..5c2025c5acc7 100644
--- a/drivers/media/platform/qcom/venus/hfi_msgs.c
+++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
@@ -690,7 +690,7 @@ struct hfi_done_handler {
 	u32 pkt;
 	u32 pkt_sz;
 	u32 pkt_sz2;
-	void (*done)(struct venus_core *, struct venus_inst *, void *);
+	void (*done)(struct venus_core *core, struct venus_inst *inst, void *packet);
 	bool is_sys_pkt;
 };
 
-- 
2.34.1

