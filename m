Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721203;
	b=xeQZyMQVAkemIBFWT429iYfYH1OKludZwqOLFiiFyFv9cndmTRPjUPQOw5tpEMCOFIeQ
	 9H6oskxG2xLTmvc+18GX5TyDiA1BIEsOVJaEYYMI664D1HqER34v9k1OAu3yTfS88rLzk
	 wEFTOrKAO1arPasinx7yshpxk+MhA5WXkA8oECKK6AZxbcajBVP26VHBbav+U7KGE/2JB
	 9Hoks20Maf8CqRAj1ldO+3RGSnjKFajr6yoXOmPPyTTzejrCiqJnveOzx5qxDMO+iGnGc
	 aKukEb97TOBE+VvQ5TaK8zvFI7YvWuup2UWVBG2aBI50nw9RGlKanuAW5YbUKV2wSEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=anB0zTq8jJujneJmcQG5UHQs5K86qJzq/JkXXdegQ0Y=;
	b=qEebKNZUnNL0vmzJqbHf8rOwLi73UqZ3L896x0BZkS3ezdflvkw9vzPTiFhPCKUrBBhX
	 rDkV3SFVIy4W//KgETYwyf9yFw9mw+iKlWMqGZHolJOUndbAnif+cOvLMApfZ5Q3J4BO1
	 hqwlyXVULli0NjWYoY4s/R6YPLpT+9qFQ0ZJ2Ii54TBsSE79y3FDN4z4h8eSSrXor8FZe
	 /W/15yvYNwPBIJLxmhK8zr0chd7h2ZC8wPgSJz/66XnWCeOhTw1f/yFmULmapk6vqphgv
	 Rd5eQ8Sbk7AqrI5uEhKguMlyx7LT9Mvjqf8036Qxe/cIX5I7kc8yABzeSKcXTQIB+kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tSNX67su;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DB6606A327
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 15:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5DB6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tSNX67su
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso17936455e9.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 07:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793721201; x=1794326001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=anB0zTq8jJujneJmcQG5UHQs5K86qJzq/JkXXdegQ0Y=;
        b=tSNX67subyw79uMOg4DSMsKrL4qoZR3fWMirU+8bRpPuHGhaWmjkMuROfHKcpYZP3e
         oE4uUjh/767qBQ9+CO+ovt8otMG8ZjjJjjDA/hN7HWBE6LZ9/1w9/VFAs6dCeyFyMaDa
         NejxEV3MAUgDZ2M/wOqitCqlG2nrLA8PhVVvV4hoKsuwwlbGHsRqCj23u6ZCywCohzp5
         rQ6BKIgKdt7sQYmxWVQTA6CFM4OPVOfdtnBAKEJKQW52gE8VLax0Q2iVSto6qbfaFaCi
         qnHpuYQYpLZm1l8fo9nwOiSFp4GOOlMyMyIzvBZgk/gTIMMG3alnfapmXv7+KJOB3EHH
         Gw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721201; x=1794326001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=anB0zTq8jJujneJmcQG5UHQs5K86qJzq/JkXXdegQ0Y=;
        b=ZG31wrVP17+pkBS+DvyAgrEosLVxFMOMAiJpGJdFJ+/c+5M5MkzedBYPnLY/qOpJwn
         Abgcr1AIivxoq4QThd4pa8k3Z1Bmuh1CFQit+pzMbvrkYmhXbr4fKp7rzX8YXxSwIx1i
         A1fDQg6N9+HEg42kN/BRfu6YXRPr+p4hfqGb7Kun0ZUo9lIFU17jSIjfYAVc81sLRbgW
         Qx8t/Ab4DovT3dgQISgBEudGwvRLXge28bolPI+Z9EjVV1x95LWT3RLzRSYWuhNQcNOe
         N/13VjVkvvrd6zXGZk06v6pbRci5XZB3hqqPj3StGsWyW5/sOzDdHVnuN0oe2FBxd5B/
         4/ig==
X-Forwarded-Encrypted: i=1; AKwUvBxcfght+8J3TZDggayoSNJHbq9ytV/iv1smwDXmPTmdkkyBEYg53bIALGpeW1Khgst7Trgq9o+uGA5MjQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8df0n88/5WswLciWXSWJ46ECS3li4CR//iH/RVasapUwRxQQus
	qfBZ7IIKP1aMUgFH96FSEMwYf9VBuoUxbb00037WoZDMGUsfuaOsKfd3
X-Gm-Gg: AYBFou3OPWzpczz0JylPgNBa7Mq4ZzP9c7AjrMkWL+dyEIaQDzH2IrW9GEgiFpGSlIT
	l0f1iFI4V4dKSg/mGwfqmj2kK9bg3ZhZsULLbxzrSoU0tzV8JLeFofq4cGu8HTR3pNEJaqM+aOh
	UCbsKN+A3BOdTrx1U3OI/GMQWv/nKzI3x1ihIGplX9Qhow7KdKjqjJV+rWNJi7yZj9sdNSS36mq
	Bhbfbpk/6I7oSeL98k/RiqWl4a4ZS6lsSHB7w9ESfHFyTQ6H1KpJNvouyA92pxPv+gKM0JMEq1b
	ObLh9sdhTMXaZmsObPJVa1N1Bnb2p69y/3FIXsSRuQaybXy0A3xlGV6XMzd4QoJEnTNt43H7H8G
	p8AznOQJWcL+OzQkIRCj4DQBcqdHeJzD+3jhRbLXiqGu9GyoTePKozJYxp7DwAj9kH97vL31Vtu
	HzKGGuDA9LKmeKgmoo9bKJjQy5K399V/qv+a0FtYn8USaOVtSJS3VvDLyrMjTBiD1qNnGciUkdD
	ppIR4SuSaDqWsSvrKj9KJlzQZgfcwbGC7YFSdl9EY++K9zU/ELH9U31w/TrHFJP1c/4xTgphjRV
	BTu6ddc6BUh7ouO9VDdCgR5emoqA/w0/x1YkH+25X0hZDqBxpymPipqpFW7caE8x6hQzenV8
X-Received: by 2002:a7b:ce0d:0:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4ac177538c5mr237110155e9.1.1793721200982;
        Tue, 03 Nov 2026 07:53:20 -0800 (PST)
Received: from Termis-ROG-FLOW-Z13 ([2001:16a2:4495:e600:1209:ec98:a2b4:9c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879f401sm63777815e9.5.2026.11.03.07.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:53:20 -0800 (PST)
From: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
To: Mario Limonciello <superm1@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Benjamin Chan <benjamin.chan@amd.com>,
	King Li <King.Li@amd.com>,
	Caspar Adriani <caspar.adriani@proton.me>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
Subject: [RFC PATCH 0/3] GZ302 rear camera (OMNI13B1, OV13B10) board data
Date: Tue,  3 Nov 2026 18:53:10 +0300
Message-ID: <20261103155313.114347-1-saif.elden.hatim@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series is NOT meant to be merged yet. It puts the board data of
the rear camera of the ASUS ROG Flow Z13 (GZ302EA) into patches, so the
sensor can be enabled once the ISP firmware supports it. In the v6
thread of the ISP4 driver [1], Mario noted that OMNI13B1 would need a
new amdgpu entry and the matching GPIO tables; this is that data, plus
the board configuration and a small sensor-driver change.

Caspar Adriani already posted an OMNI13B1 amdgpu/amd_isp4 patch in
his RFC [3] and dropped it after Pratap's reply [2]; credit for the
first posting goes to him. This series covers the sensor reset GPIO,
the 24 MHz clock and four lanes in the graph, and an I2C ID table for
ov13b10, and lists where every value comes from (below).

Why not for merging: with isp_4_1_1.bin from linux-firmware,
SET_STREAM_CONFIG fails with error 6 (UNSUPPORTED_SENSOR) for this
sensor, as Pratap explained in [2]. Merging patch 3 would make every
GZ302 show a camera that cannot stream. The stock linux-firmware image
does not start this sensor; on my machine the camera runs with ISP
firmware and sensor setup data from my own Windows driver
installation, read from the Windows partition of that machine. I do
not redistribute any of it.

The values and where they come from:

- ACPI _HID OMNI13B1: \_SB.CAMB in an SSDT (confirmed).
- I2C address 0x10: the sensor answers there; the _DSM returns the
  same value (confirmed).
- Sensor clock 24 MHz: the rate declared for the OV05C10 platform
  (assumed).
- Four CSI-2 lanes at 560 MHz: the ov13b10 full-resolution mode
  (assumed).
- Sensor reset, amdisp-pinctrl GPIO 0, active low: tested on the GZ302
  (confirmed).
- enable_isp, AMDI0030:00 pin 85: copied from OMNI5C10 (unconfirmed).
  The capture driver needs it to probe, no ACPI device claims the pin,
  and the ISP also boots with it left undriven.

Bin, Pratap: the firmware sets up the sensor clock and link, so could
you confirm the clock rate, the link frequency and whether pin 85 is
needed on this board?

Sensor model: as Bin and Pratap explained, on Linux the ISP firmware
controls the sensor, and the reference ov05c10 sensor is not bound by
a host driver. Patches 2 and 3 fit that model. Patch 1 and the 24 MHz
dependency below only matter if a host sensor driver is used, which
is how my out-of-tree setup starts the sensor. Which model will the
sensor-agnostic driver use for OV13B10? If it is firmware-only, patch
1 can be dropped.

Dependencies before this can be merged:
- ISP firmware that supports the OV13B10 on this platform.
- With a host sensor driver only: 24 MHz support in ov13b10, which
  accepts only a 19.2 MHz external clock today.
- Patch 3 needs patch 2: the ISP setup in amdgpu uses the software
  node that amd_isp4 attaches to the ACPI device, as for OMNI5C10.

Patch 2 copies the software-node graph of the OV05C10 entry. If a
shared graph builder is preferred, I am happy to rework it that way.

Patches 1 and 2 have no user-visible effect on their own; patch 3 is
the one that makes amdgpu create the ISP for this board.

Testing: built with W=1 (clang) on next-20261026. Not runtime-tested
in this form. The same graph, I2C address and reset GPIO work out of
tree on the GZ302: the board configuration in a patched amd_isp4
module, the reset GPIO registered from there, and an ACPI override
that lets the stock amdgpu find the sensor. There the clock is still
declared as 19.2 MHz and the sensor driver is adapted to 24 MHz. That
out-of-tree code is in a repository I can share on request. I can
test patches and firmware on the GZ302 at any time.

Related: two isp4 driver fixes found on this machine were sent to
linux-media separately [4] and have been reviewed by Bin and Pratap,
and the GZ302 bring-up is discussed in [3].

AI use: Claude (Claude Code) helped me write these patches and the
changelogs from the out-of-tree code, and run the checks. I reviewed
everything.

[1] https://lore.kernel.org/all/3a671359-b05a-4d58-84ca-f29385088e5c@kernel.org/
[2] https://lore.kernel.org/all/ea758386-13b0-4667-8eca-9aa4efefe92b@amd.com/
[3] https://lore.kernel.org/all/lWYl1YJwDSh-q2Ew2f8b0BweQ4V-SUnPMSMurU5gT1LkqVdrmWFunj0sSgjC7m66bORBAD_jRCFTt1_ZOkotOMukY46rI4ayYbIfPQq4E9U=@proton.me/
[4] https://lore.kernel.org/all/20261026182442.229869-1-saif.elden.hatim@gmail.com/

Regards,
Seifelden

Seifelden Abdelmonem (3):
  media: i2c: ov13b10: add an I2C device ID table
  platform/x86: amd_isp4: add the OV13B10 (OMNI13B1) board configuration
  drm/amdgpu: add the OMNI13B1 (OV13B10) ISP sensor

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c |   1 +
 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c  |  13 ++-
 drivers/media/i2c/ov13b10.c              |   7 ++
 drivers/platform/x86/amd/amd_isp4.c      | 127 +++++++++++++++++++++++
 4 files changed, 147 insertions(+), 1 deletion(-)


base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
-- 
2.56.0

