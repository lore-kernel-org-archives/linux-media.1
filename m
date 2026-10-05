Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884D9370D7B
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 07:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184240; cv=none; b=SHrzf+wU2W0Ej8R16CjbwXCvUhH6bZGN2AKZ00uCsY2r7eMNbY5t4Q6dxMiYbwURP9AMwzwH6Y7OdtJp2/b2V9UDqgb66qFr+aUemMb+rvEbNkGrCJm/pbh31eyCM23FBNvMvfVrAMruV1tV8/OFkrWgAWLNTjzNhBCUJD8xF2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184240; c=relaxed/simple;
	bh=W2DrySIcx70vrTbptdu3ALk9CYU49TBI2l50an7B/bc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YMROsvEeELr2hIcsznf3HIfuFZnGOXRVR2ywk+iHehyJnFPzppb+tNt4A74Cdr0toSq637AHDFYGp6enYQOzgvNWnvMZbN6wqx1HHh1LQ1ySHMJlc+yr0KOpLIoUYwplDbPGz9qvBTJ+JTD6jaWUv3EeZVBVqc9GfUrMZNqhmws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fiP25KQW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fiP25KQW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso15068985e9.3
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 00:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791184237; x=1791789037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9O/YxO2mPH+H7HGo9/k7HsTpYrEEKl4oBq8R1d8UlDM=;
        b=fiP25KQWkw6Qar+h0jRrP8oqk0+X2nrGVrzYX/ItTJIFlyULaifF01IUYp4qcepmqh
         K3heIZkY2l2llksz6/M1k1uAHLJGbpRcbsz8B+OV2qcW6J9aOTdkVfo7lvyqMujV4vw3
         aEEtf+7zs79yC++S0NBnucqyYoG2fnpQ+ni8rIf6wR64AQLDH8zGASpRh7wCdwDRUMgF
         hfdsbn6mr32vvyhdLdTsGOzmpFLAqfau3OKj8HUoJeOw4GcmvYZDr4TZqmm2bq+jw0To
         QfiL7BDE0Axwofo8iPIhTOTzrCoaU4F1VuM6v/JBDexQFaYOpT8qb6ojQEujCeIGZDIq
         16HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184237; x=1791789037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9O/YxO2mPH+H7HGo9/k7HsTpYrEEKl4oBq8R1d8UlDM=;
        b=wvy+T250XWtzneR15yEYE+LeSmHYWLEZXfU+KJQZP+nTTNKWYRNqLWEEo498+ohYIP
         En9S+il2yDktxwHTJyD2A6M60m1j/WP1dHejSG8UozsFF0IJkxh9uRoz513wsbJRzBZ4
         o7CSDcv6AtFcnVTXaJgD5WQpNScqjBtyC9pGuqnFXMpa5qOUjcqnLWjNwF9mrPOay/o9
         fj9LQor7aZftczUcG+eD7P+IBGK+zQWhRGCzjaHF0WYTMdFR/s0X3yzk6EIwM7cupE/I
         h66j5s/04+TV03Rc1KYz68rnXVvD1lK6h/rVtlNzMN3x9ebYRKB32QOdgo9flOYncDa5
         dAAw==
X-Gm-Message-State: AFuF++mz6elNbcWmN3SkCwKo1q79gdzo1SQd8utTKQmaPwz/cnTuNgcs
	b50O4mSKubsMv5ttvmxCYqfkZCzSKqNNr3wiZOF1R2SkVzZqKZ0oLHzGH3hAiY+Y
X-Gm-Gg: AYBFou0BqeaOxJwqF6rN9zaqzYJDGVVAaeuGS1CRVy0n3DbpIpCs4T4rEdqyFBKc6Ko
	h4GrOKt2Ud5w85wf50VQDhheYRzl4UJWl6+PS9qfCeMQwNcaImVKw07nbgv4IVGd4qlc9e+Mwu9
	emzmLAdqlpjZGHmba3AyTeBV8hSskIz/VWyDypuxpUtUIFR07WfZTAzqoox/QRuD2Ubcal20KfK
	oRcyIi6uOpEQbHCq83UxNHDhLDCM2Qo5WHMs2AcTh99vopqx0dw21twB/v4lslu143e2MkwAMcK
	rB9yrmxR3/Yo5wv7ibP7WAnaI+HGAleTG0emYTY4F5SJEcuZs44X7j/7hqOF6ROHxLTPMDHyGFA
	TNU/az8FaaF2DP1YVMx6YieuP2t+dGKSE7wm8jx4B8R5l2u7eCjutvHB6I7Hd73VofGyLmfwGi2
	+gHI852RQVGRozVBh4ga+z7vp+nnnSw5hQRlgR+eOCjBdEBBQDFwzk7uM2pY4wUexni+glv9IJr
	Lfik05ksBhk6nIlOiAGlvqosZFdZSVsVh0BAoDJ7NCucP8/mYocwkLF0YpBiwBzvMtaElTT5Esi
	Op88lL6C8CVbzQ34hpm8zfteDw==
X-Received: by 2002:a05:600c:4594:b0:4a0:22d5:908c with SMTP id 5b1f17b1804b1-4a1680eee54mr81493895e9.12.1791184236472;
        Mon, 05 Oct 2026 00:10:36 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm316749855e9.14.2026.10.05.00.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:10:35 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Bozik <robertbozik@gmail.com>
Subject: [PATCH v4 0/3] media: Add OmniVision OV32C4 sensor driver
Date: Mon,  5 Oct 2026 09:10:07 +0200
Message-ID: <20261005071010.7191-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

v4 of the OV32C4 sensor driver. v3 is at
https://lore.kernel.org/linux-media/20260829115832.8749-1-robertbozik@gmail.com/

The one open question from v1 and v2 was the second I2C address - the
write to 0x3e that the sensor needs before its main address answers -
and whether it belongs in a sensor driver. v3 could only say what it was
not. This version answers it with a measurement, and the design follows
from the answer.

The question that decides it is whether the block behind 0x3e lives and
dies with the sensor. Measured on the machine, polling 0x3e and 0x36
every 0.5 ms through a runtime power cycle and lining the polls up with
the kernel's regulator, gpio and i2c tracepoints:

  - sensor off (AVDD disabled, reset asserted): 0x3e NACKs, as does 0x36
  - AVDD on at t=1.0 ms, settled 3.5 ms; reset released 8.9 ms
  - 0x3e first ACK at 10.1 ms, reading 0x1001 = 0x00; between AVDD and
    the reset release it did not answer
  - the driver's 0x1001 = 0x04 at 30.1 ms; 0x36 first ACK at 30.6 ms
  - reset asserted and AVDD off at 4000.8 ms: 0x3e gone by 4001.9 ms,
    0x36 by 4003.0 ms

So it is unreachable without power, appears only once the sensor's own
reset is released, forgets the value written to it over a power cycle,
and disappears with the sensor. It has no ACPI device of its own, 0x300a
there reads zero (it is not an alias of the main map), and 0x36 has
nothing at 0x1000. The same register pair exists in OV08X40 at that
sensor's main address, named AO_STANDBY (0x1000) and MS_SELECT (0x1001,
0x04 for streaming) in ov08x40.c. The vendor Windows driver writes it
from the sensor driver as well, once, after reset and before the chip id
read, and never reads it back. I take all of that to mean the block is
part of the sensor and the sensor driver is its owner.

What changed accordingly:

 - The driver claims the second address with devm_i2c_new_dummy_device()
   and writes it through a CCI regmap of its own; the bare i2c_transfer()
   is gone.
 - ipu-bridge no longer instantiates a VCM for this sensor. The SSDB
   says vcmtype 2 and the bridge would put a dw9714 on 0x3e; dw9714 has
   no id register and binds to anything, and that client would hold the
   address the sensor driver needs. Patch 3 carries the exception, so
   patches 2 and 3 go together.

Two smaller things turned up while re-reading the driver for this:

 - The 10 ms after the software reset was a busy wait. The reset sat in
   the mode table with a delay_us, and regmap_multi_reg_write() turns
   that into udelay() on a regmap without can_sleep, which the CCI one
   is. The driver now issues the stream-off and the reset itself and
   sleeps; the table is the vendor's sequence minus those two entries.
 - power_on() returned 0 when the enable write failed. It now fails and
   undoes the clock, the supply and the reset.

The power-up timing, your "0 and 5 ms" on v1: I did not follow it then,
and I think I do now - nothing after the supply, because the regulator
core waits for it, and 5 ms after reset. The measurement above agrees:
the block answers about 1 ms after reset release and the main address
within 1 ms of the enable write. v4 uses 0, 5 ms and 1 ms, verified over
a cold boot, 20 runtime power cycles and 15 stream starts without a
failure.

Where the numbers come from, stated plainly this time, because v3 said
both "copied 1:1" and "measured by me" about the same table:

  From the vendor Windows driver (ov32c4.sys, FileVersion
  70.26100.2.18255):
  - the mode register table (1787 writes, at file offset 0x31300), of
    which the driver drops the first two entries, stream-off and reset,
    and issues them itself;
  - the 400 MHz link frequency, carried there as bits per second;
  - the chip id 0x563243;
  - the write of 0x04 to 0x1001 at the second address;
  - the registers the controls use (exposure 0x3500, analogue gain
    0x3508, digital gain 0x350a, VTS 0x380e) and the rule
    exposure_max = VTS - 32.

  Measured on the sensor:
  - the chip id, the register meanings above and the exposure rule,
    confirmed against what the chip reports;
  - the gain ranges: analogue exactly proportional between 0x100 and
    0x7c0 (1x to 7.75x, 0x100 being the power-up value), digital
    proportional with 1024 as unity, clipping to black one step above
    16383 - the obvious donor, ov13b10 on the same registers, puts
    analogue unity at 0x80, which is wrong here;
  - the timings: 320000000 / (4080 * 2614) = 30.005 fps against a
    measured 30.00; the power-up sequence as above;
  - flips preserve the Bayer order, so the media bus code never changes
    and the crop compensation ov13b10 does would introduce the shift it
    undoes there;
  - the 6560x4928 array and 6528x4896 active area, from the window
    registers of the table, agreeing with the vendor's product brief;
  - the second address, as above.

The rest of the series is as before. It adds a driver for the OmniVision
OV32C4, a 32 megapixel RGBC CMOS image sensor. It ships as the
under-display camera in the Lenovo Yoga Slim 9 14ILL10, where it is
enumerated through ACPI (_HID "OVTI32C4") and feeds an Intel IPU7. The
driver supports 3264x1840 at 30 fps, 10-bit Bayer, 4 CSI-2 lanes at a
400 MHz link frequency, with exposure, analogue gain, digital gain,
vblank, hblank and flip controls, runtime PM and .get_selection. Tested
on that machine: the sensor probes, streams at a measured 30.00 fps,
frames arrive complete, and the full path to a processed image runs
through libcamera's software ISP. The driver has what libcamera's sensor
driver requirements ask for: the five mandatory controls, the crop
selection targets, flips that keep the Bayer order, and the orientation
and rotation properties.

v4l2-compliance on the subdev, kernel 7.0.0-38:

  Total for device /dev/v4l-subdev4: 46, Succeeded: 46, Failed: 0, Warnings: 0

Static checks: checkpatch.pl --strict, sparse (C=1), W=1 and
dt_binding_check.

The series applies to media_stage.git; base-commit is below.

Thanks,
Robert

Robert Bozik (3):
  dt-bindings: media: i2c: Add OmniVision OV32C4
  media: i2c: Add driver for OmniVision OV32C4
  media: ipu-bridge: Add OmniVision OV32C4

 .../bindings/media/i2c/ovti,ov32c4.yaml       |  105 +
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov32c4.c                    | 2716 +++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |   26 +-
 6 files changed, 2865 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov32c4.yaml
 create mode 100644 drivers/media/i2c/ov32c4.c


base-commit: 4900cad020c0580dfb1be27776ff10a4ef110cfa
-- 
2.53.0

