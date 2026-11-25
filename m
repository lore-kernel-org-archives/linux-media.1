Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605989;
	b=Cmu85hTI1cDvJ+9yKwyIGhSvHCFMVCdn7udWxlf+qY6Mf4t7/Zgrju/+zWsP5Wykgb5S
	 lBulAyeBZgoo0pX/tYMdHlPcD2bI/zmUMwAeD+I8ZBgROH95t5dLs03kAVg/FqPyVtUMc
	 ymIq1rnQB3uoy+xsWl48g60gVAQOaObzVIAPqVGY/ulOuyv9Ol2FEZBcheh4ne0vVi5Xh
	 qDpmjPPaQ5pptdueBTLRVRFuLVDYpGJT2E4nyFYVqAqMbfuUQF1kSXTQdRO7PQvCs9XNC
	 sxN90hhhr0KentWSytyOkmny3w3EXquBB4U5w7RktkAaZXYQERVbum+ttf1URTuw4zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=G+BRXkvsKkCtNetmP+qei8f/iduzEEyC3n2dsxTeZ90=;
	b=RMEUdoGY+l9dfhCm24EteLtZG8jL9XyW3KI3t4lE8xbw8uT7MPiP/LZzJuXdTV5oHmrx
	 jAh5+eP6ZTFLJaJbP5EjiOdL1tLHjNmXC9xFsCxQEiwDUMGu1zFoc7sC+o3iLdfbXXS/n
	 TR44uNvQk/fxEfv+CApyzmVGC26RW4m6KHForl35pqkN8KmMqKKoZgrky0dOHMknn3YtF
	 IKgereN5eeuGgUqFEy8gWXfpgKQToDH3uW0DW9Ax7hVjrLa2KKg34zZ7fa0PaU7eANvAy
	 IXvhtOEjaRI7aUYQWPiWJiTlCbNnRMiOCToAFy45FWq7F1MtN0Uu857ELYa05CrTXXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsnXNr0E;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C22A606A332
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C22A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PsnXNr0E
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso6604669a12.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605988; x=1796210788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+BRXkvsKkCtNetmP+qei8f/iduzEEyC3n2dsxTeZ90=;
        b=PsnXNr0E2nPRNc4NVDs6TRBylDALo4zK45DsyV3iimGtstnIcQuO8A88WZxWfyNMvM
         1wpHTVu/CmvWrgr6pMq9jC0o/XSBuuI+x5WJQxt8lvrw0lrHXife2yBvjqKBi+kGr9jY
         LZ37tRvEOXexYmzSH2CC9nDToQMGS6m1gz0nU7ZahT+aPOvw+1igrWuo9UHUb9ZXxTV8
         0rjTeyw9ekGMBDqeTLt0HooTDDdHND2K7L97YVExmeJiVez/60JKhT8iu8yHR6FoEy3r
         JWXUWqDo2n2ZFnmoRkbZzxqhHgiGjaRRLxiXpgGrzFYx1vbXOP6cvcAngxwkd1cH0Ftd
         T+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605988; x=1796210788;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G+BRXkvsKkCtNetmP+qei8f/iduzEEyC3n2dsxTeZ90=;
        b=TmUsjoROWnbY5aSdANOPTtLWdCsJqC3nPOn6HKwtstgfXAn+BVpfZcdzRdWDXHFL5X
         HNQLqLcHdkUCaEwYSrXu8Xxrrr1AECscyAwMGbD6Eep6YHKrgeoKrx9fuics8ksZsuFB
         NzfeKFz+BImA7n1gVahYpmu1Z6LEOLhmtVx1qMgDGnraYSsK3wWlsqZF7IWB64i8IfGo
         +g/Vfh7WX8+CIr4dfVcNfPkcVJ8G8juP8EZVX06phyUsljjSJ/S6LNQVwBUehIytoS6L
         2rfhjiYjSaBy8G18y8EMnzwCpRF96vMbz98isM7dxPJvBnNdviYg8eSnkINZQBauXxqD
         kQfQ==
X-Gm-Message-State: APuU4Z/IhD8sUKKMoK78sYSl7dsUPLs2EYSILC8Dy/P8MSz5YA5Dbm/T
	unJV//MYvTG6RBCbW0qHp7m2/QMKeOhC3KaQ+sfE+8FHWFhzANplAIY1viI5tA==
X-Gm-Gg: AZFdTZf7HkXs7twRux3HsjAF04w5xekjGwYIi0opAWqvYdcE13eGCVM4iKg/aV+6aaw
	0+hNxOz2dah9uS+XIeX4H2Kd7FlIckYmZUfTT84ns7FpdeOCpvge6A6MXG8V1qMmMoqEvg7l/Tm
	vHTOJJHC58CxuXdMDXbQpR14LFvdEVETBnRCfpRYLL/WBMaFcUPp+kCd3OkcsPYrhzF4gwa5qrb
	a39UyG+e+obefYCeA6VS4RJjs32bW3gX+0wjC5plm5WZLRYXOCLCjO2+5UbvMXuzZBnPWs95uC6
	SVAXrq/wUF8hrzTNmrvq28cj18HgoZb1ZnZkkUc7kO0ZmR/KFDPi1EtKBaQWgseZgSleihZMxhc
	qvccXXSPHnFr9jFtaMolki+EZ7gFySh01RjIUS/9mfXHvByXqH0pvpl1tn2Bgk17/RDgw6JDNBH
	WpCkfhCVP+/zWltYQ2zOhTPvqHEVd9fnC2fYNdDQfPY/8sEp7+uD8Mw+fiOmfi4zEy+O+keZ+u1
	fKUEZaujW8A1Y+v0JCDoHvCXGuZL4eeKNbPGsy6DAG3/Cu/8xEK2B337J+PoxcLfnliSfzz8eI+
	PLYCr4S24i77pJwSmFfXhgtQaf/yS0bv5QluCpqjA6bZlJsBjnHjWP496pv5R3LXOypJQatuXzl
	l/NJCZbt9Kz7VHfFdZVDy9cnHJ+HfbIk=
X-Received: by 2002:a05:6402:1155:b0:6b5:7312:4f48 with SMTP id 4fb4d7f45d1cf-6ba37e90a38mr10062440a12.28.1795605987551;
        Wed, 25 Nov 2026 03:26:27 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 0/7] Tegra SoC specific Video Input updates
Date: Wed, 25 Nov 2026 13:26:06 +0200
Message-ID: <20261125112613.237333-1-clamor95@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset contains various SoC specific updates for Tegra Video
Input driver:

1. Fixes for Tegra20 and Tegra30 VI configuration (clock adjustments)
2. Moves Tegra210 specific code into tegra210.c from csi.c
3. Addition of Tegra114 CSI support

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

The "ARM: tegra: Remove fallback compatible from Tegra30 VI node"
should be applied with "dt-bindings: display: tegra: Remove Tegra30 fallback"

This patchset is based on
https://lore.kernel.org/lkml/20261125110750.223628-1-clamor95@gmail.com/T/#m46981c261c3178126ce806aabddcc38cc33f747e

---
Changes in v2:
- "staging: media: tegra-video: Move driver to media/platform/nvidia"
  moved into media-device conversion
- dropped:
  "media: tegra-video: vi: Switch to media_entity_remote_source_pad_unique() helper"
  "media: tegra-video: vi: Use entity function to check subdev type"
  "media: tegra-video: vi: Adjust pad assignment logic"
- fixed schema clock-names configuration for Tegra30 and Tegra114
- added "media: tegra-video: Move Tegra210-specific functions from common CSI"
  (Move and staticize the tegra_csi_error_recover() and
   tegra_csi_calc_settle_time() helpers from the common CSI file into the
   Tegra210-specific code)
Link to v1: https://lore.kernel.org/lkml/20261113161819.36847-1-clamor95@gmail.com/
---

Svyatoslav Ryhel (7):
  dt-bindings: display: tegra: Remove Tegra30 fallback
  media: tegra-video: vi: Diverge Tegra20 and Tegra30 VI SoC
    descriptions
  media: tegra-video: Move Tegra210-specific functions from common CSI
  dt-bindings: display: tegra: Document Tegra114 CSI
  media: tegra-video: Add CSI support for Tegra114
  ARM: tegra: Remove fallback compatible from Tegra30 VI node
  ARM: tegra: Add CSI node for Tegra114

 .../display/tegra/nvidia,tegra20-csi.yaml     |  37 +++-
 .../display/tegra/nvidia,tegra20-vi.yaml      |   5 +-
 arch/arm/boot/dts/nvidia/tegra114.dtsi        |  34 +++-
 arch/arm/boot/dts/nvidia/tegra30.dtsi         |   2 +-
 .../platform/nvidia/tegra-video/Makefile      |   1 +
 .../media/platform/nvidia/tegra-video/csi.c   |  75 +-------
 .../media/platform/nvidia/tegra-video/csi.h   |  11 +-
 .../platform/nvidia/tegra-video/tegra20.c     | 171 ++++++++++++++++--
 .../platform/nvidia/tegra-video/tegra210.c    |  71 ++++++++
 .../media/platform/nvidia/tegra-video/vi.c    |   8 +-
 .../media/platform/nvidia/tegra-video/vi.h    |   8 +-
 .../media/platform/nvidia/tegra-video/video.c |   7 +-
 12 files changed, 324 insertions(+), 106 deletions(-)

-- 
2.53.0

