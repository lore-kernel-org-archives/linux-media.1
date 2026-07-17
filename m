Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF363FB7E5;
	Fri, 17 Jul 2026 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286335; cv=none; b=e1A8tpfgaz8jiqXZpKK+Te7+L8physsm1knMgWoCtTA2j0Lt8jpOc2MPzKG56n4GjuNDpppcMFvbDPKfery4kGdkVWHwA7NMr8PHICUjQxU7cFz5Y1PFr57ymwvGaCE5cDcslN/l0Mci77sp+xJj2FIUD3FPSjo5PqTDqrLOujs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286335; c=relaxed/simple;
	bh=xUhpzDcLxGv+EVoovKUUw5899upPna9MqQW9NtmU3NI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YrsZWbjthnsgmu/m1rLKNmiGk6BB0yo1AVH0ieab16c/EOoH0uBnHdWvv/NNgA9cKefbaQxMWRFaLKkmXGl88UE3OgaDA+zBaezKqVy4yB66q0Vnf3KQOpJj/5w84lM6bc02JzNoRUeV6+ruD6cI05WbNpWtQsrFHrESfENUPRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E718m6cO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E718m6cO"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 952B3130E;
	Fri, 17 Jul 2026 13:04:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784286271;
	bh=xUhpzDcLxGv+EVoovKUUw5899upPna9MqQW9NtmU3NI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E718m6cOTvG2/MuWonyh5E8Odd1q8qBlNkgs6wwNqxa1zM5o3GxmQ6/tWydYUhhMW
	 F3TqLx4U6mB69uw1pGig9R1PX2Dj/Nqvcl3PFOq3VNm78MltbDjfkpsF1aqucgIpZl
	 f+TOilrDiIP1nT6fRA5WNM6bhKuGn/nYXeblBW90=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 17 Jul 2026 16:34:19 +0530
Subject: [PATCH v3 4/9] platform/raspberrypi: vchiq-mmal: Support bayer and
 gray formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-vchiq-isp-v3-4-fb8235e15c68@ideasonboard.com>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
In-Reply-To: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4308;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=xUhpzDcLxGv+EVoovKUUw5899upPna9MqQW9NtmU3NI=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqWgxXBdUfNlXU0lNJOUfN4VMovffm4zWCY2L8h
 rZoCPp7+lKJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaloMVwAKCRBD3pH5JJpx
 RTdAEADOf9onJjtCk6peEysv7uVO57BF/vjuNlR4SmkeETLqmhB1zkD7W7yt56vQjhb6golYpO/
 lhqTFJVe3C2ZF/WIMMFA5g4n5FfcE7FVFIT4xaydNO70eyIPmMRc3fFLf9VkDCg/Ln4AV9vVhGv
 jzBeXV5avPClIhF7ZEDy8fjL0wmhanPW5JuWYWHhgQ6yLjgxz5inzZOI76cHRTzGdpw5wv6hyWC
 r0K+x00dNZr7vImEaySGrxuVPLE7uLG9HOgVApRkj3k+XBY1SKvDFMv2t+8eRaRdAt4PLIVh2Fl
 KqWIfvqQE55TUwZW/I4o2Q1IZkL8JphL7p9R9QG/IfZ6KPr8SV+iagDXgDq8uoJDiee+wCXnXET
 3xTbo9QoMKxZ87/qiNNbnxo/ivBlU/bzjPSVSFc9oVzpTVgGoCkVtryMCLDapjiGnee6i/u0eDs
 zgEQLadU2IrJqFYUue8uvlrhJN66avC8CysOU9Hk0bEtfP83ep5Ggr8S+vKumTV2q93CdwN8C2W
 nBIZN29Fh4a4vKZhG2DoruAUI2MBDlE+we9GFwleB+e/mLOVqEk1XOjUdEQ1co/DyzZidj5HQL8
 3y5wtQRCuIr4wzk44W1GPgR20kX8/Z9KcMuUqUnHYLm5dYy8x/UYmlvbzMvaR014nC2YZnKFy2X
 PGMegoEhkCYG8Gg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Raw camera sensors often send data as packed or unpacked bayer and gray
formats, which needs to be processed by the ISP.

Add macros to support bayer and gray format FOURCCs in the MMAL layer.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 include/linux/raspberrypi/mmal-encodings.h | 64 ++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/include/linux/raspberrypi/mmal-encodings.h b/include/linux/raspberrypi/mmal-encodings.h
index eadf2e981408..1e13ebbaebf6 100644
--- a/include/linux/raspberrypi/mmal-encodings.h
+++ b/include/linux/raspberrypi/mmal-encodings.h
@@ -69,6 +69,70 @@
  */
 #define MMAL_ENCODING_OPAQUE           MMAL_FOURCC('O', 'P', 'Q', 'V')
 
+/**
+ * Bayer formats
+ * FourCC values copied from V4L2 where defined.
+ */
+/* 8 bit per pixel Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR8     MMAL_FOURCC('B', 'A', '8', '1')
+#define MMAL_ENCODING_BAYER_SGBRG8     MMAL_FOURCC('G', 'B', 'R', 'G')
+#define MMAL_ENCODING_BAYER_SGRBG8     MMAL_FOURCC('G', 'R', 'B', 'G')
+#define MMAL_ENCODING_BAYER_SRGGB8     MMAL_FOURCC('R', 'G', 'G', 'B')
+
+/* 10 bit per pixel packed Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR10P   MMAL_FOURCC('p', 'B', 'A', 'A')
+#define MMAL_ENCODING_BAYER_SGRBG10P   MMAL_FOURCC('p', 'g', 'A', 'A')
+#define MMAL_ENCODING_BAYER_SGBRG10P   MMAL_FOURCC('p', 'G', 'A', 'A')
+#define MMAL_ENCODING_BAYER_SRGGB10P   MMAL_FOURCC('p', 'R', 'A', 'A')
+
+/* 12 bit per pixel packed Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR12P   MMAL_FOURCC('p', 'B', '1', '2')
+#define MMAL_ENCODING_BAYER_SGRBG12P   MMAL_FOURCC('p', 'g', '1', '2')
+#define MMAL_ENCODING_BAYER_SGBRG12P   MMAL_FOURCC('p', 'G', '1', '2')
+#define MMAL_ENCODING_BAYER_SRGGB12P   MMAL_FOURCC('p', 'R', '1', '2')
+
+/* 14 bit per pixel packed Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR14P   MMAL_FOURCC('p', 'B', 'E', 'E')
+#define MMAL_ENCODING_BAYER_SGBRG14P   MMAL_FOURCC('p', 'G', 'E', 'E')
+#define MMAL_ENCODING_BAYER_SGRBG14P   MMAL_FOURCC('p', 'g', 'E', 'E')
+#define MMAL_ENCODING_BAYER_SRGGB14P   MMAL_FOURCC('p', 'R', 'E', 'E')
+
+/* 16 bit per pixel Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR16    MMAL_FOURCC('B', 'G', '1', '6')
+#define MMAL_ENCODING_BAYER_SGBRG16    MMAL_FOURCC('G', 'B', '1', '6')
+#define MMAL_ENCODING_BAYER_SGRBG16    MMAL_FOURCC('G', 'R', '1', '6')
+#define MMAL_ENCODING_BAYER_SRGGB16    MMAL_FOURCC('R', 'G', '1', '6')
+
+/* 10 bit per pixel unpacked (16bit) Bayer formats. */
+#define MMAL_ENCODING_BAYER_SBGGR10    MMAL_FOURCC('B', 'G', '1', '0')
+#define MMAL_ENCODING_BAYER_SGRBG10    MMAL_FOURCC('B', 'A', '1', '0')
+#define MMAL_ENCODING_BAYER_SGBRG10    MMAL_FOURCC('G', 'B', '1', '0')
+#define MMAL_ENCODING_BAYER_SRGGB10    MMAL_FOURCC('R', 'G', '1', '0')
+
+/* 12 bit per pixel unpacked (16bit) Bayer formats */
+#define MMAL_ENCODING_BAYER_SBGGR12    MMAL_FOURCC('B', 'G', '1', '2')
+#define MMAL_ENCODING_BAYER_SGRBG12    MMAL_FOURCC('B', 'A', '1', '2')
+#define MMAL_ENCODING_BAYER_SGBRG12    MMAL_FOURCC('G', 'B', '1', '2')
+#define MMAL_ENCODING_BAYER_SRGGB12    MMAL_FOURCC('R', 'G', '1', '2')
+
+/* 14 bit per pixel unpacked (16bit) Bayer formats */
+#define MMAL_ENCODING_BAYER_SBGGR14    MMAL_FOURCC('B', 'G', '1', '4')
+#define MMAL_ENCODING_BAYER_SGBRG14    MMAL_FOURCC('G', 'B', '1', '4')
+#define MMAL_ENCODING_BAYER_SGRBG14    MMAL_FOURCC('G', 'R', '1', '4')
+#define MMAL_ENCODING_BAYER_SRGGB14    MMAL_FOURCC('R', 'G', '1', '4')
+
+/* MIPI packed monochrome images */
+#define MMAL_ENCODING_GREY    MMAL_FOURCC('G', 'R', 'E', 'Y')
+#define MMAL_ENCODING_Y10P    MMAL_FOURCC('Y', '1', '0', 'P')
+#define MMAL_ENCODING_Y12P    MMAL_FOURCC('Y', '1', '2', 'P')
+#define MMAL_ENCODING_Y14P    MMAL_FOURCC('Y', '1', '4', 'P')
+#define MMAL_ENCODING_Y16     MMAL_FOURCC('Y', '1', '6', ' ')
+
+/* Unpacked monochrome formats (16bit per sample, but only N LSBs used) */
+#define MMAL_ENCODING_Y10     MMAL_FOURCC('Y', '1', '0', ' ')
+#define MMAL_ENCODING_Y12     MMAL_FOURCC('Y', '1', '2', ' ')
+#define MMAL_ENCODING_Y14     MMAL_FOURCC('Y', '1', '4', ' ')
+
 /** An EGL image handle
  */
 #define MMAL_ENCODING_EGL_IMAGE        MMAL_FOURCC('E', 'G', 'L', 'I')

-- 
2.54.0

