Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590367;
	b=u/n/IQl1x6yaQcP+tdYp/M1A3zzN93dRU8AlDLNcDlQmqWYrxpbmyAvECRM4lPFp1S0V
	 EyJLggufBdUzNUhl1WOdg3rFlM0wWuIAUACo+dE08UqBdFAZHMrdyfchnwYefwP0nONL2
	 +1DDxpr8qzv7bt/hZSolhgdM2VOWrBwA0scp4Mi/qt4KavO4ztafi/cb5quwZplVBPEZq
	 Pv1kFAcZ+Dq34cFryvBdexVZUoqopfpPHMTu4z91fruoGgU8ObeBN8V0raC3lam1VKS2y
	 XKyG2soHPaAxSDa5Pr/WUbyF1k4W0WkphZ3f9dLPEZRvtzCWNr4pt2MvE7M6b9Lspvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2RzE/F0hiuhnUZy+R/vgP/sdimqcsNQo4juhfeJk3ys=;
	b=rgs4JuplO6fzFCTcVQlu/pVE8jVcnshaXremzs4O+T8J4VR07ucHq13Dak+WH0jyfMVK
	 5O6rZdJL2Y0lFz3/1BiGBsUXx3P1O/gQsBSRx+GpER/cpJPA8ywUFbxLWPK2roj0XXh9H
	 iGPn7+wH9T6BoMwd6ppWztlcctexcHulz7Qw9N/fKHyqH/ic54O4V2U7GnjXEbxXwCMWx
	 h/6cXSpBILqkaFZJNsPiFBtCaN36zgAG9x6rWSLtw948Yq8aaU8d+GgzT1dzcDOhQ5aJI
	 K8YHsILoxOxrVLiyl3v3bo7EnG0PrxxqInwH1s/vGPHKYjVMcqNJoxqXafJQ5Ci7EpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lP6HhqcL;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D68606A69A
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 07:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44D68606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lP6HhqcL
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso2445964a91.3
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 23:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795590367; x=1796195167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2RzE/F0hiuhnUZy+R/vgP/sdimqcsNQo4juhfeJk3ys=;
        b=lP6HhqcL6r5uJAL+ZJMg7UQBMPwa5VbXYJeKQNXjNDmf4AOMF1eoeMUbWjlfQFP1Mj
         C9EYYwx83maEvmHMVYTd909ac/tpABOzvkeKxS9gkwCu3bmt7xNcBwtqjUIJ7Lg5DNTq
         yNGC/Ihd/VfwgwxqY+PMvfsDh1ZvfQG+TTBnta5FTeb6o9BPtv3yuIlDByT8a3LdmP3Y
         +DVIEHOKvFCv7KHIjTIgAIaKQQ+Z+Aodkb5DYSFrr5xgp4BTBl7iFqIfqeyKjVpfeI3c
         M0zrs45+Cr4cwskcPcB4GKWjXDcmYwx8bYWbaxdK75qaQ/1e8+PjKZy6AHSJ5u+XLoK3
         Sj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590367; x=1796195167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2RzE/F0hiuhnUZy+R/vgP/sdimqcsNQo4juhfeJk3ys=;
        b=X62Cdb9F3MifD+Df2Ezmh1sng98BqOo3ENeIl55dnXRYopsZBD5XuqJPUFFl/N+ibO
         HGQwKtBZQG4T0jvT/Nw3FEIj7J8/h+fdpc48IQqCcI8s/ZYa+9wWR9K3MAy583+gMbc9
         uWv9C4T2Vrzbb0WS8Q23HxZ789S1Umu30g8E16eDKEhY3mNuLvubUtt0lrX5E4HsLc/B
         ESZc5l1PLy5oJ8CXidxvx72sc5PFKd5Yaw0iU+R7146rOTh+5AQwM6qqFsk0blF6Zzor
         8hZ+W/kxjGg0KXVQhs8U8rStPzI81rKNBn1jX/N2vYNreaCmTnnY2CWTXiEdoNcybhmY
         3u8g==
X-Forwarded-Encrypted: i=1; AL+hErFUVvEh6UpvyiMDKrZS0CKpbIrgf7qgVquSVMWdfZzbQdgGCFVlUuj1ZK9+XXmzwaRR5OrXlk8qxnm+tQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+3vFTAxn17lEokohFYUWciqSLF2HLVpWm9onG9h2hO47x5ZBgM
	kMT0WmNhpeRvYNAA3GftR+GP72iykVJYdq7vQw1kAgcSBAzt7C7niT/q
X-Gm-Gg: AZFdTZeEEbWUCE8JzQhM09fj4ralx0VpvJ3XERsNxOWz1/GbM5ELteD3eChXtmB7UVg
	khGdWMSa3UE1iFzqKS71M8j5xRezlPc4QPbv+waAwJxXTqwONCHxUGGGhXU+CR9qCqEUyxR3hRR
	wzQmL8UfYcyzS5HvwIdmERekh8Ogk5HCG1yVBABF1NFveVpLgoAxF/nLXwPToM7tah13DpvZI0o
	Z028S+2QuTyc/FjOofPUrkUe/eYgbwi3dda+lU0OnhYSqJCNPlprG3rc1elN7sddnTp4SR4bx2T
	4P/WMIw42zXRzrr7JGsYE96V2qNSQubMZNzGsZd3db2XNN4gl2vbh9oDZ97UmHmdC2JLMWF/Bwd
	w5W1NVfgtaog99aTE4YJF0sM2uLQHz2OJOpdwiVZtBC9J8CrS9Zwy2G66Lci9UlW4XE1RSM8/Yy
	ULu7qima0Im5S+cWrnZubSebbarZ3V37dHwDFrvNNITseKJMyXUmRX+dggcDpkl08jXmtZ7pCax
	lBvF/7/nXv9BFq1W6w3qrCqsi0K8kMcjmzKJtQ4YXPjCciPUKJN9GNWP//CW3z0c2TohEXMXlyV
	OOpjthzvu2sxAISXyxo0rzqwazEM+99uQI30U0U12w==
X-Received: by 2002:a17:90a:dfc6:b0:3b4:e929:f46a with SMTP id 98e67ed59e1d1-3b4e929f529mr2782219a91.25.1795590366557;
        Tue, 24 Nov 2026 23:06:06 -0800 (PST)
Received: from a-VirtualBox ([168.188.125.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm25898247a91.3.2026.11.24.23.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:06:06 -0800 (PST)
From: Minseo Park <hiyoukou@gmail.com>
To: clabbe@baylibre.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org
Cc: mjpeg-users@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Minseo Park <hiyoukou@gmail.com>
Subject: [PATCH 2/4] media: zoran: do not update device state before the format is validated
Date: Wed, 25 Nov 2026 16:05:46 +0900
Message-ID: <20261125070548.28989-3-hiyoukou@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125070548.28989-1-hiyoukou@gmail.com>
References: <20261125070548.28989-1-hiyoukou@gmail.com>
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

zoran_v4l_set_format() stores the new frame size into zr->buffer_size
before it validates the line alignment, and zoran_s_fmt_vid_cap() stores
the new mapping mode into zr->map_mode before it calls
zoran_v4l_set_format() at all.  Both fields keep their new values when
the alignment check later rejects the format with -EINVAL, while
zr->v4l_settings, which is only committed once every check has passed,
still describes the previously accepted format.

That splits the two values which have to agree on how much data a frame
occupies:

 - zr_vb2_queue_setup() sizes the capture buffers from zr->buffer_size;
 - zr36057_set_memgrab() programs the video front end, and zr_set_buf()
   programs ZR36057_VDTR, ZR36057_VDBR and the ZR36057_VSSFGR stride,
   from zr->v4l_settings.

The ZR36057 has no transfer length register, so those geometry registers
alone bound the write, and nothing compares them against the allocation.
An accepted VIDIOC_S_FMT, followed by one that fails the alignment
check, followed by VIDIOC_REQBUFS therefore allocates buffers for the
rejected format and then lets the chip DMA a frame of the accepted
format into them.  With PAL square pixel timings, 768x576 BGR32 followed
by a rejected 33x24 RGB555 leaves zr->buffer_size at 1584 bytes, so the
queue allocates a single page and the chip writes 768 * 576 * 4 =
1769472 bytes into it.

zr_vb2_prepare() does not catch this: it compares the plane size against
the same zr->buffer_size that was used to allocate the plane.

Commit both fields only once every check has passed, which is what
zoran_s_fmt_vid_out() already does for the JPEG path: it negotiates into
a local struct zoran_jpg_settings, calls zoran_check_jpg_settings() and
only then assigns zr->jpg_settings, zr->map_mode and zr->buffer_size.

Fixes: 11c9c16f7cb5 ("media: zoran: fix use of buffer_size and sizeimage")
Cc: stable@vger.kernel.org
Signed-off-by: Minseo Park <hiyoukou@gmail.com>
---
 drivers/media/pci/zoran/zoran_driver.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/zoran/zoran_driver.c b/drivers/media/pci/zoran/zoran_driver.c
index a053365922c4..99fedac12b67 100644
--- a/drivers/media/pci/zoran/zoran_driver.c
+++ b/drivers/media/pci/zoran/zoran_driver.c
@@ -177,8 +177,6 @@ static int zoran_v4l_set_format(struct zoran *zr, int width, int height,
 
 	bpp = (format->depth + 7) / 8;
 
-	zr->buffer_size = height * width * bpp;
-
 	/* The video front end needs 4-byte alinged line sizes */
 
 	if ((bpp == 2 && (width & 1)) || (bpp == 3 && (width & 3))) {
@@ -186,6 +184,7 @@ static int zoran_v4l_set_format(struct zoran *zr, int width, int height,
 		return -EINVAL;
 	}
 
+	zr->buffer_size = height * width * bpp;
 	zr->v4l_settings.width = width;
 	zr->v4l_settings.height = height;
 	zr->v4l_settings.format = format;
@@ -530,13 +529,13 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *fh,
 	if (fmt->fmt.pix.width < BUZ_MIN_WIDTH)
 		fmt->fmt.pix.width = BUZ_MIN_WIDTH;
 
-	zr->map_mode = ZORAN_MAP_MODE_RAW;
-
 	res = zoran_v4l_set_format(zr, fmt->fmt.pix.width, fmt->fmt.pix.height,
 				   &zoran_formats[i]);
 	if (res)
 		return res;
 
+	zr->map_mode = ZORAN_MAP_MODE_RAW;
+
 	/* tell the user the results/missing stuff */
 	fmt->fmt.pix.bytesperline = zr->v4l_settings.bytesperline;
 	fmt->fmt.pix.sizeimage = zr->buffer_size;
-- 
2.43.0

