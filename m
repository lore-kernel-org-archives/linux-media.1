Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766CF3E00B3
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169385; cv=none; b=rZoLYGlSm3594+iJTq7pLJHxp1Sej4PqjkyiEe9LpyB1AxYrletpKIOQnBQ/e+g4saLpF1ssKvXowk3n9uYUyB/qKygVh9tLoYTzF0znQUSlP3cnjyjVTL4+wgTIZSURGdEm4s6zdw4J4xfxI2kDkioagNmf0wdol/6Akum3XeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169385; c=relaxed/simple;
	bh=LuYj6EwIqV6NwexPQcbrO0D0onCO94TVcOKZPJJBWb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kwq0yQT/nbVLhc9VnGz43rRUWl9U4W5NyzRO46lfXsg1Yn5tFGcSR9y9IVKqaN5q+lGebyI1FU+NBYv+u6pRHsSddwDJXEBRZfMgK4LjDhkxOT0+w5I4GHMPqUaGxbeR67Sb4R/Fa78N8EpsfrUXmuh2L9PfGz9OS+UliDO7GF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jp9oxMo9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jp9oxMo9"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495590dde14so31332045e9.0
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 02:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788169382; x=1788774182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mNQxdTkzGD83pNFUYAGZDFb9hsIN1sZQHskMcBDnWv4=;
        b=jp9oxMo9aphNlZnBGXpZTBVDAGlj83XN6Cu77NXc9JiuvHYqmQSYFb5zsNHVrn1kU5
         5zq1vR+vUNAhEPSIYn/bq5JtxU+isqQ8uB9G/3+1BEJn+9GzVLSgExs/CVwE6NTHXCh8
         cxc+fSV+r/kp7dqAGwLCj5I+M9OgMj/XmDcL1p228LmNY9GZaiG97ft8zHq+LBz0ptCz
         kkPvDQONtV4K3EaimDy4tCwyJDbgd8RTpvoWAi8IuJFAg38QuIcSN5SuUL4CIOv9B5KK
         aBsQJe8p1enkD/3xLzfKQv4INmvg/57rj85OAcdJaE3bgz2FCookRaW4vfxaaDx+xdup
         qFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169382; x=1788774182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mNQxdTkzGD83pNFUYAGZDFb9hsIN1sZQHskMcBDnWv4=;
        b=emTQiprSeLgSuEYgSvhg2jjzwhXszN6HCpsh+dS7x1dVGjAfTaLO6ntbHtPtYQYpjS
         Odd6P822zUs3BZncn65qtJI574uq85Zy8FAR9zPRha6eTaKXpmXidL81kF/AtX1YcrzF
         AGtjyDTlHh0GereJZg2nQxqxi7hMnU9rKP+BTjcZ4cDp+33TIBbHWtDCLfNVtDH59Okn
         9y2zTejkC2XNT/IidPZxMb70AN/xKdKM725FlSI1TEs9nO4e18GyY6fRoOWFKIE27vke
         6udQ4/8CcgJIuqgLgqkYmBeFG4rFJpVV0R5X9A6I64FEMI1QI1mZDvZ4utsHAS7RjHBF
         ZDkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqTYjnk96OYcMIhPUAp9Cvvih3OVFGLjqnPuGXgDKWGN/TjIIHK73LHpYBYos/nUozeliujgwRlXd0ySQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m15eCEcA35Ej2psmLb4IuaaNm+cG4BYGeNzkQbW8v9p/634Iw1
	JO4/zs9GhI3KgcvBi6ID8uSryT6DCSzQInc7kW6yAhW8uVKv4AvgtAg=
X-Gm-Gg: AR+sD10djb0xpwt2kP5FU57HdIq+Ar4WaLRca1HqRhd67fiO8tmFejnJmsv1s6HuTw+
	RTc2f1/fycnt5atwaC+OIIuu7ngI14rJzQhJkfLV9TX0hrEDpIoycWPxhhhvvsoPJK4cGNNWfqz
	6CTAD0iwOAFDDhsN/wmwnWOnU/198hJYDsgeU35ySmX6De33W2YS8jbqbe7VRoCVwS67bF1BBWE
	Ppp4o6HKjKGltqJDcgwF6DnNf6JWB4wQO7Cyr1R7kN4L2dpK9vXeUGBtfnao2pL8kMqDF7lQJBA
	8fcZV/tJAV81yw20iOJUK3qkFxRmBM7lAXtZ+YoATS4GAqRk0JAY7c053RldV5sgknSybztb7as
	eWC+YlueNEVB9kpMyzYy5k3g9o0RgqAERBRGvZyej+bY7TrraTscQ9SVHCU5eZI+/XgVo3kX0sI
	EyUInXPuSdbUd230XxEZeFfKRbhrvixM+u+Jva8hL7rQFNV2ZTXW+51uEhqfU9jGbOUjjcguvoC
	pN4lvWVLWcRtTE+ZfEf/simAGO97QGaZzt52KelGUDj
X-Received: by 2002:a05:600c:3b01:b0:49b:9105:cdaf with SMTP id 5b1f17b1804b1-49cd943d074mr34361125e9.8.1788169381375;
        Mon, 31 Aug 2026 02:43:01 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9267c369sm189932125e9.3.2026.08.31.02.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:43:00 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: [PATCH 2/2] media: ipu-bridge: reuse the software nodes on rebind
Date: Mon, 31 Aug 2026 11:42:56 +0200
Message-ID: <20260831094257.29398-3-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831094257.29398-1-dmanresa@gmail.com>
References: <20260827232636.93145-1-dmanresa@gmail.com>
 <20260831094257.29398-1-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The software nodes registered by ipu_bridge_init() are deliberately
never unregistered, and the intended design is for a rebind to reuse
the already registered nodes. That reuse path however only exists for
the case where the IPU device kept its secondary fwnode link, which the
fwnode graph check at the top of ipu_bridge_init() detects: then the
function returns early. When the link is gone, ipu_bridge_init()
unconditionally registers the IPU HID software node again, which fails
with -EEXIST on the sysfs name (the node from the previous bind is
still registered) and the IPU driver fails to probe.

That is exactly what happens when the IPU PCI device is removed and
re-scanned: device_del() unsets the ACPI companion, and
set_primary_fwnode(dev, NULL) then clears the ACPI fwnode's ->secondary
pointer, so the fwnode graph check on the next probe finds no endpoints
and falls through to registration. Observed on a Surface Pro 7+ (IPU6):

  echo 1 > /sys/bus/pci/devices/0000:00:05.0/remove
  modprobe -r intel_ipu6_isys intel_ipu6   # ipu-bridge unloads too
  echo 1 > /sys/bus/pci/rescan
  modprobe intel_ipu6

  sysfs: cannot create duplicate filename '/kernel/software_nodes/INT343E'
  intel-ipu6 0000:00:05.0: Failed to register the IPU HID node
  intel-ipu6: probe of 0000:00:05.0 failed with error -17

after which the cameras are unusable until reboot.

Add the missing reuse path: if the IPU software node is already
registered, look it up with software_node_find_by_name(), point the
device's secondary fwnode at it and return success. Restoring the IPU's
secondary fwnode is all a rebind needs: the sensors' ACPI fwnodes still
carry their secondary fwnode pointers from the first bind (the sensor
devices are not removed by an IPU unbind, so nothing clears those), and
the IVSC and VCM links likewise live on devices that survive an IPU
rebind. The previous commit made the registered nodes self-contained in
the never freed bridge allocation, so their properties are still valid
here. The IVSC readiness check is intentionally skipped on this path,
as the IVSC links were already established by the first bind.

software_node_find_by_name() takes a reference on the node it returns;
drop it right away since the node is kept alive by its never dropped
registration, matching the reference handling of the initial-bind path.

Developed with the assistance of an AI tool (Claude)

Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
Signed-off-by: D. Manresa <dmanresa@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 4de42ed..6fa1c3c 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -930,6 +930,7 @@ static DEFINE_MUTEX(ipu_bridge_mutex);
 int ipu_bridge_init(struct device *dev,
 		    ipu_parse_sensor_fwnode_t parse_sensor_fwnode)
 {
+	const struct software_node *ipu_node;
 	struct fwnode_handle *fwnode;
 	struct ipu_bridge *bridge;
 	unsigned int i;
@@ -940,6 +941,29 @@ int ipu_bridge_init(struct device *dev,
 	if (!ipu_bridge_check_fwnode_graph(dev_fwnode(dev)))
 		return 0;
 
+	/*
+	 * The software nodes registered by a previous ipu_bridge_init() call
+	 * are deliberately kept registered when the module is unloaded, and
+	 * the sensors' ACPI fwnodes still have them as their secondary
+	 * fwnodes. If the IPU software node is already registered this is a
+	 * rebind, e.g. after the PCI device was removed and re-scanned,
+	 * which drops the IPU's secondary fwnode link. Registering the nodes
+	 * again would fail with -EEXIST, so instead reuse them and just
+	 * restore the IPU's secondary fwnode link.
+	 */
+	ipu_node = software_node_find_by_name(NULL, IPU_HID);
+	if (ipu_node) {
+		fwnode = software_node_fwnode(ipu_node);
+		set_secondary_fwnode(dev, fwnode);
+		/*
+		 * The node stays registered, it does not need the reference
+		 * software_node_find_by_name() took to stay alive.
+		 */
+		fwnode_handle_put(fwnode);
+		dev_info(dev, "Reusing the previously registered software nodes\n");
+		return 0;
+	}
+
 	if (!ipu_bridge_ivsc_is_ready())
 		return dev_err_probe(dev, -EPROBE_DEFER,
 				     "waiting for IVSC to become ready\n");
-- 
2.43.0

