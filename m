Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0B83955EA
	for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 17:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642548; cv=none; b=Pso7xXB/HUBoQ0FAHXhqxCD29mF1eHrg1qy16pA2SIkVpLr2EO4EwG/bdW/mKp9ZoT8PxUo3Gy9daIBkKJHHGgnM4iuz3GJJHr/E6wcEvm5zBvh4Tect2OdDedYpv01Lchr/mWf3f2tS+Z1+iUxHnYTCqKU/xUHdf3lUSSHSrxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642548; c=relaxed/simple;
	bh=EpdUELAaiZioheWX8e3BxNxgpQ8irAdVJXLq8LOJzGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JRzOZZipdMDLitwE3GvH840GSKpKH/4qphXTn9kvMWLlUms8H469iGtfV+YM3IlisWyh11p9TzJiciJ/a04vPJ7PNSTTbEZl3U858HaKAh9ENqSZAbTOoNE8+3+2UsXU7qYtnYzj5fH+ecyMXkpQ88JITIUY54MGCtiJ3X0trjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZ9kS7Wb; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZ9kS7Wb"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8485ef63b68so11516b3a.1
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 10:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786642546; x=1787247346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qAtVjKLVKpx3lHCaPIBwIdrASts/5vle7hbdA02CwC8=;
        b=dZ9kS7WbANDq0lyiyYO5EIzuMkBAp3YO/Q5g4ydSjAdxt2wymQQvY/1relP5V3LnIY
         jsFBnbfSG1GOXSuCbOiS/IRYOLqNlxuZdWavo8RAKBEnujCE526AOKkr71iTvGT+EZmW
         U4KlUxmDocBIKHsoU7jwyQ9cWq19c56bBQrxCm7FZkQ8BBUrD6WBDZQR2bDnwzrx4Xr/
         ShX4J/XlEW4CT/HbTJTam369i1I9YlHFAODcWevJiE+6qrSVeCk8ye1YinKaz8ImKGFu
         F9NdHPM0PIx9g/9TviAwzarzumwtbykpnfcYh/BQqXHboKkhUYFHQ1CiVfbicBWCSm1N
         ZZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786642546; x=1787247346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qAtVjKLVKpx3lHCaPIBwIdrASts/5vle7hbdA02CwC8=;
        b=U6VwfGbp4WMSYraDJIQSdVtnwSKeoLied9J09IbzEeuU64znm6J5yK+SJsIyFzlHcP
         JvpzMdCeZdGRU7kIPJ9vBtnxDaM2BQhhDZ/vN6oVV7vc8iDJXoD71U737HQq3uQeXkYG
         X4UHu0WT4v8A2mTBiNyNw4N7EvXQ3ktkrREOsPRUu5EE+lQ375bZk5A9QoDpIJWc8L6q
         W5qGXKshfG/uHSSlv1G3tps7XPMtGsaEbgT1wmqlKGpZQSA+o/zNHXG2hln+/BGeGJHd
         KkBZWTN1cCuxYlqnkFO9MmypPbovVT17CstZg0f2VPzMyRcPwJj0n0R+XPE7dHV/du5w
         /VNQ==
X-Gm-Message-State: AOJu0YxMFH6XzGHD78zu5vJeSj9hSeSQtxysMleEkLEvplj//b/YcYVA
	BrKIdP9bN7nC5WhkxjRrti1vIN13bG8kulQIKEaQfYwSAER41eGtsPwm9OxT/GzTxGs=
X-Gm-Gg: AR+sD10CpVs9FMhVslyBwZZJZLCdGkKGkJia+Z+Oo2ax8V0x0Y9iX8a5OpSPNFJ7xwO
	DO/RHjt8j6vHn8BeQCUuCpU73UeJOjpSITaPFqoaNBPQyQVvQV1gH3KaBArT7b6JCi8+izi6jgH
	2V6Yg+EKWIoEbo2avAuR4798rSmdbMFmkbOUJpAdEvne6nc68JdLZWy1yF8HvPNtN3v14GM4AmS
	xkbiIDgGVh0M/w65o3adHQR+0KxubGrihnuxRP+xGxKfi/IGutDSQhUvZQGb5jzEiBEIqEu74eM
	IcjbQeAKcohydxctoTy97G4AgOdxBYFguYfwekjYGc4a1s4auLXzPz6SOXLNZt3HD/hUB1whBnL
	y7Y/ylBgda+sGKeJR5ahTMBfDY3WNdwkafeCAVS71l5OPhfgHZBp1/Q6NCCvaZ+X4NDfEMUvPOJ
	0oWVu8uZyOMRp4aebn1LKWnCbj1jwxvF2cKtN3dLvidzYk11SwnUWnYNu8C/w1lQasRDC9Ur2CQ
	Q/acg7Z747D39nMrSsW/mezJ740rFCD/bacDPIfnPPaQpztNI3S9E73
X-Received: by 2002:a05:6a00:6c88:b0:848:4d1a:9554 with SMTP id d2e1a72fcca58-84fc76bd05fmr8927564b3a.38.1786642545823;
        Thu, 13 Aug 2026 10:35:45 -0700 (PDT)
Received: from desktop.local (97-115-114-204.ptld.qwest.net. [97.115.114.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc4565c86sm1269994b3a.12.2026.08.13.10.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:35:45 -0700 (PDT)
From: Jack Flusche <jackflusche@gmail.com>
To: linux-media@vger.kernel.org
Cc: Jack Flusche <jackflusche@gmail.com>,
	patrik.r.jakobsson@gmail.com,
	sakari.ailus@linux.intel.com,
	hverkuil@kernel.org
Subject: [PATCH 0/5] Add driver for Broadcom FacetimeHD camera
Date: Thu, 13 Aug 2026 10:35:08 -0700
Message-ID: <20260813173516.29293-1-jackflusche@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge Patrik Jakobsson's out-of-tree driver for the Broadcom FacetimeHD
camera on some Apple Macbooks using the Video4Linux 2 framework to add
in-tree support and remove the need to install a DKMS package

Jack Flusche (5):
  facetimehd: copy code from patjak/facetimehd
  facetimehd: add Kconfig and Makefile
  facetimehd: fix compile-time issues and formatting
  facetimehd: add firmware extraction script from
    patjak/facetimehd-firmware
  facetimehd: add entry to MAINTAINERS

 MAINTAINERS                                 |    7 +
 drivers/media/pci/Kconfig                   |    1 +
 drivers/media/pci/Makefile                  |    1 +
 drivers/media/pci/facetimehd/FIRMWARE       |    6 +
 drivers/media/pci/facetimehd/Kconfig        |   12 +
 drivers/media/pci/facetimehd/Makefile       |    2 +
 drivers/media/pci/facetimehd/firmware.sh    |   61 +
 drivers/media/pci/facetimehd/fthd_buffer.c  |  126 ++
 drivers/media/pci/facetimehd/fthd_buffer.h  |   73 +
 drivers/media/pci/facetimehd/fthd_ddr.c     |  670 +++++++++
 drivers/media/pci/facetimehd/fthd_ddr.h     |   33 +
 drivers/media/pci/facetimehd/fthd_debugfs.c |  204 +++
 drivers/media/pci/facetimehd/fthd_debugfs.h |   16 +
 drivers/media/pci/facetimehd/fthd_drv.c     |  558 +++++++
 drivers/media/pci/facetimehd/fthd_drv.h     |  124 ++
 drivers/media/pci/facetimehd/fthd_hw.c      |  710 +++++++++
 drivers/media/pci/facetimehd/fthd_hw.h      |  128 ++
 drivers/media/pci/facetimehd/fthd_isp.c     | 1468 +++++++++++++++++++
 drivers/media/pci/facetimehd/fthd_isp.h     |  770 ++++++++++
 drivers/media/pci/facetimehd/fthd_reg.h     |  183 +++
 drivers/media/pci/facetimehd/fthd_ringbuf.c |  133 ++
 drivers/media/pci/facetimehd/fthd_ringbuf.h |   45 +
 drivers/media/pci/facetimehd/fthd_v4l2.c    |  759 ++++++++++
 drivers/media/pci/facetimehd/fthd_v4l2.h    |   34 +
 24 files changed, 6124 insertions(+)
 create mode 100644 drivers/media/pci/facetimehd/FIRMWARE
 create mode 100644 drivers/media/pci/facetimehd/Kconfig
 create mode 100644 drivers/media/pci/facetimehd/Makefile
 create mode 100755 drivers/media/pci/facetimehd/firmware.sh
 create mode 100644 drivers/media/pci/facetimehd/fthd_buffer.c
 create mode 100644 drivers/media/pci/facetimehd/fthd_buffer.h
 create mode 100644 drivers/media/pci/facetimehd/fthd_ddr.c
 create mode 100644 drivers/media/pci/facetimehd/fthd_ddr.h
 create mode 100644 drivers/media/pci/facetimehd/fthd_debugfs.c
 create mode 100644 drivers/media/pci/facetimehd/fthd_debugfs.h
 create mode 100644 drivers/media/pci/facetimehd/fthd_drv.c
 create mode 100644 drivers/media/pci/facetimehd/fthd_drv.h
 create mode 100644 drivers/media/pci/facetimehd/fthd_hw.c
 create mode 100644 drivers/media/pci/facetimehd/fthd_hw.h
 create mode 100644 drivers/media/pci/facetimehd/fthd_isp.c
 create mode 100644 drivers/media/pci/facetimehd/fthd_isp.h
 create mode 100644 drivers/media/pci/facetimehd/fthd_reg.h
 create mode 100644 drivers/media/pci/facetimehd/fthd_ringbuf.c
 create mode 100644 drivers/media/pci/facetimehd/fthd_ringbuf.h
 create mode 100644 drivers/media/pci/facetimehd/fthd_v4l2.c
 create mode 100644 drivers/media/pci/facetimehd/fthd_v4l2.h

-- 
2.55.0

