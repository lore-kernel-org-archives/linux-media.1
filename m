Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5D43BB672;
	Fri, 17 Jul 2026 11:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286316; cv=none; b=sMBmJFRkI8Q1ThoKdlU6zU+Buu/CDYyRLhAv4td0XKPRLObsa8QIJjM1gwYVN5JUtvnc6Ube4J1RZ6/P+Wdqnk6LhMCXfn0B1Hrfxq/LeICd90u5C0idsUDLUAv12OTLx0CqMyndr2Wiza6WMsqYwl/PEhdWvh5ceb1YqIqT4Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286316; c=relaxed/simple;
	bh=XcCD5jKcosNizznqr4oeF0NIYgw4B1GH02hSRnS02tg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ifj6TEvyK+xHxdL1jEebQFRPRefNPxwtOW1ZJUdNCKAQ1g9ubR7GnV0ryevzpi6JjAFPXr690M8CfMD5WNElNloKuMqQvO60AkoDLBZNHP55LoLfeMBsUQrlxsFA5xJNL/hxnP3/Ny229n88YVHs9OXhY/A0+tIFd4XyCdDwY3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ScDNPs0p; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ScDNPs0p"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 165B38FA;
	Fri, 17 Jul 2026 13:04:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784286250;
	bh=XcCD5jKcosNizznqr4oeF0NIYgw4B1GH02hSRnS02tg=;
	h=From:Subject:Date:To:Cc:From;
	b=ScDNPs0pYzacWmxeqk2a/eec5mu4fHXpHPUIITZbSuNoRgt3b7VRMU1FyuEChago5
	 ckZc6kv/TvUk9zbJStGYWR45lZRviZBh8ULHcSRyfKpN+KJ/+5e6xlrNsnYXXrT0X9
	 sF/J+iTHcqoFL0kq09eZnMdSkb8JasYyOpv/UGnY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 0/9] media: Add support for Broadcom/RPi BCM2835 ISP
Date: Fri, 17 Jul 2026 16:34:15 +0530
Message-Id: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23PwW6EIBCA4VcxnDubYURxPfU9mh4Qx8oB3QVL2
 mx89yIemmx7Y0j4fuYhIgfHUfTVQwROLrp1yUP9Ugk7m+WDwY15FoTU4JVqGBQkO7s7uHgDzZ0
 lstS1aEV+cgs8ua/Cvb2fc+D7Z1a381J4jtEUta+y2aKW+jQherDeQKoBobWKte5QcTO+upFNX
 JdhNWG82NUfpcFEhnz2buurpC8EwUpxNGcXtzV8l42SLNESkvLp80nmEBscasRhmmz3N3R4iX4
 NkvhkUDaUwvqqlGxo4n+Mfd9/ADbEO6BnAQAA
X-Change-ID: 20250923-b4-vchiq-isp-7e8c22c2860c
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.org>, 
 Umang Jain <uajain@igalia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6060;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=XcCD5jKcosNizznqr4oeF0NIYgw4B1GH02hSRnS02tg=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqWgxThpW3Uhqltyk8EXkyurF3ojp4oYO4i+uN8
 s4FhmzsXbSJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaloMUwAKCRBD3pH5JJpx
 RXv6EACFmFZPXb0vOrz59/Mn2W4uTF/fzPDqgUCuYk422P3JrpBPQ6xsxXJ1zGwSocxK2SdR4gD
 lGczB2b+SutKJk0wCQn1YGcKroSgBDn2R+Hz9t0Lkxrw2LKz7bCKXmL78XqTcZjk8LZ2qzmfbuV
 Pgf41GqaehmOazmzSAu1pb9fVLVvww9dO5DLguIM8Eg9dcFtWAWVi+Fb2SuPxNiji3jbMsz23Q+
 QJvtGhU5KCb0AM/Z81baAoaUTnR6Wi80CbuFwB1JkW+CFqE5Ea/Urr4yAHyV450YvgB/Nc0ERhL
 gp9uyG4HTedDgvIhc2irVtS8kGILoaFqKLapp+8k/GpLM3BoPnl/bL/tD0XOWPZ0sWk0C9Hs754
 3edM4QywFpZd4/rd+ZcJy9tbCu+IjKG/4Y2mehAIcOmeUPO6HsGtQFZo7G3ltuET7Wc4OGgz3ut
 V0ZSj6ieLTOVMHx6nn9L8okMWg24OeQzSs3f8L8kI2xuuCBfmfPhpY/XEq6boOcpoBAwBwoF3Gs
 NmNgU7fqHHUTBGW+HnvmRd0ZUtuuQULfOVVOYU8toHKct76rXYFQGNFMmpPrDuNyMsGQO4hjHrz
 AOzyiQax8MIMvlSN2D58vtHWSrBlt+unQztOqINZU/x5ppAe1+mGJ4P75TkZRMF/Um3XAWBACbW
 1Ffs90IyPeBKApA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Hi,

This series adds initial support for Broadcom/Raspberry Pi BCM2835 ISP
present on older Raspberry Pi boards.

The underlying hardware for the ISP is accessed through the VideoCore
VPU, via the VCHIQ/MMAL interface that was recently destaged under
platform/raspberrypi. The ISP driver, and thus this series, depends on
VCSM CMA driver for shared memory support (for lens shading buffers):

https://lore.kernel.org/all/20260105-b4-vc-sm-cma-v2-0-4daea749ced9@ideasonboard.com/

The baseline driver was taken from the one present in the downstream
raspberrypi 6.12 tree (which was posted as v1 with minor cleanups).

Since then the driver has been significantly modified, switching away
from custom V4L2 controls to parameter buffers for ISP configuration,
and many other fixes.

You can test this series with libcamera, using the following branch:
https://github.com/jailuthra/libcamera/tree/pi4-upstream

Thanks,
Jai

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Rebase on v7.2-rc1
- Split PATCH 1 to add missing incles before moving the headers
- Update commit messages with Laurent's suggestions
- Drop redundant buffer list and locks for params as we send them
  immediately to the firmware in .buf_queue
- Drop the now empty .stop_streaming() for params node
- Minor cleanups
- Link to v2: https://lore.kernel.org/r/20260210-b4-vchiq-isp-v2-0-4403944152fe@ideasonboard.com

Changes in v2:
- Replace custom V4L2 controls (V4L2_CID_USER_BCM2835_ISP_*) with the
  V4L2 extensible parameters framework via a dedicated metadata output
  node (bcm2835-isp-params). Split params handling into new file
  bcm2835-isp-params.c.
- Add AWB gains and digital gain as extensible parameter block types
  instead of standard V4L2 integer controls.
- Use MEDIA_ENT_F_PROC_VIDEO_ISP instead of MEDIA_ENT_F_PROC_VIDEO_SCALER
  for the media entity function.
- Rework media controller registration: let video device nodes handle
  their own entity registration, removing the manual entity/interface
  creation in media_controller_register_node().
- Propagate colorspace, ycbcr_enc, xfer_func, and quantization properly
  through g_fmt/s_fmt.
- Fold the stats/params FourCC additions (previously a separate commit)
  into this patch.
- Drop the custom CID base commit (no longer needed).
- Update documentation.
- Link to v1: https://lore.kernel.org/r/20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com

---
Dave Stevenson (1):
      media: videobuf2: Allow exporting of a struct dmabuf

Jai Luthra (6):
      platform/raspberrypi: vchiq-mmal: Include missing headers
      platform/raspberrypi: vchiq-mmal: Move headers to include/linux
      platform/raspberrypi: vchiq-mmal: Support ISP parameters and stats
      platform/raspberrypi: vchiq-mmal: Support bayer and gray formats
      platform/raspberrypi: vchiq: Add helpers for vchiq driver data
      media: platform: broadcom: Move unicam driver to subdir

Naushir Patuck (2):
      media: platform: broadcom: Add bcm2835-isp driver
      platform/raspberrypi: vchiq: Load bcm2835_isp driver from vchiq

 Documentation/admin-guide/media/bcm2835-isp.dot    |   14 +
 Documentation/admin-guide/media/bcm2835-isp.rst    |   78 +
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../media/v4l/metafmt-bcm2835-isp.rst              |  101 ++
 MAINTAINERS                                        |   12 +-
 drivers/media/common/videobuf2/videobuf2-core.c    |   21 +-
 drivers/media/platform/broadcom/Kconfig            |   18 +-
 drivers/media/platform/broadcom/Makefile           |    3 +-
 .../media/platform/broadcom/bcm2835-isp/Kconfig    |   15 +
 .../media/platform/broadcom/bcm2835-isp/Makefile   |    4 +
 .../broadcom/bcm2835-isp/bcm2835-isp-common.h      |   51 +
 .../broadcom/bcm2835-isp/bcm2835-isp-fmts.h        |  558 ++++++++
 .../broadcom/bcm2835-isp/bcm2835-isp-params.c      |  470 ++++++
 .../broadcom/bcm2835-isp/bcm2835-v4l2-isp.c        | 1502 ++++++++++++++++++++
 .../media/platform/broadcom/bcm2835-unicam/Kconfig |   23 +
 .../platform/broadcom/bcm2835-unicam/Makefile      |    3 +
 .../{ => bcm2835-unicam}/bcm2835-unicam-regs.h     |    0
 .../broadcom/{ => bcm2835-unicam}/bcm2835-unicam.c |    0
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 .../raspberrypi/vchiq-interface/vchiq_arm.c        |    2 +
 .../platform/raspberrypi/vchiq-mmal/mmal-vchiq.c   |    9 +-
 .../linux/raspberrypi}/mmal-common.h               |    4 +
 .../linux/raspberrypi}/mmal-encodings.h            |   68 +
 .../linux/raspberrypi}/mmal-msg-common.h           |    0
 .../linux/raspberrypi}/mmal-msg-format.h           |    0
 .../linux/raspberrypi}/mmal-msg-port.h             |    0
 .../linux/raspberrypi}/mmal-msg.h                  |    0
 .../linux/raspberrypi}/mmal-parameters.h           |   86 ++
 .../linux/raspberrypi}/mmal-vchiq.h                |    0
 include/linux/raspberrypi/vchiq_arm.h              |    1 +
 include/linux/raspberrypi/vchiq_bus.h              |   10 +
 include/media/videobuf2-core.h                     |   15 +
 include/uapi/linux/bcm2835-isp.h                   |  530 +++++++
 include/uapi/linux/videodev2.h                     |    2 +
 35 files changed, 3579 insertions(+), 25 deletions(-)
---
base-commit: 728e68a889bcf257b1e67298b12c360e5c3a13e0
change-id: 20250923-b4-vchiq-isp-7e8c22c2860c
prerequisite-message-id: 20260717-b4-vc-sm-cma-v3-0-6c4e77804e5d@ideasonboard.com
prerequisite-patch-id: 07e50207cc947f44e1d626b31d0ace7e12a8f3a1
prerequisite-patch-id: 3d82a2605799686668729fdc2677c3f6b7c2aa0d
prerequisite-patch-id: 3022f05545dcfdaf05522f8ce1ebd8b9e3bc412f
prerequisite-patch-id: ad833b78f90ce3081e470caf70e601fc573bb52d
prerequisite-patch-id: 1898d91213e9bd75be3109180527fb0caf6d7174
prerequisite-patch-id: d0cfc49c673c8c4a4c13d44a547104c24f57cb49

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>

