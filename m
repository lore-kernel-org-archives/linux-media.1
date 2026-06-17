Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC2E375ADC;
	Wed, 17 Jun 2026 18:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781719877; cv=none; b=UzAtoMTCP9emgfsDE0eSSF8mnKJ3mA+c4PWh0O5G6cIJCxjoomULB5hQR6kRra5F4/4xQIP5LG3QqG1W3Wkj75DFeFRAz3n+F/mducYGg3azhStuERzN3HUqck81UOiwrlEyn1BjXL1RDt4Pfw5qJ7jFFPCx6idXb9jlIcameF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781719877; c=relaxed/simple;
	bh=wxFDIVFTpkjnrKaMbsP5v0hX2Xzlz1fap4XvyI5tDTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tBMAQKChwp188sIRt2UTRs/AMh/fT8DH9wdvZg9jNvahcL1sKUsX17skewaiLakYDKFU67J5x8XU9S2Sbx7Ntgm6m6hdKK/kdw9oyJRIbYXdLPWoTdGgesVVAyOTRj0383//dhFatxP9EBfaaruKz0iPTsq9iLK2t1/dX/eAsBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BCmkGk1j; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BCmkGk1j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781719873;
	bh=wxFDIVFTpkjnrKaMbsP5v0hX2Xzlz1fap4XvyI5tDTw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BCmkGk1jEPKg0TsQXk9hKAVQU+mCtzL0S2taBl8f/z1pZLMbO+iQHEenESvCC18EY
	 jaWQYIrSoTsmHNTKFroG7qqhSvlGuJaonErfVnYWaIxy76ylxyUnXitiui71oYcWra
	 uhDHqFaCPU3oNA2oxOGXzwKCpqg7mLw7DfLsGzMXWeWY/85AOnz63tPnbqZT5t+M0r
	 NYjQjeGgpYla5QjPe9dJ0Hol/yJ5PCY8bYChoPN7cs2/4vtoZ9gLTrB0ebw4YnucXn
	 VfYSg0RpNO3IT7ob9lk7lrmveLQ07pcIlUh5Du/hyVg7c13pnghG+ezmilHxy9Ec3z
	 Tiag0NoZ9FJKg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 36EE817E0B81;
	Wed, 17 Jun 2026 20:11:12 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 17 Jun 2026 14:10:57 -0400
Subject: [PATCH v2 2/5] docs: media: add documentation for media client
 usage stats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-v4l2-add-fdinfo-v2-2-d298e98ce06a@collabora.com>
References: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
In-Reply-To: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Christopher Healy <healych@amazon.com>
X-Mailer: b4 0.15.2

From: Christopher Healy <healych@amazon.com>

Document the media fdinfo interface for per-file-descriptor usage
statistics exposed by stateless V4L2 codec drivers via
/proc/<pid>/fdinfo/<fd>.

This interface is designed for stateless (request API based) codec
devices where the kernel driver has per-job visibility into hardware
execution. Stateful codecs cannot support all of this because their
firmware manages job scheduling opaquely.

The specification defines media- prefixed keys for engine utilization
time, and operating frequency, following the same conventions as the DRM
fdinfo mechanism documented in drm-usage-stats.rst.

More fields can be added later.

Signed-off-by: Christopher Healy <healych@amazon.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../userspace-api/media/drivers/index.rst          |  1 +
 .../media/drivers/media-usage-stats.rst            | 85 ++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 02967c9b18d6..61879738836c 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -34,6 +34,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	imx-uapi
 	mali-c55
 	max2175
+	media-usage-stats
 	npcm-video
 	omap3isp-uapi
 	thp7312
diff --git a/Documentation/userspace-api/media/drivers/media-usage-stats.rst b/Documentation/userspace-api/media/drivers/media-usage-stats.rst
new file mode 100644
index 000000000000..d3dc07002f62
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/media-usage-stats.rst
@@ -0,0 +1,85 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _media-usage-stats:
+
+==========================
+Media client usage stats
+==========================
+
+Stateless V4L2 codec drivers can optionally expose per-file-descriptor usage
+statistics via ``/proc/<pid>/fdinfo/<fd>``. This is analogous to the DRM fdinfo
+mechanism documented in :ref:`drm-client-usage-stats`, but uses the ``media-``
+key prefix for V4L2 media devices.
+
+This interface is specific to stateless (request API based) codec devices,
+including both decoders and encoders. With stateless codecs, the kernel driver
+explicitly submits each frame to the hardware and receives a completion
+interrupt, providing a clean per-job boundary that can be attributed to the
+submitting file descriptor.
+
+Stateful codec devices cannot support this interface because their firmware
+manages job scheduling internally. The kernel driver submits bitstream data
+but has no visibility into per-frame hardware execution timing.
+
+Implementation
+==============
+
+The V4L2 core provides the plumbing: drivers implement the ``show_fdinfo``
+callback in ``struct v4l2_file_operations``, and the core wires it into the
+kernel ``struct file_operations`` so that ``/proc/<pid>/fdinfo/<fd>`` output
+includes the driver-provided keys.
+
+File format specification
+=========================
+
+- File shall contain one key value pair per one line of text.
+- Colon character (``:``) must be used to delimit keys and values.
+- All standardised keys shall be prefixed with ``media-``.
+- Driver-specific keys shall be prefixed with ``driver_name-``.
+
+Mandatory keys
+--------------
+
+- media-driver: <valstr>
+
+  String shall contain the name of the media driver.
+
+- media-type: <valstr>
+
+  String shall identify the type of media engine exposed through this file
+  descriptor. Standard values are ``decoder`` and ``encoder``.
+
+Utilization keys
+----------------
+
+- media-engine-usage: <uint> ns
+
+  Time in nanoseconds that the hardware engine spent busy processing work
+  belonging to this file descriptor. The engine being measured is identified
+  by the ``media-type`` key.
+
+  Values are not required to be constantly monotonic if it makes the driver
+  implementation easier, but are required to catch up with the previously
+  reported larger value within a reasonable period.
+
+Frequency keys
+--------------
+
+- media-maxfreq: <uint> Hz
+
+  Maximum operating frequency of the main engine clock.
+
+- media-curfreq: <uint> Hz
+
+  Current operating frequency of the main engine clock.
+
+Example output
+==============
+
+::
+
+  media-driver:           hantro-vpu
+  media-type:             decoder
+  media-engine-usage:     123456789 ns
+  media-maxfreq:          600000000 Hz
+  media-curfreq:          600000000 Hz

-- 
2.54.0

