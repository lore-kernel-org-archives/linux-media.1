Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1943BBFDD
	for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 06:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785305217; cv=none; b=L7HlVfYDTKTtR3VUYy1Bjk81GDV3FcyZDrdcYhnXbt1REjIXwc3iSiv7DeGVUfaemP/CQ0RdfnWhDoa91IAziaYN639bx1mGCVbd6nfeK1XyJEFf1TEHZmQ66PzSoPEyo+4MI9KZXSv4e1GQljOYzESqpMHhDtVdpINsMU6+Sg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785305217; c=relaxed/simple;
	bh=QRxN5MDr5FIc8PSFipSzi/f3VAveC9b8plWzbqt7zQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MVzmKzMh0Kp7qe8wuoHYQwBDN1Ir3MIxSZWbf3p9AHVnE9z0G8Wd6E0JvgY6075bjLUfLLju9t/CtLT/fsIYAloJqh6RYC8+vpdBn2jQujIBC+X4myVelcqE8v4SadJH1TIcer334nT1g055QF2utpoflE6/E/ynX+P3Y+YlRr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSCy/n2G; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSCy/n2G"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-848d21bbaffso618556b3a.0
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 23:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785305215; x=1785910015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qs8cSOjWBzZH3Gfw1u3IO4v1AqoupOCUcrhQMOFV05g=;
        b=GSCy/n2GXKKxwHjtg38/TReMjbNPzH3822xCNKb0Yy5woI09ply4mkCP/KQ+1npiZi
         7K59mGn4TtOmwKTeI2Lsw4Xs+C9tug7xdBBj9qAuCt5ev9qIqJPit5fiZIbiz9tXJx8F
         Wln3kywDd90Q5TdBJPjYrLTBqveRFPmDWJErQbvAm4SNbBlc2GWOGd8USyjRI3oUcxuV
         L/osn7CfRyp+w8wWPymy2XrfOEidmHTg6ypx1PLzbAeHO6hWaaagT17wxYfTRMjtCt80
         B0SYxvdkzwY3n22g0OE3L9bsNSRgS/wHCnus219BSWSNa5Gg+GNOTGteGBCpTkiEaue5
         QaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785305215; x=1785910015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qs8cSOjWBzZH3Gfw1u3IO4v1AqoupOCUcrhQMOFV05g=;
        b=Ok6pw+A8NMsnVNaqHHjWlyyMevo1ePlGd4wTI6Qt3E2Eid1/dt/voyIxtlI5AaJuOt
         9bb8Pc+dBjD/palhYys0sXg8d3VqYZ0gfvgRTRlvahqnS0c0T0HhK/daHBX5RQeEtiOf
         4mtnbi3brqHMhvcdxn1AUQHS43RVvX68bxiu6eglHKDulcRI2IyDVHiVBechLhdVFrDf
         gRT9lncg7dpYt1IDcGCGFJGoUjkwAkJqAjcF7g+0DZwnL6jwtb1QGLPAyyBo6DGeqbIq
         5SCkEhjLcslEobnriy2/E5VQOnj0q34VBCrQx7R5GHQTMrF/5M9b5gH3/cVZ1e9GhOkn
         Wxhw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+vqZ9eZhzj6sOymy3ruDHb8cMWLQAyoWv6p9tK/2FXJCIrnc5QYiMoiUxvfEWpYg4kPS5oB/pCh/kMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Vp8gS4Fzbbsq7fxhmn9yVhcuEPMUOgFCp9qkficaXjVadPtf
	09SfMnr8Hjvg3Llhv7bamOeopodU+HyvVhv+tO22/cFsnuhshtwYiz2F
X-Gm-Gg: AR+sD12JVSyLnwTcryi5GQePcwKXlgTEvsEj8Ct43+6WQTKZVpIjQgHIuDHNTZtAId9
	VwBONNcMXOEKnhefXjFIn/aKC26ah1LPaRrYGTp0bC28WtOrG3Qt/bLTsaF/w+a0papPnlR1d/v
	kFXZY1yGX9k2BIxr98ATnxDm925FF5Xug30EUp59B2wLSWWEENLsY2lqWD0jhx/tr+zuNvZ5G8n
	b570uzB0xhsnQdY9cSWPtoybw1F35nvpyjObm5A2zws4Rh5oKbqeImpauHW5vonJ7Szb8t8YCnd
	nv+n84s7jEgbq7UR6fbjIA8WABKkjVhQrYO+Tw5CxTij4/ePQcRU7jEybtSJDle4ivywYzsVVsr
	+JhMAAwz/AWhG5JhMPVZbBzpj/nBHCcwADTPKa277ZL0zLQpFkphodsQSIXWdUq3W+eUpszwXEV
	gt48hK2aPqPmHd3Z0xeJWeQi9tv9isUgr37M2bTcK9l7YU9/jXILbNLSeRXctdeZmp1URgZV+TI
	3tPFoSH22SgBFrvdFHDPYplbg1mUFjQ5S3ZX5OzIUiUklwOi74=
X-Received: by 2002:a05:6a00:4614:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84e93264595mr5862999b3a.35.1785305215191;
        Tue, 28 Jul 2026 23:06:55 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([2405:9800:b670:b64b:1c6e:95da:41c0:e7b6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02f8473sm805504b3a.31.2026.07.28.23.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:06:54 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Frank.li@oss.nxp.com,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v5 0/2] media: hantro: fix runtime PM resource handling
Date: Wed, 29 Jul 2026 06:04:38 +0000
Message-ID: <20260729060440.2092-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Hantro device_run() path acquires a runtime PM reference before
invoking the codec-specific run callback. Failure paths can leave the
runtime PM reference and enabled clocks held.

Patch 1 moves clock enable and disable operations into the runtime PM
callbacks and releases the runtime PM reference when device_run()
fails. It retains the existing CONFIG_PM conditional so that the patch
remains independently buildable.

Patch 2 removes the explicit CONFIG_PM conditional, defines the PM
operations with DEFINE_RUNTIME_DEV_PM_OPS(), and uses pm_ptr() when
assigning the PM operations to the platform driver.

Changes in v5:
- Split the runtime PM changes into two patches.
- Move clock management into the runtime PM callbacks.
- Release the runtime PM reference on device_run() failure.
- Retain the CONFIG_PM conditional in patch 1.
- Remove the CONFIG_PM conditional in patch 2 using
  DEFINE_RUNTIME_DEV_PM_OPS() and pm_ptr().

v4:
https://lore.kernel.org/linux-media/20260728045921.4761-1-tharitt97@gmail.com

Tharit Tangkijwanichakul (2):
  media: hantro: release runtime resources when device_run fails
  media: hantro: use DEFINE_RUNTIME_DEV_PM_OPS

 .../media/platform/verisilicon/hantro_drv.c   | 75 ++++++++++---------
 1 file changed, 41 insertions(+), 34 deletions(-)
---
Tested on a Rockchip RK3588 (Rock 5B) board with Fluster:
  H.264 (JVT-AVC_V1):	     129/135, unchanged
  MPEG-2 (MPEG2_VIDEO-MAIN): 23/43, unchanged
  VP8 (VP8-TEST-VECTORS):    61/61, unchanged

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.47.3

