Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787125;
	b=2B/CRxZDo6spk6txipSWQYDBuWzn/mtKtdueae1NnJZxde8ZnQFYlljbe9IutNE3qrM6
	 /juMCfR5vAE4baIaTB2DndN2fWpJwDQsaBcaKk0O5/rngtN6qayApFiKbsVDrF5u3VRiO
	 dcwJMEVenqumilTs1nXC8v06PzItCcyCBmpNEuI04GA+KcLIZdnqDxA1m1eU7HP7IsaJ8
	 NJ7Zrr2HMmdE9bWWX5UPfk9KgonbZ1d4Kbifv96nlK5G9SBn/+LUk4deghMAKPqVAOIfW
	 EsuYrOOOjB1v/aA5jECTrpTGJ7ne5slxhGhGFKk2+Uzmiv+0M9gDHNfs3Ia9rDrvdjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=soBllhnRsKIz6tjmTzgFLG5DRqhYbElDc5QHHZS0VwA=;
	b=L9AQHONcKpyZ3JyAIbFg8UjP7shlhUlFN023yrEgXy+2FEHweb7hylI9/Hvd6H8jYzXP
	 CskRUzXKOvpe9545rAoqPS9b20Hy/7pMSFoQqNpwQzDMc6GjlagVOKlGTWy3VkHKfl0va
	 u3kR94VhtMJ/8pe9ONk9WuYfaLDHTtOaDzXX9eBQZKRiRHtU6L6M8nDgJSpYAnFehUeOa
	 JoiK2Zt54L6V1WPvTAWknNFvueHjH114dj3FoidzQ24Hh2Boo36/OJPTegMSfpWmrdP2w
	 BaV7WwilO43jBcxlR4Hn6yuPtiJuvFDQAYVq6Niw4w/uNQyA3X1xlVTuRjdd1MJr6sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRfcINcX;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD03E606A323
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD03E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRfcINcX
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f048476ab9so56662825ad.0
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 05:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787124; x=1796391924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=soBllhnRsKIz6tjmTzgFLG5DRqhYbElDc5QHHZS0VwA=;
        b=VRfcINcXZkGKJlamNcG7ibHTmkHDvq6tYYNhQjY8ADYHJWVBhMYpYMWxlRm2qkwme9
         lgTfSZBRZSLaG312p4Ohbr76U+E2prGbnT3tnj+y3hln2bc4Tgmktck+bQqd6qpQXR7O
         tOr3JiU5A4+HmQ28gVgxTLEnuDIjFyohxW7UNtSCDqueBxW5v+FxvDr5XEeH8NNks8j+
         eADDdfx9BNuutaS7srnsPUxi2rmFhSeD3tYDJMEhuZ8V/WVNs8+2dKZ8LuIOC1kFyAAB
         bPRwEn8AWHHS0vwm9zq8MrCkxzNPbmF6QFSZLGQDdcFsQMc0/v+H+D58OIk1vutYWRQA
         4dBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787124; x=1796391924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=soBllhnRsKIz6tjmTzgFLG5DRqhYbElDc5QHHZS0VwA=;
        b=EQdqQozOe69BQxtXsj5NXDSsdFspSkXYz1VzBlHyJbNqo3nKfM3TxI4m4dicEU3qJb
         51Ytpri7lbUmH6gQmp3C+404+MU/j3NpnOPEkk/V7kQX7fLPsLYxNN/Y5j5tfhPKWcgQ
         A6HELe1NcAbNrANsJuDQIRklqWkDgCUwW8D1meXO6Waf7TI/Mxzn2ndpzpH1zmjyPjU/
         XfcFk+tTeO6Lrbz7lknGnVlFRvtItK/qgmqxuFYmq+BVinp6dKB+xVeqC9JYADosXD0V
         qxq9lHp21tvNIfGLkNQ19IUKc9d1hN5aVAsCGUOTCN2Uj3f9wPxf2w7T8c9g954NJcST
         EjYw==
X-Gm-Message-State: APuU4Z/h8feCSnzlb077UKO4EnwOWvzLgN8Zh/2z7wzNQ5m1MTVI2qpZ
	uQOgHYJ27162x0ynIeYDXlUJWlfaRlcDA5OaAEhU+Lk9Ur/lfgXkLgYj
X-Gm-Gg: AZFdTZdHHOQilf9xFsVGbYsCP4GIH8t//dMY8laJaTBm1s2xTH+307dUlL4Dqkurq/d
	zUyV7h9guLpl6Kij1LD3PSzwf3sHSzsQzT0nZPwH8cRFhhR+1LGzAeKVfbqiZDV0lVTKld90ZBn
	b8h1OieKhrO0OKLMAYW7DnIh6nmzKe2Bq3tK3W5In/B6/+JbFL69FBpxiMkmWtwedcJZnthlIrM
	Sahp5KDKZb5RVQMGINeMnzk0N9VLhD/KlBmHnSvvVo2R2TNM37rafx+pGP0S6IB6b0O7QnU3sOM
	1D9wosRmKQa2QSygr9jJ13OqWxLiNhW93KAfP0upK2nAaVVPhca1me7GCUg3paU0cGBZN3/L3dF
	TbDfsn6voqlK7kr/8JisKFK42NRyi0rHdZeVsTdKPa8gHYoUqG0d7HKd8Tm/baBRvKvkfbEghXF
	6ofts8MIRFp9+cVOYgMbygnLK2B5siIu5ViEkykdEH+ILpIo7+TfOAFa3R+RordQSyn0f+i3BMN
	Db6/BpNA4MzM1PQbKB9XJJWevJ5/1744Maxz8yND4b7PlQlltZudSeBBeZ67OsBIqunc9RkBIAB
	U10xolGH9rsgvZN0gqd50cqPMtxOY3aHHpqWvj+I6nFw1w==
X-Received: by 2002:a17:903:b4f:b0:2f0:3b8b:9145 with SMTP id d9443c01a7336-2f03f1851e2mr258565905ad.55.1795787123904;
        Fri, 27 Nov 2026 05:45:23 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:45:23 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 0/7] Enable front and rear cameras on Xiaomi Mi A1 (tissot)
Date: Fri, 27 Nov 2026 20:45:00 +0700
Message-ID: <20261127134507.125513-1-hikmahgumelar@gmail.com>
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

This series enables the front (Samsung S5K5E8) and rear (OmniVision OV12A10)
cameras on the Xiaomi Mi A1 (msm8953-xiaomi-tissot), along with the required
MSM8953 CAMSS clock fix, sensor DT bindings, V4L2 subdev drivers, and SoC/board
devicetree updates.

Changes in v5:
- Restore missing `select V4L2_CCI_I2C` lines across existing camera sensor
  entries in drivers/media/i2c/Kconfig.
- Move ov12a10 Kconfig/Makefile entries from the s5k5e8 driver patch into the
  ov12a10 driver patch to preserve per-commit bisectability, and add
  MAINTAINERS entries for both bindings and drivers.
- ov12a10: Call pm_runtime_enable() before registering the async subdev, add
  v4l2_subdev_cleanup() in the probe error unwind path, update the active
  subdev state and return -EBUSY when streaming in set_fmt, add the 35 ms
  post-powerdown delay when reset_gpio is absent, and match the initial
  V4L2_CID_EXPOSURE maximum (3372) to the default mode.
- msm8953-xiaomi-tissot.dts: Move `vdd_l23-supply` inside the `regulators`
  child node under `&rpm_requests`.
- Include base-commit metadata via git format-patch --base.

Hikmah Gumelar (7):
  clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
  media: dt-bindings: media: i2c: add Samsung S5K5E8
  media: i2c: add s5k5e8 image sensor driver
  media: dt-bindings: media: i2c: add OmniVision OV12A10
  media: i2c: add ov12a10 image sensor driver
  arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states
  arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

 .../bindings/media/i2c/ovti,ov12a10.yaml      | 110 +++
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 +++
 MAINTAINERS                                   |  14 +
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 124 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 145 ++++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  20 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 770 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 567 +++++++++++++
 10 files changed, 1856 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c


base-commit: b7ac871daee981f1963f632586ff9b9d898ce5dd
-- 
2.47.3

