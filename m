Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E90A391E57
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 18:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787250131; cv=none; b=d7Eho1fWi+ZX+ht1gd3SCCoWFhby95tDzAcd6kuokmK8omMCxUc4sxIQG6/tXmyDBSvtidfSbi+JjT/0VZFCwEu/uYCupuLogFmaQqDTaAiwIG838n6XQlkB3dFiOgWsvW8+gjlQxzNx70ZGZOINDy5HieSI912NdQikDmOE++k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787250131; c=relaxed/simple;
	bh=EpdUELAaiZioheWX8e3BxNxgpQ8irAdVJXLq8LOJzGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RSH5ZcABHek0EQXKImCUW+N3lNgviObBYNNDxhKYuLx0pL6rW8M1ouw+Q7INWCkK6wp+GfmxRwtA/8vPNQJiSIivr05ws1euhl0k9Y3aIWzYWoo+mNPBRq2GwVyF1S+eeTKZAzK/FAZA48pAH/skqym6TGIVAAM0N+1h4VK9+R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7jMOjLT; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7jMOjLT"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84a2c90e383so919979b3a.0
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 11:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787250129; x=1787854929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qAtVjKLVKpx3lHCaPIBwIdrASts/5vle7hbdA02CwC8=;
        b=Q7jMOjLTEUCkDyaSfuEiGNTlj/Vcjsxr6IBoS8O204GmvMq3IHK7ckLZrLwxyX/nF0
         kNKGJeHka5Fw6ledDULPrEni2v/VpxiMRTjzqSe4lvp/wh9Oki2z1rGOVUz80cDwtYGy
         Y8LkXG0MPoTCjeNtzMHZIL9JHI01dF39isT+ioL3ncuUT+TgptVzy/Ul9hqjIEqoVWzI
         RW9Gv0WY7QsmJ1ByKd1NAADXwcKXrfuvpbnP193QZa58e90TcCeilirQFl7EO9eaHPXa
         E2Csk0Pu7qnZkcVZCcdGbSkwYzExwA0bcpJiPxrpZlVs85kxtCaVWx6NGwxGN5VuVTYA
         iA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787250129; x=1787854929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qAtVjKLVKpx3lHCaPIBwIdrASts/5vle7hbdA02CwC8=;
        b=syMxWXKiu1x/js8kIUW9U/youUjSbSI8tOZOryjRF8GfM02nDWA7Cr0KLnZZHaOMdw
         muYO8ekFcb7db65glOfalvIjmmLkkv1nZdRZN3IJNlawusTH13ogwArlNz9wbRm2yVc5
         fEliTDY4k8FaOx+isxAAdMgxHhTEI/xnk0F4dbXJqF+PJgjmT64mQSnO0oy4XgnJHtOC
         mRVjYs08BsPUixv81F3UbEPeKQTskAyfT9YWtLzHWSEN3FvyL6Hnf9F/OyzALHmSwS/6
         9z8SzGffcdB9Jb3cFHtvtLav20ISq8dmZiybGsQHOxjkdBXJi2J1Y6BXZVnA1Y1X191g
         pE3Q==
X-Gm-Message-State: AOJu0YyVAKyl7lqtef1cLBC+XMc19CHoImTBhVGAhRGRj3J/JRhhXCis
	PGr+UJl7lXlUPHP0U2ibs+bsT1bXm2Wg/MQzCuPSk+VLIh+N+OUk2EQmXBcyuCtmqrE=
X-Gm-Gg: AR+sD127B878lbCu5Xa7OBtM9i3GX14nu2BNxIAXs9kLDPfwFamaBLpgzHNl01vI6xY
	TICF6vRij0u56YUD7cLDzQYERQD5gTLY2La0kI8uTAbom7e/9rNPzK/y2L7hix614O/DyuWAL0/
	XodbLIWWeZ7t2I7BtmsMZOVJlcQ9Q8iuIdWHdMVo0YSbFy8l/zUpuNWUZoogyzcjxd4iaJFDOq6
	4yCQY0Hml8JU/JhsPJwobnMkhGRSBx6vdPIcRKximPXGR0i3ZIsvjwOVk7uTprVR9ikbDIU+Yi2
	1/z2LTEJrX3SxXKvW5cc8kM7A71F2WazjQ5zwMg8Fr8lrYr9mzPC4I3MTe2i/FGCH9wzaEJMgJn
	blWd9tlgPDQa3rJjbEz8jdll/Th1kxw3fRhKqo/mZ6GunyS0GtPTvhPhqOkmZOQYV9MevZolDtq
	AMCwdbHsvXwLsNfrc2LE+4AhEdXl39NDMQ1x1O/lmFmVoCTinXejdqyr9MtSpgIl8j2ns/U9+NF
	pGbD4WHm2tOdvQ5PSAtyGdZ8dwKn8GlmfFHeiy3c+KZ5G9IG0koxQ==
X-Received: by 2002:a05:6a00:1f19:b0:84f:df11:b78e with SMTP id d2e1a72fcca58-851df8c50f0mr9327857b3a.2.1787250129458;
        Thu, 20 Aug 2026 11:22:09 -0700 (PDT)
Received: from desktop.local (97-115-106-59.ptld.qwest.net. [97.115.106.59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d369a487sm2037829b3a.59.2026.08.20.11.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:22:08 -0700 (PDT)
From: Jack Flusche <jackflusche@gmail.com>
To: linux-media@vger.kernel.org
Cc: Jack Flusche <jackflusche@gmail.com>,
	patrik.r.jakobsson@gmail.com,
	sakari.ailus@linux.intel.com,
	hverkuil@kernel.org
Subject: [RESEND PATCH 0/5] Add driver for Broadcom FacetimeHD camera
Date: Thu, 20 Aug 2026 11:21:49 -0700
Message-ID: <20260820182156.18078-1-jackflusche@gmail.com>
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

