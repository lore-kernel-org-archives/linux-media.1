Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174462ECE91
	for <linux-media@vger.kernel.org>; Sat, 18 Jul 2026 06:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784355145; cv=none; b=WY7S+uA0ZKXaGVnM7DoZkMscI/zLxMioCw42mGyWDz7XNBN8CHU0B/rAU6sdLK922QKWocphZ9lo0dwMcG/+0XPJAIjwOG/InA0ZNIDCZAHbOX61ZnK4MabZgbcS4JyHZtV0wdTvIqohd8v0I8ZArrIfRxPKyO0adOWDbvsc6Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784355145; c=relaxed/simple;
	bh=LSDi4vg4dkRBpeBiyuKHc8nkkYy3z0Zlsyl0NPyVwEE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=kNmiBO9nqhBTws3YqQW6y72OCp7pbavqCd2IRz7WYxUr46eiP0zPdU74ZUO0d+pahfmoRfQEH9DBpAd6oQSrIDHp2tC8kgrIeYagyMf9T/opfn7tSnXuwVKQHJE82vqc2glGLOlLiCCXUG+CUS8F1c0yo9TW2iBEpz6ZqGH1Ukk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOreV1qg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOreV1qg"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc97653887so95875885ad.1
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 23:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784355143; x=1784959943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HvzRwdyZtvw7BXz2mvnVzoWsQjj8u9HVqDmukJny8A8=;
        b=LOreV1qgj+WUAoRc6dqA+yVUYMI3PD4Q03f9HiuKM6zziZ+is19AJIA9nazxoQjDtX
         Fy2Ln2GqRLmRcAvQGZiM2mzAhWQ6oX12WPhNGYk/qnBt1faDDW3pL4dA+i6EgCZT1nrU
         jqBYIyRelXfnU5KuDuMVSLDg8hmE44WfzMRQp46NTxeglalxg9a4fJNyfTpl5G0aWV1Z
         PaWZWLFObpbZ9l5XkvxcM4eBTnK251f4oCsySEtJ0Z5L9grl/4Tti+/eXmSqhV6eXn84
         nDaeDwrhlTFoy2nHieifPI+DjxG4PtEmRu+LcF83pB1nEYoe06jlr1AcUgVzmCLdOY8Z
         d0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784355143; x=1784959943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HvzRwdyZtvw7BXz2mvnVzoWsQjj8u9HVqDmukJny8A8=;
        b=BR1AazFLNYno2tgFdvnrXmlEe7O3zxy/DEKeQx3YMjTtVo+ErGXObiasHZF3DkTz0A
         LfFCMdIin/XVElaHcGChUH4Epd9xp0ZjIUwjM1wRKT0+RQYEKPYD2WWafz4/BbdZE1AD
         mvHAKwko7cgOJ1BnUPHVcRhOLQaro9/Uwh4ZVGvj+H1QszwJAZE9wRtaCqk3tWn0hSxG
         lCDlgO5jsWmUVwR5fDy0V6P8rAQoHJF5TGfydCDlWvrn6W7CNAYFzG/Mhna6VRWX1FBg
         v7/mRu4FkDOPUodOWU4Tfuitn5TelHwshoiEPouXQP4UXcYoduJiKY9TXeB25tgmITpv
         xoSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpogstHwPVzWGI47PtWeEsM1ldM7Wu/KnAIGpnNn+KwbeuB4kuhEKURbtJVDOKwfjbRVrpOtzpZNVwcZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmp9c9HdlqX0jit4zvVLiKgptuaGaCoZkPSLcRrZ8mgHYzmMNm
	m6DlAPJiqZeBtVwyshzdwNe9hfi6FAlaKfRsZCSCNH4R6R6MFSRRrTgB
X-Gm-Gg: AfdE7cnjyNagzlqbq21kDmuie/hs27XA3B8fUHX1MpSLgSYoGkZgX8Zd/76pqqR9weq
	m5HJIUnkh73WNDBGAiFL+bkaoyl4Ns4jm5YjDDuTqaI6GlnhYDBRBe52/Uon1vC5OWNKOiPEYxi
	M6OWZHqGEAbYkBDeIGl7Reh2drAM8+sNYk+S0Lja/Yt/zBq0f1TTddLmulU+Wcug/zbNyRR5Dhd
	Iqaft/GZLUHEm+G1Vo4OCs+3wseBXA8c3rZtiKi1Zmu6/nyIKkrn5rcteOcbPTxQepQJe7E1WpT
	mj2kjy8jb7S+G8pHpxdEM/wivIPsqtNFvwqKtBfgfvWuNlO42yrDCadElFbQtup5hj3pc0U3vyF
	rgxovzpqZ9TqSbJwtl+FjJZhUWu03ZJZZVX3Z76hmqrTiWDb0qLsbXijsMvsy
X-Received: by 2002:a17:903:11c3:b0:2cc:6817:d9b1 with SMTP id d9443c01a7336-2cf34a00b94mr65975315ad.41.1784355143430;
        Fri, 17 Jul 2026 23:12:23 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3471513bsm22271745ad.57.2026.07.17.23.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 23:12:22 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Wang Jun <1742789905@qq.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Steven Toth <stoth@kernellabs.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: saa7164: fix cleanup on resource allocation failure
Date: Sat, 18 Jul 2026 14:10:11 +0800
Message-ID: <20260718061012.2964002-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

saa7164_dev_setup() adds the device to the global saa7164_devlist before
requesting the PCI BAR memory regions.

If get_resources() fails, saa7164_dev_setup() decrements the device count
and returns an error, but leaves the device on saa7164_devlist. The probe
error path then frees the device, leaving a dangling entry on the global
list.

Reuse the existing MMIO mapping error path to remove the device from
saa7164_devlist and decrement the device count before returning.

Also release BAR0 if it was successfully requested but the BAR2 request
fails.

Fixes: 443c1228d505 ("V4L/DVB (12923): SAA7164: Add support for the NXP SAA7164 silicon")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Reuse the existing error handling path instead of duplicating the device
    list cleanup, as suggested by Hans Verkuil.
  - Add a new error label after release_resources() for failures where no PCI
    resources need to be released.

 drivers/media/pci/saa7164/saa7164-core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index 6bcde506adf5..db65506ea885 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -878,6 +878,9 @@ static int get_resources(struct saa7164_dev *dev)
 		if (request_mem_region(pci_resource_start(dev->pci, 2),
 			pci_resource_len(dev->pci, 2), dev->name))
 			return 0;
+
+		release_mem_region(pci_resource_start(dev->pci, 0),
+				   pci_resource_len(dev->pci, 0));
 	}
 
 	printk(KERN_ERR "%s: can't get MMIO memory @ 0x%llx or 0x%llx\n",
@@ -1000,8 +1003,7 @@ static int saa7164_dev_setup(struct saa7164_dev *dev)
 		       dev->name, dev->pci->subsystem_vendor,
 		       dev->pci->subsystem_device);
 
-		saa7164_devcount--;
-		return -ENODEV;
+		goto err_devlist;
 	}
 
 	/* PCI/e allocations */
@@ -1039,7 +1041,7 @@ static int saa7164_dev_setup(struct saa7164_dev *dev)
 	iounmap(dev->lmmio);
 err_ioremap_bar0:
 	release_resources(dev);
-
+err_devlist:
 	scoped_guard(mutex, &devlist) {
 		list_del(&dev->devlist);
 	}
-- 
2.43.0

