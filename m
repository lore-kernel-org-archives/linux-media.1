Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795319222;
	b=364C5R4ezb37OWLSmz5dvQevtMrFQQjW5x+kojKwnmJwZoNXm2AmNrOK6t5oObkj+0NZ
	 zMLa1tx2BgbwaNbNaSGWpLE2FSmtbAmMuh/jkHUsX5cbzOoZmOwP+nJeof505GTKW5SoR
	 T1lJILBKrzUqpQQUTKsLb4zPuM3zGEOU/TyjCTfsWp+hHnK1Zmp5PfRNGU5TKbXNS1BOt
	 TG/RwAJX2wAWcmmTvvixTS9UK56CZ2LhYblTkgvuJxEKf0aopAy625Lx+cuZH6zV3VqfL
	 DpO7abHuqUx689aKWD+0eZuEE6DCeEPRRFmosRD2u03tXf6wuqHU5zVZ2Paz17/Ph4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795319222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D8e8pIUItvuPYRgF3NPYFE6tJ5ovr6dpnf69J/+UZLk=;
	b=xekIX/Pp2tsvqYOVD6jOQZIcxPjKnl5RExLl6Uv18geUQiXXEkEOX4O+g2FyvLp93Vpc
	 QDG2rG51A9tpvCSEdeOZmBW2nhGQ+KBbzecl+2BnW24Apni1ErbT8eWTX6GHQExNgEEKV
	 krnPYHHJF7Hc5vEsAW/lsQEQ/5H9hijnAvYpzfWeRNOlRV7UCPZZB87Qf9jotB50WL56S
	 LODnhZ7Ji2z7nOpmOle3lOtG9JZL8iCM/g3wS18GEIHT95uF6FCTLCsAzpr/nT1JiEKWg
	 IwYedSOt6jH/c/wbHwzMzMZc213B1LHHIn3HgNa5kyi6jOWdc30rJuGIN9MlAU+jXug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Q/IZHBMm";
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D655606A320
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 03:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D655606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q/IZHBMm
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f066274caeso4234415ad.2
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 19:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795319221; x=1795924021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8e8pIUItvuPYRgF3NPYFE6tJ5ovr6dpnf69J/+UZLk=;
        b=Q/IZHBMmdSxT6CxM4EvKEfeKaTHx1t6Zb7X8DvWa0G272RxztavonpeZ5Xx8v2Hkfb
         L/2UCBQogUOgb0VPMa3MaikEgxY94MAXUVEAwGmEJj2Z4kUIQmfNkYf2G4ai+fIMjmf1
         Db7YyFA7Tb4jI9BH63FWnTNhq6GOfYE43hWes0rVX9cbC886Q5AUXqW+FFz+HGeY2kma
         nJJQRXi7OiGyBNjzwFDnmPRovRxxNXObua7aMcBm3LNj/0LfK+5L4pOVe7nnWGu7JdHm
         Rzxlq8H2ylcSS/3Q1oyTktrcn3Ug7iszanI0nMJu6qQGcd/NRmsYbKUHCQZ+4oaCZt7D
         WQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795319221; x=1795924021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D8e8pIUItvuPYRgF3NPYFE6tJ5ovr6dpnf69J/+UZLk=;
        b=HdyxtFB+1KoyNzEM5ldmikcmTZEslFnfc3Y9hflABbo0tN+MNmzoA6Ve60nlkvCRUo
         dgm1HYhUo8MX3u+JMNXi3TVEL6h1kO+OSE78CAAnlvkjeg0LIStzvVP8LQSft+9MiWIX
         RUIgqwaChu9Oc3DDFbX/UzSTHN9mD45d0iRmCZa+bHMC8XKmw6m0xAqjSqk6xPYWkf8d
         01SWg8xwweQrt26cYjpPdcK5JopSKDwSC6ubgCoaGGrV3q/V7lp4OxhS4+KnIncwUNl8
         mhHCV2oA4qUCV22Op8l/vKOkrpyk5v29DEUKvREC+yRWSPmsuyoLnfX07xIU9ipohf4J
         GQ/w==
X-Gm-Message-State: APuU4Z8Vzw4E6zkpu1gtCxfDTBYoseRf4LuurBzSnCh6OsDHqNJWlXuw
	hrBFKLXMXjP6C34QeB7JFSbV3Gumby4cragTNnRqLvDKsH8TqvbywGwCX6RKIlBWJ0A=
X-Gm-Gg: AZFdTZeXhOMR2YlTWCr1wGrk8ciFfEY2IDqqUEqkO56JY4iGrPgq/wJJEpl+dscmbqz
	aC16RVJFiCAeWRacq1wgU6pHtfbhN8ai6nXbenh1BbaTrdypL3YZmjShjFc1mMQRa3iOs6QRKhM
	zG8Q663HulsI4D5WmbMpmB5ziyiRo/QLvht3SiO8588cL6FLon5bG1MHWMW++vCq7Ola0xsX+Ub
	g1HOtS35AkQqzFOAEATdfjVuC6HjpC3LlQxpe5W1B+s5hdtekPWdSZK1u9r90xAMzohE4rfRL4e
	44HeZi2CltkC/52XSC0noggeFs4eYVA5oexmX83IzsdZvTw7syWEecuuV28a7uJdMGwge0kEEuY
	BkWpuQB93ssAUzlVPnfUGpM+HpwzaMwuwFh2LenIScMWP1iezFtMXUitk2+4GL5xU52nswQ0Xdz
	bEJ3C2MOqNaIy5PunDsEr4mM9XPa/DDdmsODEU4xZ42PjTcwRd3SIAX5REkAYZ7MCGJxD49U10n
	mjVrPtBJ9iyVRkBpCDqFvTf7MPj5x7ougUZfJbilV3WxI8C84//Y/8ZSZk2xnP+ilDwl02HtZ5w
	rFvN8p7G0kb6ch+NknEeqhG7XgHXRMs9nlABaSu5S5aSznP91HMlMI+z/kiXqXzofFMercfrrQX
	F84aEJXcCW0tjBRgN3YU=
X-Received: by 2002:a17:90b:5109:b0:3b4:e3e:650 with SMTP id 98e67ed59e1d1-3b41c9c40a1mr7014717a91.67.1795319220695;
        Sat, 21 Nov 2026 19:47:00 -0800 (PST)
Received: from default-vnic.degu-barley.ts.net ([161.118.211.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm11040018a91.17.2026.11.21.19.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 19:47:00 -0800 (PST)
From: Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chernyav.a@gmail.com,
	Tuan Kiet Huynh <huynhtuankiet33@gmail.com>
Subject: [PATCH v3 0/2] media: i2c: Add Samsung S5K5E8 camera sensor driver
Date: Sun, 22 Nov 2026 10:46:54 +0700
Message-ID: <20261122034656.1093369-1-huynhtuankiet33@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121120731.2028810-1-huynhtuankiet33@gmail.com>
References: <20261121120731.2028810-1-huynhtuankiet33@gmail.com>
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

Add Device Tree bindings and a V4L2 subdev driver for the Samsung S5K5E8
5MP RAW10 CMOS image sensor.

Initial patches were authored by Andrii Cherniavskyi (shown in the
git shortlog below); v2 and v3 updates, active-state refinements, and
hardware testing on Xiaomi Redmi Note 4X (msm8953 / mido) were carried out
by Tuan Kiet Huynh.

Changes in v3:
- Rename driver, DT binding, Kconfig symbol (VIDEO_S5K5E8), compatible
  string ("samsung,s5k5e8"), and MAINTAINERS entry from s5k5e8yx to s5k5e8.
- Rename standby-gpios to powerdown-gpios in both the DT binding and
  driver, and switch to sequential regulator_enable() (vddio -> vdda ->
  vddd) with powerdown-then-reset deassertion (matching the Samsung S5K5E8
  OEM PWR_ON sequence).
- Use RUNTIME_PM_OPS() with pm_ptr() instead of DEFINE_RUNTIME_DEV_PM_OPS()
  per Documentation/driver-api/media/camera-sensor.rst (runtime PM only,
  leaving stream suspend/resume coordination to the bridge driver).
- Adopt full V4L2 subdev active state: drop duplicated s5k5e8->mode and
  err_restore_mode, derive mode from state in enable_streams() and
  s5k5e8_set_ctrl() (guarded by WARN_ON_ONCE(!state) -> -EINVAL), and
  store/return active and try crop rectangles in v4l2_subdev_state
  (CROP_DEFAULT returns mode 0's crop).
- Align 2592x1944 X_ADDR_START (0x0008) with 0x3306/07 and reported crop
  ((8, 8)/2592x1944); program 0x3307 (0x00) and 0x3308 (0x0a) in
  1304x980_60fps_mode[]; align 1304x980 MIPI link PLL registers (0x0306,
  0x0308, 0x0820/21 = 0x0344) with Samsung OEM binned preview so both modes
  share the 168 Mpix/s VT clock and ~418 MHz actual (420 MHz nominal) CSI link.
- Update active pad Bayer format code synchronously on V4L2_CID_HFLIP /
  V4L2_CID_VFLIP changes, cluster hflip/vflip controls, and reject active
  format changes with -EBUSY while streaming.
- Pass NULL ops for read-only V4L2_CID_LINK_FREQ, V4L2_CID_PIXEL_RATE,
  and V4L2_CID_HBLANK controls, set V4L2_CID_PIXEL_RATE minimum to
  pixel_rate, check ctrl_hdlr->error in s5k5e8_init_controls(), and clamp
  default exposure in s5k5e8_set_ctrl().
- Set V4L2_SUBDEV_FL_HAS_EVENTS, use pm_runtime_get_if_in_use() == 0, call
  pm_runtime_dont_use_autosuspend() in s5k5e8_remove(), remove redundant
  0x0100=0 writes in mode tables, document init_array_setting[] as the
  vendor flow, remove unused S5K5E8_AGAIN_SHIFT, add copyright headers, and
  unify probe error reporting with ret = dev_err_probe() and an explicit
  chip ID mismatch message.
- Update DT binding to require vdda-supply, vddd-supply, vddio-supply, and
  endpoint data-lanes (and enforce data-lanes presence in
  s5k5e8_check_hwcfg()), drop driver-mode claims from description, add
  data-lanes and powerdown-gpios to example, and add Tuan Kiet Huynh as
  binding maintainer.

Changes in v2:
- Rebase onto linux-media next branch and update .set_fmt/.get_selection
  for const struct v4l2_subdev_client_info *ci.
- Convert PM ops to pm_ptr().
- Place DT binding MAINTAINERS entry in patch 1/2.

Verification:
- Build/schema checks run against media-next:
  - yamllint + make ARCH=arm64 DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml dt_binding_check: 0 warnings, 0 errors (samsung,s5k5e8.example.dtb built cleanly).
  - ./scripts/checkpatch.pl --strict (with spdxcheck.py): 0 errors, 0 warnings, 0 checks on both patches (123 and 1071 lines checked).
  - Compiled drivers/media/i2c/s5k5e8.o with GCC W=1 and Clang LLVM=1 W=1: 0 warnings, 0 errors.
  - Applied cleanly via git am onto media-next (origin/next).
- Live hardware tests run on Xiaomi Redmi Note 4X (msm8953 / mido) using
  downstream Linux 7.0.9-msm8953 with this driver backported (without
  media-next's const struct v4l2_subdev_client_info *ci parameter in
  set_fmt/get_selection):
  - v4l2-compliance -u /dev/v4l-subdev17: Total: 46, Succeeded: 46, Failed: 0, Warnings: 0.
  - media-ctl -d /dev/media0 -p (front sensor entity):
    - entity 428: s5k5e8 4-002d (1 pad, 1 link, 0 routes)
      pad0: SOURCE [stream:0 fmt:SGRBG10_1X10/2592x1944 field:none colorspace:raw xfer:none quantization:full-range
                    crop.bounds:(0,0)/2608x1960 crop:(8,8)/2592x1944]
  - libcamera cam -c 2: verified streaming in both 1304x980 (59.81 fps)
    and 2592x1944 (29.89 fps) with SoftISP and unbind/bind cycle.

Andrii Cherniavskyi (2):
  dt-bindings: media: i2c: Add Samsung S5K5E8 image sensor
  media: i2c: Add Samsung S5K5E8 camera sensor driver

 .../bindings/media/i2c/samsung,s5k5e8.yaml    |  109 ++
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/s5k5e8.c                    | 1041 +++++++++++++++++
 5 files changed, 1170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
 create mode 100644 drivers/media/i2c/s5k5e8.c

-- 
2.43.0

