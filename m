Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0243AB288
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 19:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156170; cv=none; b=Yl2DwUG385AzqJvPEwVw2SNEMqfcQa+CxQ6R51Ofp8D9II12IIPce2H6FR2e0uuB9DmyXTopIYSoWnQI5QNVe2YCLBE9irAAN++JMFbDlxbhbId6zZSwELr9B/P6xkpQXN7iyhmmYK/gY3RBYgOAAqFFDHg/hvcVT5E+/og9GTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156170; c=relaxed/simple;
	bh=8L+MJLvc8rpMWflVBEwSbVEOm4tg7Z8cCjwZhqNT8cg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a79YEd5/zP9B4zRYvqXrj6ABYWcWG8R0g1QTuZ/OnhmZmEOSz2X51+XrunagKwk6oIcbvgZFbaBZza0Pd8U2UBdOFuwlm1UZLKz/msrRZPLiDIr3tsJsHwmEa+hr6WY9M+R/2C7xQsSbT7PgbXjN79AUXdmjzUi3s94b1cOgcUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tI5jOqlU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tI5jOqlU"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so18923895e9.3
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 12:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789156159; x=1789760959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bO9sSaJXgVUZLaMrL25og9Fl/eV88WCxkq1iFkvm7/s=;
        b=tI5jOqlUsH9OVr+AG91u7vp12QRfz9buPzCOVtV2TrC5coSGXUv/L5Te/hyWkWcc++
         zRathPxKMbXOW/MNPbPncn09EFu8MFIueL2qFzAlJ27aGuVkVG9+hgQO+zfY3Ke2pxnU
         4aZijt6dnHuUK0N6c1kd1/TdfL5jamioNGN6at/jjKeW//H+eyxFWNRc44n4cNz/8m1p
         y14lnROALYRdSbth/wW3Y+T54xzADLYVk9roCsz+5opQ9Lr3D6GtJ83zZ8fNQZbxuLFG
         BKL/Wr2h6AiR+Wr62Mpc5s0fpq/gJlxYmPh7XWP3MdljdWM49RNFQEru5CR1OvNF6pxA
         dcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789156159; x=1789760959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bO9sSaJXgVUZLaMrL25og9Fl/eV88WCxkq1iFkvm7/s=;
        b=ZxWb4bfl+oE9Tzk4b6n136/wAevDtIU6+falt55NF5dPkD0+EzgVZjO12wOjx+nJ6g
         ZsmuKfcNdAv21LjberlhL24DqVe97raX4iUXwSRWAOuGfqveR4slWi2UHq+gn9fonZF0
         CSeoPY+9jmDw6Od2KinzyKO4F4rUCzJCstQCpvFCBQ9tEQbvPhq6X/jkG7GEdkqBoV6C
         j1S8tGQKSjNEUh7I6YQcwVVUYkp8TUDSAaXkr0QmDplbQUcoagja65/bp/UFj4N2q874
         /Tw7FKvqGqcSXGTxPCmLE/rJTeiHTChQXSW7S6qznZdUTVw8DDkiDwvozsiW6aX5xeaH
         n41w==
X-Gm-Message-State: AFuF++mISD3i9Jkwr45tsWf55eI8B+K/zmyzH7C2eggJhJJpefeTjcoC
	wbc2VXGLfWUvsU3iNN43Qsb6iYJXEXo8BFlCvNYMgmIF6xwrPy2uo0H2FMcKutjqBYk=
X-Gm-Gg: AYBFou0sIqrsVToKs5hBqmoqnFT+y8NEpRIZGHqSDJY2w420C7KQ8hcTxeeL60hV/vx
	MpfWcFxanbBS9i1z3X8l4PlbWLZc/CUME8EFbCh6hjShzSuNShAM0ukZ6Cw1rVI7aUm7qK3e8vk
	texqPA1O7AJnVC1q2n2rcyvAxrZlnQk1qOLeTmdqwoOrOcpKvZnVekjlj1eoyGSFiZpRu4G2pgL
	ZXQt+yy6HETAm3dMpHodYjFVeNSu+MaSzmAWNreylKeFfzXYTWafrqnwuJL6IKFB3RV4EA+BWGz
	cK2w4StiyiL3ARFQsYOJcLC6qbI5GjOqzI37aPzfE+0mGtK1KCCgPa21Fa0Siz44T8P7bmnk/SX
	X4F6jtPnHJCy37EwmmDT+V2ZE1+eNDL9jbwGIHzruO1gBe1P7rVunp6zHyzwjZkxTanRf8LrKmC
	TqSGAP/9FsYClnJq8WxpsC3laM7DOXcxYhNdSNN5gdQQO80OLT0STg0QjHtqNj4QAhOZZfl6Et4
	QckMxn4tIKi2BOmrw1C7nSemqttQNwEe0d8UXrZ2YzC9dyuAWiVA5oVjmo7b2PDEkx+2aLe1PPa
	kHRDoJZcLHBWhQZLPmT1Mgsrjo96/JwfurDtPoW3BSEVmOwFrrI2WbSsbH2f+AogABz4pMjSXgo
	qzseejTnjQmeRI40x6vJFK3ogEwn7Pdd6HlrXF5tg9frAu3QN
X-Received: by 2002:a05:600c:c491:b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49e619bb949mr72530525e9.20.1789156158588;
        Fri, 11 Sep 2026 12:49:18 -0700 (PDT)
Received: from localhost.localdomain (host-95-246-9-241.retail.telecomitalia.it. [95.246.9.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26b7332asm175983925e9.0.2026.09.11.12.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:49:17 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	antti.laakso@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Nicola Fiorillo <nicfio@gmail.com>
Subject: [PATCH v2 1/3] media: ipu6: Check the remote pad before dereferencing it
Date: Fri, 11 Sep 2026 21:48:52 +0200
Message-ID: <20260911194854.78894-2-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911194854.78894-1-nicfio@gmail.com>
References: <20260911194854.78894-1-nicfio@gmail.com>
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
unchanged in v7.3-rc2.

Fixes: 3a5c59ad926b ("media: ipu6: Rework CSI-2 sub-device streaming control")
Signed-off-by: Nicola Fiorillo <nicfio@gmail.com>
---

Unchanged since v1.

This one collides with the IPU7 work; see the cover letter. A version of
it rebased on the ipu6 branch of the media tree was posted in the v1
thread:
https://lore.kernel.org/linux-media/20260903202820.8401-1-nicfio@gmail.com/

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

