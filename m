Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604902;
	b=IdEjnRR+4iXrhfYIUhe3SSsd7VW3Ij/Z+Yl2XNW0lU+oiSq7XbjvHQgOaMb/Vo0dtO0H
	 vI/X6TN30yAdKdSqet2XHwwpIT0bDhs9BOkvG6TvWmI6TNsWN8obF2Sz4VtQSkyKTQiiZ
	 UPY/fsla275zd6mUdCM/uA4+ovjoaNuPXVkMgTpOOAYevx+HAnuT4EQ8KzT6wbIyjA7gv
	 wnJkFx4PuktW30sFilXGCofWNcBfNGhRhSA2pdnRYZTylhOklIirJqjtiofp9Kh2l2loj
	 CiqOhdeGjvUB1Ri8QmmoXamzOPt8aKgYrY0OimPIS8ajA4QOpOwH37MiOICNym6E9Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Vim7sbndF1zYQuJCjFH9ennVNq+IgaxKfDCkwcZwj84=;
	b=HjIRWHMMuCW90a+OLuxiW5nCNND8lbw7p8heOiiNjgVDlQBf4WyytDMlKN572UoFcUwr
	 QEWIZ8uEBKReDL0LOMN88C0PusdFLjnib1UIq8B+cQ5lsG/WlDKUv9WgU2zoHnT5kJAcu
	 C6YRP3i7fzPDh/q7kzKc2QSNNoYfiVc1Hk07M1OlKKHYHvO4FaE8BbcnJlp4VED6Ov9Qs
	 3aN+VGogJ+tHlTG2l/nV6PW3GGw7//OqBwcwelX+1PpTEkbb6yUhCY8jNCh5Ws478UKQ6
	 XtUa5Gfk2dubW4XEhSMxe9w104OnzDF+BKCorgZvFb7A2y1tPtd/7dM/H5Ru438RkLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFYeXBci;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7CC606A326
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D7CC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFYeXBci
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c51a02ad3acso66803466b.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604900; x=1796209700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vim7sbndF1zYQuJCjFH9ennVNq+IgaxKfDCkwcZwj84=;
        b=wFYeXBcidB6bUPa0ITenvDyBv8wZDaQpp3EpsIXZkTsArAmVChIcxDvhUnBiCCb+/t
         WeSNE2euEeWKnRuUgkFsRIVv0m8LgqAU3Sgf0JhoVqwC8MM0GyF4WPGToccLYGXCTMnR
         FlhpL2nxRtspw50yKDr8EaLMru20w3BcngHhuD6GM4ftL16diaksn72/nZFPDjnbbxqm
         fxL1lQpzHwe6f0Dk+Ub7dRZCD6aiVopqowh+UdXP5dfxzHeSaVurBDZo1Nxsd+cCyISq
         1DUzMBxwOy779Q4vp3qKWS/Qfr4+pKSvDxFORflGFZNUQD8SpqEuboUqHSCMS7Dlq4Dc
         r9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604900; x=1796209700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vim7sbndF1zYQuJCjFH9ennVNq+IgaxKfDCkwcZwj84=;
        b=eytZmUsp6cdoI7/9/xCqw1uSGlbVGpUzFE8zWeRfq4dapESltJvRiUH4ETMoJpTZpj
         JBPHMlATmoAdpWB1x6bY/F41ob8yjh+tAhgfurS1ugbZPo5crhKe1YKGMvfZE123LfnZ
         qlfuy28Agpp9R/Hww+DbV0bnrtSJKO2cvY75BnfEXj5R7unu9mI9gSke/jq+Phf0++zE
         fGna9WKhWnbeUcWOPxfXcfR3CX2XvKBa8T9XkILNfBnbyDl8/f42ACizcoyQNsEM5fxf
         p0HwYbHQpGWbznaNhhHmdDTUYFoeeWR+VX/pvCodLCgzsFf3YZItRHfJL5YyNdKTAXqE
         BMLQ==
X-Forwarded-Encrypted: i=1; AL+hErE3Rvi4ByS14NgPHqrTsVOUHiOQ3Ja8n9BPt7827ZigYxnV5V/d5HPBE89T/BJMVExqrT29trFkMk2R4w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8byvdTQhSjr4fnJEKCTGiBOmkkcsIiXqTw/B+692LWaneiKtME
	10dC2uakMsEFCTWdA8zWnD/j1Tmk2/3n2zkpGqiuvbqC9ZQKMAUUPrhv
X-Gm-Gg: AZFdTZfiyfwQ4U9O3Z0JB7P1k8AKTy4s3dDpXIuKmyHxP1UK5NnWmEc+taVKrNsPGs2
	vur2DWNg/6g1I6PndyD48wmbi+x/HibZ+C/qe7rCfmkjsfx3SOweRHxSIeJDkzlxCkNJpaLgcm5
	08zlL303oToiLkqbR+41x5fOGNyeRk1HdXpb63pPPRPWhmVwRfUCQeeY8isaqq9qcf388rLxtDH
	ri3yO9UDwDD2hHWdW2CuFAS95oxbCcghE7ztNDYpRr7BleLAUbMFPJxvTSxsFLACaZLP2iaVE9V
	QXiZX5+tUJ70FrqmSy0ocMiCVU7dOuFWUTjq8PYxEbzXQoI24OK4Q5euPAhSJscmpFlqVdb92xC
	g8sl3N9w9SvFAmyGCPIPNy7b2bb286A1Nz/dEZIigo0k7x89Vfw0lqIpqW+oy4Sw48BoZgQUu18
	a6NQrqrP/iuYDMWAh9wd9Waudg4+JRSXNhUGGHTd6LXi6PFxS++F9ViTqXauJ+06CbB0yK1fPX0
	7KzgdUPBUsUScUtNtbE+TmMwPc9KfiluA0hi/8JyZIykdMuXb8PVPY3rmyifB5TiYIrLxiRDS1b
	xt3rm1oefdHOXYEqyoajx69tREoRn8ho5cHH8O4sQOs9MDdI6L20r0rs+PCpArdRYNVj1tomGv7
	74/wEFL0FKg==
X-Received: by 2002:a17:907:1c9c:b0:c49:df95:fd0 with SMTP id a640c23a62f3a-c519ac70721mr350640166b.48.1795604899681;
        Wed, 25 Nov 2026 03:08:19 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:18 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 00/13] tegra-video: Convert to media-centric pipe
Date: Wed, 25 Nov 2026 13:07:37 +0200
Message-ID: <20261125110750.223628-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

A minimal set of changes required to convert video-centric pipe into
media-centric. I know that moving to /media should be last commit,
but it may be beneficial to keep this history in the /media subsystem,
instead of leaving it in staging.

All changes were tested on:

LG Optimus Vu (P895) Tegra30 device:
 - MT9M114 front sensor with complex topology and irregular pad mapping
 - IMX111 rear sensor which has simple pixel array and a single pad

ASUS Transformer TF701T Tegra114 device:
 - same MT9M114 front sensor
 - OV5693 rear sensor which has simple pixel array and a single pad

Nvidia Tegra Note 7 (P1988) Tegra114 device:
 - OV5693 rear sensor

They all work and produce images.

Svyatoslav Ryhel (13):
  staging: media: tegra-video: Move driver to media/platform/nvidia
  media: tegra-video: vi: Drop controls consolidation into VI device
  media: tegra-video: vi: Expose all sub-devices in the pipeline
  media: tegra-video: vi: Drop subdevice passthrough and input ioctls
  media: tegra-video: vi: Implement link_validate for video entity
  media: tegra-video: vi: Populate stepwise frame sizes via vi_fmt_align
  media: tegra-video: vi: Report stepwise frame sizes instead of
    querying subdev
  media: tegra-video: vi: Enumerate supported formats instead of
    building bitmap of compatible formats
  media: tegra-video: vi: Configure capture format locally without
    subdev calls
  media: tegra-video: Remove remote source subdev helper
  media: tegra-video: csi: Scope pad and state ops to TPG mode
  media: tegra-video: csi: Add pad and media operations for own CSI
    channels
  media: tegra-video: vip: Add pad and media operations for VIP subdev

 MAINTAINERS                                   |   2 +-
 drivers/media/platform/nvidia/Kconfig         |   2 +
 drivers/media/platform/nvidia/Makefile        |   1 +
 .../platform/nvidia}/tegra-video/Kconfig      |   0
 .../platform/nvidia}/tegra-video/Makefile     |   0
 .../platform/nvidia}/tegra-video/csi.c        | 298 ++++++--
 .../platform/nvidia}/tegra-video/csi.h        |   0
 .../platform/nvidia}/tegra-video/tegra20.c    |  18 +-
 .../platform/nvidia}/tegra-video/tegra210.c   |  18 +-
 .../platform/nvidia}/tegra-video/vi.c         | 643 ++----------------
 .../platform/nvidia}/tegra-video/vi.h         |  19 +-
 .../platform/nvidia}/tegra-video/video.c      |   0
 .../platform/nvidia}/tegra-video/video.h      |   0
 .../platform/nvidia}/tegra-video/vip.c        | 102 ++-
 .../platform/nvidia}/tegra-video/vip.h        |   0
 drivers/staging/media/Kconfig                 |   2 -
 drivers/staging/media/Makefile                |   1 -
 drivers/staging/media/tegra-video/TODO        |   5 -
 18 files changed, 433 insertions(+), 678 deletions(-)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Kconfig (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Makefile (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.c (75%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra20.c (99%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra210.c (98%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.c (68%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.h (95%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.c (71%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.h (100%)
 delete mode 100644 drivers/staging/media/tegra-video/TODO

-- 
2.53.0

