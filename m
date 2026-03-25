Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C463D6662
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 13:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774445086; cv=none; b=hhs9T+RcTBmd6/3VeTfxaJODtjLFt2Lr/MIxusdbDBpsBLAvnoVAvWFu19j0OHJkJAjlO7mkM6D1xIhi2SMl8VaHD7Ty7gX/bMtNdJwrOSNt7i2kWhrU3ndBeXluDZJjAiINaPZeY8UvIA0ufZveDPLwg+lKh5TKZ9B32KMfz+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774445086; c=relaxed/simple;
	bh=YU6O3kng7/BNGDBoIbt7jkzWS/bQ7BgWCpHm2cOJ6P4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BorUoAwAYgnbL4X3IriLqpiZM0tA9GWlDJYTaqOMJEcAMuUyW8JxUEk1yrZgLUjkmRt/CldHP/4qxZ3PQLtbXfmWQJMDMhexpgHBAGxzB1f5rBKiaULTeZ8Q5/e/g6ZnEt6jizm5Y211aqTUPbcP9Pyzjj04BYbOVJ1jPTk/eSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rxb1zrVS; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rxb1zrVS"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35a1cc6e478so1336285a91.0
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 06:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774445085; x=1775049885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogGgcTCPsfVgHz2kUeNqvCykR2TWzJ60B9N6IFrUyk0=;
        b=rxb1zrVSHe2acRL1Qk7NRBX+A55pMoFQL5SpKPAegL0VyqSe2UCIgYauJW2thXgdWU
         c63yB/GAzQD1gn0w28zzJCvCZ7VaUBQsrsdLxNbQob5381V1EoCYVS9QMqwvqjSWUwRD
         wwkaXiY0C6ZmqTUGAaJ58yZsZ+zC0ayiHW1/1n4B4d++F+uP4wpgQ6FpwjcInEOKbLjg
         2NqTyvWp0ts5nnVBwl04b6n9mD5M3w2HaATcfLsLfbPIKU8GPIQQbrUVRTfhuh6NKVsh
         Gav5TjeVrGc9l6Eb19kKSEt+Nj50Q0Yn4udV+TWo1/CFcNblPKBxPKrr9o7JGoyp5LVL
         Z9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774445085; x=1775049885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ogGgcTCPsfVgHz2kUeNqvCykR2TWzJ60B9N6IFrUyk0=;
        b=fyDzIwSrrKIRlPojEn5XArdD/ZD63Z1ngkEoqIraE7AIuWUNOII9OOETe+vWaePg/Y
         KfXLtyHan3nRq82gHKetzaLT/RdRUsDBemUfDMmNwgEyVrNraWHjdIybwv7n35qhLhHC
         43BmTtnXI6+NKI8QDVwqSE506oLuMBa7f9DOTMXlFojxu6yltQ8BJx9aX/8Ktanalxze
         iHTgDtIomssMHATeT/BRW7TTzfAAwK/DO07VzFpxe7PQdj4W2UfnSTKJKKZJSCYlakx5
         8famwhJf/2dHKyqQuyLGH89BjZlzmtdTHdDrbatPw3xfxp46w/0ggIRabaV6/ZP6E9OA
         AtzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjibd7i/I/6UieLL+aOFDnZQzRxqVmXh/J4X+/Y/gl2iDT3FwC6lfzBcNyPGg1itqV/RQ1wJ2YRVz59w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2njcjG20WO11MPwg51cwTXg0wV8YxGxCwtNHKbIo/o/+HrJmB
	lzy2WQZaEdu/CGZJtOHLVMKjnUNXndbjS6p+YSzFe8m4V9ghmEZ1MCX6
X-Gm-Gg: ATEYQzwkt/dTsrFVyWA8SvAIc7Z20pxD7ixlvbN7AwwqX2PtmQtAn/Mte/NL1d+scY3
	kfnCtRPtz4HuJKckzzUCYNuSFXI41Xr8/ITSnbNuN/jIwDk1hfX6hoj+QdNtTu4beF0iicIQ7tD
	5OMfS192bYP7dFzteSRIkNMXnhPET7b1gaSYPMtP85TC1IycKoWRQECyzWtwCoLBXPfolYG4vwJ
	YXNK+uQE1V9MQwTTtgvkBR20RPFs1ae9wbZ+KDCpHqlJPHNQu8zSaZjM23u1DKIAaP+EIToYaCw
	rUnkFqOUD4Rz2qEoRNSN4P4I5nDtrDZOTGeezIqkCKyBmEHXBHO7J/Hwt0UhiKwRqVd1ELAMJqq
	pE2yT+DVdrkfovVSigX826a3Q75xq2R1YL9rcBBbI28dzYfvdZOn99gq2t3YavpnEM9as4BY3WH
	S+PM+4XD/ZN3cLagQ5xAHZ07I=
X-Received: by 2002:a17:903:3807:b0:2ae:3d7d:d905 with SMTP id d9443c01a7336-2b0b09f73ddmr43803375ad.23.1774445085188;
        Wed, 25 Mar 2026 06:24:45 -0700 (PDT)
Received: from localhost ([223.233.85.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0ae360d4bsm40943945ad.16.2026.03.25.06.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 06:24:44 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: andriy.shevchenko@intel.com
Cc: andy@kernel.org,
	anushkabadhe@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: [PATCH v4] staging: media: atomisp: pci: fix split GP_TIMER_BASE declaration
Date: Wed, 25 Mar 2026 18:54:34 +0530
Message-ID: <20260325132434.55775-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <acPQOplQWD_-saf9@ashevche-desk.local>
References: <acPQOplQWD_-saf9@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge declaration of const GP_TIMER_BASE split across 2 lines to improve
readability.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---
Thank you so much for your review and guidance.

Changes in v4:
- Remove unrelated block comment style fixes

Changes in v3:
- Add commit description
- Fix subject prefix to staging: media: atomisp:

Changes in v2:
- Fix block comment style (move closing */ to its own line)
- Merge split GP_TIMER_BASE declaration onto a single line

Note:
* This patch is part of the GSoC2026 application process for device tree 
binding
s conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 drivers/staging/media/atomisp/pci/system_local.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/system_local.c b/drivers/staging/media/atomisp/pci/system_local.c
index a8a93760d5b1..69bcd557a821 100644
--- a/drivers/staging/media/atomisp/pci/system_local.c
+++ b/drivers/staging/media/atomisp/pci/system_local.c
@@ -86,8 +86,7 @@ const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
 /*GP TIMER , all timer registers are inter-twined,
  * so, having multiple base addresses for
  * different timers does not help*/
-const hrt_address GP_TIMER_BASE =
-    (hrt_address)0x0000000000000600ULL;
+const hrt_address GP_TIMER_BASE = (hrt_address)0x0000000000000600ULL;
 
 /* GPIO */
 const hrt_address GPIO_BASE[N_GPIO_ID] = {
-- 
2.43.0

