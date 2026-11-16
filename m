Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851525;
	b=bsOLBySOFNflkXtA+E58MoFPiHFKqwukNBFW8UCNtSUyNzgNsSdU07Npr647vqL3mmkZ
	 2mujsZ98nIhjhuJrGpDooZJy+I91av+BqEK2kYuyWf2C39ZYSX6/9QwrxssGIfoZQMXjX
	 Gv2fCK/AnD3uefy8NNXZfCNwSWmkw7/EyIxw0r0AO4fraX6IGjak0BIBZa/+O+IskiZn7
	 4g4IAnnromtDX9dC4NSjY/isOCKNjKqkuWYXgDIDA8YG7sV/z20errxhdjhSfdeZF9ac7
	 94Gc14paX+cYkGI6MWmILsEuN4Hick/DznItAmT6tvyxrMZB4qH6rARa4IiNEDndnjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gyuCA352CKmEx6btp0JZpNwIO4QYJ/q79Bii/WWiLxc=;
	b=ZdYMRtAgWDOrJFWJ6eus1J+FgweyTZzZk+xFH1N1vEtKLIQbxunv9FLUhJZrXjjyc0mw
	 CtkpfLA3vqHgaJ/cFp81i4rLPsXxnaJWZIVKMRtL7REiIPelJzIImxa/n+YE72dSDTqJo
	 4aA9XTk0fjwUrwUuCjmo1GuHBk48+xZ/ylNjK0TabHw/HMSSoyQ4+3yLI0GBLSOS6Mjzb
	 L3/QP34koTCf1B7yDcvCcXpOsDDKQQZ4cL7cSmuJTsixanLXvMW3PmSvUqCoH/Tne1ONu
	 9cYYO1hnWSHk7ROP4k2PhumywoNvvlRftreXmPysCcHsonfi3VVaod4iR8a7m0YLIUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="SvXohw/2";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AC7606A893
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8AC7606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvXohw/2
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so29782585e9.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851522; x=1795456322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gyuCA352CKmEx6btp0JZpNwIO4QYJ/q79Bii/WWiLxc=;
        b=SvXohw/2CW5oHL6eyf1QuCkPdTEqkgf/s/Tt0OZGyMBsqLktE+Fzmk02xmV27fy4cj
         Egy4bvVoISk8jdgt622SjxCykoWaAQ2jdIePpkp5n2HcD7t8N94pldaQXZ7X4NHQ5+D+
         IFpzkgl6l+3ROzx2eeb9SfFlZHRm8GW9W6TnLIcyEaGKU9ooIErEoqhgwNTDrRz6Eb5T
         GII9mg/VJjWqh3b771n7YYYvN03evDxjQO6rmvzLAlFH7+vqsUTZGrC4K2LSsmOExDaz
         cctBjOyjzZtyYfrFKUW+yeA/vSjxgV0WpQE3K2+s21kZ2s1Ktwo6Q7IpE0tXnR0klyrX
         N6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851522; x=1795456322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyuCA352CKmEx6btp0JZpNwIO4QYJ/q79Bii/WWiLxc=;
        b=r8pCJgMSUkMHnTetzq3H2rV3//AUUieV0DL2S9QFXG+Ruro8yl2f9nF84lkhsCgO9E
         DD96Jzf32LcDNG7fHZQ9tqpcr7G72nQh2QEv3OsbPqnjKVG/zcgKBdpaNwzqrbN+OyID
         DHvxXtLNGIfHJt24YrMzJE8X0bIL6bzGRstTR0k/xK4+mIWLcLvx4wg6MWhqUJ3TX6ey
         Hs/DBT3I9FANXWjwpLMRp74QgK+14AJsTpb7EeKwFHp3f3geG3ISN9Mi8HcYIn5UD3d6
         3uKgFwRNRK98+jkiAi0GEBmqMferVvU6FXV+aNAexITBqtEyM2AncjJ4oKunooqKVRO5
         jGeQ==
X-Forwarded-Encrypted: i=1; AL+hErEdcbSnagms+tFJz6NnRHHj0ekulSBFeua+bLFwnWunw1Ch57aPEZCNrQv/K+zS9/sZRHEvvOuKHOMobg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9MgcEc7K2hLiR6YqLPb+UIl2QzqPOyGzZSQjFm8ShhDo9AuCHu
	1PvY4I+brbUgWs0oejXpRQpthqdEAWQ46PX7vKjhouAcAf18JG2Ea7Qk
X-Gm-Gg: AYBFou1g/Yjv7JRPMXoVqziiRZ+fiNwplkpNF79Mj6OAbtWUijYgaz8qlCRrNigd/UO
	Pln61CG+tKee9z9zLWA8u2Hk0v9MiDFLg2woO2D1iFkBA/QGkKugiJv5kH6NXXNGNIWCtjNMahB
	C6GE3SIf67uPCwpbuYenva4g4byTnqrhG8Rg6ErvX3VeOIn4emiPXny1U/Slw4dhL0ozAvhPc5T
	rgh+ojPZwigtHE3v9iSJJ+q7u80Nl40YFPBy5VpotX34HoizS7tazJayV+rSL+dNmQjFISYu1KU
	9jF0nn4tLDi3iV1oedv0i1GUm91AZko4aMzJXJrMYiPCqJBDkW3k7FI+qawcT5QAHYazXu8sg7v
	bE7Hgm7gaS/esM7f9j9QtuvRagUi1UP4QGzmrDjKk7fTqdc04MXSGTEwM+jGAdFduEGN6JKgjw7
	BWOgtoJdcRVpbKYpw4zowXCL7ixTeuiQV23yIDPvGeIUhLEAhynvdFe4XCvVEu3rXvWlz46ez7I
	lmLp+XLBYy2N61iatEUEhreQDiR4UkV1YDS5e4m1m+twaRXvHuTq5JPpSGSW8pAn6CqgBbpBDIv
	aKv4utg/jjvc/IVlAWu9M0xUbfHIdCZqmWxre0EMmaRzwhj2bMhuQ/HECxS/jQLm9F4=
X-Received: by 2002:a05:600c:3d91:b0:4bb:6861:657d with SMTP id 5b1f17b1804b1-4bb686166e8mr143043725e9.21.1794851522066;
        Mon, 16 Nov 2026 09:52:02 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm4546075e9.12.2026.11.16.09.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:01 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH 0/3] media: Add Sony IMX175 sensor driver (Lenovo ThinkPad 10 rear camera)
Date: Mon, 16 Nov 2026 17:51:48 +0000
Message-ID: <20261116175151.20150-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series adds support for the Sony IMX175 8 Mpixel raw sensor, the
rear camera of the Lenovo ThinkPad 10 (20C1/20C3, Bay Trail), using the
atomisp driver through its v4l2-async csi2-bridge path:

1. a new standard sensor driver, drivers/media/i2c/imx175.c;
2. the INTCF1A ACPI HID in ipu-bridge;
3. a 4-lane sensor config entry for INTCF1A in the atomisp csi2-bridge.

Notes for testing on this machine:

- The firmware exposes the ISP in "ACPI mode" by default (subdevice of
  the IGD), which atomisp does not support. The hidden BIOS setup option
  "ISP PCI Device Selection" (Setup variable offset 0x235, value 2 =
  "ISP PCI Device as B0D3F0") must be set for the ISP to appear as PCI
  device 00:03.0.
- The IMX175 probe fails intermittently at boot (-EREMOTEIO) without
  "media: atomisp: csi2-bridge: Don't cycle the PMC clock if its rate is
  correct", sent separately [1]. With it, the probe succeeded on 10 out
  of 10 boots in my testing; without it on 8 out of 10.
- The OV2722 front camera of the same machine needs "media: atomisp:
  ov2722: Report SGRBG10 consistently as media bus code", also sent
  separately [2], but is not otherwise related to this series.

[1] https://lore.kernel.org/linux-media/20261116173307.14169-1-volodymyrchapman@gmail.com/
[2] https://lore.kernel.org/linux-media/20261116173143.13584-1-volodymyrchapman@gmail.com/

Testing, on a media.git next kernel (3fc9303dba01) with this series and
the two patches above, on a ThinkPad 10 20C3 (Atom Z3795):
- the binned 1640x1232 mode streams through atomisp, alternating with
  the front camera; the full 3280x2464 mode was tested as a still
  capture, as atomisp limits continuous capture to 1920 pixels wide;
- the sensor's colour bar test pattern and real scenes have the correct
  colours, also with horizontal and vertical flip;
- v4l2-compliance 1.32.0 on the IMX175 sub-device: 46 tests, 0 failures,
  0 warnings.

Not supported: the voice coil motor (the firmware does not name its
type) and the LM3554 flash.

No DT binding is added, as the sensor is only known to be used on ACPI
systems; one can be added when a DT user appears.

This series was developed with the help of an AI coding assistant
(Claude), which wrote most of the driver code and commit messages based
on Intel's register tables, existing sensor drivers and my testing on
the hardware. I have reviewed the series and tested it as described
above.

Volodymyr Chapman (3):
  media: i2c: Add Sony IMX175 sensor driver
  media: ipu-bridge: Add Sony IMX175 (INTCF1A)
  media: atomisp: csi2-bridge: Add IMX175 sensor config

 MAINTAINERS                                   |   7 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/imx175.c                    | 797 ++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |   2 +
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |   1 +
 6 files changed, 818 insertions(+)
 create mode 100644 drivers/media/i2c/imx175.c


base-commit: 3fc9303dba01676c2090768126e5327e341b7761
-- 
2.43.0

