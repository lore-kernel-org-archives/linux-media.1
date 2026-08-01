Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BE32ED141
	for <linux-media@vger.kernel.org>; Sat,  1 Aug 2026 12:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785588999; cv=none; b=lNe1eyBcG9lzN8EnHQ9PsSZdg41lCatLUzQX8ZAtn8AthFH7pLKPbzpYysopQGer38h0AiBwgflf/qa5GDgUT5BxNy6UpFulsFEOuwHmqu69qwwbtQCdYtu74mqPWtd1LDupSLmmWNtU98F9yhz39zNVCx5XftE9mqSjOKKpKws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785588999; c=relaxed/simple;
	bh=GWYh6PfHzXJ24Lv+kO86aOYZFR2Qz0K98fLbexCOYIA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D6nmbneiYCRKR4ZO9ehSQyI4rwfcGkT1cutICKFj0ecLP6V0vRBNu1A0ucKYk2Hwot4kTenyc07sS3aX0VukXo04dtr0eO2qFbFq2sU/4EdPkz4mdEpoK8NwaaeH9763n8g4oi8/q7ubH+bgjyS+uGHS/h3SlfKkDypBX+0JLKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9FXDQS+; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9FXDQS+"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbb973e6749so2138979a12.1
        for <linux-media@vger.kernel.org>; Sat, 01 Aug 2026 05:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785588998; x=1786193798; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DXt5AeyHYEk7MNJZLXJJ8wYyYWmg+frDkMSxnOOnAFk=;
        b=f9FXDQS+ST8HA7JMD+fstAhOhZ5CACz+7Q+SpPQcV0fnDPIaJQw35fmJ8/JCs1T/99
         06ZGp91QSOYA2LKVlc/atsXK8a1WLP9d3McIU7WC/wJtNYnRHA0EZRLGAh/PY6UzfCqP
         8Y0PNHf1jzu/klyfPdBT/XsMO9o5DnoLWz8X4ITGjVm9uskKU/4NmT8NbbzafOABRL8O
         fiOcn0CPblwb/2D9poBrLDbRGZppCCmW3EvzuXeO5vf5UdazxLz0gekBa8zqO6cHtYM7
         GwwYcb4B6H/kDgyNGlFgitClUt7HNomDzkT60H/LYvsGjDVBjMjViYSpoADcquVYgxtJ
         A8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785588998; x=1786193798;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DXt5AeyHYEk7MNJZLXJJ8wYyYWmg+frDkMSxnOOnAFk=;
        b=II4pKrkI6mNuSuqRF9dhKWiJAUawYTGtw6Yhh7TczDAVtf/wbVATbNjAKx+4wz+dXJ
         /t4y3k7DaUm1YB+zT/ct49w1hjm5sPIA4GO4HeQzMmIuaNabi04qo7hWIC6OTu02KVL8
         4NwyyFBIXNicgq8HDKVHhmZyxEVEM6Gj4rupHAZssbKqGQid6SJYmla3zKhRlKNbBcsl
         /YZiLN8gO+6AdJh+GD4PGjNo7hjO2CbVxUTrlGUikBacSGzuaK7uEiF2KcruPbgXS0aK
         Wi35rrpzwJpMAiu/RD+egacuEoNfQYWcbT4S63nuMzMNaYK+blX/mUC9VLxR/gYg+JJ3
         bP1Q==
X-Forwarded-Encrypted: i=1; AHgh+RoJdQ6rebTKTB8xoH5De4idyMWWkvJ3KD3BVBAuHTMPeLCASBPpDc1ql59dy37h7aSaqLeE0jWlfOJXWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/xLCdNlNR3GJpBhNpnTym4Wu3e1mZdJLmkD0I+4kDGQ6cbpbV
	ZkSACBRiO6tljWShqmY1mcUQYI4YHOJwR8r99CQSGGGDAh3ptLzRyxL0
X-Gm-Gg: AR+sD12NLAQfEjG5G5FEEisxUrPcEpWdlUpBiAqxTU6rZV80LNLmt3qkdZ4VIHkGl4u
	TeV7TqsVMWVtlIAr3LcaM0xzTsohzXF2GhZUI6BV5vFro/irnMvSz7tK19u7ntmbg2NpwpKe9n1
	1zPwXzzaONbut9G7Pn5YAs82LxqsmbB50cvv8gCxLPHl9rWIOVOozUstLsqu6DioguNO4G9GneD
	OTDlhH2yHbgtZEfmPQWMsCD/8yYQOQoQMYTp31TfXhLDAMNBVyKt85Xf9aTzWeiRW+HME6PmCjM
	KOeiUtQSO6WD/gSBgavWebCjBdXNqjR30OY1vNDVGEbMBdjpUIRnHCOlSrh2eFwd72sxGlH0jo9
	lAgfs/WhUdM8fM0r0QIuUu1W3YutcRdNc/LqEy2lSNOPlIke5Dfcb2tdygm19kDnnfp5mW9dlNu
	6S9R8C4iB2nWy9nSiYVDzyjhK4qh2FWZRGkvZCTB4UMKd7/dBRhKVT0v0aBbhG2BJ+
X-Received: by 2002:a05:6a21:510:b0:3c3:724d:ae7a with SMTP id adf61e73a8af0-3c92a518b52mr3598772637.9.1785588997645;
        Sat, 01 Aug 2026 05:56:37 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:8900:d10c:80ab:6bbb:b91:2804])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f88fsm16131724eec.20.2026.08.01.05.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 05:56:37 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Subject: [PATCH v6 0/2] media: Add Himax HM1092 mono NIR sensor driver
Date: Sat, 01 Aug 2026 18:24:41 +0530
Message-Id: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33QTW7DIBAF4KtErEvFvyGr3iPqYgxDTFXHFSSoV
 eS7Fycbl0WXT5rvzWjupGBOWMjxcCcZayppubRgXg7ET3A5I02hZSKYMMxwS6eZMydoyKlipmC
 iAAghCsZJM18ZY/p+9J3en7ncxg/0161km5hSuS7557Gw8m3u2T0w3nVXThkNfAyWo5By1G/nG
 dLnq19msnVXsdei16JpFV2UxgUDyvZa/qtl01ZHgCFGFdH3Wu217rVqmgGX6MWggnW91nvteq2
 bBh71CO29yP5cvq7rL6TsWE+0AQAA
X-Change-ID: 20260618-hm1092-driver-a6f2aaddf201
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jake Steinman <j@metarealtyinc.ca>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6182; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=GWYh6PfHzXJ24Lv+kO86aOYZFR2Qz0K98fLbexCOYIA=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBqbez+2Nixjwzl4g1m0eFotN0odKIoh0WyI4rIM
 TrGviz00pmJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCam3s/gAKCRAVlYpeERwF
 3hT+D/4iBq4BCQkRhtHI7x+Ye9zzmgnS9UqbhoCD6KzKdmwLBwwwPyT7acHNqVZlt8E+qVghJDi
 HlPyrdMhgwOdY4Zef11/dDgS3d8OlCJFjrGo3Bows96L8HHMRpDxkL2QlAnrFeueeX+XZR3p2Sh
 M2lY7fhJBhtqETGJOgFTH76z9VuyYQXk5He56uBPuMBfe3x7ZKybDZQ4sKDrXYX6QMYigmiT7g7
 LogcxPQeKcI5yKoM7JOEjsYIXOf0n+irqYYFOplKXGKSYtXGiddJYcrwRpmoWyJ/3NSFUUFN6oW
 gzM875e+cagUoVyPtWpL8Z5e1SfPmhp65AG6+I2MNVuy9zMZfbqUfUa0BkKy3RQg16e+r/AoFDB
 m1e2IFywfnOwE9JEj4ms+NKi6/ElWLPr0f7mvCBjpuusOme8VkyMWvJ09bL840xLHKjBOgnp6Tn
 KRkqTgpHQIqpTeasrTgqb+hlYz/1UT1VrfK1ye25huQSW5Er6rZuSTpIjCHEpDPrv98J/4LTQg5
 TpcS/wc3HVsoop0m2dXmVThByWjNFcXwsKCHBteJkmL9YbLaHlOOMVPFkBSbeo9TsGnlm68YzEg
 NG9NaihKyfeLENT1M3VmGpFtodv4ZosNCa3tJz2MGscgM3qdYAqLDiL/febxCkNxY61BDWkoCnq
 ZwJ+O2H2Fnwr7NQ==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE

This adds a V4L2 subdev driver and DT binding for the Himax HM1092, a
1 megapixel monochrome near-infrared image sensor. On laptops it sits
behind the IR camera used for face unlock. It speaks a single MIPI CSI-2
data lane and outputs 10-bit RAW at 560x360.

The driver exposes that one fixed mode, test patterns, exposure, analogue
gain and digital gain controls, pixel-array selection targets and the
standard fwnode properties. It has been tested on an ASUS Zenbook A14:
the sensor probes, streams, changes brightness across the full exposure
and analogue gain ranges, accepts digital gain endpoint updates while
streaming, and returns to runtime suspend after capture.

The exposure default is 500 lines, selected from unstretched illuminated
captures on the ASUS system. The init sequence programs the same value so
the sensor state and V4L2 control default remain consistent.

The register programming was extracted from
com.qti.sensormodule.hm1092.bin in the Qualcomm camera stack shipped for
the ASUS system. Jake Steinman independently identified the exposure,
analogue gain, digital gain and group-hold registers from Dell's
hm1092.sys. The available documentation does not identify the
test-pattern modes, so their menu names are based on output observed
during hardware testing.

The ASUS Windows configuration supplies a 24 MHz external clock. The
programmed PLL divide-by-12 pre-divider and multiply-by-90 multiplier
give a 180 MHz CSI-2 DDR link frequency, a 360 Mbit/s lane rate and a
36 MHz pixel rate. With HTS 1616 and VTS 750, the resulting frame rate is
approximately 29.7 frames per second. The driver reports the 1296x736
native pixel array, the 1280x720 active array and the mode's 1150x718
crop.

The sensor driver and its binding are SoC-neutral, so they are sent on
their own through the media tree. The board-level device tree and PHY
work that wires this camera up on the ASUS Zenbook A14 will be sent as
its own series.

Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
Changes in v6:
- dt-bindings: update the example to the PLL-derived 180 MHz link
  frequency.
- hm1092: replace the inconsistent 400 MHz link frequency and derived
  80 MHz pixel rate with 180 MHz and 36 MHz. The new values are derived
  from the ASUS Windows configuration's 24 MHz external clock and the
  sensor PLL dividers.
- hm1092: report the 1296x736 native array, 1280x720 active array and
  1150x718 mode crop as distinct selection targets.
- hm1092: add exposure, analogue gain and digital gain controls using the
  register map supplied by Jake Steinman. Keep multi-byte controls as
  separate writes, use group hold, derive the exposure maximum from VTS,
  and program the hardware-tested 500-line exposure default in both the
  init table and control. Hardware-test the controls on the 560x360 mode.
- hm1092: do not power the sensor on in probe(). There is no I2C access
  during probe, so leave it suspended and let runtime PM power it for
  streaming.
- Link to v5: https://patch.msgid.link/20260709-hm1092-driver-v5-0-a1f5baa6fe08@gmail.com

Changes in v5:
- dt-bindings: drop the data-lanes property entirely; the fixed
  single-lane wiring is not configurable, so it does not belong in DT.
- hm1092: implement the get_selection pad op (CROP, CROP_DEFAULT,
  CROP_BOUNDS and NATIVE_SIZE) reporting the sensor's pixel-array
  geometry, as required by libcamera.
- Link to v4: https://patch.msgid.link/20260705-hm1092-driver-v4-0-0a13ec274d89@gmail.com

Changes in v4:
- dt-bindings: make data-lanes optional for the fixed single-lane sensor,
  constrain explicit values to <1>, and omit it from the example.
- hm1092: add the copyright notice.
- hm1092: replace the private register representation and write helper
  with CCI register sequences and direct CCI writes.
- hm1092: use descriptive test-pattern names based on hardware captures;
  the available documentation does not identify these modes.
- hm1092: parse fwnode properties before creating controls and set
  read-only flags after validating control creation.
- hm1092: use the generic get_fmt callback for the fixed sensor mode.
- hm1092: initialize endpoint parsing with the fixed one-lane default,
  reject other lane configurations, and remove the redundant endpoint
  presence check.
- hm1092: use fsleep() and null-safe GPIO calls, and apply the requested
  declaration, brace, return-value and error-path formatting cleanups.
- Link to v3: https://patch.msgid.link/20260702-hm1092-driver-v3-0-85faa7ff4fec@gmail.com

Changes in v3:
- dt-bindings: add the Reviewed-by tag from Conor Dooley.
- hm1092: initialize RAW colorimetry fields in the pad format helper so
  userspace values cannot leak into subdevice state.
- hm1092: return -ENXIO when the required firmware graph endpoint is
  absent instead of deferring probe indefinitely.
- Link to v2: https://patch.msgid.link/20260702-hm1092-driver-v2-0-4f9f369d6a48@gmail.com

Changes in v2:
- hm1092: use pm_ptr() instead of pm_sleep_ptr() for the dev_pm_ops
  pointer. The ops come from DEFINE_RUNTIME_DEV_PM_OPS(), so gating them
  on CONFIG_PM_SLEEP dropped runtime PM on a CONFIG_PM=y, PM_SLEEP=n
  build.
- hm1092: free the control handler on the error paths in
  hm1092_init_controls(); the fwnode-parse and ctrl_hdlr->error returns
  leaked the handler.
- Link to v1: https://patch.msgid.link/20260701-hm1092-driver-v1-0-d1bd81e233b5@gmail.com

---
Ramshouriesh R (2):
      media: dt-bindings: Add Himax HM1092 NIR sensor
      media: i2c: hm1092: add Himax HM1092 mono NIR sensor driver

 .../bindings/media/i2c/himax,hm1092.yaml           | 101 +++
 MAINTAINERS                                        |   7 +
 drivers/media/i2c/Kconfig                          |  11 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/hm1092.c                         | 863 +++++++++++++++++++++
 5 files changed, 983 insertions(+)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260618-hm1092-driver-a6f2aaddf201

Best regards,
--  
Ramshouriesh R <rshouriesh@gmail.com>

