Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBF84E4314
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 13:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736764; cv=none; b=dfnxONqzCT0H2b9tBEuyDt1Dm+SO4/lRRX1zjg2huk1ga3+3zdHQjTnZxRmuMC/ULnFuwLdBv8bWJKdfm6DsjbL6VW8uOnig4TQrctQlSjlBbNS9vWAzpq1TVhBBVzvQ5T4CfG26Uy3tuKm01g+aRLZOrls3Cc2ZaDuok1UlHjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736764; c=relaxed/simple;
	bh=kPgx4cLfFtyea67NwR3E633DUHHI/gx0j+1j/jnDfgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AFjObpaH1cpznahbcRrflLhCqCd+NLSaiLgjOhBfD0nMn8B94BIoa8iOGAhzA6VqxPGYvkT/snWDwrZG2IHeZfCA8KZsZmyGjpt123Xqq/97uwcOIi6wnGXk6u9pISy4MspATpi8KfHyKJyWa0KoVln1t+L0VOuWnxQxLULk0UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaM+zbWh; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaM+zbWh"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so3855455e9.0
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 06:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789736757; x=1790341557; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xTtOVPmjJhEY4Y5vNG5Ynui/aIBMd7EqZyB7db6fqik=;
        b=BaM+zbWhxxwhWSYLmzEFUHYtQgUmSRu9sAU5Hv3c/QwzJ/NtA81nzQ4fzApiQcjpG4
         tl2bJCfBjS7M6PNQ4uA79Ts/SrSWdOq7HGF315wENDYvIb8ProJUqPThC1GzHhvqflM7
         AhUmaysR4AVq4Ao3L8vAb5Ga2QGwfK5QPvREVAXpCwW3V5weWfd2yzpeU/d/t3wYXrNB
         4Vgyo9BiPTPkDB8gWR7tygkbEaYX+ZGgPUsc7HouBDUpr8q/hKJNezcYHuJ/xSKkKLzH
         BsKauJiNpPMd0N4QDF9RcRtzMAzVI9eQ8HesB4ZRdEhkXfTSQHXBkdrlqh0ku8O1LSyt
         Txig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789736757; x=1790341557;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xTtOVPmjJhEY4Y5vNG5Ynui/aIBMd7EqZyB7db6fqik=;
        b=lDZXTAxyXryxjnlGzyCvHQHmHdJZs1Jg2oF+SWWTlAwPZPLCbTlLRolxtsGNV1Kilk
         HxByfJJBRtqM6vp24VSvLqxzc35PuYVFKcgCVw4/bxr1MIZls2j3XOGtInPcvBnz52EK
         JhRblA8keNHhz1G6WyKj1VTpm8/Lo3A2AOBel0YuiSj8FUUe3JI3wJuOnl6T0nNszdp0
         hely86el0QlOTH5UBvpWqtmnWNFDC/Yy2fjUjVMrctgFn5+SnSXybv1VnxLJqB9Irctm
         9UUkV6YGQChbe4GsMcRLP4Is6gKWuX2gfwDaildhi7cRI5R21nhurSbWiIt+1z9CHVrt
         Fu4A==
X-Gm-Message-State: AFuF++lZF1ndmqucUsMYT+kTqdrT/d1ZvU1FkZFodFhq9rHhtGasrzSr
	IIkl7hXcS+gIv5BnnxYDmAuvQ4dHuTbKxeRQVBOuBtVBfuYwaEOJEVa+
X-Gm-Gg: AYBFou3l1idnzjlDL9E+xtlq+U/QbW8l54BPR5nJm6Mdjag9CcVnmG2HsU8pgqF4Ydc
	EC8MGSdO7j7Ek397QXSKwjnEYBuGvqX9Cx6VgO3L5h1YS9OqHGHtYp5nPWGPbyIDBIja4Sj1zUb
	bEAlmE5Ys+KNiehDafZGtKhyg+038uSj3dD5If2oRPBYcc8V9hMHSFgWpuwcLUfQ24s7q7J/OsR
	jctSm2RnJlSb4OJX21iYl2FLuwWZhPGm305WCHR0wcvETEHfaXzEr2O39+hDYJBCsO1P4iM+7LV
	xyNWigM3/TIEcDVDKVzKkCWoG1a5Av+02npmABY7b0YIGNBhhuGjZHCi9y21vyi7RuNQinAsStg
	Vt8hylFc+UuiT7oWxKFywaryYwMG3kruCAYO+BEy2zOCOTcLlC41GLUAdMz142udaLQlGfG/+na
	1sZq9PQHBsX/EQGbsY3UrR5V/A3l/aveIKL4cFihR1xSLjvF5vSc86rvrCKFZZgzyw+/vK8jGSF
	HwklSANlWn5orcJKHi7sFzhdpIPmKeOObg1HcIQ7UzBJPgvLArOid3Y4Q==
X-Received: by 2002:a05:600c:19c6:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49fc5741239mr34035075e9.16.1789736757294;
        Fri, 18 Sep 2026 06:05:57 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7ce0050sm64995715e9.4.2026.09.18.06.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:05:56 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Fri, 18 Sep 2026 15:05:40 +0200
Subject: [PATCH] media: rockchip: rkcif: convert timeout to
 secs_to_jiffies()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-rkcif-secs-to-jiffies-v1-1-110f336750b0@gmail.com>
X-B4-Tracking: v=1; b=H4sIACM3rWoC/yXMQQ5EQBBA0atIrVWihR7tKmJBT5UpkyBdiETcX
 c9YvsX/JygFIYU6OSHQLirzFGHSBPynmwZCeUdDnuU2c6bC8PXCqOQV1xlHYY45mt5VnbOFLfk
 FsV0CsRz/b9M+1q0fya+/GVzXDcQtwll5AAAA
X-Change-ID: 20260918-rkcif-secs-to-jiffies-1b98a96465f7
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789736756; l=1003;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=kPgx4cLfFtyea67NwR3E633DUHHI/gx0j+1j/jnDfgM=;
 b=pggsFLR06h1pcvdC/nqDIW9ExWwe/rpDAtuNuj4ftZ2dnTT7yl+yPfCBCZSNWi7x/a3d2+q9F
 RJ1IywmT/tFAYuO0IGq4I2KX34bi0eW6c7CxgTnUEabgIXNiscn45mw
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

Use secs_to_jiffies() to simplify the code.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 drivers/media/platform/rockchip/rkcif/rkcif-stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index 3130d420ad55..f82eaf9a37d1 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -314,7 +314,7 @@ static void rkcif_stream_stop_streaming(struct vb2_queue *queue)
 
 	stream->stopping = true;
 	ret = wait_event_timeout(stream->wq_stopped, !stream->stopping,
-				 msecs_to_jiffies(1000));
+				 secs_to_jiffies(1));
 
 	if (!ret && stream->stop_streaming)
 		stream->stop_streaming(stream);

---
base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
change-id: 20260918-rkcif-secs-to-jiffies-1b98a96465f7

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>

