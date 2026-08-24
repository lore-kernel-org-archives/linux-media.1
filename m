Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B033A3E98;
	Mon, 24 Aug 2026 09:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562265; cv=none; b=hqDEszoJ7AHNcIXq54JzLAqqDJkCaBTnT5prvOHmmiWOOMuhe7VePf7I95N/PzRK38qnnn+f1cm1eSr9YyRyPHQ7rJdKPkrx/aEKqYmUOMK2pzpEYrhjeKvzmopcd58glMs6hwf9Vg9UVPdaadZ/t5hDu2fkZUFaALL9dv70jYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562265; c=relaxed/simple;
	bh=nTyxLcXJ9s/f7lXgQ9mtDig7a+cVfGOHJ9iwbz+sdw8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kcGhwmfx2ad6qJbfriAYkU778/xFLVkhT9UGIdd45RzaURUeFwDD1F59NoivwqX+Fqk1CoB8cHygA1pAacKaGzbyO69sQwLG15HpkaYIrcvbAOMMn4+NY8aZxlhUlyu7RHZydMEGcv+DcCzOoVtT4JByROwZd1ZcqsMpkvTflC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iR4YXkbC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iR4YXkbC"
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2400:2411:160:2f00:e616:f172:fe90:f1b5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48B5B2F8;
	Mon, 24 Aug 2026 11:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787562176;
	bh=nTyxLcXJ9s/f7lXgQ9mtDig7a+cVfGOHJ9iwbz+sdw8=;
	h=From:To:Cc:Subject:Date:From;
	b=iR4YXkbCaNdskNfpx1B7j9t+XEyuiikXdptSat6Ii8uXfu1CPMYglA3HEmVVA3N0s
	 ttaYw46bO7pYf3JpXFWA+QcR4ldwqFZHSVYXSHbGjYuhc+onKNbeNPR6lRwITXIo05
	 mQnXE4NZmNhSXDrMdD1cZtE0jAdcou3dFzV49Tfc=
From: Paul Elder <paul.elder@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	michael.riesch@collabora.com,
	xuhf@rock-chips.com,
	stefan.klug@ideasonboard.com,
	mehdi.djait@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] media: rockchip: rkisp2: Add driver for ISP on Rk3588
Date: Mon, 24 Aug 2026 18:03:57 +0900
Message-ID: <20260824090406.3695880-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello everyone!

This patch series adds a new rkisp2 driver that aims to support all
Rockchip 2.x and 3.x series ISPs. Here we add support for the version on
the RK3588, which as far as I'm aware is a 3.0.

Patches 1 and 2 add dt bindings and dt nodes; patches 3~5 add the actual
driver.

Notable changes from the RFC version:
- fixed a couple potential page fault storms
- use extensible stats (previously only params were extensible)
- no more subdev pad crops; all cropping has been moved to parameter
  buffers so that they can be configured synchronously
- the DMA RX sink pads and the main/self path source pads on the ISP
  subdev have been split into individual pads
- an unused sink pad has been allocated on the ISP subdev for future
  inline mode support (to prevent uapi from changing)

This series is based on the latest version (v7.2-rc1) (at the time of
posting) of media-commiters/next [0], with some patches on top for
testing on the Orange Pi CM5 Base with an imx708. I have a branch [1]
that integrates this series on top of said patches and
media-committers/next.

Corresponding libcamera patches+branch will be coming soon (within
minutes), but since I cannot send and link these simultanously, you will
have to search the libcamera mailing list :)

[0] https://gitlab.freedesktop.org/linux-media/media-committers/-/tree/4900cad020c0580dfb1be27776ff10a4ef110cfa
[1] https://git.ideasonboard.com/epaul/linux/src/branch/epaul/v7.2-rc1/rk3588/rkisp2/upstream-v2

Paul Elder (3):
  media: dt-bindings: Add rockchip rkisp2 bindings
  media: rkisp2: Add parameters output video node
  media: rkisp2: Add statistics capture video node

Xu Hongfei (2):
  arm64: dts: rockchip: add ISP nodes to rk3588
  media: rockchip: rkisp2: Add rkisp2 driver

 .../bindings/media/rockchip-isp2.yaml         |  125 +
 .../userspace-api/media/v4l/meta-formats.rst  |    1 +
 .../media/v4l/metafmt-rkisp2.rst              |   88 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |   57 +
 drivers/media/platform/rockchip/Kconfig       |    1 +
 drivers/media/platform/rockchip/Makefile      |    1 +
 .../media/platform/rockchip/rkisp2/Kconfig    |   19 +
 .../media/platform/rockchip/rkisp2/Makefile   |   14 +
 .../platform/rockchip/rkisp2/rkisp2-capture.c | 1540 ++++++++
 .../platform/rockchip/rkisp2/rkisp2-common.c  |  180 +
 .../platform/rockchip/rkisp2/rkisp2-common.h  |  619 +++
 .../platform/rockchip/rkisp2/rkisp2-debug.c   |  234 ++
 .../platform/rockchip/rkisp2/rkisp2-dev.c     |  371 ++
 .../platform/rockchip/rkisp2/rkisp2-dmarx.c   |  706 ++++
 .../platform/rockchip/rkisp2/rkisp2-isp.c     |  839 ++++
 .../platform/rockchip/rkisp2/rkisp2-params.c  | 1161 ++++++
 .../rockchip/rkisp2/rkisp2-regs-v2x.h         | 2625 +++++++++++++
 .../rockchip/rkisp2/rkisp2-regs-v3x.h         | 3428 +++++++++++++++++
 .../platform/rockchip/rkisp2/rkisp2-regs.h    | 1736 +++++++++
 .../platform/rockchip/rkisp2/rkisp2-resizer.c |  404 ++
 .../platform/rockchip/rkisp2/rkisp2-stats.c   |  508 +++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 include/uapi/linux/rkisp1-config.h            |    1 +
 include/uapi/linux/rkisp2-config.h            |  605 +++
 include/uapi/linux/videodev2.h                |    4 +
 25 files changed, 15269 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip-isp2.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-rkisp2.rst
 create mode 100644 drivers/media/platform/rockchip/rkisp2/Kconfig
 create mode 100644 drivers/media/platform/rockchip/rkisp2/Makefile
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-capture.c
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-common.c
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-common.h
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-debug.c
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-dev.c
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-dmarx.c
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-isp.c
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-params.c
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-regs-v2x.h
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-regs-v3x.h
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-regs.h
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-resizer.c
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-stats.c
 create mode 100644 include/uapi/linux/rkisp2-config.h

-- 
2.47.2

