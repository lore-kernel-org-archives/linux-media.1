Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1704156DE
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 06:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616092; cv=none; b=Su2ZwQwI4FIBtyak/FMYbLozVAuckfi214JWmzSM//WKmbGZObAGoznbDZ6rL6RVY5i/9oQ22mNup7jfSlwrqAszersFrUtXhZrk6qetMFoxupY0xZ88ABYua+DLp5o25nYfdb2KsvGtJDduSVJ5at4s58gTXZUUlMv4fGXvP24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616092; c=relaxed/simple;
	bh=cXwXhZdmexDzQjYTqjUXobvORvGFsVnLc+x8PC+sOgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AbTi3fOi9T872NjsS9vJV2cfHXLDUJrtrKMPZJWMoPw9EF84zShjqTyHprnVcJ3H67Ld5KlzlcA71tGJAmzQR5E6JU9Zo5x8r9I98dLcvEnH4pDK8wese+mCqDew8xQ2HumE1emfeiMWsiHlo6Qlewh1RVbYQ/ILDReWXWfRcZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nc70rqEo; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nc70rqEo"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954a2dba6cso2524055e9.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 23:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784616089; x=1785220889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=olVi47cfDDwShzUFdBWycem44Z+dyrHJb9D5B3ac60w=;
        b=nc70rqEoHBhsQjr/1fEEXpWvpCNs5pBU1bcgH5CFS0olcZOBoW+NpSEF11BUvLwBFE
         +MQoRlz3+8s4EKFBsMMDlMcI1FZaVs5ZFL6k0xJoc379InqJ2NZAyV5CR0PNxESwJz5J
         /EfAR/TuJ+8T2cCoeArhG0uM0aL5pK9Fsf9NWoGOIQkQ41ngbbJwOQ3KcKG4jTDJfq1W
         GncFNrn+kBPaVlLloQjeeFxffh5UCPlTmednuDB+WS487ZTrvjfyVaXRbxZXini8ngPS
         nbQKLpOrzL63onx210TVqmsNq3bHI95T566MN/Nfaa481HeOUt4J5fcKwFrs/mLZZpoJ
         U3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616089; x=1785220889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=olVi47cfDDwShzUFdBWycem44Z+dyrHJb9D5B3ac60w=;
        b=U1Vk9+ESJUgEtNTD2dxr0/tM4+GyT86/bEt3ArypUf5BmQVtFfzQCpHDGU72qC8en9
         JDCQPBgcSvCUQyXV8ljJooBa5ddzgxFq1o0qEWcnkRazQvHP2r8fJq9olmCyb6O/ww3V
         zdjLJ0qwSj4aWTCpNH9/Zz9XQpmiKp9pBtGZTm+/9zC1LbaSqlqziHbDZjNBK1u7Y5t5
         gQBgI6mhK+16FXYxfeWPU0OMQ95DkoQA3Y9aAKkGrI4wx4q2EJMbpDuhOlpC3yUqUuTS
         uphRbRC30LnNa3u7AcLO4D7rVeVm3PQSHmNinhKT1wD/IT6ZlT9rB2darOVGmF7fOopV
         797g==
X-Forwarded-Encrypted: i=1; AHgh+RoRq72rVm5CfUWfILiwEF3ZPBYKuddcmHf0+xMdMekHFDsCFIyShlQjUzVYpDw8UhGqbtpMruPt4bNCPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG3a6caESWXSuOSqPfXZqzcCWcXu1RRLaBpuOcoOeDVtTrFFPR
	G7XatXgROZoK754TA19b9iXLe4X0YCNl6Gq3flJv0QB/YNfWAcZAZOGE
X-Gm-Gg: AR+sD11iafc0EZM8uoasfPsHqSAtAxxQXd8u8vPMUYtsC8q3DLAQudg5bMyDvCKvX+M
	XNW0RenMvjJCVgDdNjz/u/JOsE2R18hqYWvoIcorkopRe4YCD4k+i16Prvw+0phc8qJg5q75di+
	wOHEXZLcU83sefRYwUujn+nqQv2tZvzxlX7xAgXdj4359qwdldyVFgs1DSi67DXt4b10iCSUj2b
	zPHjZNHjFcR9d/C/EtfOstixHQf9Gw/wlgb8SaAG6G5Xf5zERaNi2FYbywHqAI6QADw0WTaB+iG
	2Ex44gdLYBaukymQ7kfpdkAg7sylNoVfAMmkSKw+5eL6JHhxG2fO4fzGKYferGMAYUn5sQ1hKyE
	ReuGK62lpU/E8yIM1U0V6aOBc44V8GWzADY3xGXcl/8CUWQnydmN5BW0Xkm0kY7U2vd64OkHwZy
	MARJjrJGbgrLmxxO3HHz7PunYZGwjCB69CUIbDsVCa6IuV6PTX1P6qPh6WtU6NvzR5mtvovvcD6
	RA1Prk1i3M=
X-Received: by 2002:a05:6000:4023:b0:47e:96f2:52a8 with SMTP id ffacd0b85a97d-47f7fdd26d7mr1154379f8f.1.1784616088618;
        Mon, 20 Jul 2026 23:41:28 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B88AD00DA0BF9DB4519DBD6.dsl.pool.telekom.hu. [2001:4c4e:1b88:ad00:da0b:f9db:4519:dbd6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed1911sm38837951f8f.22.2026.07.20.23.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:41:28 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v4 0/4] media: synopsys: hdmirx: add HDMI audio capture support
Date: Tue, 21 Jul 2026 08:41:11 +0200
Message-ID: <20260721064115.64809-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds audio capture support to the Synopsys DesignWare HDMI
RX controller used on the Rockchip RK3588: the controller's audio FIFO
is exposed through an ASoC hdmi-codec device, with a periodic worker
that keeps the local audio clock locked to the incoming stream by
tracking the FIFO fill level. Together with the two dts patches this
yields a capture-only ALSA card fed by the HDMI input.

Validated on the Orange Pi 5 Plus against multiple HDMI sources:
capture follows the source sample rate (44.1/48 kHz switches
included), survives repeated stream start/stop cycles and SIGKILL of
the capturing process, stays free of FIFO under/overruns via the
clock tracking, and now also survives system suspend with an active
capture stream: audio resumes flowing on its own after the cycle.

Changes in v4:
- Driver: support system suspend instead of the -EBUSY guard
  discussed on the v3 thread (Dmitry Osipenko's preference). The
  worker is stopped before the controller clocks are gated; resume
  fully resets the controller, so the audio path is re-programmed
  from the last known sample rate and the worker re-armed while a
  capture stream is active, through a hdmirx_audio_setup() helper
  shared with hw_params(). Validated with an active capture stream
  across the suspend/resume cycle.
- Driver: use swab32() for the ACR word reversal; readl() already
  abstracts bus endianness, so the reversal must be unconditional
  (automated review, valid finding)
- dts: the sound card is now a shared, disabled-by-default
  "RK3588 HDMI-IN" node in rk3588-extra.dtsi, mirroring the HDMI TX
  sound cards; the board patch only flips it on (Sebastian Reichel)
- binding: reference dai-common.yaml, switch to
  unevaluatedProperties: false, and drop the consumer comment from
  the example (Krzysztof Kozlowski)

Known limitation, noted on the v3 thread and under investigation as a
follow-up: a second suspend/resume cycle in the same boot can leave
the audio datapath silent until reboot. It reproduces with no-stream
suspend cycles as well, so it is independent of the suspend handling
added here, and looks related to the cold-start behavior described in
the v3 testing notes.

Link to v3: https://lore.kernel.org/linux-media/20260718085728.6797-1-royalnet026@gmail.com/
Link to v2: https://lore.kernel.org/linux-media/20260715200834.8486-1-royalnet026@gmail.com/
Link to v1 (RFC): https://lore.kernel.org/linux-media/20260715051939.64652-1-royalnet026@gmail.com/

Igor Paunovic (4):
  dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
  media: synopsys: hdmirx: add HDMI audio capture support
  arm64: dts: rockchip: add HDMI RX audio on RK3588
  arm64: dts: rockchip: enable HDMI RX audio capture on Orange Pi 5 Plus

 .../bindings/media/snps,dw-hdmi-rx.yaml       |  13 +-
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |  18 ++
 .../dts/rockchip/rk3588-orangepi-5-plus.dts   |   8 +
 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 306 ++++++++++++++++++
 .../platform/synopsys/hdmirx/snps_hdmirx.h    |   8 +
 5 files changed, 352 insertions(+), 1 deletion(-)

-- 
2.53.0

