Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7294342AF98
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 10:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786532008; cv=none; b=fThLYyT49pK3dPj4P3T5CSPi6jJtCArCDuDKLUs4LVq2aDu57ImxMw7C9nVpxIPUV/ae9PZ7WKMo2JJ+vgDHL3HFHmT7l7flG/WFNUNne8px4I8cPfKVF2MGLRr1yO7EaYO3c7e6gmNpO0DAGvZDi3J+7jwZwIo4D3G3iA9lrwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786532008; c=relaxed/simple;
	bh=MZxpdQUH2WM18MmXTZCwsSq01qdcto9rE1WR/kLOhug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gG0OpR9fXZINiMHJmZXqQroH8Pc00XAt9PrFGr5g/wauJ8MzZ0WR4ssL1ecInhuBcni4i/RUnJYG+jItcQc0ROC+/QOZyeJGYKaY5/tK7pFRp48jMqO4R9eSuU/OwdTAiGOC5m46kOPblfBFrr4SAJ0to8n088jaBa8qYVmIS6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHwbPIqW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHwbPIqW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954dff6536so6171865e9.0
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 03:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786532005; x=1787136805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zdWsixD11lZF8ErXsHx7xiySMr3/DkdbqSRJhXboNQ4=;
        b=MHwbPIqWWGEoreaXlyWsT9IeekHpcQfSXlYC7F+tbo7b1SeaNrR42Ist5UHdcam9rR
         gb49u0EFBdAhTrp8NxIek+DIHcG4STl0nzXGFWWkDUxuWNbTJbMyoS+V9VoIuUhcbmve
         FdkwPkm8ibo+pRXE9cShZzxSzymM7gyKPTsx6g9LTASnWowIe9X4AnC3wfiRcZCv+Uok
         3CN8AdehsbIA29YVQ7Ip8eq6SnqoWSd37MqE7yzBj3ZMu+mKZjr0oAfnr6s1Q1cvTXRy
         WrsFMAdSMomXyGvzWf5DSkpW571MfVoIb7nNFM3WqoS+XZo1ycaVwB2FUZSrg0cGWwEm
         TPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786532005; x=1787136805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zdWsixD11lZF8ErXsHx7xiySMr3/DkdbqSRJhXboNQ4=;
        b=NoRC5huEKEfbtdjosPk0WzdXae/lgZ1m1JI6rEdVSU8Z1VjjeRh4vdUPl+TpOFlLVX
         hWPrwXUXBBrX34KkSr0oBNRS0POpB7HxkgWrTcdve5McC7PVJcOl725mi6NDsFzn4C6c
         KTwIPlLl01kgDvC8+I0kTD4fBWAh2k8VPZE3L8ipgLfsbE5IZJ4bIPiRY3po4kO2g8P1
         K4UDrHGhGUz7jtmFpyS5SZb5NZmPEGljdWB5oAI7DR8tZh3++okcTWnimFhepwvlVp0j
         yttNF0nqEu/HcMlcE9uvpRLb0Y047ua5bDTZKjSYCipKaeX/BAaoMmZoI+S3kYu2MJk0
         ufXQ==
X-Gm-Message-State: AOJu0YxDNc14zNXFtwluBIg+qtznhOIburmyoPAVzUpQ8ld7uFfnUzfy
	rA2m9MhV5j1GIo10nmCfh2tJu9zi9R70Tu025PfBVdv/iX5IOfRUJk+i90L5+2hI
X-Gm-Gg: AR+sD13KjGPdyPVFAIldjdGfO45/Z3OYyx2ECay8zezmSj2GHx4Iny1fBl8txgyd5I7
	+2Rd/GH9rUM7iVolyWShrCXZNkJkbuzqhNmuh/UE+81mWkdqhXTKziHQlQl0lUuZTJbAPFXWXO7
	NlOw20HlD41BU+TVsOSMGRhLy7F+MvLTJtCuNbdCW0JIs1WoWvp9kFZSIfY7tNuSS0nOhBF/Dp1
	r9Yp6eVlVr0CgFis+tK1dT/+/EaaRZlSdH1jBKbR9LAGO6sGh9FXQeqFISg3/HFy9sHjcm+J+tB
	TgHvEdUpHozB+2eD1hGUGhuHlTkiKNGL9C+KifqVUTelw+9Mo/pEd7RG1v2erD8wyjaWA89HI3Q
	Dwo1bjnd4Syb8RCOYmw9OVeQHYUAPp7tcnLE39xE/7eRrFPA3cetAZPYe+1+xdlT3I/+Kj1JqlG
	Rx81f9RX+KKc/nlLr+neWC9YPHH2bFZnk86DhfmmD8bdmDIgRhM/4T+GLqHXNIQeuDOqKLZzO03
	HtHcH/QqVYPhefF5Sl2Q00+aWFvMZCX1UjxHkLDIem8dDsTLNK2gVAZ+7HvzxYl3LBVOT7ANpH9
	7UAB4c+u0Uu8ubO0gBdinpMGXbESW63XBIai/y5WbcGsvwPNkrLmttstQgOgGLYsapPqgNgDef7
	Dp/wrnsNkQx+LQ3XlejKLYdvV9jmerB+ZjVRGgM+3YpN8Gw==
X-Received: by 2002:a05:600c:c178:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-4997c1487e9mr47992325e9.13.1786532004701;
        Wed, 12 Aug 2026 03:53:24 -0700 (PDT)
Received: from localhost.localdomain (host-213-45-168-79.pool21345.interbusiness.it. [213.45.168.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c939574sm37352315e9.1.2026.08.12.03.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:53:24 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	linux-kernel@vger.kernel.org,
	Nicola Fiorillo <nicfio@gmail.com>
Subject: [PATCH 1/3] media: ipu6: Check the remote pad before dereferencing it
Date: Wed, 12 Aug 2026 12:53:03 +0200
Message-ID: <20260812105305.32447-2-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260812105305.32447-1-nicfio@gmail.com>
References: <20260812105305.32447-1-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unbinding a sensor driver while a capture is running oopses the kernel:

  BUG: kernel NULL pointer dereference, address: 0000000000000020
  RIP: 0010:ipu6_isys_csi2_disable_streams+0x3c/0x70 [intel_ipu6_isys]
  Call Trace:
   v4l2_subdev_disable_streams+0x1b7/0x370 [videodev]
   ipu6_isys_video_set_streaming+0x20f/0x930 [intel_ipu6_isys]
   stop_streaming+0x102/0x110 [intel_ipu6_isys]
   __vb2_queue_cancel+0x2a/0x2d0 [videobuf2_common]
   vb2_core_queue_release+0x22/0x80 [videobuf2_common]
   _vb2_fop_release+0x58/0xb0 [videobuf2_v4l2]
   v4l2_release+0xbd/0xd0 [videodev]
   __fput+0xde/0x2a0

media_pad_remote_pad_first() returns NULL once the sensor is gone and the
link with it, but both the enable and the disable path dereference the
result unconditionally. The faulting address is the offset of the entity
member in struct media_pad.

Check it. On enable there is nothing to stream from, so refuse with
-ENOLINK. On disable the receiver still has to be stopped, so stop it and
skip only the call towards the sensor that is no longer there.

Reproduced on a CHUWI Hi10 X1 (Alder Lake-N, IPU6) running 6.12.86, with
the CSI-2 port of a sensor being unbound mid capture. The code is
unchanged in 7.2-rc7.

Fixes: 3a5c59ad926b ("media: ipu6: Rework CSI-2 sub-device streaming control")
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index 7e539a0c6..c00a82eb8 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -356,6 +356,9 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
 	int ret;
 
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
+	if (!remote_pad)
+		return -ENOLINK;
+
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
 	sink_streams =
@@ -392,10 +395,17 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
 		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
 						&streams_mask);
 
+	ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
+
+	/*
+	 * The link is gone if the sensor driver was unbound while streaming.
+	 * Stop the receiver anyway, there is just no one left to tell.
+	 */
 	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
-	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+	if (!remote_pad)
+		return 0;
 
-	ipu6_isys_csi2_set_stream(sd, NULL, 0, false);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
 	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, sink_streams);
 
-- 
2.47.3

