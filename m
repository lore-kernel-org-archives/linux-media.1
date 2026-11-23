Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432100;
	b=ZlwCavBftzbcb+BbFONYjnolUpOkX91WfW2IrV+e+veujD6oQ3oKai6/V32S0m9Srrq1
	 pGx+8dOkFLn3TjH+H0uI7RTLLfm1ZqBrlyM3QcW+PGzk1p3kWv1iV9xWx/s4CcEwORmAX
	 hYTkdQedkDHDnd00g8kCoJdeP9QCxHSqu4uoaPel3SOZXlV+uGUZFFt5qlAlY6x2t53qR
	 /t+lYBp8xrJqyQBKzXWzTYqGXPqrBuQ1cMxAZwjPUC6/ZNVerAaLb/jEG4nm885ZVU+XN
	 kpFdH4756AUycLWGjanCCknqbAs1bL7Awd65wM9rbaAS+YmVio2rw/ojFt/wdFuJ21A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IMN0qsksgNIN9kMeTfgWdFSfENva8adgCXhd53cR/YY=;
	b=bxsMo/VOvvYulXmkKd1CugVMtZm+aMEFvC23zDo6f/SqSNbtkg7OoQBeaYPkO8iEPJbk
	 pc4DPscmudnudWkIu20SlsyxfRWZf+ej+igO8Aueds62JD8aceFO1DiQBSotYOnh4NCI6
	 GY8YBr+6DwX2vj4mVNQg4oLaEHDK+yx7s6Z9+kpaCaE86OJhaKtr5zX2dSq3p/0mBWYIT
	 5h7DcSd3vhUYfnVtA3EG5+qkzfXBGs9sveYX1xiND9ZRU/4MuEDpy7kGXMW1SQj5MuxMR
	 ht91lxqela3WQqYB/nbDHSXv73VxdTVZOWbG8hgVvazXo4hbvheKoVvTzfNx9uN/V5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ec3UFjGz;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5EA606A31F
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C5EA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ec3UFjGz
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b244fb7fffso2847314c88.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 03:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432100; x=1796036900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMN0qsksgNIN9kMeTfgWdFSfENva8adgCXhd53cR/YY=;
        b=ec3UFjGzf+Ax+mOyj+jbqDFmxv1s+/ilYTPPCkCGVgYuPO3q35DWB/+HRF/Oz2sLvL
         3aQyHI6tHe6HhGEfoUlt+RPLm8ZWtFcdQbDy9jO3MlFzg7xTHIVOcfPEQcIPxRIAVWzQ
         BZ5lRfv4aUhyVlfNm6x6F94Qj4rbgapEOVaNaU+0o+/9/9iRZAOfOBG6MpyGxIQUt3xO
         ALHIZuvHue22QtQ81fiHVBB+0KkjfYRpS44nsn1Fob4Ikd3/1INTRshst8/sQFb0hzRj
         MAVu9TNdZwo0izTaUC/5fX2acbHZrF7RzdRbrdJR8h5+MxGc+rwHlVjLyFEt2n4mkv6k
         t4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432100; x=1796036900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMN0qsksgNIN9kMeTfgWdFSfENva8adgCXhd53cR/YY=;
        b=NBPqREfJNx2nrcYyODuBOVW2rjVSXMfccGHqhMHTlRoIT+kw1H//qCJcRKiX+m3DOy
         Ut7tTExlyKbrHokF3Ip78gbNnpq5z/hmjtE9uUPtmWJHHLTFnIf8ql/LHjnejsk59PPE
         lcVTx5VF3bdc7BQ/kfCNr/rS9Le6zqvky2DN5rInc+hhb4+P5fF9THj4HRDaR2IockvD
         mP8Iyikb3V5vE+OkfpvNElTpi4G3D4gPdHrMZd9bFNVwysF9rjfntAeMNKGD5BvE1Epr
         Ti7ek8oaoT0q9VTl+8u5K8cbhkTCikEzien7H/rumfXKHDZscGWIGZXkm+veNhotUFAc
         gjIw==
X-Forwarded-Encrypted: i=1; AL+hErEB5KTPCg5MihGqc7HbLkzsAbEy3gI3pe75VNEBgxoxMNHccAS4gnJTjbltXRMlfSN8vqS/Gwkr8anOew==@vger.kernel.org
X-Gm-Message-State: APuU4Z9O6SPDUKxBD/EGXZxRiqWZS5JnsOfeCEYwSMb6XS9AGITeKPF6
	+/JVWo+dXMkfkqzDTak/uZt7SuGsXaW23bzsUiL9heZiPdkq26g4GEPphNW3EzXqejA=
X-Gm-Gg: AZFdTZdHgSwF9NNthM9CH3v01xUatYvbO/pQ4d8wx1nsLSOpt72oOfClY5dtTmOt4yK
	Xa+549lTrJsbbj3bruN/V/ubSPDfanFyHrXxtzagPtTZb8Lco4ygzyqE78xKO7FOu95NTM2P3ld
	fYoh6HWMZlpzDv8TZ4vdCTpbA/ki45+OTeAD1yS6MSHrrUyBwk9rTBQu+OJkQ2fVmVxfPjvseOb
	lLJEIqrlWwlzTaB7ev9zI+KNlQHjtFECYdMOhRt0AzbxLhkUUB0VaKxbb0SoGxp2bd9PggwyU+I
	2B/6TmOvNZ3sBA16K8DCNUFkO2amggJU9xtW0c1PW/iHfGVtFKaoxJ0FjyuNX+Nxmn5bF2MO2Yj
	xdtLkr9ZxBcv5IlP0+fJyQJOxtJT8wzWtOKw+6gf1UwQB88loVbQPA29KHPeK4oLAv3SiHqR6eb
	oCmB3NVs0nfhDPLZf96LJoNiTRt7nKCV28YvQNMwYO98pibLa+dAJNV7UyqN1vmCll6j1/sqYrQ
	R/NwvL8lWv9MreeZLRCN5q4sgBK9dBbi9NvcyG/Z33ZbNsE41vIRn9sCMByOiEKXe8HYXXXJnJa
	XNBs09NhK1NL+2gYF3VWqzjlymV0ApP1EyMuN9O3UaOSyQ==
X-Received: by 2002:a05:701b:4587:b0:1b5:1a7a:2ebc with SMTP id a92af1059eb24-1b56f87ab60mr3863029c88.16.1795432099526;
        Mon, 23 Nov 2026 03:08:19 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:19 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/6] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 18:07:59 +0700
Message-ID: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

This series enables both the front (Samsung S5K5E8) and rear (OmniVision
OV12A10) MIPI CSI-2 cameras on the Xiaomi Mi A1 (msm8953-xiaomi-tissot):

- Fix the 100 MHz parent entry in ftbl_csi_phytimer_clk_src so
  gcc_camss_csi0phytimer_clk enables properly on MSM8953.
- Add Devicetree binding schemas and V4L2 subdev drivers for the Samsung
  S5K5E8 and OmniVision OV12A10 CMOS image sensors.
- Wire up CAMSS, CCI, CSIPHY0/CSIPHY2, and both camera sensors in
  msm8953-xiaomi-tissot.dts.

Tested on Xiaomi Mi A1 (tissot) using libcamera SimpleISP and GNOME Snapshot.

Hikmah Gumelar (6):
  clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
  media: dt-bindings: media: i2c: add Samsung S5K5E8
  media: i2c: add s5k5e8 image sensor driver
  media: dt-bindings: media: i2c: add OmniVision OV12A10
  media: i2c: add ov12a10 image sensor driver
  arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

 .../bindings/media/i2c/ovti,ov12a10.yaml      | 115 +++
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 +++
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 114 +++
 drivers/clk/qcom/gcc-msm8953.c                |   2 +-
 drivers/media/i2c/Kconfig                     |  26 +
 drivers/media/i2c/Makefile                    |   2 +
 drivers/media/i2c/ov12a10.c                   | 720 ++++++++++++++++++
 drivers/media/i2c/s5k5e8.c                    | 500 ++++++++++++
 8 files changed, 1581 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/ov12a10.c
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.47.3

