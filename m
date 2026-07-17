Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFF83AC0F4
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 16:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784307323; cv=none; b=ZzKlSzPcjsy/7O9icqp1g+/JMaVkFZvNNZ3wzeqBUH8WzCOWTTiDYBSCtXQpS6mOHY/O8cie3ZCVBW0PSiuw02a5Zd/BvH+RRb/HaL525ACXGwJsTEjlXiwHQjmhx9xuC/YramEfAgJj6JEsXu26MouwfB3OrliFIdv6stPAPEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784307323; c=relaxed/simple;
	bh=zSAWwGEjCo/ISFQ05jLdZTK9jBIloQTAjMIWES3GCTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TcPJ1A39hxcXtz+njp284A5yH7//Bs6IqPdIEs2c2C6s77So2YA4cSMvhgljYOlVWXJfC+nyzFOBKKHjQ8loHhRQ80lOePC4kCWbR3OrUGLe8+DrwP47+djmPSCYUh7g+w0zQf5DyxdUNNH0sv+0yEJdD/TzYaOiRrmr5Y0FC1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyuaOWar; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyuaOWar"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e1a9d9105so3905521a91.1
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 09:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784307321; x=1784912121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Ly5xIEgI4AcPsFzsa4YqSru8hFVFu/iGied4OTbOEw=;
        b=PyuaOWarZWN91wYI4JVRycZdaRZMNV6VhvxpDYHM/rpZi/qrJV+bMjhZqWc1KBLDPS
         QJFi2mRayVyzELUeNjNvTI2dxRiJ8t29MZS9qPAO0P/f/lZXiJFH/OAggt7H180WbRan
         kZvM5i6moKWRk8BeaHbc3ojOjFdfG6YtGmT74vkBMS1zhcEct01fV0iY8NS9VWqkUNGo
         MJfkq+gZKeAtf6KqEyO8Kjbkz4Pb5kEEnVx5iCyaPQEUT9ibROpnHbMKj9YOBQ3CUe3k
         9K+nfw7cCTShgJvskng322ujnMtY9TBVUZkEjt6ETwYO1sdAjO9X5WvPdFKpIf/7E6Cc
         VbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784307321; x=1784912121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Ly5xIEgI4AcPsFzsa4YqSru8hFVFu/iGied4OTbOEw=;
        b=p6juQBaghh9FMCVmbl0i6J9aX4OikwzXqJN8DmC2XapER0nAb6z3bdPe19YxMlCxXv
         8UzCvcshdx3xo0ML8SQjEO4voged4MmA6wNVIOm89ZXNJDYoucOyXakmL+T4Oarw3neP
         7XMKDxBRsUIUgrCqvWRiwjQB8DqLMxITCQkU5BHdHLEtPfA7GcNwY2qOElbjLyCXwm4P
         f1NLUd4fOA5Hnd9dPDvpscCHWFPWfta8HFQKx/bUh9aUofm/2m8XN5lHsL9OhSolbudl
         xeC42Ia5iLG9iTiMF4quej+ltEARu8L+iWdlZu1aL9lm+ZAW9K0oJ89AehF95QCOEokx
         3ltw==
X-Gm-Message-State: AOJu0YwfdojXb/aVDMZzrS96UnMLimy0SY6IfE59l8wdMHQyBZlJ/JxH
	Kk/yaxX4vrCt0X/8B/iH+gkM3Vl632zP4FBYir2+IYH/4shhw1q753EWg5clMw==
X-Gm-Gg: AfdE7ckzruU9bGucPkYRhnmD6IEZjQ0iBLOAUkrgRixNuNOdM7sLsJ2ss6jIkyEalad
	jYWcI+62TCWpIQSQhnGUa7v3QxeHwuSno5X4NQzGQ3eVL64dnJfnJym+anqjO5ZEK4YVnO5Uwxw
	ZV3Vh2cvY0zl4VzZaleE8IvGC6gs2mbnDQf5F0ykWyaNz39RX0UtGLF0hUok41Buaql4XTmViE1
	fTKfkYHd2DEr8Yp2o0iyJ+roHXLDPXl+kY1XQXYi8s1pyBHgSP1nDwYBqXm21TKU/PZnXYYGqxY
	rl1tYgTiPNHxDjjbhB/rKQ8LTjre3rrjy6GU8XcKS+i36YgpgMjxr9wyl5449PUrCRS9CyumdsS
	eUmKO+Bo3SgvP7cvX5+IJk+e5KAVkiKx5J/UK48cbBXuLcPeXjsC9iBZQqd9dUsuNURLYtot4HF
	lxkmsw5pcc
X-Received: by 2002:a17:90b:2f10:b0:387:e0bb:5803 with SMTP id 98e67ed59e1d1-38e4b5ea2f8mr3349933a91.42.1784307321574;
        Fri, 17 Jul 2026 09:55:21 -0700 (PDT)
Received: from cachyy.lan ([2409:40f2:1183:2842:9e3b:2493:9d45:c117])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb8a4sm9512668eec.14.2026.07.17.09.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:55:21 -0700 (PDT)
From: Sai Vishnu M <saivishnu725@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sai Vishnu M <saivishnu725@gmail.com>
Subject: [PATCH v4l-utils] Add missing allocation failure check
Date: Fri, 17 Jul 2026 22:24:45 +0530
Message-ID: <20260717165445.46734-1-saivishnu725@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Sai Vishnu <saivishnu725@gmail.com>
---
 utils/common/keymap.c | 11 ++++++++++-
 1 file change
 d, 10 insertions(+), 1 deletion(-)

diff --git a/utils/common/keymap.c b/utils/common/keymap.c
index 21c1c0b5..b881187a 100644
--- a/utils/common/keymap.c
+++ b/utils/common/keymap.c
@@ -124,7 +124,11 @@ static error_t parse_plain_keymap(char *fname, struct keymap **keymap, bool verb
 							struct keymap *k;
 
 							k = calloc(1, sizeof(*k));
-							k->protocol = strdup(p);
+                            if (!k) {
+								perror("parse_keymap");
+								return ENOMEM;
+							}
+                            k->protocol = strdup(p);
 							k->next = map->next;
 							map->next = k;
 						}
@@ -399,6 +403,11 @@ static error_t parse_toml_protocol(const char *fname, struct toml_table_t *proot
 			struct protocol_param *param;
 
 			param = malloc(sizeof(*param));
+			if (!param) {
+				perror("parse_toml_protocol");
+				free_keymap(map);
+				return ENOMEM;
+			}
 			param->name = strdup(key);
 			param->value = value;
 			param->next = map->param;
-- 
2.55.0

