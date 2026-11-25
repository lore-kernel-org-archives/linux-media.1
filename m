Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590363;
	b=CEC6TFt4EPhyHdueT37fQhPQWUMeoBwlCoUQx6h3VPioK59dB+9T9PbF9uoOgKkkn9jr
	 4G1/WI7bj0kJY6CzFIME7CZYeQK9S/g53ftkEXwkpVpVfiefWEeBc0LuTLLwr4QTG6Kwv
	 uLqXJcYWo4O710Gc7gcK4adN/F1aazE8IZHzq7nbujCglopB0z7Gs/9x67iDwb6xgaUU6
	 AKYZk7JpqM5YeBqBq6+WhBfpOhpgsPWvWoFYaoBSsEZJJXq/KFZoW/3I6+FGYP811Teez
	 haS0pdL4L5EbEf8QZEIl0NUh5ETbtjI6b+AyYM7aiv0/iihdvmkDYgUSGGBFFrTNdGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7KO6BJkPL4Xh/S2hlOpY8o2wtZX2tSI3Ngql/Modzpo=;
	b=c1c6rWvP7SqNnJtc7ohwPCqug7aiEAbeID36bn8G2TbcATPDgjR71Q3Sj5RkWXUMCIf8
	 +IFbWE36e1DajpV7T2sFqxPh/VkrcTd0YMhFH1lIF2qN6IrxBQ96VLiJr0lYH15T5zASv
	 32cipAkF2baz2Y/pZIJJ6XQjHZgcITarSa3JCaojmECRiQYHehxmNU1Be2LV16xqP3yQJ
	 S+vqU8J8uoH965Nv3/j3jN0P6M7hXlhGbJj8OCt9EuMQ1UMZjBvr7zaCePIZzW5OOKKrC
	 bSvCy/3DYmP76SkXKLCVAcgfdsw9mBWspFNriosbWCTqXnOgDFPiUdfuE2r5xpLr44g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="JM/gUZ6M";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66479606A337
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 07:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66479606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JM/gUZ6M
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso2595410a91.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 23:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795590363; x=1796195163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7KO6BJkPL4Xh/S2hlOpY8o2wtZX2tSI3Ngql/Modzpo=;
        b=JM/gUZ6MnB0HIH9eK8aGhMfp1BgxgrDR6Q+JcQLNpNr+yAn80p2kj2lImXPdyhGH7S
         HGIXV1nVDQS/KnYzNKjeGkR1qd0vkBh/3DIs8x6Sj6LCH+LSoOjq52kJnC9BD94ZGxHU
         vkLQdMJrwopevzUAbNgJPRyn6mOEiYpAfbcuQoyF0AiPl+6Zj4d+4WyR0yNdFj4T5EG/
         vaKsl8Y8Ab8u3BHS0QAZ2aipApB+EVkqu4s+59UDjAwCxlimSUepBswarAd23qE1Ayvr
         HlRa2MSUGe8udPcKd08G8JfhyWXlB06/llqz/+84qoo5m91HKAr+JdHMdpWd0xTw/ctR
         VwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590363; x=1796195163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7KO6BJkPL4Xh/S2hlOpY8o2wtZX2tSI3Ngql/Modzpo=;
        b=TS+1zhW3oMpZHScZBLxRTF62E1aLdHlWNc7qlZCsox8L5FfLD44xjZuyLrP7ur7wGG
         w+J9vpIlhI8jb1edJMSYuwl5oG3X8iM9xXdf66s0tm76NHCJFE1p0CTvGtw4V7QCYiQv
         slpSTar23TdTvXDqFUmclXtdTiOTOLzZUXbOHHBkKvx2n6gjwkmd8ehFFFNe5O14JrOe
         s+S3uI6JHd90IFYM0LZKevwGfak3PeK+l1vcUqdba/RAfypSkqJVcCGnRegLrosyINGX
         AOQDX7VKyGVGD0kXzTKroyqobHZ50D0p+aEzPHOdLqTLQ6AleRJ1n8tVbI1VgyMFAXu8
         379Q==
X-Forwarded-Encrypted: i=1; AL+hErHIrKYJ52njViMiQTV3cyno/uxmyt5L79ZFplkLb7o+FYnsWuzVzuuvI+rWuKhDu1kLEjJvmMJzASEESw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9TMfRYH48Uqk6jfVU1x3uG17MapNW+tCXLJxgj2v+fWENar+yv
	uFQXMceUuQ0ZeGHqaGT5MQ7Tve/O9dLk/TMtaDVp5EoUKNSiAsn0jh/d
X-Gm-Gg: AZFdTZeDD+bweY1P1tG6B8Toz2VbuWzy6KBdPKcG4Ax4smyD3BwOrunH1zkuiDp8S1L
	yWFu6u+Y6rSw0z87FSsIguj7rw/nh+e2aslf9pcpNHu0lpWLktqJqQJoQmLstAa6JK9vCDhwfR/
	ZLCZyXHza5F4dUFJLfHtcHti/GYEN1s5D3+m/BUV5wLwkduavTD88LieKouMqqvuutN4eVLjKM0
	mwbW55bzaF0OpdQcyZw1pQfL0ni9yPbpe8aGW2dAhV/8IMs2WotfwAxn8T/JDdj6MYla34Qhp9Y
	Ib5F0F+7KtfVenRBLRsS3Iv7ygxADtB95iW53X96dqWb2RoOgdxGy+OkkfF8sz8bEPLQVRssPn5
	ldhX26ncqM6gZeBVayoMD8dJ7eI+E5scBLUxC2jlBporqEQWAh5Oh9YiZJLYGXAGAO89LjGEfDK
	ewqtb5P6Z+Ph+ItuBq9rDK4RI77HHVWFfBbpwf0XCIpkccCZPmYCTKSRhaU6oQBqQFQOTH5v+oR
	4YmKRVm+IhghR6chrjbYWF8i22NDLuvbZCiu3bqgI/EdtFJOdRIc8vXbOmj6Mf6xoedh77B9Z7g
	gmHh0oYVpjLijH7+xWlpnxNoe65vZh4c6pe1HONBIw==
X-Received: by 2002:a17:90a:d2cf:b0:3b3:b595:2473 with SMTP id 98e67ed59e1d1-3b41c906b61mr14892216a91.24.1795590361654;
        Tue, 24 Nov 2026 23:06:01 -0800 (PST)
Received: from a-VirtualBox ([168.188.125.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm25898247a91.3.2026.11.24.23.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:06:01 -0800 (PST)
From: Minseo Park <hiyoukou@gmail.com>
To: clabbe@baylibre.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org
Cc: mjpeg-users@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Minseo Park <hiyoukou@gmail.com>
Subject: [PATCH 0/4] media: zoran: fix capture buffer size / geometry desync
Date: Wed, 25 Nov 2026 16:05:44 +0900
Message-ID: <20261125070548.28989-1-hiyoukou@gmail.com>
X-Mailer: git-send-email 2.53.0
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

zoran_v4l_set_format() updates zr->buffer_size before it validates the
line alignment, and zoran_s_fmt_vid_cap() updates zr->map_mode before it
calls zoran_v4l_set_format() at all.  When the alignment check rejects
the format with -EINVAL both fields keep their new values, while
zr->v4l_settings, which is only committed after every check has passed,
still describes the format that was accepted before.

That matters because the two sides of the frame size contract come from
different fields:

  zr_vb2_queue_setup()     -> zr->buffer_size
  zr36057_set_memgrab()    -> zr->v4l_settings
  zr_set_buf()             -> zr->v4l_settings

The ZR36057 has no transfer length register, so the geometry and stride
registers alone bound the write, and nothing compares them against the
size the buffers were allocated with.  An accepted VIDIOC_S_FMT, a
VIDIOC_S_FMT that fails the alignment check, and then VIDIOC_REQBUFS is
enough to allocate buffers for the rejected format and have the chip DMA
a frame of the accepted format into them.  768x576 BGR32 followed by a
rejected 33x24 RGB555 leaves zr->buffer_size at 1584 bytes, so the queue
allocates a single page and the chip writes 768 * 576 * 4 = 1769472
bytes into it.

zr_vb2_prepare() does not catch it, because it compares the plane size
against the same zr->buffer_size that was used to allocate the plane.

Patch 1 removes the buffer size check in zoran_v4l_set_format(), which
has not been able to fire since the assignment above it was introduced
by commit 11c9c16f7cb5.  The comparison used to be made against
fh->buffers.buffer_size, the size of the already allocated buffers, and
was a real bounds check.

Patch 2 defers the zr->buffer_size and zr->map_mode updates until every
check has passed.  This is what zoran_s_fmt_vid_out() already does for
the JPEG path: it negotiates into a local struct zoran_jpg_settings,
calls zoran_check_jpg_settings(), and only then commits.

Patch 3 rejects VIDIOC_S_FMT while the queue is busy, which the driver
never checked.

Patch 4 adds KUnit tests for the above.

Verified on v7.0 with:

  ./tools/testing/kunit/kunit.py run --arch=x86_64 \
      --kconfig_add CONFIG_PCI=y --kconfig_add CONFIG_I2C=y \
      --kconfig_add '# CONFIG_I2C_HELPER_AUTO is not set' \
      --kconfig_add CONFIG_I2C_ALGOBIT=y \
      --kconfig_add CONFIG_MEDIA_SUPPORT=y \
      --kconfig_add '# CONFIG_MEDIA_SUPPORT_FILTER is not set' \
      --kconfig_add CONFIG_MEDIA_CAMERA_SUPPORT=y \
      --kconfig_add CONFIG_MEDIA_PCI_SUPPORT=y \
      --kconfig_add CONFIG_VIDEO_DEV=y --kconfig_add CONFIG_DEBUG_FS=y \
      --kconfig_add CONFIG_VIDEO_ZORAN=y \
      --kconfig_add CONFIG_VIDEO_ZORAN_KUNIT_TEST=y zoran

With only patch 4 applied:

  # zoran_set_format_rejected_keeps_state: EXPECTATION FAILED at
  drivers/media/pci/zoran/zoran_driver_test.c:70
  Expected 768u * 576 * 4 == zr->buffer_size, but
      768u * 576 * 4 == 1769472 (0x1b0000)
      zr->buffer_size == 1584 (0x630)
  [FAILED] zoran_set_format_rejected_keeps_state
  [PASSED] zoran_set_format_accepted_is_consistent
  [PASSED] zoran_set_format_out_of_range
  # Totals: pass:2 fail:1 skip:0 total:3

With the whole series applied:

  [PASSED] zoran_set_format_rejected_keeps_state
  [PASSED] zoran_set_format_accepted_is_consistent
  [PASSED] zoran_set_format_out_of_range
  # Totals: pass:3 fail:0 skip:0 total:3

A W=1 build of drivers/media/pci/zoran/ is warning free with the series
applied.

I do not have the hardware, so the DMA overrun itself is derived from
reading zr_set_buf() and zr36057_set_memgrab() rather than observed, and
only the state desync is covered by the tests.  Testing on a real card
would be appreciated.

Disclosure: this series was prepared with AI assistance (Claude Opus 5).
I reviewed every patch and take responsibility for the submission.  I left
the Assisted-by tag out of the commit messages because checkpatch.pl
flags it as an error in v7.0.

Note also that VIDIOC_S_FMT rejects a misaligned width while
zoran_try_fmt_vid_cap() adjusts it through v4l_bound_align_image().
Making VIDIOC_S_FMT adjust the width the same way would remove the
failing path altogether, but it changes what existing applications get
back, so I left it out of this series.

Minseo Park (4):
  media: zoran: remove always-false buffer size check
  media: zoran: do not update device state before the format is validated
  media: zoran: reject VIDIOC_S_FMT while the queue is busy
  media: zoran: add KUnit tests for capture format negotiation

 drivers/media/pci/zoran/Kconfig             |  14 ++++
 drivers/media/pci/zoran/zoran_driver.c      |  21 +++--
 drivers/media/pci/zoran/zoran_driver_test.c | 123 ++++++++++++++++++++++++++++
 3 files changed, 147 insertions(+), 11 deletions(-)
 create mode 100644 drivers/media/pci/zoran/zoran_driver_test.c
