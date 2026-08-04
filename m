Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D73332B10D
	for <linux-media@vger.kernel.org>; Tue,  4 Aug 2026 07:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785828470; cv=none; b=rWGv3kBAe9iVMWp6wnx/7qdBGeyX9Qq48dXsg0292VtQ34J+nuFtz2+BxEUUntkfuU+YFWhuu5FEM18BVUqwO8pu9p+qZBLF5C7BQhELssLVlCglEBOVPWx6F/ezx+DZlvAXfG/cNNJFEGmDqDRrW9h8GQw01ipz7RegAXXVNZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785828470; c=relaxed/simple;
	bh=AC3t7RrMCN/mfJez24cFUMl9bHT8KsQ/M3uZVTgVTu8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nqx/WbWwpcl0KqAIgza3cMjUgiDh/32XRee82heeR3Hf9aEdph60xWNxmlKp8+X87poQULMOiJiRLBnGgckysEfw+7/Lcf1S2lxFGPSPQ4SzU1ua1FpZa+D1kYULmypMIr8TMZint43crY77KRiftVRzr9kGlS17mXrRKeiWYu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8s/WJhZ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8s/WJhZ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-472326ca506so2918089f8f.2
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2026 00:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785828468; x=1786433268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QHEypZX+49feTAVjHCZcGseNbVTzVI574zRhpWtGRxY=;
        b=j8s/WJhZWWNcdBRHtG/9z5aIc2HvlP87KOBSLzxLPGyoLmJsGORc8N6gQ8OPWRNtuz
         mdDNnT9//hu0vyFKzQX3yBmAzHaGURolR3kYyqYVA+jbKsj4FS/ibqsnGU8mR3WIPUCz
         lK5pmiN0/JI6+uHzogfuuWURqjQZtXDmXNsTE2qd90Lc0fZ4zZsllPneE7oFh6CJOsQm
         CXRJ0iShIkO62v4bEHwbCGPCA0/joHmu2tLfPZKLLwX4oFGnK2sApRUgCc5jT5tIO+Wv
         fA9dr2AlpHQmGUc7orvbpAd0juGBI2OkIK6KX5vF39tzmImobNKlAztG+hgsSxjBoJ1M
         McBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785828468; x=1786433268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QHEypZX+49feTAVjHCZcGseNbVTzVI574zRhpWtGRxY=;
        b=TD5fJkcyh5XBi0912IqxC8d9jyE/SjV2EUFwxPd58nI2bLrWV8pkUfohhw+rbx/Ywv
         SxCoPHlzzfVUsix5wmHU2/FUv4iZ8QDNPn821NaErvQmr9RtSqEeidZ4qs+L06rvRCtT
         zYzB7XLJ+lAZo5JIcCG7XimpqocW4lwK3FeJP28Pv8gzDcQtw8geOQXhyoY5vWURgCSi
         1ghrD3c0QVczhfDAOlradxr4uTAo3oWxU6tiYKo8CHyPb3LaMpd6qUeQLpiDkL/R+c/I
         GsSbKsSprWqYgUAo7JYuamcoTFjxsjcczlxxEDkZ1rG8Wib3+XoLu7M86P5PBbQ326hY
         HtOg==
X-Gm-Message-State: AOJu0Yxog2VWPbaLJa2L03Mekw3EvX4mLQoCxBq2UgU6OSS0ATPAHaEb
	uhMUXsMzG9ZaIJdkuwXrRVlOywVU0biSXujJaVwBtkaALbDK5vHVL5tS
X-Gm-Gg: AR+sD11NBHMo/rUjslUVjYI5ZoaOZh61gKPbxHeq8PLOETLSMYAKrjOh7kQh6L2Ggtk
	bm911mfroa1pZ8x81G4ZgNz3Hl8cI56BicCBgHzgyWsOEsvsK2tFYdQsuZOer7DMr13hYlq46UM
	9aCzO0hIgLtJoS36MvVFP3lWPaAWY+CffAzsNe0E7aFQNHiT+ZVriVE2jKpp6NymivoA7Htnju4
	1nY+9W+y9oHVkmrjk6Hr+O+K0uWlH8sRRGY3kOTGOyloPe6OFElxkxdg8U8B1vOqMwXN3KuBaa4
	f00qewAbObauI3B9bbrNHxaZvFdlGbPFRwpSCXdaJVDleLqyf/JDk7ioTDufiqGkWhXmMDpAv1i
	0ypD6ffXtLsonbAjpWsTC4HzpnKcL+GJT9q7a/Du8sN8cI449kBnkNj7dOAK5bYKcV6IwoTY45Z
	o3fFS6Vqa5aHUBawT6PbmlD/b6rOzaydVvyiSnPMfa4cQchWgqzyxoVvDyYlOR24IFHasnW6/zq
	u5hEPOX4w0XMXQfPv19U/gP5RRDAcdA7475cPo3Y36bpI/Cb3+UT7kQ
X-Received: by 2002:a05:6000:24c7:b0:47f:8fc9:6eaa with SMTP id ffacd0b85a97d-47fd72ba6fcmr34214693f8f.8.1785828467494;
        Tue, 04 Aug 2026 00:27:47 -0700 (PDT)
Received: from thinkpad ([2.176.232.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458b05fsm42422253f8f.28.2026.08.04.00.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:27:47 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v1 0/3] media: sunxi: Resend active-state conversions
Date: Tue,  4 Aug 2026 10:56:27 +0330
Message-Id: <20260804072630.28745-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These three patches convert the sun6i-mipi-csi2, sun8i-a83t-mipi-csi2,
and sun6i-csi bridge drivers to use the V4L2 subdev active state API.

Each patch has already received review and testing individually in
previous postings (see the changelog and links within each patch for
that history), but none have been picked up and none currently have
a delegate on patchwork. Resending together to make it easier to
review and apply as a group.

No code changes since the last posted version of each patch.

Arash Golgol (3):
  media: sun6i-mipi-csi2: Use V4L2 subdev active state
  media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
  media: sun6i-csi: bridge: Use V4L2 subdev active state

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  27 ++-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++------
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
 .../sun8i_a83t_mipi_csi2.c                    | 112 +++++++------
 .../sun8i_a83t_mipi_csi2.h                    |   2 -
 7 files changed, 194 insertions(+), 220 deletions(-)

-- 
2.34.1

