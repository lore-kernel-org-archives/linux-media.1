Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA4842317C
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 15:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783437878; cv=none; b=QI+ys4DwatrRf/fHdTabpJMXaekjZlvTgvWPiWlUypX0iT+Uy5e7Olf5slqsY1Gd986TZ8fwdZ8uREqP1aYcAl/8FlEn3DhhiZiJnM/A2aeYJLWubXaLKG/y1fZn+Mmt2fR/F0lRbkXnclX5A9BmYKAmfx6RWVCrHPEuKMdqtyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783437878; c=relaxed/simple;
	bh=CL1TWI09q6rHhesaHDbX4V0SqZsT9mM7aOBFw0VS9zE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CzFksfeOiE2XZcAqpF6HuMBx028nfOY32lnBot5pvs0CX4tGA1wpLDZ7A5NOzHP9GdWA0gymzmOIlyGH+4K3lZfHvxicLudV87Z96Bl7ZuDuf0eBrZGzSp2hXJnbxXYNgK4dN69iSGYxQ0lJqQWvcfsYd+3QKD1yj2BfqNHlocw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MB0ogKS/; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MB0ogKS/"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84347ad88edso5793568b3a.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 08:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783437876; x=1784042676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5PiSvPUBbt45pXI07lt7UBDjYJzi7dkwQwjZGxzED6A=;
        b=MB0ogKS/YeuQDn3H4JnqSdX10kw9ycNBaXzneq9hX9q0ZmF7sy3mdgYJ0B86CANJBA
         p/+q2XOqaJEZhK4EHxcG5tZ6+UnaLVZGWQXBzKbvDoLos5hJ4cFh1pIRZ/lr2mqlgGul
         ucSX/pjfiMNpDu3BtptiwiyLPIbl+XqU4Z2Z0q441dzI8uSsetxAO7ML8EpXujN1Kb9o
         +arIaCDJdNod+fy53sfTFx52avYWCU8D5Tjb7bqo4dyx19KzK4fADF6QCz1N/qOAkgdR
         UGd62pevk9PeP9R6qVbA5gfp9L3UPVN/PBHfdnnzSPXOF43wIHoKXt+XlLH6yEuh+jVP
         Fbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783437876; x=1784042676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5PiSvPUBbt45pXI07lt7UBDjYJzi7dkwQwjZGxzED6A=;
        b=OLa5X4Ydf/7a2IUMyCU+jHSx+v0p9cza2F2SqsPo4L4Fb7aek6NdLNGM39qHlF4ukT
         Ks9KnXA65CoI7QH4vx0EjCmctAJGQlFXXWlf7vkbScRWucrlQEAj++8OPmkW6TPz75bQ
         JVXYZ9uketQPHShmAtEzEOI5U45TZpBvlxLDrbQ/pu+jwemkDAelNfy9mpvtvuMoxsDB
         bNmvowaInyatcE2pDumBj2qABv0f/l2YQtvbz521PWf7m4ypySVthmW8PlZ5wFrDQ+CV
         y6EqMhec/qcAZq4Y8+ptaz5ALry9aML2fz2O4FRtrWmlw8hJQsbhWYL0O3vBZRb4jYE7
         EZRQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOAnVSiqmiap4QKHKsVenb0yXQQHMp96BWy5khTnZtYRjBnKUG2UrW9ePFzj5gevVtIiwxoU91OiPHpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC8xNNGbaHME10y19gN5Xxmak+HtEiWYJL1PGMVZt26ig1jVe9
	aXfsYn9/yVDIPkBl/oxg809uVYLDyZLY2ztTdf1pSc8JOgxMb+mSnXcR
X-Gm-Gg: AfdE7clM4XjaKADzq/7SX2+Oy1YOmTDdmUMUI4+wWhJJ8VVP12T2CCgUTf+NSRnm+DN
	WVQmakUKiuPrN4nMTp7k5Yxcg3djRFzxTlJoLMjc0UcNlaOWutVFgUtVaQct3vVhLQiUMyPXfp3
	/QCpBJsyMnRz4GxrkIrsYGJhBtMaSjBh+zBF6wp//9EKIcUaQ1I8d0loTx9lK3M7/B70bqPln9f
	HIMBxGvhTLyw+qvgYFR3bTUXQyhw9BWj0X4LRdps1cbxJ7AxvXb9vk3BsZo+rAFe44mipWmXxdM
	9hlomIlnVHeKnxFmYv8hUAsK7olwYITizmt5H6StV89HRrarnu8FlpNkGb8co7mO3y1wA/l9Rme
	s6pLcLpK6jmV0R32xpLwHILp/xMfKJu4yjAe+MeDA5ToKetnPQvfdJ07Tebw2a6vXffGEjBXXjK
	dR1ilKn+Wn1+dhN6MT+NwrFb9k1lDMgnIRKw==
X-Received: by 2002:a05:6a00:3288:b0:847:893f:2d0c with SMTP id d2e1a72fcca58-84826c1edeamr5779113b3a.5.1783437873353;
        Tue, 07 Jul 2026 08:24:33 -0700 (PDT)
Received: from Alvin.tail8ccd9a.ts.net ([49.216.173.166])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7c142sm5652726b3a.45.2026.07.07.08.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:24:32 -0700 (PDT)
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
To: Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hao-Qun Huang <alvinhuang0603@gmail.com>
Subject: [PATCH] staging: media: tegra-video: vi: fix probe failure on skipped last port
Date: Tue,  7 Jul 2026 23:24:25 +0800
Message-ID: <20260707152425.571254-1-alvinhuang0603@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_vi_channels_alloc() iterates over port nodes and skips those
whose reg property cannot be read or whose remote endpoint fails
v4l2_fwnode_endpoint_parse(), leaving the negative result of the
failed call in ret. If that happens on the last port node, the loop
ends with ret still negative and tegra_vi_init() fails the whole VI
probe.

The same defective port earlier in the ports node is skipped silently,
so probing succeeds or fails depending on the order of the port nodes.
The CSI equivalent, tegra_csi_channels_alloc(), returns 0
unconditionally after its loop and does not have this problem.

Use a separate variable for the per-port checks so that only fatal
errors end up in ret.

Fixes: 1ebaeb09830f ("media: tegra-video: Add support for external sensor capture")
Fixes: 2ac4035a78c9 ("media: tegra-video: Add support for x8 captures with gang ports")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
---
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 456134a9e8cf..f461e117305e 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1257,6 +1257,7 @@ static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 	struct device_node *parent;
 	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
 	unsigned int lanes;
+	int err;
 	int ret = 0;
 
 	ports = of_get_child_by_name(node, "ports");
@@ -1267,8 +1268,8 @@ static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 		if (!of_node_name_eq(port, "port"))
 			continue;
 
-		ret = of_property_read_u32(port, "reg", &port_num);
-		if (ret < 0)
+		err = of_property_read_u32(port, "reg", &port_num);
+		if (err < 0)
 			continue;
 
 		if (port_num > vi->soc->vi_max_channels) {
@@ -1289,10 +1290,10 @@ static int tegra_vi_channels_alloc(struct tegra_vi *vi)
 
 		ep = of_graph_get_endpoint_by_regs(parent, 0, 0);
 		of_node_put(parent);
-		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep),
+		err = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep),
 						 &v4l2_ep);
 		of_node_put(ep);
-		if (ret)
+		if (err)
 			continue;
 
 		lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
