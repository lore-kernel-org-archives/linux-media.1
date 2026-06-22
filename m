Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F1D30E853
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 14:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139867; cv=none; b=hWfBpD7JN1np4EIXcNjsmiXlYQFuR+6m3ibouKJ2aA1aRmqrePenLINSlhmMyrOPaN18vFZxztiCH2/SKBclT0lUUeTjc4lN6ExhoR+FO/IdlGXHIJQgT0jbcW5YfoNBrPtU2Iwc2MDt20N8VYteyA0cpT8QLXvZBe+uVfu7Kl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139867; c=relaxed/simple;
	bh=3tZUaI9MFDxL1xc8CxX0yB8M6M58S8qPUaii7OTTRp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q6ELtohlTGczufJTDwX6JuhXvRcQZjI2nIPa7dn3gfCRwA1zl1QfpVMk41ipbZVfdWfWRTVwouiXOPU5/N0o7W7nKQIWRmWWl0O8fa/hVTetb5GYmoiWUPUoZWV4+E01BXSjQvRZElaMb3rLJ4YI98LMaquOJFEZoQj0d/Piulc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r/QqvLL8; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r/QqvLL8"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso36355465e9.0
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 07:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782139865; x=1782744665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S4dLP/ZuYJZUJG7fQSoJFcdghe6DjQYILe2Gxo98gRI=;
        b=r/QqvLL8CeY7YduIZmkJlZgUB85OJoydPVp3l3jPx9SnfrLwof5kqeDTOY4xh4Tlbz
         BCsWyiToU9CR5ey/Ma9iXQCncpE0XYOt9+Q766cg/jC9qwQ6jcUNSXywNs5deJVt1mkj
         Uu+WkOnmuMMmxVlM52AArIAEEvcOevbaUoOTllb79hgyqunm/RIfPC7d9X7sA9GxE6e6
         tpwVnF3bk2QaYQ0JZTgTfEcuJblm5vPruaoU9ulYOWuRmCMl74SNOu/4oMa//A0Z+JRj
         2NxHubqva7pn8BeHEA2wZuQpWkWH89v2dQj2yTzSQtRpIu9S5PjPRSScFFnCNw1rYT+R
         m5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139865; x=1782744665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4dLP/ZuYJZUJG7fQSoJFcdghe6DjQYILe2Gxo98gRI=;
        b=iLSfaOQRcmdJK9+yvmU1RGU1TIwRn40MIyHMv9adPtUus17XtGcbxcSMDsT0meJ8S1
         Bgv4arnkfyzL/iOA9n7EIOOq7YLDuymyhh1ftWsdHVNqfITnYgHI2sLbPIgetHdTVbBB
         8tb8KwG+hh2rLUJ64Tp2UvZ0z8T8A4OXj3QYqp02bVYxlXpnNQJfx7XmzVU6bxigjSVY
         cCw9uBZtZtx6NgLGBhE7ud39VZk+wZ0UGs8sbt2Daw4Rp1RsYU32lp/khgMT0O9vBWqV
         20nmHdDVDSeAXWLyUA7+6GvYM+cIf7gph+tmMYn/v1lUajIKEOwVidrJ5FrprFtcqbAc
         CrGg==
X-Forwarded-Encrypted: i=1; AFNElJ/9ZUeyAsRwm/13t10Ci48porS1gZTDBrKFqvXShrVU+0JVgt63lr5gqIBIfiSHvJaXoNgRTtSWXJnV7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZW1ZBFmKd5o4ur/TpTzT5E8TG48EUh0KHxtjC6nu+JkT3z0tx
	rirXcB10GyyahjUjeQtikXNg1GU76PtW8Oi/6oXUtyG8MnKRO+QNipq8
X-Gm-Gg: AfdE7clKu4+kMZlx4iCpo6MnVu3g+VnRYai4WhtMEiZ/RidjwSHEZa63AYf35nQY3hQ
	BY+6L0goeowWBrkZZ1dxmFyWUQmj3uj5X8BEUuw0ZW8DQcxKjCrs6B5f/OpUVW0ycF2FmdJSPky
	hnEEgYvZMqKmnGAbSmTZdfvCngOrBJ/yxrIjHQ6WtsZotaw8cW2cW2CgqUEJe03D/2AlQm9KimE
	VZbNjdvT0ABDi8/tbN9cGk94jCNSVvOYBjct5T+pnGgKFsFml32pmUNrFzHTA5AP2DGGlgMgFBZ
	PMx7+QuCr27VJpw6MkJdp+QggSFft/ToB46dp4YJAuQ4gn/snhNkes3hDzpuF/iZv82wFQ6H5ME
	vAeh6qMnePI+k/gFUZReaVZKrHrJFM1iw5EIvyfyHB04tJj8NgrnAnUQYgBcbON6LNQ6Lezqvqh
	vyp0CZInd7+PBwboZ0VXkmm1d1qjrY87BO2tSF2NyGYNo8g3p11SAad0duuZAsNdeN5A==
X-Received: by 2002:a05:600c:5010:b0:490:e19b:9632 with SMTP id 5b1f17b1804b1-49240a59ademr190410775e9.17.1782139864619;
        Mon, 22 Jun 2026 07:51:04 -0700 (PDT)
Received: from legion.localdomain ([92.44.171.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240f054e3sm305629905e9.2.2026.06.22.07.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:51:04 -0700 (PDT)
From: Batu Ada Tutkun <batuadatutkun@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Batu Ada Tutkun <batuadatutkun@gmail.com>
Subject: [PATCH] staging: media: atomisp: sh_css_mmu: use %s/__func__ in debug trace
Date: Mon, 22 Jun 2026 17:50:58 +0300
Message-ID: <20260622145058.9136-1-batuadatutkun@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hardcoded function name strings in ia_css_debug_dtrace() calls
with the '%s', __func__ pattern, as preferred by the kernel coding style.

Signed-off-by: Batu Ada Tutkun <batuadatutkun@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mmu.c b/drivers/staging/media/atomisp/pci/sh_css_mmu.c
index f2a84c1d6..bcc973b22 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mmu.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mmu.c
@@ -19,7 +19,7 @@ ia_css_mmu_invalidate_cache(void)
 	unsigned int HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb;
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_mmu_invalidate_cache() enter\n");
+			    "%s() enter\n", __func__);
 
 	/* if the SP is not running we should not access its dmem */
 	if (sh_css_sp_is_running()) {
@@ -32,7 +32,7 @@ ia_css_mmu_invalidate_cache(void)
 				     true);
 	}
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-			    "ia_css_mmu_invalidate_cache() leave\n");
+			    "%s() leave\n", __func__);
 }
 
 void
-- 
2.53.0

