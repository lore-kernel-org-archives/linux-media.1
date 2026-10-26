Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039104;
	b=QUfvMov7GvGbr3ltPRCqaftr/LVHJ9syiRfjRW/2pU/ihyrb9TXMzXzXBZDbhLmMHBzA
	 RkbtGvu/HGPCOZQAOhP0iOS9QSsunqBKweW/R/a1Tw4bgFejJcNOdNMbguHjJH9hle3NM
	 gMe8rKQg+qOkqsVbEcS3IlWgg3755GAfzmogReVamJngguJaLYUX46i0ZAU157gGF2t2A
	 zj9xtoaoyjr1C+be9v8LnOMhwDJ2jKTL8/CbRMT0UjobY7NdJXwXbpH4xWiMlKPHRrgyW
	 2xm0od17PEz+La1pclX59G+ALOVhW654b+NW5t2aTxUherx1a3G8eAiB+ROAjpGUTgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ldW6tZ8xBpJBMNj1dRoOXwyCb4wkPg2+QnJ0KDwYhwI=;
	b=bOHjWLUW+fPAiPX4nCV8nryhH/MNJ9MJ7718HkZXy4hlp+spC9We9I/ONtX70mERcShF
	 A9EcDbhmiPjYukEuqF1c7TOkp9ZLp00gGT/s6Um98fifMWm/Zyv3hIvTORfGqxkvEUkge
	 knQ37xT+H48Z1ZSsppDPJuUCMIpAoQsUoo6qMXZ6FWQWp309ix9PKHEearVnLtfUQoI6r
	 50LtdhVgCmNZiBMdEy3f8zlcjhrquY/EEpmMYwAqebVhzDPo37IIDuPdlcDGZjaRNe2E+
	 jlC/K6BbYdApUHWU6vCW5CPF4a6i6TD6+XiKY5yqHN9PTKFL5c2cBJf/pnGqBm4WK8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZLS4k9Vg;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0D3606A31F
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 18:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA0D3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZLS4k9Vg
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2119feee8so2499765e9.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 11:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793039101; x=1793643901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ldW6tZ8xBpJBMNj1dRoOXwyCb4wkPg2+QnJ0KDwYhwI=;
        b=ZLS4k9VgrtTglxmBEljcUMl5SSyzVAOm1lx0OqPSZ/DTur8sa5dCc0lketaA7W2KqN
         4wHhEXiDgH3soei8xsk6cfZhAasafmJGP4qla2SqGp0Wy3Y8HUelU6/+eVoVXKtcUVeN
         QDGdyOYMsMJ04FfIXiH5tXb0SmGUY0Xwx1lumXGy/nZCrIBDuSatoKMlzhrK7nzLuC2t
         Xn32akFfuCfohOzn4UVc8OCkSeCP8g3anah3heNhD441Ii53kRo5W4uMgD5JLVtijC4Z
         md2KFISxbGwLzWXI0DJEcHuYddVoBlToe9GNdIAB/a3lB5PHUK9r5SaUq7tEekE0mUSr
         kMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039101; x=1793643901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ldW6tZ8xBpJBMNj1dRoOXwyCb4wkPg2+QnJ0KDwYhwI=;
        b=R2p+MFqkAetV2EkdrxXcxNfzdPhHC9irEF18p0mExGX1CWIqoGNEJ8dxKuGU6+m2fo
         25aPPUbAOnz/bMKOQ6l/Dzp+RBsGBx2w+eceZqoj60YQMexp5nTsSNQCIEMte5CTovVx
         grlY1BauvzxU7XK43Em/D1FLKfpW49Myc8JLx0d138XCyGtEC9KMc6KjMusNV3Le2yK3
         75pfQELMp/0jPztE70teDMaS6K2ZS5hxA/3f47uf5q3a96mMrO1ei0imm0FokOpMAZht
         YqrRBRiG6b4LgRpGC+Tet79mEdDH5osSryXFSpYvOGpW1X0WtLFpAxlly5tkUwQrJgZb
         bXHA==
X-Forwarded-Encrypted: i=1; AKwUvBzU3AQiAP7QrCMTpdid5sOXWP+O1z0L3t5GWvYSz27j3sk19O/SB9W2oVraFNXDBwSQodU8307hKTT8ZQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJf+tB3UtBVpaAVIqzAhPbAZOv1jcw1z6AG/FwC62RqFEY8OHV1
	B6qBCA0Q+aKXJUoXj++iSOs1hR2tnGI0ZWk02J6Q8hl1YfoXe5Str+nP
X-Gm-Gg: AYBFou0OCay1mxPV/w6PUUIJ0KIYrOGUdERCzU2x1dPk7XXP2IbZ592i74Jbtbmdvix
	v5qNPhT7wGuTCt+lAkFKOjCI+l9odZlfA7+S4TR5upf8ypgE9bV7rEVEn3URdC3qZk2O0dCzVCy
	ogD1ecB+LkxwDnbLHye5o3RGT4blWXotHxhI+tIDFZInhW+yB9OQ2ZreJTH4G4Uu64PulbSsx+B
	mgecaoqoNUIiYmS1MBVzcHE+r7nkla79Kum1meo8FIOqec93VlDn/s7wmcu33HweSrdAQ2+RWCt
	7PpmqavcQYJaNHXFbNQYHFuJPbTOXuCAyMfcrNjQ0Z38saTyDH+6O38LV8Rjg/4zuvJdSvBTPDy
	dvpEt5piZZtbuLRV76GndNx+oLuv2L7sUsXO0AV1KdV3xAu5cgqUDAG7/bzyibNTFpmHFJWa3LL
	gimtXT0s/ePm/k0xAHnnTwxpmUj97LH3Cglmo4bODtB+ouZ/DGrjGNfWEWj7g6krvCOhMwcijN0
	ifoH1K8QWSAynAzJ7uNuYnCaCYwLuajlkTzpsOXf2KmgKdXCyXYg5sv8FYURA==
X-Received: by 2002:a05:600d:b:b0:4a1:e774:370d with SMTP id 5b1f17b1804b1-4a35ac759b3mr126869795e9.1.1793039101022;
        Mon, 26 Oct 2026 11:25:01 -0700 (PDT)
Received: from Termis-ROG-FLOW-Z13 ([2a09:bac5:521a:254b::3b7:76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm211673245e9.2.2026.10.26.11.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:25:00 -0700 (PDT)
From: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
To: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sultan Alsawaf <sultan@kerneltoast.com>,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
Subject: [PATCH 0/2] media: amd: isp4: two fixes found on the ROG Flow Z13
Date: Mon, 26 Oct 2026 21:24:40 +0300
Message-ID: <20261026182442.229869-1-saif.elden.hatim@gmail.com>
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

These are two small fixes for the AMD ISP4 capture driver. I found
them while bringing up the OV13B10 rear camera of the ASUS ROG Flow Z13
(GZ302EA, ACPI ID OMNI13B1), which is discussed in [1]. Both fixes are
independent of that sensor and apply to the driver as merged.

Patch 1 holds buf_list_lock while start_streaming hands the queued
buffers to the firmware. The firmware response thread can remove
completed buffers from the same list during that walk; I hit the
resulting list corruption as an oops.

Patch 2 makes completed buffers report V4L2_FIELD_NONE instead of
V4L2_FIELD_ANY, which v4l2-compliance rejects.

The two patches are independent of each other and apply in any order.

Testing: the GZ302 camera is not supported upstream, so I applied the
patches to an out-of-tree build of this driver that streams on that
machine (NV12 1920x1080, about 30 fps). The stock linux-firmware image
does not start this sensor; on my machine the camera runs with ISP
firmware and sensor setup data from my own Windows driver
installation, read from the Windows partition of that machine. I do
not redistribute any of it.
- 6 stream starts with patch 1 alone and 6 with both patches (each
  time 5 captures of 90 frames plus the v4l2-compliance run); no oops,
  hung task or WARN.
- With both patches, s2idle suspend and hibernation with the camera
  idle: capture works before and after.
- v4l2-compliance -s: 52 of 58 without the patches, the same 52 with
  patch 1, 53 with both.
- W=1 build (clang) on media-committers next. Not run: lockdep,
  sparse, smatch.

Known issues, not addressed by this series:
- The remaining 5 v4l2-compliance failures all stop at
  v4l2-test-buffers.cpp:1651: CREATE_BUFS with half the sizeimage after
  REQBUFS is expected to fail with EINVAL and does not. A likely cause,
  not yet confirmed: isp4vid_qops_queue_setup() writes the requested
  size back into isp_vdev->format.sizeimage, so a larger CREATE_BUFS
  earlier in the test raises the size that later requests are checked
  against.
- A stream does not survive system sleep. Start a stream, then
  "rtcwake -m mem -s 20": after resume no further frame arrives, and
  stopping the stream logs "fail to disable stream" and "fail to stop
  stream". The same happens without these patches; the driver has no
  system-sleep callbacks. On the GZ302 the command timeouts return; the
  stop-path hang reported in [1] may be related. This should be
  reproducible on the HP ZBook Ultra G1a, and I can test a fix on the
  GZ302.
- Hibernating while a stream is running hung the GZ302 once, during
  hibernation, and needed a forced power-off. That run used both
  patches and I did not repeat it without them, so I cannot say yet
  whether it predates them; neither patch touches the sleep path.

AI use: Claude (Claude Code) helped me analyse the code, write the
changes and the changelogs, and run the checks. I reviewed the patches
and ran the hardware tests.

[1] https://lore.kernel.org/all/lWYl1YJwDSh-q2Ew2f8b0BweQ4V-SUnPMSMurU5gT1LkqVdrmWFunj0sSgjC7m66bORBAD_jRCFTt1_ZOkotOMukY46rI4ayYbIfPQq4E9U=@proton.me/

Seifelden Abdelmonem (2):
  media: amd: isp4: hold buf_list_lock while sending buffers at stream
    start
  media: amd: isp4: return capture buffers with V4L2_FIELD_NONE

 drivers/media/platform/amd/isp4/isp4_video.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)


base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.56.0

