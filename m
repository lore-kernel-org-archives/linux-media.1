Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CE34071F2
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 21:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781041878; cv=none; b=fjC6ui36ECAjI/Ha+3mWXuW7AEpiKNljxNQ4gTiT7MjYjjzjZ/8kXe7pdhWLyvRmO1lOvtN/e2AzUWdNJCQ5l7lmc4l+nqe3z96Pz+MJJ5gDB4G1Lv+rlDG5TEPtXN6DHu+/FGlUoKOJsf5Xq6I/IMqqBa10u57tWFpUaUDzX24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781041878; c=relaxed/simple;
	bh=p36HzU3EV5swZvzF5zBhSQ0fqA1uncigLkCmH+53DG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CireMIfEouRlnIM0Rmi7PvFsgw/MuTDrp8+lak+crcO7s7fvy4BOF3UAgSHCzC6QXjkwg+SfLdHH3RtTcG8EuT7QfrkNVqp6wV49R1ch4IztrZst8RnhvLfGntMVgKyXt4/w8jFxQCfFPbH0/Eb0suxBV9nT8uxb2Y7Kl3JSQUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSU/Z7oK; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSU/Z7oK"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-307d0405e07so1840400eec.1
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 14:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781041876; x=1781646676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3QatkkKnRVkIu7a4iw4icQQ1TQtBwhBS/0N8pK2Zwc=;
        b=bSU/Z7oKrXj8NLjmrOwg6rnzbJMbaRMh6N+jXMOfMmbdAfZI0qUDGO8vZoWWDBzCqI
         Q3+NtquzLXxMDdSJo9uuK0iIJToWJGKMxl7pkMgCVXBqocdGGEj80gzU2LDrvrCnRl+J
         IOxVJAcIcYk0PfikLB1d9u8FYHS2P39mQHd+k8DHi5Wp1pfHbo1s2PFFGR4i+c6JSyVe
         gB08lWIY0eCL73QxeH8ZHNUbBxpVg03IjQZiiBtP83kRQGCHx3aqs7SF4nY1wSwKXyzx
         FxxnHS5GGZA1hsFVIsMdHd56dnW7gXoQ+ISo7r1vfuQxdGxxqhP0HqI9gbC9RLgSlHuw
         PXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781041876; x=1781646676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3QatkkKnRVkIu7a4iw4icQQ1TQtBwhBS/0N8pK2Zwc=;
        b=m7RXNKlcJZ9K/gL5yswiz22+lMpqsp2DQLLitMcq2ys0Lx3smQSPd6l3fo7acxaxbO
         8mwVUmzR6hywRpsmnv3Lfr1Q30rWVh3/turn09sA8afoNwfo9H5g+UzVKfOKq3EVuDSQ
         T+9Xl5WmZYpJTJ/CDBENRt9vAybjjQfd2iJM0CdR139LXvNCAe6+VYr7mrBRZG/uh3WD
         D0NaU3NU1VllQebkPDIPJmwW9o9PRoPw/Az6oeHWuBr61hBFrFKgq5DzTsRFC9ct6422
         zfWN6WhyMnmkEZcS0g93kEH4VlCP/VlyVB4g30CkfxtQ64p3KImLEpWq4V9e4g+8uxoe
         vVaw==
X-Forwarded-Encrypted: i=1; AFNElJ89+1e0vgFSOXHL3LQySn72z8GHbu4offtIQvvc6kFMZXNjiFm4cMYfdC8kuJnCcKDQHU/IoB7ML3Ym/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyxm9ZgKEABOGWeWBL2/sEZxEp3IJ0Zr7v7IZ+KT2TF2gQ3ed6
	7c2c45xEpQzoDASIAZcK8x5nEhFliqAqRq2r4jQ7mpaPkR7dIqRB0tb/
X-Gm-Gg: Acq92OFoQQ6bwIjizmx67XfVJoHRSLanik5aOQz1XnCtEKjFy2WM5zx1ZvJ1DxA4Zxz
	Fgz0YfSUTfn3RjkuU6pj5PQh3nOp8VVFy4B/UtW1lYno++1mYB3anJwRC7NA/j+VkpLny8Z6wQ1
	5E9TcvBiShReZZ7Xw58X74K68NEsCNgjs6eZ51EL1JA+XuVpVXUjNxtLIMMTspzboaTyYE90nus
	EPSMv5MX9sNOXtq6jlgDMl2Iyn8E1BHu14gGxlr5pegPs19RSfxlxkmzFa/Ek4F8h44CBJkhU51
	YoHuo+qtEZwGpD1OaXhMWW4jE/9r/2xEerjKN8XRRbw8V4SB+Wv6JCI86k6lnO9zsrDh+3/rbzd
	ZDW1nB3MkfZZtuQJQm38XQXgNCz524ivaunMVg5udQqyhFTSYY0UCW88dK3b0iGtqA4sVnILxUG
	WPvlq8bCier2CeJcX6DjyYdQ0xc2ZzrAkL4+06WfN9hPjnV6TTRamK24PXYJQ1XGSMK2SKO6Mv9
	P80TPBxA0DsTTK6
X-Received: by 2002:a05:7300:ca4:b0:304:885f:2db0 with SMTP id 5a478bee46e88-3077b22a7demr14331120eec.20.1781041876135;
        Tue, 09 Jun 2026 14:51:16 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:f671:db74:6740:62ca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df48671sm23293005eec.24.2026.06.09.14.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 14:51:15 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: media: atomisp: use kvmalloc_objs() in make_histogram()
Date: Tue,  9 Jun 2026 18:46:31 -0300
Message-ID: <20260609215110.118860-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kvmalloc() with multiply with kvmalloc_objs(), which handles
the size multiplication internally with overflow checking, silenting
checkpatch warn.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
Hi, all,
There is a ongoing effort like this for other files from atomisp
at [1], yet, it is not covering the same file.
Tks and regards.

[1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/
---
 drivers/staging/media/atomisp/pci/sh_css_metrics.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_metrics.c b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
index edf473dd86ca..d3ae737f1764 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_metrics.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
@@ -59,16 +59,13 @@ make_histogram(struct sh_css_pc_histogram *histogram, unsigned int length)
 		return;
 	if (histogram->run)
 		return;
-	histogram->run = kvmalloc(length * sizeof(*histogram->run),
-				  GFP_KERNEL);
+	histogram->run = kvmalloc_objs(*histogram->run, length);
 	if (!histogram->run)
 		return;
-	histogram->stall = kvmalloc(length * sizeof(*histogram->stall),
-				    GFP_KERNEL);
+	histogram->stall = kvmalloc_objs(*histogram->stall, length);
 	if (!histogram->stall)
 		return;
-	histogram->msink = kvmalloc(length * sizeof(*histogram->msink),
-				    GFP_KERNEL);
+	histogram->msink = kvmalloc_objs(*histogram->msink, length);
 	if (!histogram->msink)
 		return;
 
-- 
2.48.1

