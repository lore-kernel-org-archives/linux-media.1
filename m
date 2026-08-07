Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDEE471268;
	Fri,  7 Aug 2026 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107375; cv=none; b=pmV3G6b1a2bHO8SZKf1mkCPzGfgM5Mr7it5p3vK+B6QCWaLN7SxDl5n1Z7LboRlf/U7n4eZYBF2vuvcKwBF88VDFxPG7gtAk/Hs6fB+MHCRyygUaBkJX9u8bgPrrY11Ryzy6nOXj6TE84vZKQQwLwgGSEHSKCXIZidEiPqeh5ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107375; c=relaxed/simple;
	bh=e/nyA8ZuEuZ/5Fo0XgsWg8k93yqYev6K+aC9c7ggKY0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ru4bgnSrLUAnt+hNBdHmX0Nm0JZvgBNr0A4CxaQk3Y/vSXqqKs7NJYcrg2TjBkcrLmZ66QVNNYfs9c/fdC+yZl8NYMP+WPQdz6dMaBFllk2g+ONMd7SUff58nXmMgudiPHDnnybOsgRIOxu7A/BMIZ8Pau3hFiSJYLLLR+gjtu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PAMYIJr4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PAMYIJr4"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:4f4:b619:ec54:a907:a006])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5B78741;
	Fri,  7 Aug 2026 14:54:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786107294;
	bh=e/nyA8ZuEuZ/5Fo0XgsWg8k93yqYev6K+aC9c7ggKY0=;
	h=From:Subject:Date:To:Cc:From;
	b=PAMYIJr4eaUbGlFbV5b3akaUNFOO0Kb0unUhdJ0XAmgc/mU0X2uTvxurxm945h7Ma
	 HcZgQro6EeNsrOvg58wuacX6tyR1l1TvQvs3uN4uvlvzlozyhCihgc3WsthwBF0MGj
	 H0iPZ9/jBHuKA6nS3P6kJHvANBCllBn6gmWBKXec=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v2 0/3] media: Add bindings and driver for Sony IMX708
Date: Fri, 07 Aug 2026 18:25:17 +0530
Message-Id: <20260807-imx708-v2-0-7d3d7b57779d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNsQ7CIBRFf6V5sxjAlqKT/2E6ILzaNxQUalPT8
 O9iHRwcz8nNuSskjIQJTtUKEWdKFHwBuavADsbfkJErDJJLxVvRMBqXlmt2VK1T2hpljYYyvkf
 sadlCl+7LER/P0pt+cqA0hfjazmbxsX/dWTDORH9QfVOjqF19JocmBX8NJrq9DSN0Oec3FWKWt
 LgAAAA=
X-Change-ID: 20260715-imx708-967d68ca6ca8
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2410;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=e/nyA8ZuEuZ/5Fo0XgsWg8k93yqYev6K+aC9c7ggKY0=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqddXRcknBkhLQvmKUHyT8ivBrsCIZ/ib4fOw0A
 zOGpCSIqdKJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCanXV0QAKCRBD3pH5JJpx
 RYKHD/4sU8pH/9g/ndZ1GmlxgsviJ0zvLXjfeYpMrOE44N/w0OmyET8+r1CfGWHv3EIvlkGHCHr
 UZgoeF/NgaFpSMbQkJTvjgNzSnXcDbu19SFdJXxEIZwpUNIJzmfOhBn6/JiKYnqgRTNrKyRAiq6
 FdwHX66v1kDn8JXInAR4b/W0D60tv95lX/O7kTUL9bwccMxQlsSMe1S+NyEZb5H/cIecd0HwUJ9
 adjhH5ACAxejJdGag+gvKQQEb1+UT0I86GaNslfFtawigUWT8+2uYwHZMLEsOPXcaGXtPX3vPJg
 pxWVWIySQi3y5LBnSrjN/wDkc2czMsIMY3s+9TLPdL6IerYbgBd6p3YQXmJ+ZKaNRa4ufPmyq26
 uqVlZQOiNW7aQEhX4hm9kfMTEPu6qyH7DlnnlErWPpn1HPBo/0lt9lxegU4eS3s4b3SIOywpuBH
 UK4gFuClbaEip50uXWXYiMvQRLPKaqacUebOwaeaH/8EoghVXCcx+WAGTClx5OyT7sEEZ825WBK
 rRY/TPyU24dXqT+SVik0nnKf96Pe747nUOQBMHgEiisREf2Pql/VVpeLNCrlCwmFXNv7CVxjXTl
 P4JwMkURFDNsNYE3ynVPo8qBnlx23PgKcjTBaY/l5i+QesrBzfzHWg/8vX1uQrQWn2h6ErFKfHC
 h/YsRpDmfjRpClg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Hi,

This series adds dt-bindings and a basic V4L2 driver for Sony IMX708
camera sensor, used in Raspberry Pi Camera Module 3 [1].

This basic driver is an adaptation of the one present in the downstream
rpi-6.18.y tree (written by Nick Hollinghurst). Many features from the
downstream driver (like HDR, binned and 720p crop modes, etc.) are not
present here, and will be added on top using common raw sensor model in
a later series.

This has been tested on a Raspberry Pi 5 with libcamera.

[1]: https://www.raspberrypi.com/products/camera-module-3/

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
PATCH 1/3:
    - Drop the |- before the description
    - Add Dave as M:, and move kernel-list@raspberrypi.com as R:
    - Add Krzysztof's R-by tag
PATCH 2/3:
    - New in v2, to support reuse of CCS PLL helpers with IMX708.
PATCH 3/3:
    - Use the helpers from ccs-pll.h to calculate the VT and OP clock tree,
      setting up the limits following the datasheet instead of the CCS limit
      registers
    - Keep the same VT Pixel Rate and OP Link Rate as before. The VT tree
      runs much faster than the 2-Lane CSI link, and we don't have enough
      details about the FIFO capacity to support freely-configurable rates
      just yet.
    - Drop macros of CCS registers, and include ccs-regs.h to use the
      existing names
    - Update Copyright and MODULE_AUTHOR entries

- Link to v1: https://lore.kernel.org/r/20260715-imx708-v1-0-1f36f54e14d4@ideasonboard.com

---
Jai Luthra (3):
      dt-bindings: media: i2c: Add imx708 image sensor
      media: ccs-pll: Support optional input for VT pixel rate
      media: i2c: Add a driver for Sony IMX708

 .../devicetree/bindings/media/i2c/sony,imx708.yaml |  120 ++
 MAINTAINERS                                        |    9 +
 drivers/media/i2c/Kconfig                          |   12 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/ccs-pll.c                        |   13 +-
 drivers/media/i2c/ccs-pll.h                        |    4 +-
 drivers/media/i2c/imx708.c                         | 1312 ++++++++++++++++++++
 7 files changed, 1468 insertions(+), 3 deletions(-)
---
base-commit: 8a6e017c06fbc1b96af618e82a4d35889d442964
change-id: 20260715-imx708-967d68ca6ca8

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>

