Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDD72E7622
	for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 01:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789175466; cv=none; b=LZ4LVoi9AqTKyc+wNPJhNMZd6CvP7MOYjf+K8TMukjT/64qMCx1LvE0S/iEb6Ly+SpaqdFe8/R5e8qJQ2IOe9fX5HrKu7AXPVkkviPE3JG/h7nzOSFiflGjQvRF3fu9Kdod0oN5nPh8sugaN9iRGiz+BlvtctiPZj2t8WT4OzyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789175466; c=relaxed/simple;
	bh=3swsNw31lSkMLciZcYqtrvV/YSRJx0HnmGQgeLeCvZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CRy12WQ5dU3Oj96stMjSAx8n3Uu8toZ+SsNYMCIBaBvwflPNHB8pIdZgIvrVh6qpKPe58pqPycEJ6DEjLOPk1J3cXqpRO41sEP3bskbomN8EOML9SCa5ubCEuRt696eGqPzb2WlSRUS+YJiS6/llTOhmSMJ8HQCRx2pmcCmqV7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7ijKjql; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7ijKjql"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-784a1696a21so1119901137.2
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 18:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789175462; x=1789780262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/LDGqOYLFoK6KgWIPFbEeA32vwB4mka4PD8SBisxBU=;
        b=H7ijKjqlWd68w596FQJU3EZP3/EHlH2BeI7tS9q3Gl9aeLMmO+A5veNdZBG8H95qPL
         k3ylzfazAtWHQzh/q/ifXsHovWZKRXr5mOwQO7JYfB29CkPt3YVOSUyR05JRi0dPJ2vs
         U0zgR7Jp24QRuLECMn0B3P2xvXZsdOA4cchELR05MqX8OkfgF9aoDfwBoTLG0MoDUEZN
         pYCCBQ2sqPz05Ir0bGXG9IPDZqc0YGotWHKqB9WXdpC5/PW061UiycFBHL+NIzrcrFjk
         ZALDre5HHMspYORxpRy0DLmaJoYW+TzPG08OJqKBtEW/5iZaMc5bu7RnhM8ou7hTrlM3
         lr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789175462; x=1789780262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/LDGqOYLFoK6KgWIPFbEeA32vwB4mka4PD8SBisxBU=;
        b=oUjLmg03h448hMfYHRmISUjDghLajMA+vSY9wmP3x+Kpuivh1JkqiaHNHWc4rd7jp1
         p10DZtTUK4EGHIKIySzNZkQFOPzQv7lXa+OciimhChSpbGmowGlbMBfoPiYono+KxCff
         Q21o7LMKjRO78KMgEFMzaZMa9LV8o/lnq1OHdiJbISXB2gDazFZxO6t8Ura0NBVYABcp
         D0UoCoBzXIQYKVoxJen8uL7h9OTmIlJGnoaCkaQo1Fm0w3WNmqVVP+O9tS4t2A03d6Zz
         HTJTwpVu2PMs0VahiMlyyjnfmdlFO9hsSOgEnPDHutqd2CtpMBXR6Du6xM2L4q38/S4x
         HvVw==
X-Forwarded-Encrypted: i=1; AKwUvBxzQRjfoh4U+ffFLyxlchSkZTGDmqEH88hlvheYBCzI/CDIFKQPvjVyL2HRPi1YiW1uiJsLycTiL1sN8g==@vger.kernel.org
X-Gm-Message-State: AFuF++nChSp5RSgmlquKY7LUAPAKWKO8yNrsZhu65ZhqW9L3AGUDonEk
	b2gLQ9/j/umgj6XzkZ7ywour+KBCdGgKDA1ut6ONSJmiPw4UjUC8yOlILD75qfuB
X-Gm-Gg: AYBFou0/Pb/xLA4WcxgpBBsghlEcQh5DZIaw3WnsOeTFItr4NlVoUpxrk4i85AS9/+K
	AAtgTIxus8nhe+e5mCn9Z4M16DvlHZArrOIT8fx95K9AubgCn8Cbj3y5WvAvmNEDJqWhh9teQaG
	tXTz/Pan5GaRAANpL8BzCeypKQamIIKMripHdzhveTZhPRyc7c4psjEkaG9u1mLcJ4EZzGeC23G
	mz+97Mz1JvhR+kF3rz0Yj6cppb3HxhhpbtJIhGnGSg5ZH5WLhkkNxYiYit8TYInbRuTIVeP5KIA
	m9r2coYQmKoXC8vzTNg9ZvqCiZBqyocN9OEmnkzgkkRSaZUQg+paAKjU374xqAu/AMi1B7G4+9v
	cV1DggSPhSU+ZmD2jOhRKTU9NmYr4/P3ZP5UDr4MsR3fsSlpxZx/035aVy5VamPTnK9FuNQsKHP
	yNTWQ+35adRHpCZsnSHPEbCGIGSFPKFrga2re4i220TtKTPt5yiNiweuHaMwYtrDJAKajN+bSc3
	jATZMF+x6wKiY/KJG713+2sDAUAoueNa2TLA3s=
X-Received: by 2002:a05:6102:32c6:b0:790:9e43:1236 with SMTP id ada2fe7eead31-792aad5521cmr8814389137.9.1789175462127;
        Fri, 11 Sep 2026 18:11:02 -0700 (PDT)
Received: from kernel-dev.servicos.capsula.corp ([177.105.242.194])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982ba1105f6sm4625862241.11.2026.09.11.18.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 18:11:01 -0700 (PDT)
From: Ricardo Barbosa Dias <ricardobarbosamscg@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ricardo Barbosa Dias <ricardobarbosamscg@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove duplicate blank line
Date: Sat, 12 Sep 2026 01:09:36 +0000
Message-ID: <20260912010936.12832-1-ricardobarbosamscg@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove an unnecessary extra blank line to clean up code style
and fix checkpatch CHECK warning.

Signed-off-by: Ricardo Barbosa Dias <ricardobarbosamscg@gmail.com>
---
 .../staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index 8e8433f5b07a..370cd8cac43b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -10,7 +10,6 @@
 
 #include "system_global.h"
 
-
 #include "ia_css_isys.h"
 #include "ia_css_debug.h"
 #include "virtual_isys.h"
-- 
2.43.0

