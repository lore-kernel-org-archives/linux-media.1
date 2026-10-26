Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003157;
	b=00SKsuIqRbJiyEL7CGD4MirPN5YINxp9mvUFoTvAPQ/VomShvfeqOPjGwrHqmhrCM95l
	 JQc++QCf0h0TRmPrclkJx2YfDJf/S+At0JR1zcuqOHht50E4A5pb0i0xrh6km9dLVGVOM
	 fI9txPTBQNomdbuKBg81ZbAra2w7R+XP164b3HzeLu87NIXxFFSsZVTBRFU8faeIz4sVU
	 LQj8sM0NutJCvNvwLP1tyAxMf+xUhAzmEqvvFoP6g7UMP5OupCjqPKAfbzvzPC6cHaRhM
	 VLnayB1a45NNcjz7AiNOS977wURy/XGS9Ouh9mdFpSgLYmub8t+pFP4pCzAFcDpM8SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=z9O6BgWW6yaoipar2Lx1Z0Xt+u9evhaGrz9gWofeNXw=;
	b=3qh3WQQlS/KQWJHyajwRy8oILKMu4DJaCMmNGJdN20lhEph5D81eshTIXJq2JGY9HusI
	 wUuzeBPgeI3cMDh6fBLjSs2DCbGSjZ7PKDyGD93+35diONpypzQPvPAYmxJGa8FGh++3G
	 Kx+4pVqO8O2bXdtoTvyGaRZpHYooU7eqdy65DpIYTqcTdrc3IVOfVUmEN1g5xbHJ7BRE1
	 dedgloammajgUFoCGdYvj76iuGk5qd6OrW0suV7dkicisX6And6bs551mSKWPhZfHJZJg
	 hJbRfhongMXzsdnths8UYib+FQfyRJtgGEGkh86b+Uv9SZvGYgLLhbl8fYhJ5ZIdMow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IeuF7SNg;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C2B60A2604
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 08:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87C2B60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IeuF7SNg
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so16883375e9.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793003156; x=1793607956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z9O6BgWW6yaoipar2Lx1Z0Xt+u9evhaGrz9gWofeNXw=;
        b=IeuF7SNgsWKr8mfHuqMn3piad19yrIPng7Qi5/R9ATgZt6+pxrUyTpRgf7mHwPtoPU
         x6eyhDcTEkq82eXc/wwnNWi+qnd6TJxkEzafUiyKIbet12xmHy0ImvG4h34Gmv2VNhIb
         EfLMFcrxug60OtriEIVRKdK6Wcv6oBbQ12mtNyEjwYTVHJTNjn12nvVe4LCucRIzJH7c
         sgYtfOFTGjXz/Qz+W+rCNStKreQgi5AwEi3aU30d9+exkKdwKWbbKplKOfeaGMaRrZCn
         kwjr8RH8wAzH1os1sw4mb74Rd+h9mFKQKb+3RWjXZ2zXjgl8kRGqmuysqwfnD7UYA2vT
         f89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003156; x=1793607956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z9O6BgWW6yaoipar2Lx1Z0Xt+u9evhaGrz9gWofeNXw=;
        b=XwSW1TGEIWOam8dKemXLW5KXYr5q8MYsRR3XLVbcC1W3+k0bTAobqVjramvz+vdyhj
         qlH0gHvSFk1pqknSjOTHiPHdqVnuDYeeMhQJddZPNRag4REX1Ff8R6yX4G/4aheBhx1T
         7fznBK+B+XOQuzMAD62LCcjorshIWeGEI72HmekHAtCqnL/Lf17v/bp7vUUaxPZYlH7a
         n9CuZ5u37qLfi3guBv2AXEltkBik8Od42b5iZDsLa2Wg6MStTkmZy0suDRnxTbN+tg7m
         SCX6iy/JdI/gPofzL0v/OOryXDEZ1EskALnkfOGMJgOkm2eWiPN9SdQKvK6KTAZuDGmA
         i/MA==
X-Forwarded-Encrypted: i=1; AKwUvByykQyTc2bHBMZORxbnKXJeOeEGAMa/CYe5bRxGzE2GUBNq6lGREY2aczwOqVM/5JEdR7FcpbP6kCUn3Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKna3ZzXsl2VN2X61j/Pixkgct9x05GBUI/TLZUeJj/rzg7/Rop
	OnN5/Z7jC/FZJl4IXnz9UTelMixqY7YCJTy/Oz8yis3M0exq4E5XMc8=
X-Gm-Gg: AYBFou2NQOd+i32Q6FAGdq8gnrLJhXwNmVcG/tAXrBLKiA1fX8Fg4qHPQefZ9zE+vIc
	OA+WsQLy0cyluRRlCHtrIfX6YFWYTiYQ02/TEECqpdFBiN5SqeO5WJxMvmX8Hi1gqAymW4j/JWF
	4XWg/n3sgxzHlXlYtk/kk5lEySsv2GlPqrtYCaB5KTgYABS9JzYO7/uQtua3nBQkfrKNfoRq+su
	GXZB32KSvX9xv3Tjwk1rsmv61WOdkpVF6M2CqdPzjpcMY5/Yb4yXLHaoYOAZsEVBR1iPjQ8SikK
	UrYK9F4C4HJaGvhGBzWxq2wBdBK65r1bE6SeCioqgexrjpqFBcnc3vDR1WZ7xgyqw0kuvtmOu3F
	GLvgRBv9owOf5Cc4HW+rmqiPP6mO4vuaRvwnY6aulJ0/m48IycKmc4PO6Ggvrnw9z3C5i4bzy2C
	n8SsIiIbLrbBdGvNv1v+GztjwSD/ShS2WeT1ZGVMihNxjfhKHXLWsJzhJhdkQ40k8NVSUDLRdBu
	XunHbZmKzxQTGpcJvJ2gvJ6rGdR7t+mwDAIysswHZ7lyLl/EzeycGKsnqI9I2ZAozmzmCgab2+7
	s3w8L6A7nGQtNvIQa4nEYViQ/m73YEfiZMWS
X-Received: by 2002:a05:600c:6384:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4a35ac3acb7mr104137425e9.3.1793003155767;
        Mon, 26 Oct 2026 01:25:55 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm211058215e9.1.2026.10.26.01.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:25:55 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: sakari.ailus@linux.intel.com,
	johannes.goede@oss.qualcomm.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	fernandorimoli11@gmail.com,
	lsa.uz@pm.me,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] media: ipu-bridge: reuse the software nodes on rebind
Date: Mon, 26 Oct 2026 09:25:49 +0100
Message-ID: <20261026082549.662885-3-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026082549.662885-1-dmanresa@gmail.com>
References: <20261026082549.662885-1-dmanresa@gmail.com>
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

The software nodes are deliberately never unregistered so that a rebind
can reuse them, but ipu_bridge_init() only takes that path when the IPU
kept its secondary fwnode link. Removing and re-scanning the IPU PCI
device clears that link, so the next probe tries to register the IPU HID
node again and fails:

  sysfs: cannot create duplicate filename '/kernel/software_nodes/INT343E'
  intel-ipu6 0000:00:05.0: Failed to register the IPU HID node
  intel-ipu6: probe of 0000:00:05.0 failed with error -17

after which the cameras are unusable until reboot.

Look the registered node up instead and restore the device's secondary
fwnode, keeping the reference the lookup took. software_node_notify()
resolves a device's software node through its secondary fwnode, which is
not set yet when device_add() calls it, so it takes no reference, while
the device_del() of the next remove does resolve it and calls
swnode_put(). Dropping the lookup reference as well would cost the node
one reference per remove/rescan cycle: measured on a Surface Pro 7+, it
was gone from /sys/kernel/software_nodes by the fourth.

Assisted-by: LLM
Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
Signed-off-by: D. Manresa <dmanresa@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index aea4699..45a304c 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -1098,6 +1098,7 @@ static DEFINE_MUTEX(ipu_bridge_mutex);
 int ipu_bridge_init(struct device *dev,
 		    ipu_parse_sensor_fwnode_t parse_sensor_fwnode)
 {
+	const struct software_node *ipu_node;
 	struct fwnode_handle *fwnode;
 	struct ipu_bridge *bridge;
 	unsigned int i;
@@ -1108,6 +1109,27 @@ int ipu_bridge_init(struct device *dev,
 	if (!ipu_bridge_check_fwnode_graph(dev_fwnode(dev)))
 		return 0;
 
+	/*
+	 * The nodes registered by a previous bind are still there, but the
+	 * PCI remove/rescan cycle dropped the IPU's secondary fwnode link to
+	 * them. Registering them again would fail with -EEXIST, so reuse
+	 * them and restore just that link.
+	 */
+	ipu_node = software_node_find_by_name(NULL, IPU_HID);
+	if (ipu_node) {
+		fwnode = software_node_fwnode(ipu_node);
+		/*
+		 * The node only becomes the device's secondary fwnode here,
+		 * after device_add() has run, so software_node_notify() took
+		 * no reference on it. Keep the one from the lookup for the
+		 * swnode_put() that software_node_notify_remove() will do on
+		 * the next device_del().
+		 */
+		set_secondary_fwnode(dev, fwnode);
+		dev_dbg(dev, "Reusing the previously registered software nodes\n");
+		return 0;
+	}
+
 	if (!ipu_bridge_ivsc_is_ready())
 		return dev_err_probe(dev, -EPROBE_DEFER,
 				     "waiting for IVSC to become ready\n");
-- 
2.43.0

