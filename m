Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA2C3EEAE7
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 16:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821607; cv=none; b=iZfuTP1oltNEVdPkKxcdpHZIYM5rXRr5lk7h/aD2OxIHCqzkgwGKtszDHiuYt/JB/91CLD2NpdVrAgMAkXDQFlqN99/aJ3Wud+AnziWICrK8MWhwX5Ai8yDjRDQ/7gsvi894mbNSbtXOvGeScW5BaDNjXYxygbq88ZOfId+wVWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821607; c=relaxed/simple;
	bh=hBFpiBsh1OJ7/0dcpT+PVUfIoV8PmYIo/FqAcvIJ30o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=CrilQOob6nCK2fcnSFKbGQTkv0Oyfb1xtIVRoac8PtOF201dZClvbj76u0QJRKcKOnXyvQ623cGrg2YW45DxRPzvEKFgt74x4oIgGzAMlJwTexO/T3CN4B1COXM/Rka5Nisg6xotQFPcU9U3Zk9EP9MpbenA6jYcGDp0tNC9pp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--johnsingleton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OmcxGm9x; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--johnsingleton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OmcxGm9x"
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-804e73b36eeso4580394a34.2
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 09:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791821605; x=1792426405; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LBXNI3mtAkG5Ua6Q4/3lD9SCGWUQMAEPkEoP8hTTCsE=;
        b=OmcxGm9xh/VTBp2h+tv0CPtHL5YBRX+XlhEGHXM1rwXVeeoOXtquy+nKHz99s+2FFl
         SHzfaMEBSyxxomorm/dt8PiIk3Yc9QNfZyNC9/uoJp+FUvDQQZvbYoFEmKjY9K8QKDrv
         6dLzL59hXEqYQe5myIwu0wQZMIWunZAhF2Jw237Nuy+toQI1/4Zo0dhUHUjyGCtzvwWN
         kYRvio07Ww+esToKv73YQVqQchevGofmKOSyxSX7dp2F5b0M/k+M3l2yxiZOxnP3hEw6
         WeedW4in4No9kYlYKkNAxUKtAWz3qeA7bpF5ANud4mQlP2c/57Zi1CXKtgySNPVLrZ6u
         3h/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791821605; x=1792426405;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBXNI3mtAkG5Ua6Q4/3lD9SCGWUQMAEPkEoP8hTTCsE=;
        b=p9t9fqrA3q4WPd/AxPginjn940RdUYaG7ALEZtqSwNVbKUzOGhLd75FTBUhtIkU62a
         DiFWl5fUnwnOPpvr3oiLGHzYM1DXN7vOySnOaRS/1oLJGbtwEi4uUKHEtGfuf98TBZZm
         mtSGwZzQDQFp5BBKRCdVBiAzAnUhSWO8n3EYOG51/3HM+Q7KD4gKYQzMfQrBBNYoRK8B
         W/oWQFRnmavj11ce/FWGFT7FyK63HMliVO9PolUrTL1aTm/QmeD8o7TB9jT98qlIRhTl
         Bi4PrT23yeI7emavu61nvYJNxUHzmM80NRGyao+y8eHS+ehngSCmoKVdNnkP6FmOp1Be
         gaZg==
X-Gm-Message-State: AFq9FYLMktwUqNBX0vJgLuh+U99cLs2MyweHIivAKZOOw7ROyGQvJBKK
	PXbja/0WB/nSVExYt3UVy1t0Gob7ZJlZcwN4V/IUYo8dqIGgQIhTQoKqoRC7RvztxdeYrIib3V2
	z1QQALv1SUJe009gz/mJpPhMrd8MA4/sc0Q==
X-Received: from iljf6.prod.google.com ([2002:a05:6e02:c66:b0:50f:bbf:6e5a])
 (user=johnsingleton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1983:b0:4f9:595:b80c with SMTP id 5614622812f47-50c56bf8a1bmr10785057b6e.41.1791821604817;
 Mon, 12 Oct 2026 09:13:24 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:13:20 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012161322.930099-1-johnsingleton@google.com>
Subject: [PATCH 1/3] staging: media: atomisp: Make pmic_name array const
From: John Singleton <johnsingleton@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, John Singleton <johnsingleton@google.com>
Content-Type: text/plain; charset="UTF-8"

Add const to pmic_name[] as advised by checkpatch to ensure the
pointer itself remains unmodified. The array is read and never
modified, so this change safe.

Signed-off-by: John Singleton <johnsingleton@google.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index a1d3a16921ea..d628fe4dca6d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -109,7 +109,7 @@ static enum {
 	PMIC_CRYSTALCOVE
 } pmic_id;
 
-static const char *pmic_name[] = {
+static const char * const pmic_name[] = {
 	[PMIC_UNSET]		= "ACPI device PM",
 	[PMIC_REGULATOR]	= "regulator driver",
 	[PMIC_AXP]		= "XPower AXP288 PMIC",
-- 
2.56.0.385.gd3acb90ef8-goog

