Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1420C3A6B8D
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 08:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422981; cv=none; b=iTGDW9Er3koFI6Qizcn0n6nN3GQXuhP2urwuJengN7j3yjw/beo+uw2uoPdVK4qFwskuaqyJK3Dx6YQLVHtu8pmicq0qKhKYnIZhLnyRQdFuefVTluTNVM1PTiRiEqtgGTmZL9uwQGd84Y6YqNch/3AFxJsIFsnxC8V3axAUMbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422981; c=relaxed/simple;
	bh=B8k9W36qpdUALPo0KY6RtY4UQxHuEe+pcFoeqiCFWXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OE680qVaSW547GxlX8h4iqtwgJAR5yO+a2qnMbcnjfsO071WNrwSLXPI+/oA5yO8xu8VCKweJVZw9YvnJ0WF7gnl3bwkcfiO+sfMo5sjm9fuIw6Y77UcFNmByyCVgB23M9ppRnSCpseT6CfHLFWjoa9/dxx0AB199B5vEIjbBZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CS+OaJ+Y; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CS+OaJ+Y"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49cd9add88aso12866125e9.3
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2026 01:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788422978; x=1789027778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G7kY/xN5B9q/m7QFO3Xeq8O1iGK9sSQCbATSts+IshU=;
        b=CS+OaJ+YCPWFJW9NOhVmlff5Ei9p90z5h1mb6M+lS955M1mJrmuHtBlbZM2bF5Rb4m
         UEAQPxSd5mw9bgSAy5+cilRKPT8thffOXvjo9IqI9lqAK8kciRVXEvhvxngflobW2JnA
         FQfGbxeqerwDUjzhFtV1GLpo9BGhVVMFebCnS3G2sth+sRllvGiMeFe9W8RC5m/o4AML
         Lxaof8MsC+pD/E+oafTRFcwTxLtgS7xK8JHmrRusvFsywWE5GnfnFYfd8x+oFYs7HEPW
         QGGcZ4Uo8O41ZWAFJclIzZD/vysk7sCphiwB4r268yjgZDRCktNs6FE/Pb7XLXYrokuK
         TRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422978; x=1789027778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G7kY/xN5B9q/m7QFO3Xeq8O1iGK9sSQCbATSts+IshU=;
        b=s6WR7ufHoiUixT5NPeiIySOfw2jkxenAT2I3ZHtQrwFsb9BFkcbCjK/ajTDnTyHWDk
         YOHoGriNWzgDpmGZXuxna7z9VnsKsqVUVeRSzXHr1kkJ+928V7BBBRkIGxfM8qpCr5Km
         6j4zwNe9H1AqPcA4AAExNVeT7Of1UeV7ea/JdV40CZ6Km7F9XXZl2wZjPW00Oa3bWils
         tLEYB7llSdb+OY32OuSUT3YAxZiK106nkGT81oCJabtoQ6SSd7K+GkWpfjKxN1e48+Ac
         qlFCO5tL28WhDeRBVDKWDbbBazKTN0lsxsudD4eIYQq4CLmvFbqEXXwOtEy+KrvTO+9G
         FV0g==
X-Gm-Message-State: AFuF++nbvQ7dQRWHIyfyZlIT4+IpDZk5K06Jr8Wo+swQbBGtap2C/vbh
	cWXtWS7Kl00BS4Lww5DqrrTogwZT0BjmKCxp+iRXI9jayWw5eXqZugRoER7xXj3j
X-Gm-Gg: AYBFou3VymWp+77Cu2naF3rPiwwvE8W3Vrnu9gyu771i5PUewqw6EARHLVlpVqHyoCm
	fydy6UmUjJL3BAlGPI6nR4XfOaX+K8pDsomUYivW/daiOQrYDcN0NsSu0hUnkK6jvXFC8pOZgqA
	mHktVU/P8OmAMel8roxQPcdbQb/aMFcvdSh8rRo8qtWebNct2iqeX7f4UDbUUAGjjJVj+Mwydmc
	iN3a8eqThOf+rYdqrrweQjThxZBSAGVjEb/qq8cONycvfCaR9yY3b0GfhkJIDh9BFSbCCvf+2oQ
	PFn6rNtk/0Zs6MeOEUyXlpaXlRv4q4UKrNXuiSMmpTvfpyIKVcDac+XySS5Hig9Dxghil+K+GhN
	k1G8ouIW1L8YgcRKsBqSKAIzhDAKuKB9X1BqidaGG5s7ehyjTNcfC5g3KR2xXMFaZNNcl3PLDyV
	TTGiKgcXtsqrrJHUZ0KWEsJsPelhY5rm91pBAqKaQFjuc/QqBFIc6jIGVXu+5F0ksmqEP1dkBZc
	VSSf/nDvhw13jjA4OcfGGkitI07FGceCyq0n2O/cZLM75LzslkzoQ==
X-Received: by 2002:a05:600c:3494:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49ce57ee273mr192088595e9.6.1788422977972;
        Thu, 03 Sep 2026 01:09:37 -0700 (PDT)
Received: from localhost.localdomain (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d6029sm51577835e9.6.2026.09.03.01.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:09:37 -0700 (PDT)
From: German <germanpapulindez@gmail.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [BUG] media: no sensor driver for Sony IMX681 (Surface Pro 11 Business front camera, ACPI HID SONY0681)
Date: Thu,  3 Sep 2026 10:08:50 +0200
Message-ID: <20260903080854.16266-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The front camera on the Microsoft Surface Pro 11 Business (Intel Lunar
Lake / IPU7) does not work on Linux because there is no in-kernel
driver matching its ACPI hardware ID, SONY0681. I'd like to report
this gap and share diagnostic evidence, in case anyone is already
working on it or can point me/the community in the right direction to
get a driver written and reviewed properly.

System
------
- Surface Pro for Business 11th Edition with Intel (Intel Lunar Lake, IPU7)
- Kernel: 7.2.2 (Arch Linux, vanilla, CONFIG_VIDEO_INTEL_IPU7=m)
- CONFIG_VIDEO_OV13858=m (rear camera, separate/known sensor)
-

Evidence that the hardware is present and correctly enumerated by
firmware, but has no matching driver:

  $ ls /sys/bus/acpi/devices/ | grep -i SONY0681
  SONY0681:00

  $ cat /sys/bus/acpi/devices/SONY0681:00/status
  15
  (0x0F: present, enabled, shown in UI, functioning - per the ACPI
  spec meaning for _STA)

  $ zgrep -E "IPU7|IMX681|OV13858" /boot/config-$(uname -r)
  CONFIG_VIDEO_OV13858=m
  CONFIG_VIDEO_INTEL_IPU7=m
  (no CONFIG_VIDEO_IMX681 - the Kconfig symbol does not exist upstream)

  $ dmesg | grep -iE "ipu|SONY0681"
  [    0.010327] ACPI: SSDT 0x0000000071F95000 0000E0 (v02 INTEL  IpuSsdt  00001000 INTL 20210105)
  [    5.492575] intel_ipu7: module is from the staging directory, the quality is unknown, you have been warned.
  [    5.536601] intel-ipu7 0000:00:05.0: enabling device (0000 -> 0002)
  [    5.536609] intel-ipu7 0000:00:05.0: Device 0x645d (rev: 0x4)
  [    5.908673] intel_ipu7_isys: module is from the staging directory, the quality is unknown, you have been warned.
  [    5.927268] intel-ipu7 0000:00:05.0: no subdev found in graph

  $ media-ctl -p 2>/dev/null | grep -iE "imx681|entity"
  (only generic "Intel IPU7 ISYS Capture N" and "Intel IPU7 CSI2 N"
  entities are present; nothing corresponding to a sensor subdevice)

  $ ls /dev/video*
  (32 video nodes exist from the IPU7 ISYS/CSI2 pipeline itself, but
  none of them is backed by a working sensor subdev for the front
  camera)

  $ lsmod | grep -iE "ipu|imx|video"
  intel_ipu7_isys ...
  intel_ipu7 ...
  ipu_bridge ...
  (no "imx681" module - because it does not exist)

Summary of what's confirmed missing
------------------------------------
1. No V4L2 sensor driver in drivers/media/i2c/ matches ACPI HID
   "SONY0681" (no CONFIG_VIDEO_IMX681 Kconfig symbol exists).
2. drivers/media/pci/intel/ipu-bridge.c's ipu_supported_sensors[]
   table has no entry for "SONY0681", so even if a driver existed,
   ipu-bridge would not create the swnode/i2c device for it during
   IPU7 sensor enumeration.

What's independently known about the hardware
------------------------------------------------
- ACPI HID: SONY0681 (confirmed above)
- Sensor: Sony IMX681 (per ACPI HID naming convention / Windows INF)
- Interface: MIPI CSI-2, handled by IPU7 (Intel Lunar Lake ISP)
- Rear camera on the same machine uses the existing ov13858 driver
  and ipu-bridge entry "OVTID858", so the front camera is expected to
  follow the same general enumeration path (ipu-bridge sensor table +
  i2c sensor driver + ACPI-provided clock-frequency/regulators via
  int3472), just for a different sensor model.

I don't have exact register-level documentation for the IMX681 to
propose a driver myself, and I'm aware there's already some public,
independent community work in this area (e.g. an RFC referencing
IMX681/Surface Pro front-camera support was posted against the
linux-surface kernel tree). I'd rather this be picked up/reviewed by
someone with the datasheet or existing register-level knowledge than
have me guess at register sequences, so I'm filing this primarily as
a hardware-support gap report with reproducible evidence, rather than
a patch.

Happy to test on real hardware (boot logs, i2c probing, media-ctl
topology, actual image capture) if someone has a driver candidate,
in-tree or out-of-tree, that targets ACPI HID SONY0681.

Thanks,
[TODO: German]
[TODO: germanpapulindez@gmail.com]
