Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091181C860A
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 20:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785097726; cv=none; b=SXCCop6IJzDPSzdbkUtqZUcP25agPTE1tRmTgRre42asRCT9/SXWkiPcouC0qqRP35X7qXi1T5sgYS0+YAWj7Xxiq33bDcN6f+Nz5HN0VJM9upE8RvnZhvY+wnqnP+NoOAxVdPF9wJyDVNEk8P8w1H8rCaxjIZKXDSFVSVSW7Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785097726; c=relaxed/simple;
	bh=d5FFifGNntLd0gKbbmX2pXh5o04mbTB5yg0WESEZ+AM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jEBinTxMD2lsukJxdbG572tXk1jfg6TqS4RGNPrL/hC1H1S+2gWvZWxttaFQF746RD/e6Gw8A4vDgbnRTusiKscuxQD5ebx0e1Y8Kf1kvwnKeBxTjxPm/IYnsUO+CxfMwVruWnYkIUngHvd5w57O9e5JsZH2WZE/4MDxfEU4qCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/8QscQt; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/8QscQt"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-38dbe53179bso663895a91.0
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 13:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785097723; x=1785702523; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kdLdmVA9n/pSsrP3UeU927I5NGczIynaa1kz7iUykO8=;
        b=h/8QscQtYVZyPE3GPuBa+1Jvk8mFZjyfpEM+ZQOWGRlW3DBzWuHMl+hLd2zkDNV7gx
         VlhCQUDI9v1wDlG2BtPp7aeWI77wwyuBqPl/dGfk+lZLxKKKbZpGXXq1R1KNIeMfPFes
         CSUiBh/511PMYL9fMqwM7+UqWiou3RP59Iz4PC5nmazU2n0+Jr37sbc4QF0Xpde2yA2h
         STC0vHMSR2i3jszcfW/5RUelPP8QMhhzn6xROj6HNt5m+AaYwUsNdr4WzPlMuVddN5PX
         y4mh/yJwA18q3aiYoE/SS/LdcG9PkhbB+6r+wcdq7sxXrztLi+f82uC2QQce+hRbn3pK
         gUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785097723; x=1785702523;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kdLdmVA9n/pSsrP3UeU927I5NGczIynaa1kz7iUykO8=;
        b=Q8maBkHhLZyw9ACW+J+AuLx7CxvoPFVHKxtAREV/dvsX47ngsMyeVBJswIuafy+6Bk
         kW0j4WVe4gfgJECNrGUvPVzFHmQuEvy6FMr/yMDOsnzYn376coQBjEyGqdWAb1bdpiF6
         ioIh7EOT5gcQ6QKvw6zVYqR/r+1V7hole2d5DXofnaRhktKC4bmWPRw6S1KcvCKykm7X
         I+GJrP1aUGnYL5aVtWjZ7/yJRxT5RAyHFCi3QNXOfE4C1MRjRGYffhqwhhvLlEVhdBXC
         YLyrPyYQ7CxHG7JhIbYYY9aorNzaAWVeADtANJJNG1/Dnfpg9+WDMmgdYtWjdw/B2fOj
         9JeQ==
X-Gm-Message-State: AOJu0Yzw+k9dFev0GSR0lZ5PD63P602jDE1gp4EqFit/EyPdv0AMMrsJ
	QwyKbd+IQJyoKZNqknYo9EBCIvBowSqPKvA6tG+lKkGY3kXF7pxuTn2Q
X-Gm-Gg: AR+sD11k+AiN4R5tYxoCjuwq74eEsx2BOB32SGatxr4gcW8qcETzxJVd0spVUjMK0aX
	BZ4pXm7r+zhPoFOljM2lUWA18e7G1J33V5YYKIQeIZ6JHeP5JpLItLQFPpSqLIwhwuVhnLnBSBq
	x24FJMrFc3zltyqeOFX3R9QP51pVN3jxGRVW2amKoJAhKFcwhrn4Fo2tr/gR3dQ6ZsVUdRwtlN3
	00ZirgQ8PyzCFyF9F1Qkn4xRReOn67FVxv3blJziHhcB8XCXjjNOG5pyLv7iT2HmeXSfqQnWFnO
	lAa3ulIhaCK3U1hPax7i4S8TRCqe4ohXA6wDVqpzmPd8znSYJLwkz66PExiY2a2edQZcqwNlLLf
	lqpWama+4u+70XzGRxNVVtLRMBDAyw7ZB9vNvfItHjXDQn/Mn4R2yUCXuU5xesCEFhTQLUwJmSW
	E43YULmxxEcc9snacQCcGTfmoP/+5KpNVMVBPBoA==
X-Received: by 2002:a05:6a21:d8a:b0:3c4:5f94:f22c with SMTP id adf61e73a8af0-3c67df2078fmr5956185637.43.1785097723352;
        Sun, 26 Jul 2026 13:28:43 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4d7d:1e60:c46f:4bb9:6cdd:73bd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e6461ef84sm132697c88.14.2026.07.26.13.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:28:42 -0700 (PDT)
From: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
Subject: [PATCH 0/4] media: rkvdec: Add VP9 support for VDPU381 variant
Date: Sun, 26 Jul 2026 15:25:33 -0500
Message-Id: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD1tZmoC/x3MwQqEIBAA0F+JOe9AarW1vxIdzBlrWChRkiD69
 6Tju7wLEkfhBL/qgshZkuxbgfpU4Fa7LYxCxaBr3dVf3eHcoCXC+M/ETmMOA2YKh+kVGlIz9d7
 ZxrdQghDZy/nm43TfD7d6/pFsAAAA
X-Change-ID: 20260726-b4-add-rkvdec2-vp9-vdpu381-3d1bd8fca4f5
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>, 
 Igor Paunovic <royalnet026@gmail.com>, 
 Francesco Saverio Pavone <pavone.lawyer@gmail.com>
X-Mailer: b4 0.15.2

Hi All,
This patch series adds the initial VP9 support for VDPU381 present in rk3588.

VDPU381 supports VP9 Profile 0 and Profile 2 up to 7680x4320@30fps.

Tested with fluster (suite : VP9-TEST-VECTORS, decoder: GStreamer-VP9-V4L2SL-Gst1.0).
The 224/305 score has been reproduced independently on three RK3588 boards
across three kernel bases: Orange Pi 5 Pro (RK3588S, 7.2.0-rc3),
Orange Pi 5 Plus (RK3588, 7.0) and Radxa Rock 5B+ (RK3588, 7.1).

Most of the remaining failures fall into a few known categories:

- All vp90-2-02-size-*.webm variants where either dimension is
  smaller than 64 pixels fail because the hardware does not support
  frames smaller than 64x64:
  vp90-2-02-size-08x08.webm, vp90-2-02-size-08x10.webm,
  vp90-2-02-size-08x16.webm, vp90-2-02-size-08x18.webm,
  vp90-2-02-size-08x32.webm, vp90-2-02-size-08x34.webm,
  vp90-2-02-size-08x64.webm, vp90-2-02-size-08x66.webm,
  vp90-2-02-size-10x08.webm, vp90-2-02-size-10x10.webm,
  vp90-2-02-size-10x16.webm, vp90-2-02-size-10x18.webm,
  vp90-2-02-size-10x32.webm, vp90-2-02-size-10x34.webm,
  vp90-2-02-size-10x64.webm, vp90-2-02-size-10x66.webm,
  vp90-2-02-size-16x08.webm, vp90-2-02-size-16x10.webm,
  vp90-2-02-size-16x16.webm, vp90-2-02-size-16x18.webm,
  vp90-2-02-size-16x32.webm, vp90-2-02-size-16x34.webm,
  vp90-2-02-size-16x64.webm, vp90-2-02-size-16x66.webm,
  vp90-2-02-size-18x08.webm, vp90-2-02-size-18x10.webm,
  vp90-2-02-size-18x18.webm, vp90-2-02-size-18x32.webm,
  vp90-2-02-size-18x34.webm, vp90-2-02-size-18x64.webm,
  vp90-2-02-size-18x66.webm, vp90-2-02-size-32x08.webm,
  vp90-2-02-size-32x10.webm, vp90-2-02-size-32x18.webm,
  vp90-2-02-size-32x34.webm, vp90-2-02-size-32x66.webm,
  vp90-2-02-size-34x08.webm, vp90-2-02-size-34x10.webm,
  vp90-2-02-size-34x16.webm, vp90-2-02-size-34x34.webm,
  vp90-2-02-size-34x64.webm, vp90-2-02-size-34x66.webm,
  vp90-2-02-size-64x08.webm, vp90-2-02-size-64x10.webm,
  vp90-2-02-size-66x08.webm, vp90-2-02-size-66x10.webm.

- vp90-2-05-resize.ivf, vp90-2-18-resize.ivf and all
  vp90-2-21-resize_inter_*.webm variants fail. These streams change
  resolution mid-stream on a non-keyframe, and a reference frame
  from before the resize ends up unavailable by the time it's
  needed again. This is being actively looked into:
  vp90-2-05-resize.ivf, vp90-2-18-resize.ivf,
  vp90-2-21-resize_inter_1280x720_5_1-2.webm,
  vp90-2-21-resize_inter_1280x720_5_3-4.webm,
  vp90-2-21-resize_inter_1280x720_7_1-2.webm,
  vp90-2-21-resize_inter_1280x720_7_3-4.webm,
  vp90-2-21-resize_inter_1920x1080_5_1-2.webm,
  vp90-2-21-resize_inter_1920x1080_5_3-4.webm,
  vp90-2-21-resize_inter_1920x1080_7_1-2.webm,
  vp90-2-21-resize_inter_1920x1080_7_3-4.webm,
  vp90-2-21-resize_inter_320x180_5_1-2.webm,
  vp90-2-21-resize_inter_320x180_5_3-4.webm,
  vp90-2-21-resize_inter_320x180_7_1-2.webm,
  vp90-2-21-resize_inter_320x180_7_3-4.webm,
  vp90-2-21-resize_inter_320x240_5_1-2.webm,
  vp90-2-21-resize_inter_320x240_5_3-4.webm,
  vp90-2-21-resize_inter_320x240_7_1-2.webm,
  vp90-2-21-resize_inter_320x240_7_3-4.webm,
  vp90-2-21-resize_inter_640x360_5_1-2.webm,
  vp90-2-21-resize_inter_640x360_5_3-4.webm,
  vp90-2-21-resize_inter_640x360_7_1-2.webm,
  vp90-2-21-resize_inter_640x360_7_3-4.webm,
  vp90-2-21-resize_inter_640x480_5_1-2.webm,
  vp90-2-21-resize_inter_640x480_5_3-4.webm,
  vp90-2-21-resize_inter_640x480_7_1-2.webm,
  vp90-2-21-resize_inter_640x480_7_3-4.webm.

- vp90-2-09-aq2.webm,
  vp90-2-09-lf_deltas.webm,
  vp90-2-15-segkey_adpq.webm,
  vp90-2-19-skip-01.webm,
  vp90-2-19-skip-02.webm,
  vp90-2-19-skip.webm,  vp90-2-22-svc_1280x720_3.ivf,
  are still failing and not yet root-caused.

- vp91-2-04-yuv422.webm
  vp91-2-04-yuv444.webm
  fail because the hardware does not support the format these
  streams use (4:2:2/4:4:4), only 4:2:0.

The base vdpu381 VP9 driver support was introduced by me. Profile 2 support
was added by Igor Paunovic. Francesco Saverio Pavone fixed bugs in
the segmentation map size calculation and in the altref vertical
scale factor. Igor Paunovic also fixed a decoded-frame stride bug, aligning
bytesperline to 64 bytes in rkvdec_fill_decoded_pixfmt().

---
Igor Paunovic (1):
      media: rkvdec: align bytesperline to 64 bytes in rkvdec_fill_decoded_pixfmt()

Venkata Atchuta Bheemeswara Sarma Darbha (3):
      media: rkvdec: vp9: Changing get_ref_buf function name to get_ref_buf_vp9
      media: rkvdec: Move vp9 functions to common file
      media: rkvdec: Add VP9 support for VDPU381 variant

 drivers/media/platform/rockchip/rkvdec/Makefile    |    2 +
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h |  234 +++++
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-vp9.c  | 1067 ++++++++++++++++++++
 .../platform/rockchip/rkvdec/rkvdec-vp9-common.c   |   65 ++
 .../platform/rockchip/rkvdec/rkvdec-vp9-common.h   |   92 ++
 .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    |  121 +--
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |   73 +-
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |    1 +
 8 files changed, 1537 insertions(+), 118 deletions(-)
---
base-commit: 1229e2e57a5c2980ccd457b9b53ea0eed5a22ab3
change-id: 20260726-b4-add-rkvdec2-vp9-vdpu381-3d1bd8fca4f5

Best regards,
--  
Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>

