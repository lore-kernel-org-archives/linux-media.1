Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6CE21E0BA
	for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 17:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784396540; cv=none; b=KQHTrpCNi1ETakuUaDZyicGeSDpqSniwuM4yEKIEIiVQlgA6Ax0AFoW1RJ2+D88o1znvV9HjlqBgzfnMZE5XGnNW21z3AGV0j+XsmEgzbOzpnby4phe5pRdQvTjP3Dzic0aVOvvbQMk1xqoM8XKwvm0SYIIrmguPPPDetsGBLps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784396540; c=relaxed/simple;
	bh=LCYz6MDY0rnU7n09dwIagTCCM0Rp27A51IpunjvDziY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c2OQRsHV87Pr/UUrcekE7m6xvGdYgz3PKqWjqmYktqQuMVsFOy8Z1sclqIW4kx+5ZX3lhy+xQMmbYojQvfi3pKwdX2ztFfmKaoXAQI9Jj/QG4OH1///1nUHtZupsCc6T5TAW/BCWY9SMsxB101kW7xVy7mUlNJDFLT/7wWSmCTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYemvWij; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYemvWij"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8486ac3f347so2274209b3a.1
        for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 10:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784396539; x=1785001339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lk0CxdbGAUsWkU3YuWaCA7JJ++iDFVSrzXmUd3kpHVI=;
        b=BYemvWijh9woNnLrrkw+HPNCT2IsZGdDzcqgX+aMN3vZSaXW5TI8Gv6G3MDDwaJKPh
         J8KIcVLGB/iliS7TE3GO55st7MxJ8uRaB4zk7h7AZtPYNNnrNgSv37GAzbMu4w0JAKSp
         IS5q/xMncQ6N9H7aTnhKGOm9vLExm+hYEvvQRX/I7sJGLIRHnyTthPCoDuBPwzmOWNZ0
         khPJJAOF9HVKSHQ8mNOMVjTDP4ldOq8wITj8Wg17r9h7765kmGFVRArL4pJOo9uZj12B
         9Nk+ITzTsRherZU5en3f+iU0RlD6m/UPxJ4oqchfE3dCvYCXv9w3Yyjhx3AiuflXVrr8
         tIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784396539; x=1785001339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lk0CxdbGAUsWkU3YuWaCA7JJ++iDFVSrzXmUd3kpHVI=;
        b=jBoGvczCqAYghuG36IJev/dCtpd+hzU+JYMpZmE5AzT9nYOsOHDRZK4Tm20z7HFOGa
         MFerovbEanOvDbmwwo+u1G7T0LPGGYKgA0PfXk0QbrJ/ByzvacEqokxKSTxUo3EXyn4R
         ZpLPAsNfmwJGWYuMA/OIYwOnhr6QfXkBBhl80JKqWd47fuzthVoez5Q62bM5wzc4Eara
         nKNVCs6FbUn8GhLm/uPzgAse1x0xjzdoWGb1lTUkcYEWANpwHnm40Co7s/lUwj3E33lA
         vdKA8Kdme/8CHgTCOA+olhPrEOQqlBHNg88LHbtalh38Z5aZxwUCYHaowGcJ8qTB7QBb
         lLZg==
X-Forwarded-Encrypted: i=1; AHgh+RoXQ/c0Wpd/QsWEfx6JzZIX4oucTjLFq2rp0OlJ6cw6mIQrfl3zC+oJN0TWZbEeQiMeTO5shSLO1Y7V/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIB7AsXDD2pGjh+7Yb5dkQ0EjTWm1x+MqFXoDQ3ojnWpYJJv3t
	CENAd9xIuYfZsaPAamDfIZ8bwBNHgcThOSLqFzyNnEshOkEGTWNpIBrO
X-Gm-Gg: AfdE7ckm3xK4Q/137Er8u4755Q7WIlDikTGfhRM2fZ2qErehmyVsyXO0MDFTun+YHT3
	w1lVinOA13yRuMqlJnWaW20vGF9cI5zYmkpD3Rt2rjh8+xjfPm8nlM3/yLR+G5brL9Us1HG0ujh
	Qn5IQThe9mHvh1OBTvdUELMHSKcTjCBoyQcJ9RUTHbGp1IUwDeyAGu+7yiExvMrQrQVRfDIzL6c
	XGpXVNVQ+jhvaop7nwX4wwE8d+PWCOiABoNQM+twNYMAzzcnVqwP9P/YLBDpC7J8CRdYVueMWWo
	dRt7HV46Q/YlNsReOF9IszqIj5omd2xUam4kFvb5fALCjGO16Y4cMAzZQ1tBnc/lP2RzIauZlxV
	M7ir6jJ9ynwWzdeHZ28TnV+cj1srnQvXGXbNNu2Ff8OKat108Yr6g2e5de/+GRc7/dilIHj6Kcv
	UjK2B/0SwsOpieU5et
X-Received: by 2002:a05:6a21:1519:b0:3b4:7459:85a0 with SMTP id adf61e73a8af0-3c38db2e247mr12043496637.18.1784396538821;
        Sat, 18 Jul 2026 10:42:18 -0700 (PDT)
Received: from UbuntuOS.. ([2409:40c1:10bf:f813:619a:ea70:804c:eb7c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe1014sm19449407eec.7.2026.07.18.10.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 10:42:17 -0700 (PDT)
From: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
To: gregkh@linuxfoundation.org,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Subject: [PATCH] staging: media: atomisp: use sizeof(*pointer) in vzalloc
Date: Sat, 18 Jul 2026 23:12:03 +0530
Message-Id: <20260718174203.21591-1-prajvalchaudhari733@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch style warnings by replacing explicit 'sizeof(struct ...)'
types with 'sizeof(*pointer)' inside vzalloc allocations. This aligns
the code with modern kernel coding style standards and ensures the
allocations automatically adapt if the pointer's structure type changes
in the future.

Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 0ee52637ea30..ea49ebe2da5c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2873,7 +2873,7 @@ int atomisp_css_get_ctc_table(struct atomisp_sub_device *asd,
 		return -EINVAL;
 	}
 
-	tab = vzalloc(sizeof(struct ia_css_ctc_table));
+	tab = vzalloc(sizeof(*tab));
 	if (!tab)
 		return -ENOMEM;
 
@@ -2901,7 +2901,7 @@ int atomisp_css_get_gamma_table(struct atomisp_sub_device *asd,
 		return -EINVAL;
 	}
 
-	tab = vzalloc(sizeof(struct ia_css_gamma_table));
+	tab = vzalloc(sizeof(*tab));
 	if (!tab)
 		return -ENOMEM;
 
-- 
2.34.1

