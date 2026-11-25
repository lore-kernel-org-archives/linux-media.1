Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609954;
	b=0MqRpL/GOm4dOzvuR5xT7Ct9OtySh4pnrqfiJvzK/5QbMmU/igkZuqa+k8/nPwK2e58m
	 uz3Buq7HreySydDR2+JiUoDLI6rKleDZaNg7NluNhHxIrbPYbIuwO7trAzBfGE5tpH2he
	 V3sbcznrNCUU9VnpyO6keavfznSpLRi39/Az8ZO39iEBUr4sDi6zTQNVHQ6uK+NH4jIE6
	 ILNDw/K5PdIIHnpO/+018W0EaZ28k34d/dXzYxlEQNIC9Xb982ohPITxoHtHzeWjaOyNx
	 FO2IWZSfbP76z3kqoLOeQEftMSIvSRYRmf7l3iYr+yREZd2QF9jnQ9zlTTB5VwCcbAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IvHx9D16QzbXJ9PEfv5MhOt53lp6B9YTM5O0ok8W/NQ=;
	b=nFvXxOJlW1ipX0TAUQ4CiKlOs87+ORWP+fO5LzbaFwJCxBsf6AptrazhwVfWtRIMEq3S
	 ZRdSQ1jdC4pZ86cgcJNW4n7QnMB7SRreOC9T25bfupIxF/BeIBFjgPOaJGCpHE82qkDjv
	 MRcAPHadjf1HHEyKgxhdQGVAbus60B7EJRSBkhzDtWqfeW6qtqzbKLRXPfxknyYFY5tU1
	 Z1YHx7Zqk+6wnUI6TeINslalzEBI8+7Nyb2GGQliN10hOMd8ItddgRmMsvBeUDZaaEkfV
	 skvugSU5rU2AFUTDaihQcah/om7+ZTiM9Nbgvo2ohF31PdBn2XTPeR5aO4a6gK228uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ppjk/PHX";
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFED606A32D
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 12:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DFED606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ppjk/PHX
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b41e5a1719so2402257a91.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 04:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609952; x=1796214752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IvHx9D16QzbXJ9PEfv5MhOt53lp6B9YTM5O0ok8W/NQ=;
        b=Ppjk/PHXaFf2xFYnTBi2dflKcU0hPvBRvusUu56u+X6FH3/D7MWrpc2TAdElIndzie
         r5b5IFSr/FZecCaM4clvxCwNoPcyYCygW4Koc8jqu16fbHdPP5dNj+f2swgSkZUuugCS
         s/SADxoPwCg0kTSvzM+rCUdOzdhHnBwOs2YfOqthL3g5i8/CoSyc6hLmvarCkZTahFTm
         s2Qr3l1l67VnUTiVAahMxc9jHO4cyRjmiWlR6Rq7ZUl6A9f1iACWbpvHxkVIw4jnEEpg
         oJHTRzVHAKJ302EvQMbmkA1aqM49jXXVkKaOxNi2ML0YYdIPxip7PQknR2CUZFawOUun
         6ziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609952; x=1796214752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvHx9D16QzbXJ9PEfv5MhOt53lp6B9YTM5O0ok8W/NQ=;
        b=y4yTr2ZLqKAWoHxysx4kxC/fx3vtis4O90uwos00+B+wWp6d+ZDh7tqVlOe13V1yY6
         64B7GKpf2tDJjOk3092HeR80RyEEHxGwXtUqW0Nw+fBsm20hoFjgp1tKaPKFBXADd+kd
         X18CTQ1GPVWW7Q/84oz7Ew3kKFM9MPNAA/msfvBexzAg+YJLwDeFRKB7kpxYk+zyjw0K
         ydgZwsY8LUVrHEGzF9bihdmxon4oqgprXu/Cfhvkk7ss1nY6YjHijjMRgQd987FAh5mG
         Sd0dzlvzL2NSyxOgjjYFEvFojymT7UR5lKecc5LFAlNmxBSvBiZzM5WOfLUpy5P6dHwk
         Mllw==
X-Gm-Message-State: APuU4Z9Z0ziGaD42h9uOqnK3+gLBUJkj0ccqOLSDElbenBrYguteapJq
	ID2H+XtgJglox2XreV18bcbl8/UENLdVd6s4UkrEUydUMUK1jRuVvZmi
X-Gm-Gg: AZFdTZfqSN+I89fTU8AMSIqi3/tFFiI97ymTV3+03G1J/bHKehiAqzu8XnERmkCQxNj
	hWwyCh3XLGbnyhp7qFspitTbvMRhWbmrUV1W46OjwrqAFnrYBBa2h1Kw6s/yO4VhbxCtSXTDavz
	pz839GIW3VqzHzgQXvIrqBWCN3gmPOxvK22pxGyLE0tvrU8eq/ESJDztxHZdlL4nyFDRU0Q3H1b
	rq5Q9GaI9jEvlI6zohQn+XX0QHYWGOp5lBk3csWZ2XsDLQXXdkz5elk6dDN+ekqk7H9trWJ101B
	c32E94jkimQCvmdmTuy/MNhb7V+e0MRWkbfcDUQrOiFP+vMcU6mpNQXxUQygAifmLgXulUtAhr6
	yNnv5fa4Zzm/wa8oTv5UUWABTkTS5G6znZSKiwOInoeW0DOjYKC2eGWPV08YtV0qWr6+njjBCvM
	Qdqo9S7fXmS4bxbPYFqkwNOJ1m39TwyFkPAU0XMj763tGUS2QaXw+1aMb6D888SGP6g1+8SCGqu
	kbs2ZSfC+0CgHUTaA8wUqOZsQETgkkgd0soYtwxMdeO+6rSskXFTiLmfAA5sxzVUXqT4HLU7aCs
	JEXoAj2qEDs3CGTobnqGkQJqWXWGJF9RaUGy0NEFNdLqJeb3
X-Received: by 2002:a17:90b:3b86:b0:3b3:fe22:2739 with SMTP id 98e67ed59e1d1-3b41c9c34b5mr16172380a91.54.1795609952223;
        Wed, 25 Nov 2026 04:32:32 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:31 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 0/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Wed, 25 Nov 2026 19:31:39 +0700
Message-ID: <20261125123146.379057-1-hikmahgumelar@gmail.com>
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

Enable both the front (Samsung S5K5E8) and rear (OmniVision OV12A10)
MIPI CSI-2 cameras on Xiaomi Mi A1 (msm8953-xiaomi-tissot).

Changes in v4:
- Wrap all commit descriptions at 72 characters (Konrad Dybcio) and fix
  all checkpatch style/alignment checks in s5k5e8 and ov12a10.
- Keep CAMSS CSIPHY0/CSIPHY2 data-lanes 0-based (<0 1 2 3> and <0 1>)
  to match legacy_phy lane_base = 0 in camss_parse_endpoint_node().
- Add vdd_l23-supply = <&pm8953_s3> under &rpm_requests for S5K5E8 DVDD,
  and specify assigned-clocks / assigned-clock-rates (<24000000>) on
  both sensor nodes.
- Request powerdown-gpios instead of pwdn-gpios in ov12a10_probe(), check
  IS_ERR() on powerdown_gpio, drop vana_gpio, implement .init_state,
  add v4l2_subdev_cleanup(), set BIT(7) on OV12A10 test pattern enable,
  report 12MP native/crop selection rectangles, and validate CSI-2 fwnode
  endpoint and xvclk rate.
- Use pm_runtime_get_if_active(), check __v4l2_ctrl_modify_range() return
  value, keep post-power-on delay unconditional on reset_gpio, populate
  full pad colorimetry, and reject active format changes while streaming.

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
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 124 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi         | 145 ++++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  62 +-
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 760 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 567 +++++++++++++
 9 files changed, 1821 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

