Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EAC3B2AA
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 06:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776408826; cv=none; b=tEwjj1rApS7gwcX0iloiY7Wz/HN3Yv3R3CZebsHg0O82TYA3q0Zpqhtd1fVGE4Grmw9kPCcR15fVj3/Jub3qVZOhvJpDBiU4R9WgxExHS+FuhS+TYsHsk29mE5i/uRCW42io4JGsvKds1UMJTlc/YXcRenzda3b/OIntREXlKas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776408826; c=relaxed/simple;
	bh=uZBkgnwy12Z6S+MN3Nh7ARIhFyFzyr3YpSPDxdevAWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cr8M6kNiRI5ekOKtMayAgVb1RWpA+MpOI5gGRzT7SMEpEkBCiEVEgC6paOOFzPdPTYAvlj/80zcFI+M4XN7GfX3VzQ7PVn8/HwpUNvrtBiJ60qHvhvSFqx4QdKDsUTzibIYefAcUOn5Lo9yn9M22i8OKEIiXLE5gwjp8Liwdgko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuSOQ0Kl; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuSOQ0Kl"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35e576110adso251863a91.0
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 23:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776408825; x=1777013625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dz2TbEulj/LIiFp5mSvpOE3UlRqu5LHEOaLq1tYoI6c=;
        b=HuSOQ0KljIGWqvU2uwQS3GR8tKCbQtjGxLouP/eeHZ7XSXdmBuNaiWnkjqLKbxyt3r
         B593F0VZUHMhfld/UrSTBBMvgqHr1ZHbZtLlWyCWGPQitMtJEvDe2+zuw7w8w+dVddrx
         /cOJSvWzJTdR2SrgEE1GuJnM96l/8NmkwDYpqNutE4j9bBMIe6TD4Exh5a8eaEjs9yaA
         Nc8VBQpLHU5JGakiABXJvnHLsXMT/UlSa1V1kFHQai94E8iSW07CKY3r90liU2okjX3d
         wY/iriSU7+NAqnjJKAi3ku839HdBga1hKWOPlfWjj2PJQaKTTbhopPoRLHTtNGTzpcy0
         zB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776408825; x=1777013625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dz2TbEulj/LIiFp5mSvpOE3UlRqu5LHEOaLq1tYoI6c=;
        b=I/vvsVWUAPpqHDCivYssJQUPWKsb7coUjDaodcEsTyt2maZzCm2KmfaaPVcSj+6cTe
         XkeiC6g0hWwpeqNEOSuHPXmPjXChVDJoXUpifrua/NbTDhlVav47Id2apKwfzFN843xT
         zzwAG4yfi3P8FblajScXqrIEux+akHueAFPUYqEUjk46PzJkAjPjqKlPnOCBBsHufSl/
         jhFT/mxNOg2YtszMS4KgwBwddoCkT9D7AeQT63WO4VB6kqphQLHkZydDQNdkMwXk1Icz
         Ff0ECTCjhrajrz/jH6Y9ER32tUKi0BmCjy2TfdB9lvAF6U7ZIZKcJ1pBH3+TS1r9zL3U
         K+cA==
X-Forwarded-Encrypted: i=1; AFNElJ8itm16W2e80OfNsiVxUb2FiPjafWgR/o0Zzove/93e2JKL2nrYxv4Kta+/km/exg2xg4tOmzM68UQJbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCZ1Gu4eMBFHb5sg+BuBYdgXmzv+qUUp8MHgtcbwO5G0hOIdMq
	cAAp3exb6Ld7JZDSZDwYitYHM0usKZu5GoxHg9F4ks9//DNNw/uQPtIdOJ+kIDFnyP5g5w==
X-Gm-Gg: AeBDietJ1MwLEN02ISwh+mw3M566tmLNp8YB01OUEf+Qr0BItJ5d/xSZ5x+PURK/4EJ
	/teVgtKJ/OhMqurAJ46S3IXCdtM2ejhZyBxpYUyw/NecFPtZaeaSyle0ekb44BeV0LuUKCcTAW3
	pVos3hBtrw1ZztuCChgNYDTtxSloOydRWPoi5cikfZQNZxXLFTzHK+0Bnm+A5QCqMOW+cJ1Sho9
	PKkGNSggPaKC9lTyp870MF4c2L/TPr8VPoiTCWL5xk+9EZGOEhIXYym3IT3SRwen/NXit0CixLT
	F6F0SJr3JG9fCzKu6wQ33cfGSzC/rCS617C8dZyDb6+I4qDkOohC4ElIpThed70191ENb0KMhaJ
	2WhyIB9qcbeJwGgtmq15JQynXTbxmemwgFit9Mnk741SB3yfyTMYwcEjbLxG/ph4tmk18FXcmHQ
	TsJTuTHrk+JkCvRa0dBAFla7FG4guUl9vjG4wVvN8c0A==
X-Received: by 2002:a17:90b:3d02:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-361401ec4b4mr1280969a91.5.1776408824736;
        Thu, 16 Apr 2026 23:53:44 -0700 (PDT)
Received: from lgs.. ([2409:893d:1140:1e34:335a:efd9:dc2:f12e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410bafa9sm978644a91.15.2026.04.16.23.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 23:53:44 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] media: marvell-cam: fix missing pci_disable_device() on remove
Date: Fri, 17 Apr 2026 14:53:30 +0800
Message-ID: <20260417065330.4032892-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During manual code audit, we found that cafe_pci_probe() enables the
PCI device with pci_enable_device(), and its probe error path properly
calls pci_disable_device() on failure.

However, cafe_pci_remove() tears down the controller and frees the
driver data without disabling the PCI device, leaving the remove path
inconsistent with probe cleanup.

Add the missing pci_disable_device() call to cafe_pci_remove().

Fixes: abfa3df36c01 ("[media] marvell-cam: Separate out the Marvell camera core")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Fix subject prefix to use "media:" as reported by CI

 drivers/media/platform/marvell/cafe-driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/marvell/cafe-driver.c b/drivers/media/platform/marvell/cafe-driver.c
index 632c15572aa8..22034df6cba9 100644
--- a/drivers/media/platform/marvell/cafe-driver.c
+++ b/drivers/media/platform/marvell/cafe-driver.c
@@ -609,6 +609,7 @@ static void cafe_pci_remove(struct pci_dev *pdev)
 		return;
 	}
 	cafe_shutdown(cam);
+	pci_disable_device(pdev);
 	kfree(cam);
 }
 
-- 
2.43.0

