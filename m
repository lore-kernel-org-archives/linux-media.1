Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207348;
	b=KSbmSljlCPTzxHpTtYog4VRJnv+NvxNUqqrkQQnEKWjC3J38edow4AgXXaG4i60B6gfR
	 JQgUmTE+eVHkwBLuFbcym/Wzg8HUeyT4seTsaCs7k6ur0gtgHh4dY/KQ1molAvA4DLruW
	 AnG6Mfye2aTbbg+LN6Y21hc05HEwsHz4fVenNGRyfpvCbbTSj0XuZHuGFI4ZfDrfUuSwv
	 ++Gq0xMIzHniVqLZoFR7h3PYgpOxYn2/rCpyAU9aiLCJS+xyX3MrI6D4EKN2leKcRI/sb
	 i0OFjftaEI+3PHm73z29PaAg0QNjFr5i5B/mVmAbqiRvAygmdCM++hfxWpF/N46EnsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O0UDAqKLczseG5vwWb+qcEkII4ga7mybPYBMC/i9NRo=;
	b=QRQDaS+H1f1ZgoRbJTwOrtcosN7Uxs6x5wBuWtnNN6ubZsazEWU26/b78RpqDPyq7oh3
	 EhIJ4GTCeW8sbWBn1uU+OcsJIHzbOu+avA2tkQn8Bk/ZuuD+JYH93uM7tHIsFYJZRdSF/
	 HItR84ITCV8pFMhnKfYmJ8wCSLb5SD9QQbERZJrZPUNmqX+zpb58VTXrr2L9XG3inTEQa
	 mbUTef++U7kO/J9c7ZnIVBWLjT5m30oltkMho/SD7uVwcWiEI20nC5tT9OmeI1oq+lAI+
	 8VOtxKeREI2t7Ng2XveCAthBO4WLTRsrJBzhZDtaylX+7a8hvi3LzmK4OEcxx5kOfqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9kDxjlf;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9656A606A326
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 17:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9656A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9kDxjlf
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso669429f8f.1
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 10:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793207346; x=1793812146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O0UDAqKLczseG5vwWb+qcEkII4ga7mybPYBMC/i9NRo=;
        b=R9kDxjlfeabjIAx9+fZ+Ftk4ce9PFZEliXk2DS7GHjIEYyta3iN1PbHpEdpzeCTqrs
         RHo5TOba4alpQcNlbsyIng/dYlKgt0O8qk1eGitHEjgpYsVgJCBhyEijtDLucI7jS3gY
         Pk72CP7dxVPxcs+7IZ7yqxB+S9bn8b6u97hLKMClRB85F3wceZXNJswZ3vEkgM3DThl2
         g5fl8DNp4bqopHUhumldknslkfSWAMthLRZlQ+JeKXB3CBgcatUwm3dqbSNXCqQv7MrO
         XZVTAJvKHSW9hW+dr5TXxTBF4Owd8wNvBebOfD+o9v1IMHJRX0pTGu++U4MfWi3tmqGX
         Yi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207346; x=1793812146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O0UDAqKLczseG5vwWb+qcEkII4ga7mybPYBMC/i9NRo=;
        b=puGYG3RHlj4ZfvulbOqtm1pctzc/OwReLFiG5yVAvHIbPaMBrP45fvXLuPznpsXmX+
         a0i06fcybWDyci35WjTJVbe4kDT0Zv8E5fFwlomher0Umt2bWHT7ln9fX7UoIweUIz3T
         KClOMaRc0BKAZpKxUhCfZc5daYNhoX5rWrPh5KpbSJ4ccocJ4IS7613H7a+keiFY+rgj
         1qnOVwNg8CynmILBs4367MNPTBCOR330bRImpwObVExQ6I/ZUVc4W7ZXUV+WmmtdtNTb
         QXfEc89B5lR8Yo8GjyKGZY+OxgVc54Hqniyfbf0Ly55b4E8aw6o9ZRTVRrRiHdecEMS0
         c84w==
X-Forwarded-Encrypted: i=1; AKwUvBwNbCNO5P6FOsw0ARj+iMslcWdPYJ3fgULnH+PqU2YNbsf37OFO7GIoZGAQ+NaVJX3HV3HaAMGX6kEOBA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/4nWqUNoagBBYFHygcav1EavJJvr/0RHbKgkYXEcRIWc1yI9G
	f2mGSEIy40QLXsZuMaJ/SHnv1DHmJeHyY4G2tk3oQrFKfZlvMoIEU/I=
X-Gm-Gg: AYBFou1oOT16PGVFkH9H2MkT0j4acAR0Ci1W2wdQ4GCbW4TW/2ZAI20Gjgk6aL6cjsv
	NErLtIuILA9JZ9aB4uVHWDsmcpvg33JSwOotHRtO9NzZMTZW/7VZsc2wZjHqxt9/5R4ufZXhS36
	KyVIcd2ZIyzCOrx6SxJvAp9BsrA9Csd7E5RaSHDgpBx1PCnLAorZylN6tROOXPaRvghXsTMq68Q
	GzsV2Urz6C7lA3n2VzYVx1gqSjx+h6c+FP7d8XCWI/jeGKu9hcFAtYsizgU8z37GUIwqzJYg3vp
	CkCY61iWXqCFe2PJXc7KdSvJlwEaa8PYbOS6p/OzlJUV4kJCazD6ScnYLb1xxO/fYNOl2nh0HwK
	k1QzKq/Em30oIiJ8AwjRMUU+GZP9JQTrFAlmaVmKO8S6f4V0ag238bm/4cGGxd+NknGY09h08cG
	x753txOK3W6bf59AtqmSaOoJjP5AsHwNjoYZUHBk9UCNDn/1IkEuh5NvJhkoCzX1jlvfyKAaIj5
	WqjF14FnIG70hYOwZruHjOx0buT7zLlzXoZVPHYVmhdumwkaqvVIzBAa9/7xdNFN2wq1yymhg==
X-Received: by 2002:a05:6000:288b:b0:48d:fbf4:895e with SMTP id ffacd0b85a97d-48e5d2e6cd2mr6765330f8f.11.1793207345780;
        Wed, 28 Oct 2026 10:09:05 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4ba7sm29732715f8f.33.2026.10.28.10.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:09:05 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Steven Toth <stoth@kernellabs.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	tristan@talencesecurity.com
Subject: [PATCH] media: saa7164: cancel workcmd after disabling IRQ in saa7164_finidev
Date: Wed, 28 Oct 2026 17:09:04 +0000
Message-ID: <20261028170904.1183502-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

saa7164_finidev() does not cancel the workcmd work item that the IRQ
handler schedules via schedule_work() for command responses.  If the
work is still pending when the device structure is freed, the work
callback runs on stale memory.

Add cancel_work_sync() for workcmd after free_irq() so the interrupt
source is fully stopped before draining the remaining work.

Fixes: 443c1228d505 ("V4L/DVB (12923): SAA7164: Add support for the NXP SAA7164 silicon")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/media/pci/saa7164/saa7164-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index ac5eb6b923e21..8c6dd8dfd9a1e 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -1518,6 +1518,8 @@ static void saa7164_finidev(struct pci_dev *pci_dev)
 	/* unregister stuff */
 	free_irq(pci_dev->irq, dev);
 
+	cancel_work_sync(&dev->workcmd);
+
 	if (dev->msi) {
 		pci_disable_msi(pci_dev);
 		dev->msi = false;
-- 
2.47.3

