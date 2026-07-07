Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E513A873D
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 07:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783409781; cv=none; b=lbHNMuHvzJc1/y1Ghx7+kBHuLK5YGXnpklDSgqlY4HarFg8/7LL4Y+Vi/O/WZJmqMiV5ak0BipeS5Qxo2/50JaNq3Hr63oyEmIcpOKaSG22SV0N4M2+xm/KiPjLNB46GL8pavjXi6OhNHGrYMMBt42JbnyD/DQV6cwJnGodSURU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783409781; c=relaxed/simple;
	bh=DSEChP9kAsmk2HrXfSdbcWaNkWfX3idepBBcxxyGuF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nGQUABEgmPC01cWSv7/2jPwtyoHJPl+6UVwMc10ZYTV04bDAUgBkIel0h3ocVGArGlRBwyNKHg2XELw1vhg43qEggdZW9EBCDrbFefszezLa0ToUeh7tV5WrWNqYlOcFjjLJVrdlziTLBin/93CyQu/MprYJ3PMMwpRjyi8aFE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCO2IW0+; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCO2IW0+"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso6546778a12.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 00:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783409778; x=1784014578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K6AeqTPAcZ4JrA+Qd1cNlOBTaQ+fwvnS/cXYGctMis0=;
        b=XCO2IW0+wl2/TTVsaSeM68xaqGyeSlR8kPZ4ZZVhzz0hgtUT93u0v2Y+9++nkDfnr/
         9pbzYefA3/XQ8/ATUW8XkxHwFZEhBZ+nuRyqOljxuKLvAftDcBZgCLQxtRf/mk5W/LGe
         isxGRG8gW+rWPIg0n4QdQicTeHM3gZyOJddhF0JyQEt2HOlHSprPlw9gv21SMjndlrDv
         9IRwm/HeI8edMc1ApsBGJi0FQIcQ0DKjgM8POT2wvTjDAIMOVKwvzvJIm1te66NoCWn1
         vrvhryXTNAVETUDJatycEgVm1+2KrYLhDqESIfRgrcEX07F+neUQYJkkNCmt7yL2xiyl
         aBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783409778; x=1784014578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6AeqTPAcZ4JrA+Qd1cNlOBTaQ+fwvnS/cXYGctMis0=;
        b=nbkypk+W4TExrBeRnmGEYXTbJs46eBSycCzrHiEZNZ9lfFbUhZ7ff3lEfT4Ny+2hwX
         TAuLRqx8fbdLIowu1B2TZvkzDd4+YikFI/lAmW+unojsW3OIkg1bIwVUQuSK21LrGjV5
         slaZ3V98k8QlYHR2zefCYxLNMv+S/RIxWP/yDu7w6sKm7TJeTsc4enJ44IK7PS5uP1Ub
         317PvMDNPwsJ1naKxiNQyv44SGHpl1whrsL8sF2sh4Xh5apc5TAtjNojfDr6DUQku/B5
         u15R7SyWP/pjpCUmuxPvMe02/pPPKvBSQ8PPD8qq1xDc6ZMrlT8J2wgiZ5Z9pSNz57O/
         fELw==
X-Forwarded-Encrypted: i=1; AHgh+Rom6Kzfib2bxBNpb/Pyi4zk5kKx1dRerwBi7aqitW0vhPcoJiLwiiMDP3ukVoEIJQ2fbOxORW39x2MsrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdphFsXzZ/GAe8tGettxGODVyeSPENzpLEL9UC6FyUZKU7jBJI
	47Evg01bEwUtdnYs07IzLLC80ocoC1C0q79Ek2TLHkZiwoDUsZO2LThw
X-Gm-Gg: AfdE7cklm5Z7UnPaOJ5uw/wecW+Hd7kCG6yB1gg8NEyrysVcCx10ZMOgc7I0Oj34D+e
	aGeuOG798g1yr7a1IbFgYXCl5cgDHBGQlQqPWIFQp8z56VcxA/48VbvPVqpWaExCdHSlOqfLBHK
	bzouSJ0EQtUI8jRbQ+ebenAr2v/lSfmKKEwqs1qGSX9OKS9gUiv5aGMoYU95siPsAQJ+J/GMcbe
	FsBBEjuqzswsIa2BqnWFgR7WQ+oW0sVztUBiNErKfFeAffZQv6G3pWAWh0upj9642qcHNgoYHLs
	ssYYPzWT24YXwOb7WYM6tSzcpjzbTqYc/5Lvz0dezsMQ8dNyJUhw65DhkBBnXY5mzk7A+UKKX3K
	FUfa/74lEjP+4qgOQdl7oPFNjmg10foCLOcR2yr0hhd80sxfQuYqazrpxgV+tJ74SSmOLdYclOi
	5XSvBeksTfb3Km3SC3
X-Received: by 2002:a05:6402:5406:b0:699:6d24:e298 with SMTP id 4fb4d7f45d1cf-69a8564e926mr2104511a12.8.1783409778033;
        Tue, 07 Jul 2026 00:36:18 -0700 (PDT)
Received: from fedora ([156.203.68.153])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4588sm5515780a12.7.2026.07.07.00.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:36:17 -0700 (PDT)
From: Ziad Ali <zalshemy9@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ziad Ali <zalshemy9@gmail.com>
Subject: [PATCH] staging: atomisp: fix typo in atomisp_tables.h
Date: Tue,  7 Jul 2026 10:36:04 +0300
Message-ID: <20260707073604.11463-1-zalshemy9@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ziad Ali <zalshemy9@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_tables.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_tables.h b/drivers/staging/media/atomisp/pci/atomisp_tables.h
index 33e6079aa..59730ce32 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_tables.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_tables.h
@@ -93,7 +93,7 @@ static struct ia_css_macc_table skin_high_macc_table = {
 	}
 };
 
-/*Blue enhencement image effect table*/
+/*Blue enhancement image effect table*/
 static struct ia_css_macc_table blue_macc_table = {
 	.data = {
 		9728, -3072, 0, 8192,
@@ -115,7 +115,7 @@ static struct ia_css_macc_table blue_macc_table = {
 	}
 };
 
-/*Green enhencement image effect table*/
+/*Green enhancement image effect table*/
 static struct ia_css_macc_table green_macc_table = {
 	.data = {
 		8192, 0, 0, 8192,
-- 
2.55.0

