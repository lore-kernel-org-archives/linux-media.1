Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC08B30DECE
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 11:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150692; cv=none; b=tmLwoXS5tHicnsKws1+CYPRR16mJI7eqGg0qbGKcRIj022BztJX+M7NYrzUpCw/d49BfZOLYp32ce8+/qe1gfZNdzwLoQQtnbPEEuK8+sEDN4tD4Dbwt/n1uenjvzBcWKLh1wKiaoHOarC2YoHJwhE9fae9HWhKUxd0rJ2Gwydw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150692; c=relaxed/simple;
	bh=sKGg1tN9Cccwb6abvyttzA3Koepl4cYM98WljAGJmw4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XWwyFw06CDro7aYM135dnJXAwe7PDDE6DKdLgvQvEZQXcjM/RNd7vPSd12FiYcOKjDsOoJ/ckEe40wubVt59T5qSbfxxiEbA04bUa3achORTSWR64p/uiV9NiNTL5SUMjFXkWiVG/z1BlSIWBXkuw7/SNIt8Ve/rMu54SfdrEtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rcWNPnWC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rcWNPnWC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso27215295e9.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 04:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792150688; x=1792755488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I2to3/HS5QrqXW5ag9oyRzHLN+O7mWCd99D09pX0/80=;
        b=rcWNPnWCxROA4aSp7GC1jnmzbbyStmjgFTHnvi6lt8Eklgd0wXpwgc+IiJ1FONJvTE
         Yet9jEvuDQKbiakoU82bdt8sZQA6UlSGrfPJvgMHw/QEF+5+xJidmflRe5iQ01a3sS/o
         5W+BLkP7kitPh13qNikqsR0sNmlD7Q5MY/iAN/WiwrF90w2jxZiUlfHtmk5YF50ZVSvg
         J5rbv1RRE2GaPeuY89z6ijT5E/1j9QGiyP9kx5eAJDCNv7HdP7e8wmEdMiJdfkY8SHcP
         WFvabwVD1Ko/Ge9Z41DT6IWgJ2yKSalfU/NVmsjWZNwoEGJqjYU2Mf3EiMdq3rOK/GtS
         TpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150688; x=1792755488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2to3/HS5QrqXW5ag9oyRzHLN+O7mWCd99D09pX0/80=;
        b=w9PBAmQMWS0UWWxjxvOoZPkTD2VIJQT5glPNfqhH8htN9jXCzYFBW/9h1tpF7ODkfR
         s4YBknaNoaj3H8ctDhEF/aDgb18QV0qNylCF4QthJ2luN5fv4hatV0bKb65DQxxWRily
         UX9PsFO3J9g2AqVgYRtWvPq4StJqRiJZbANBFrsPajuol5VeRJDtK9Pn9xF4+eTsNpH1
         LD/G1z0km4UaV2PkTqvNWeCpDZjJhiDyYsuwlj/7mkyA22hqm2PqxTf2gy+g+dzbOImj
         tWRD16LMlRUeHtmz3fQeRPG6pFKrhfhA0YqpUI940SEgyruaygSpohlU+O4PgVsFM1NI
         AcCw==
X-Gm-Message-State: AFq9FYJkO5KTd+0/B51cM7wvCw6mlwzp9rPRGNxmKoI8Umrh9xdxHuO+
	bmi1JsiRbQxvAcxniOA54/3nAyZzgQtuKrh060XpX+yioaeZZjMqF0v1
X-Gm-Gg: AYBFou2FZn1+g7yyUrUZTim9OBpCvGNM2fK0Fkg6hPewsZ2+ElXzqiT6E2JTLX8eUnP
	LIGUvJcQd8tzaP2evXtNLMCO5/O7ne5EzniHlDhdcQON73lJMlrXyhor2n7Pk3dFFzulcpF8M07
	+oAF9zwd1cYr5vgg0vH2DtnrwkXEiDTkMpXwhcQafQtSkDRxcqw0hF1DufwjeLZb00IhLKxi/Ui
	1VzuH9P7Wof3Rmgy7Lab8QbDSUUFDVaO2+rpeMtVWtjbKDMQeRwqmzHUXuBBR9CcnaGT85TtVlm
	LI6qY6xchzST7/I6hmnSQ1MeJQZHZ2IGCm8SF1dtXC7M78I4mvuqCRZA5Hj9eO9QMSE6DWl2LNR
	FLqR+K+9PnOHFPlkBv9SqQ1xJUJVl0I76VqRqqit98oGHFBgSWp1ylayzERwWFnf5dhZrDOgp1m
	SLnj0EQdzB6G+ig3j3lMjZcduEy9nwZ812PuD5F/1YBPBUim2UOMIkNDg3ZhQM/9dgko4s74DeM
	QUWQIE5ouKMubDZfE5M3JYcdzX9+fgYgxIE+nmkLbgaPCZpjakvoOIyWA==
X-Received: by 2002:a05:600c:3b2a:b0:4a1:d248:25b5 with SMTP id 5b1f17b1804b1-4a1d2482659mr19130645e9.24.1792150687905;
        Fri, 16 Oct 2026 04:38:07 -0700 (PDT)
Received: from thinkpad ([2.176.196.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8b5fsm156650875e9.9.2026.10.16.04.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:38:06 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v1 0/3] media: sun6i-csi: Improve capture and bridge
Date: Fri, 16 Oct 2026 15:08:43 +0330
Message-Id: <20261016113846.8602-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series improves sun6i-csi capture and bridge.

Patch 1 fixes sun6i_csi_capture_format_prepare() to align both width
and height to 16 for NV12_16L16, as its 16x16 tiles require.

Patch 2 adds vidioc_enum_framesizes() to sun6i-csi-capture, using the
same alignment.

Patch 3 removes duplicated mbus codes from sun6i-csi-bridge. It was
posted earlier and carries Paul's Reviewed-by.
Link: https://patchwork.linuxtv.org/project/linux-media/patch/20260527124552.33815-1-arash.golgol@gmail.com/

Tested on LicheePi Zero Dock (Allwinner V3s) with:
  ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-csi-capture

As ov5647 only outputs Bayer, streaming HM12/NV12 is not possible on
this setup, so I did not test real streaming. I checked that
v4l2-ctl --try-fmt-video, --set-fmt-video, --get-fmt-video and
--list-framesizes report the expected sizes for HM12 (16 aligned) and
NV12 (2 aligned).

Arash Golgol (3):
  media: sun6i-csi: capture: Align size to 16 for NV12_16L16
  media: sun6i-csi: capture: Add enum_framesizes support
  media: sun6i-csi: bridge: Remove duplicate mbus format entries

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 12 -----
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 45 ++++++++++++++++---
 2 files changed, 39 insertions(+), 18 deletions(-)

-- 
2.34.1

