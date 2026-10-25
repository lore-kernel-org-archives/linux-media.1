Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792916690;
	b=ECR7F7DAjK00Y7pvWBx+OEKXvcCG+A2rmrMPQkB709otqecWJLM6z4IkKLAkzKc85EIf
	 ZjTJyq4hYd8amBLg8Ncn4c9w0rsXDL/eng+fIw5e6HOjgAxU5s5CGv+Ft6baDa/y0FVal
	 KjlnvzpxNNNNbvEdpCho7BbCyWCijNfvdzOy4PNCwSWMFu8Y0Tok6wnxa3YW6eUJ6IRjJ
	 WpD6mdV6NZiIjZ+URv1TuVXeURULl98yi7P+21enltHMegODER3yfHN8TsDkLoPNNRkCF
	 CrUvfQwhxQskLdrKLm4PrUR7pPuhUii5gD/SgereaGm/hFYtmhF7Ma9pHhRHvGjQwww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792916690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7RWPUVAjdb3F1t8/E4Di9FGAQf/lla3oj1eazW4iQLc=;
	b=t7zLeQAFY5rGc6c+Y65QuDNcP6+KF7XPfQ0wxLirAi9rSlWY+o0Qb/65f8gzqU9KH8V9
	 Jr4dJM4fWedT44rNpeIoZ6MnyWgGEFC1UbDTrwDFWaLYBsgBbP8+iJt/t7luF/nzz8NVh
	 khV1tIml+TxJ6jQ+mp2vNekVC97S9+7q4kOM4q4FBmz11l11qlohkv06gijcGFScx7RWd
	 ha/P7BFu6UTNHawCiznJzAhv7OC9gaQaW0s0Dhs1+DX08KV+5OGiwRRlsiHoQ5hRZeAgp
	 UClm5cav508uTVzSLKjoF7H8DEkv3bm7ZI8QVYUUlCkLRn7RPJdNfEDz2m+2m0xzUYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=D1Mx3zSP;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57EF606A31D
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 08:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B57EF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=D1Mx3zSP
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F3B363F442
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 08:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792916686;
	bh=7RWPUVAjdb3F1t8/E4Di9FGAQf/lla3oj1eazW4iQLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=D1Mx3zSPvqL+TX+7jPag7RYNyMUM0k3doAUyLJC0CiaNYZ7855ipsmotb1pBkfzjY
	 ZeVNk+ZHdfJhgSW4RTfMB2qnwUe3sNOMGV5PGOd3/MnkcGUI4cHhBq724TIgrpNV2I
	 p//JRJVPEANZ3v+QWCYKsiJ78QYfDbzMB52k4OaSRHOXI3J0CmuGYWs9oD4ue+mJ9R
	 M6saVe9d2aey2jEgM7g/uKAGegvoqNo1fYYDXH3vvgoGicMJz4KcZJaUB33cDd4TaN
	 Oav4fGFRmqghR68vZgjIDfmrUkvSmq4GfaEz0Y7FSbcEFBl4t9XDRFGkBzbUIjgW7U
	 DeihuRop6hVmV0ublJD0BnLH0ocMOwhnO3dslfua+LZ1RY+c8sOI6zliKxgCb/N/DV
	 MoNUkwE/HJOfT2ON3hHwUDAhDpsP95x//amFZikkc4dLf/PSQEywAzpRzYehgds5kD
	 8g18kFOXbtmA6FPC2uilCWUNO3siNN/HzmlCDy9VcRVmvf0bkGtCzuQKP+OXNTKteb
	 4ThIRsytT8hTTh9tdE9Le8o/64NMtrDM8sAzi/inwNbGl6i+WsN3FGe4DIEjCFz0xd
	 OC7yedH2DdcgPIcwQ9/T6IhAsfmEAliADNmbYWDRMQsQ5w0rJJuAbMzCW8VixSuQDA
	 1r42nh/GX+27T5PqQ2XWQZN4=
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so10104093eec.0
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 01:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792916684; x=1793521484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RWPUVAjdb3F1t8/E4Di9FGAQf/lla3oj1eazW4iQLc=;
        b=ayahkQR97cPS11vNUUr83gaI8N7p18DzDb7PIKEo0uz0fK4IcoZGZ4JVOQccuBS99h
         hqQd0OHqdTXqRyem+z7Uco5Pfyn4tCIz/iZmIjd50/AH4DqzJbxwkm4paSFJU0a2BGOj
         1No8G/trdIslxGfzL9GoQbgnruJZgrbzqIZHaGNxs7bK4fc13CJPJhU3N81F5CXe93HY
         DYmkJMrCw5Ctp9UXZ+jZ5STpMRCM2ahrf6RY1n6Ro7RZiLDon5Ko6uZH3OLkQEUQM6GH
         dtl1pyHbT+WCjp25CghVP0HXqd25eUqyKCMi/13nAnjvxx3TBgDvU5Wp5qP0x171hMhJ
         ePYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwy3GaPYyl9zEsc9H4GTvcfWG4SWjjNy3B1qjrrGb1dSESyVBiEiMrH6Thu9nTU65BKbfpL3qpxlAdcwg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLo1EW5wblTFsjiEzLhGk5Yc6QI5nFfWay3MgCuohhZczmHgc+J
	mLmpqGy6GjQrqXEyWdx1E98UxhoSlUNzGqDWKsyInKjKxgvpd/HVw1IlQZy/0724MuqSY1XTiR4
	DGogrCUiUukxSQVKZVB2Ovs1tiEliJo+u8QlUC6k7xLBNImegAE1LMW/Xyjyjs8kPbndG2ZBqCH
	qnuBL1
X-Gm-Gg: AYBFou1gdpsvFlGBDFuD3weTOiGifX27HTY5Wz6A9bPUwt1xqNFpSQ7OhsF7tPMN3B2
	JJehggDbX58qvoVPKfs46fzldVQTlaMlFqgw317VfUfOuLCQdeajfFBonkX9MOx+JCaBFKr2d5t
	ZA0oqfAbTWUICxJsw6D9vf9qyWVsE2f6lM3Cxd37i+yMiJT1vexp8Ssh4mTPVV67mZNoBWsuw5D
	81ayBLx6HeBl5pmL7KqcGSAvimLJdVxGGKn0viayaCmyBa7zCqkod9LoddoWDWxLbwzSPMSWP3v
	q7y7v16qEmaSCX0q4sVchgCJutm2JPLkB4F0jep6/jcPBeLf7JBpOWFc7wUpA9VEVrU76x8P7Ve
	Jz2GuvizpuSngFw+zLw5bzyOBfo/FN3K/e5OwINHbOr71NrITltLol1skDoGs5wlHgrQSbU4=
X-Received: by 2002:a05:7301:f2b:b0:35d:f3cb:ede with SMTP id 5a478bee46e88-369e836aeeamr5907896eec.5.1792916683837;
        Sun, 25 Oct 2026 01:24:43 -0700 (PDT)
X-Received: by 2002:a05:7301:f2b:b0:35d:f3cb:ede with SMTP id 5a478bee46e88-369e836aeeamr5907869eec.5.1792916683321;
        Sun, 25 Oct 2026 01:24:43 -0700 (PDT)
Received: from resolute-linux.tail872496.ts.net (211-75-139-218.hinet-ip.hinet.net. [211.75.139.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f27d5bf8sm10301143eec.4.2026.10.25.01.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 01:24:42 -0700 (PDT)
From: Aristo Chen <aristo.chen@canonical.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aristo Chen <aristo.chen@canonical.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: nxp: imx8-isi: Register the media device only once
Date: Sun, 25 Oct 2026 08:24:18 +0000
Message-ID: <20261025082419.199021-1-aristo.chen@canonical.com>
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

The v4l2-async framework calls the notifier .complete() operation every
time the last missing subdev gets bound. This happens again each time a
remote subdev is unbound and bound again, for instance when the sensor
driver is unbound and rebound through sysfs.

mxc_isi_async_notifier_complete() calls media_device_register()
unconditionally. Each call allocates and registers a new media devnode
and overwrites mdev->devnode, so every rebind creates an additional
/dev/mediaN for the same media device, and leaks the previous devnode
and its minor number. As media_device_unregister() only unregisters
the most recent devnode, the older ones also stay registered after the
ISI is removed, and ioctls on them dereference the freed media_device.

On an i.MX93 board with an AP1302 ISP, every unbind/bind cycle of the
AP1302 driver adds one /dev/mediaN: after three binds, /dev/media0,
/dev/media1 and /dev/media2 all expose the same media graph.

Register the media device only if it isn't registered yet. Keep the
v4l2_device_register_subdev_nodes() call unconditional, as it has to
create the device nodes of the rebound subdevs, and it already skips
the subdevs that have one.

The issue was found while debugging an unbind crash in the AP1302
driver of the NXP BSP kernel. An AI coding assistant helped to find
it, and wrote this fix and its changelog.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
---
Tested on an i.MX93 FRDM board running the NXP BSP kernel
(lf-6.18.20-2.0.0), whose mxc_isi_async_notifier_complete() is identical
to mainline, with the AP1302 driver from the same BSP plus a local fix
that makes it possible to unbind it:

- Without this patch, three unbind/bind cycles of the AP1302 driver
  left /dev/media0, /dev/media1 and /dev/media2.
- With this patch, after each of three unbind/bind cycles only
  /dev/media0 exists, and media-ctl -p on it shows the rebound AP1302
  and sensor entities. No kernel warnings.

Not tested: the ISI removal path, where the stale devnodes would be
dereferenced. Build-tested on top of 330517c63aa9 with W=1, no new
warnings; sparse was not run.

 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 0ae5f35e017c..82a03742405d 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -90,6 +90,10 @@ static int mxc_isi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 		return ret;
 	}
 
+	/* .complete() is called again every time a subdev gets rebound. */
+	if (media_devnode_is_registered(isi->media_dev.devnode))
+		return 0;
+
 	return media_device_register(&isi->media_dev);
 }
 

base-commit: 330517c63aa9b48227b6ab45f01003effac77ae4
-- 
2.53.0

