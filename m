Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E12369D47
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 16:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790439904; cv=none; b=e0cF+I5KtNYTGf7Lk+ZyYFlmoVdINzpMgGam111GJlK338asopO08yQiEMQiPLv4iYOIsJJaTT4VdM7OqoXGwiq/aShN7NFRC3fDSt62qcPpgJXTegXHES7Tba7oCcHBiiT5aQagkR1gH265LcE608xLbL6g6LpGKQsnIxvxei0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790439904; c=relaxed/simple;
	bh=yEAjJLLW2mUFewhC7K8QsWCSw5B9UcetRCPCEY9zmDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Swn5YFjMs7CtMxzwgSt49XFS7nfd4j7sM5vlqInbF9miLqjFG4tVC+D1/iYOWof//R8wP/w8TBmpE8TnfPTwsHF/yi16ISNTPIS7odqlQN/3TvYUATJBuH7LFRR7jpuXfxOCGtPkD+kRoQBHvRwUH9QUXLvlC3ufcrC4JreKB5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FD2vFnm0; arc=none smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FD2vFnm0"
Received: by mail-qk2-f40.google.com with SMTP id af79cd13be357-93c5d67aa05so65589685a.0
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 09:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439898; x=1791044698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lcedmEUDuhdephxMCHT6cYbYrSuUGs6yxAq+AhOHg5Y=;
        b=FD2vFnm0dh13lq36yhbZcJkxuZpHykvICWazMvo8dOYu/KPrvNJW2UJ73CsPtrdAhG
         Y7SFkDzkIJoz2AxLLgGJJ81sog1bQqp3jFilNlbwxQuxl0LRWMN89EGe4gnsEi4uhRku
         TyVzrLG/qhpIB/p2ilOFx6C13CjK78Mw711+9dyWstrQ5842aJAsHcsKD4QfpPrPpC5O
         gscdDvik4Ck/qfmQ0li9rKHW3VSNDD5MVkUfPpSNqFaSz8hJbdGDjnOhdDD2+QZWafmh
         rjhlqMv1/x4zYA49Y6Hz+vt3Mth2Q55NxGZTIfdnU0tHzYXMN5p5ZsN/JyOk+D7Ngt5X
         eGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439898; x=1791044698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcedmEUDuhdephxMCHT6cYbYrSuUGs6yxAq+AhOHg5Y=;
        b=kdeE3nICMUrO5I8H/0Kyz9TYcm6WAuDWURU/1NTXpxrhPkEIAlTwWQG6Nhz4IDUKuh
         6tvA17NCSg+6N43fQrouuxHpryf7IblaC7ZQcx5NKpQq851Eq4oVCVPnJ01Hfj9e3dvY
         IMYLo6FWEl+g/fFGSNZfg7jqJ9TbyoWodjqrslKKHWmwcry14M2G/zHSG96x799yqcYk
         jaLYJZ9DTkRWAz5Q5/J3WX1zIiIW/AkQf0/ddMVxbvmZMrksrESBDgCTGLDFJ016+TH5
         /q9wOcOLR346odO/3nCQpxNnlgrvqTrjM9VTxRcP8MrbEClTMkXi0mAGmsQmCeb4ykQt
         IHjA==
X-Gm-Message-State: AFuF++l9Wj7M+Tsm6OVngY2wpVN/Y9xsE3SJBmZ95j0s0zaYGgQCHQTu
	Ob62oOtBpwpUmBNNio5+A5ameI1jWb49Bz59mpIq1i4wK/WNZz9n0JMRxrSR5A34
X-Gm-Gg: AYBFou2FpccP3lhkQXCZnMWWUhn6ATqdteR2g+Vk0CsKDzccQ0laODbOGjUDEf0F6oy
	Tdov1OeXhBkf4Hluj0s3xH+bNrcO8jIYzFKD5RWSpO8gJALJ8D2N6ot7X+fOYjgd2CgpaMUIVhi
	TObKGRZMCYUtajweNqJBycRIv4lL9WXJYs1NFDfKQWzyrLZpyRVlf4ZeVpaLOV4oSuY2pgeiol8
	voarno6iVhHGkGTZ2YcAI4DFTbKjSd5prtS3nDmj1nwEjW3w6GzPSfL0JpM7aSJy4WqjQUWWu7W
	+STlBz7TuLmHO/tw//WeIRAup5z80tPKq1u0lNa0pmA72YGE+gssKi+mS9zB2QQtq4wTZB2ot5w
	vANivePvvakgq4Pk1g8s3kWWUJexcE3U+nwUnvvB9e451R+jPR8jYRsiot42mLTE3DOSvUW7Z6B
	PTcnv7bQYj0IOuq7nmS9MTzWSoE0vgQ9VKo+7nO3ouHXn4D896x69DArFgYia3JI0yCWCkUWHKy
	8gjBbPgV5C/HhEo2b8IfHiu7KX2jG7GHyRfgNHkab8AL3I0
X-Received: by 2002:a05:620a:4809:b0:939:6de8:43dd with SMTP id af79cd13be357-93c47511ed9mr943179885a.49.1790439898560;
        Sat, 26 Sep 2026 09:24:58 -0700 (PDT)
Received: from zaina.localdomain ([172.56.198.134])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c448f57b1sm448507385a.22.2026.09.26.09.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:24:58 -0700 (PDT)
From: Zain Aboobacker <zainaboobacker33@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: saa7146: remove unused dump_registers() debug helper
Date: Sat, 26 Sep 2026 12:24:45 -0400
Message-ID: <20260926162445.25173-1-zainaboobacker33@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dump_registers() is compiled out with #if 0 and has no callers.
Remove the dead code.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
---
 drivers/media/common/saa7146/saa7146_core.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_core.c b/drivers/media/common/saa7146/saa7146_core.c
index b705c4bcaffa..92b5be153613 100644
--- a/drivers/media/common/saa7146/saa7146_core.c
+++ b/drivers/media/common/saa7146/saa7146_core.c
@@ -18,17 +18,6 @@ unsigned int saa7146_debug;
 module_param(saa7146_debug, uint, 0644);
 MODULE_PARM_DESC(saa7146_debug, "debug level (default: 0)");
 
-#if 0
-static void dump_registers(struct saa7146_dev* dev)
-{
-	int i = 0;
-
-	pr_info(" @ %li jiffies:\n", jiffies);
-	for (i = 0; i <= 0x148; i += 4)
-		pr_info("0x%03x: 0x%08x\n", i, saa7146_read(dev, i));
-}
-#endif
-
 /****************************************************************************
  * gpio and debi helper functions
  ****************************************************************************/

base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
-- 
2.53.0

