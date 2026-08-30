Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0972D3ED1
	for <linux-media@vger.kernel.org>; Sun, 30 Aug 2026 16:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788105757; cv=none; b=NKdacLWeufwVkRoGY3IWHVJ+crdeNEAexhBFr+/GW4Gqeo9LmPNEKBODRYM3/WLDSjBxGqzilwOSoECV+/kbXzgHT8qJE6DkM9daCpf9P8iAobzIqXRCPJEyqYfZu5AaK4DWYxXM29amh7OHyKB9lt/w1eP4xfnowhy7xzes/p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788105757; c=relaxed/simple;
	bh=5I7WZk9Likezcszkxm2f5VMiSja2ZVMFwssHq+M2D28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sc1koMyGNb0aM40sEI+B6LtA0j4WdiZG4gVfNoIXXltO8K4LB920MTEo9knrOZDP6eFpeL0rveIVCFVYcVgxCrhkWgc0139I3dOaLXUYraaLmZUfzP0cEae5vFNF+dt5IAaSiHhR8ZK05eR5xrLA0svbFUomivqkkN3anrAOBdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyksnbdq; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyksnbdq"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so2144836a12.3
        for <linux-media@vger.kernel.org>; Sun, 30 Aug 2026 09:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788105754; x=1788710554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EU/f9ZuMkFjEGmh1dmO/3ytBQ8IveQK8KxWk7ZUANeY=;
        b=kyksnbdqZ47+kSj+nWGucjW4eEB6AIvW9McJEgCa1C4c9Y1XcU78Nb9VGvvF8DLiVq
         UMRCJumCfZpR+TZupOv/RGjQxzVz3Udw4dvVYlKswWvSD++w1Oy2A/tPI5Km1z0KKMo5
         7NP/tPbKZ44VxYfno+ZpuLaoh2VncCJDsDxlUZSLQBU8MtA5GaNHSnsyNdGsHx7D13+e
         8f9fvprPZnmvgCAh2flwCH8o06sZ6p3h6dQWXYhZ945btkTetrqtBLekyrLsxFX9MQxx
         64mKJhh+mkuHTcUG7bO1tI7xHbbGYzi/br4Jl/D7XNhAOG4WS5D8Qx0CySOm2cUUBoG7
         9RPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788105754; x=1788710554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EU/f9ZuMkFjEGmh1dmO/3ytBQ8IveQK8KxWk7ZUANeY=;
        b=oL4OHBR6/tzvHk2DA7EJeEfGRoXjSEvdCPDjFb3h/0lQWDKDNUAHlHSWVTNXNqZeIo
         e7uZ3b7R2BbCXD6n/GmmQctLdD3panFV/s1zj9sQYEFFa+hfsGf77AJjB5Nz4l+xwsT9
         BliSgytTml9smLH5+zR4dAQfwP7YqEpOCM4F7p9okWN03vIwd8R0FVzlcZTL/1zRJXOL
         MJooRDjx/ArgtIE0Ce7qETyFJ8O17V3h4I1FHEA/cuh2YBClX1l3zB8HXWfPnU4RXLS0
         eUOBJmi+3BKuO+VhwY3mTjO/qmUBIA3Z7yZYRPf8tENUSMk0uGjR/bGIFVOq4HDGGSaT
         fc2A==
X-Forwarded-Encrypted: i=1; AHgh+Rqf6idgU9iOEkUZhvbS/rDDun8FOXW4CtcalRJ/ntlJujd4FJX14Us9RVRJrZwGssoztR14i+UAr9HsEw==@vger.kernel.org
X-Gm-Message-State: AFuF++la6pJrtUCrgbkD0QoKzZ7bGz4WRUv0d8qX4L5ULDe+Fn3EAfCb
	yvq5XN/UCQZBxTbbOjYD6fhrxYr99Di62X6yJiyWyTyZN1JqTxsS4Jo+
X-Gm-Gg: AR+sD119TaEUMwpR0wMP+KV5Bl2XmKVy5a4C0HHoib3h2+yeV04PymBUIda/40+X5bt
	Hf1Yav90BG6BW9MsltfqsFHS2Oc+uRGpx/r5bLAt6dOdha28xp7Gf3o3s/6VvFEqzZ+zL6ovjma
	905TpxPmLN1W8/4O0jqEpITJS6V7x+3uXTqsofEBFH0/LowNrgvngaGwsOaLhOgbaV2k+E7rzle
	BjtMdxDC9uTUOqDiy2XBAiyHEBNbQmLPy/cddrRh3NxoNxoLj+FzUt9DHfpevNkAGV4jsT0d/+I
	lolwG1gakPcPfF+/2+YxBZQPME2TVJZIJfCeQU8abmNv/pDRVbGHeTt3+aHF95+mCqMpr3tf/Da
	wNhKegL5YSugUQmlZ49OWmurSs640pPTat9Vq+pN/1FPsoe9m6+OqlbGfoF1/AkQfhFz9seAL/W
	4G0ByYK5ZKI6QwC/vN8zGzRoL92cXeVrZbuKBBX1q4EDEW3MVMuZ0iXbkNcKrIEgzckKq1JhHMR
	Z2GvnUgeTz6Ru9odJec/LhG7sKcgBAG+/SbJdYVGnduzz9osiIc/g==
X-Received: by 2002:a05:6a20:729b:b0:3cc:9618:f51a with SMTP id adf61e73a8af0-3d26615ece4mr29016741637.8.1788105754380;
        Sun, 30 Aug 2026 09:02:34 -0700 (PDT)
Received: from nuvole (2.248.212.35.bc.googleusercontent.com. [35.212.248.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2839584a12.11.2026.08.30.09.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:02:34 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v6 0/5] fix and improve for Hi846
Date: Mon, 31 Aug 2026 00:00:20 +0800
Message-ID: <20260830160025.211384-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes errors blocking Hi846 driver function, fixes
link frequency and supports 6MP and 8MP modes on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v6:
- Add link freq ctrl back (Sakari)
- Use v4l2_link_freq_to_bitmap() to get matched link freqs (Sakari)
- Move clk_get() before than hi846_parse_dt(), since we use clock in hi846_parse_dt()
- Add link freq check in filter for v4l2_find_nearest_size_conditional().
- Link to v5: https://lore.kernel.org/linux-media/20260712115012.91600-1-mitltlatltl@gmail.com

Changes in v5:
- Use separated fields instead of raw register values for PLL cfg (Sakari)
- Use mul_u64_u32_div() to avoid loss of pricision and u64/u32 issues (Sakari)
- Use v4l2_find_nearest_size_conditional() to filter for different lane cases. (Sakari)
- Drop line break (Sakari)
- Rename post_div to mipi_clk_div
- Correct div1 number from 1 to 2
- Link to v4: https://lore.kernel.org/linux-media/20260511103927.279550-1-mitltlatltl@gmail.com

Changes in v4:
- Correct default lane cfg in commit for 'fix link frequency handling'
- Fix messed header (the Media CI robot)
- Move constant to the right side when comparsion (the Media CI robot)
- Link to v3: https://lore.kernel.org/linux-media/20260511090924.269106-1-mitltlatltl@gmail.com

Changes in v3:
- Fix modes handling for different lane cases (Sebastian)
- Fix header missing (the Media CI robot)
- Link to v2: https://lore.kernel.org/linux-media/20260501095433.1609309-1-mitltlatltl@gmail.com

Changes in v2:
- Remove uncessary `else` (Sakari)
- Fix link frequency (Sakari)
- Correct link frequency for DT
- Link to v1: https://lore.kernel.org/linux-media/20260429070351.1307204-1-mitltlatltl@gmail.com

Pengyu Luo (5):
  media: hi846: Fix hi846_write_reg_16 handling
  media: hi846: Fix link frequency handling
  media: hi846: Fix modes handling for different lane cases
  media: hi846: Add 6MP and 8MP modes support
  arm64: dts: imx8mq-librem5: Correct link frequency list

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   2 +-
 drivers/media/i2c/hi846.c                     | 370 ++++++++++++++----
 2 files changed, 289 insertions(+), 83 deletions(-)

-- 
2.55.0

