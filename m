Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691671;
	b=lFAHiK9NpoOSFzJAE2y7NAtAYi8DF6rfN6VvyOTacFurPvHecGO9hHiPwgRSpe2RFo65
	 gVYzK7tEAnYZez+v8iMbvSXCLdIwrdJDLBbnxp1+c9GMfXryNdFMs+a0L6yMbQnkwCo86
	 OVZddaSYTeVA0mpfDtCozuE+ypISC8qyCeIPm/1RqZscfF84EewD7GE0AH8IZ54J9/nrl
	 MxihwwwVBH0Vefc/82narJpwDDv48ogLgCLlDZW+CzIJbs8pKSewvXuswtow8qX8Dx+RN
	 GBF/4piYqr6x2D6RMMhwKQgnRazUuRbaNDA5DRLe/yvzoRe1aVuSSbf2S48ZPIzK2CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691671;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ZVNZDjoh7iEovmI+SV652RvivUvdRsZqCQa3UYckedg=;
	b=TWRTpCEHBfd/qEdCskqf6F3n2TSjw9802dnCx4lXzcJzjMI007XeM/J3vEY1OYfPTgp/
	 5F0FphlH5nZ/zyhU+fGXyvlysyKco156cgMLLmpt7+SfMFCF3IXMQh4u7Jkj1vAHtLHA7
	 mgSdE0xZx6ZvC+1qTu33VbjeOjoOfgZ0E6WkXJv10T6+bvavuoNLzLGy4a9pskBOTwLHh
	 GSNgEiJkxrcgWd4mkg9xw72bmr235yyN0CrB7VAUp7JEtEkViRmTv5F+qt9+qoX5XzNq3
	 /UU88iHEBWKP2DM8Y5flUef89FlvePCXnoNH4T8KEagcIl+i8IiPuxn2D1blHciWO7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=lgn6uwU9;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24CE606A32E
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 07:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D24CE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=lgn6uwU9
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1769227;
	Tue,  3 Nov 2026 08:38:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793691531;
	bh=cZXV5vLnxLdKb4vQSlAx6ZHA1oNubbZDSy4w+DSK1kk=;
	h=From:Subject:Date:To:Cc:From;
	b=lgn6uwU9KTwObvd2O1t6ukfk8RYQCG/2+qINcNGHJLlrWLlo+QiGK95ClBI/oJQNb
	 jAdpU3TRVzfWzFl/6qfSVppKfkKZjTyEwce2bUyc+TndfgeDLY3SWrgUVo0kGZE21n
	 XHtkK+MFZofu5JW669uyK+ql8uEof19MTHwNkmr0=
From: Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 00/16] Allow a running stream to survive suspend and resume
 in rkisp1
Date: Tue, 03 Nov 2026 07:40:36 +0000
Message-Id: <20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPSP6WoC/x2MQQrDIBAAvxL23AW1xdp8peQgdW2XECO7WAKSv
 1d6mMMcZjooCZPCPHUQ+rLyXobYywSvTyxvQk7DwRnnrXEBZWWtFrVppZIwDoS0bYT3dMvXEOI
 jegujr0KZj//7uZznDzjBC5VrAAAA
X-Change-ID: 20261028-rkisp1-suspend-and-resume-7d4f388a9a61
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3338;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=cZXV5vLnxLdKb4vQSlAx6ZHA1oNubbZDSy4w+DSK1kk=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBq6ZAIrm8UgVSaf6LuS8UPpkgwHczn3Ou36Bs71
 XaJa+Jz/9OJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaumQCAAKCRDISVd6bEV1
 MqDwD/9HWXIJWcrHNfZJhhBU14rpT5KCRARDoa+PjuKgc78NtQUgdhIuPwgp7NIhKgYUTHkH0PX
 UqtUwwUC+r43h4CmOLM1J7U5uTO7MxAJhEfnGWi5XJwUg8/YqIXOQIWUCDHw0Y2JKsaOuVO0zFR
 2UKuHQxBKqXJuDnapnN3KWSQsYR5LaCdy1l3GMK0Ov9eL9jMMSSipIAQskKkU48cnSY2ctBMW7h
 GbmpcFksihxmDKZxOjJDYkElEr08+rNk/TQRcEXFpH5iksZLbtFrGh6C0X8atpa0dCTb8A4Hh4f
 BWl4oR0ttzhretwa2Rw39DxFc88+hInB+ke04EKmwESUE9ZtUmHc4WKxxjWBYUNvpc4mwopalHQ
 4ZaJavq9OEFLNhWL1Lz5gir4DU2WhBbBnMoMO3NsvR0+fpHlGd9ePEf42/cXUu7z8cv2ba1Vdot
 WNqsS9cI2ddU/qIfaqZyrgvVlSDMe3cIrHaXGdgc8n5dl115XnlApJNfkmIoiDOuRCFSfwZo7G3
 WmF7I4zWcDNH87zc+tFCMt4NNIF3SyEZUpc6WW5Pe3ZDL4fDPe6ibGmq7aAFLPlAExpPh/NDmod
 aCq9sqxlUFRiAtwOL3od7CRU9JQTrKq4swkz5+JpcObWH5KRO9xeJVV50mPOZ1R1jk9dPaBeIoH
 XdCvaIPlET289vQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Hello all

At the moment a stream that's running from the rkisp1 when the device
is suspended to RAM or disk is dead when the device is resumed. This
series is an attempt to make the stream survive that event so that if
it was running before the device is suspended, it will continue
running once it is resumed. 

To acheieve that this series:

1. Creates device links between the notifer and subdevices in v4l2
   async. This is to ensure that the Power Management .suspend() and
   .resume() operations happen in the right order. I think this is a
   universally applicable change so it's in core rather than the
   driver specific .bound() callbacks.
2. Updates the rkisp1 driver to cleanly stop stream across the pipe
   line on .suspend() and resume it (assuming it was running before
   the device was suspended) on .resume()
3. Updates the rkisp1 driver to store and re-apply the last of the
   params buffers on resume.

There's also a change to videobuf2 core without which I found it more
complicated to do the "was a stream running" check. There are also a
number of commits that do some tidying and preparatory work to make
the later commits cleaner.

Thanks
Dan

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Daniel Scally (16):
      media: videobuf2: Set start_streaming_called after it's called
      media: v4l2-device: Add struct v4l2_device.flags
      media: v4l2-async: Add devlinks between notifier and async subdevices
      media: rkisp1: Drop an unnecessary variable
      media: rkisp1: Store the current params buffer
      media: rkisp1: Modernise the locking
      media: rkisp1: Power down after subdev initialisation
      media: rkisp1: Switch to calling .enable/disable_streams() in CSI subdev
      media: rkisp1: Switch to calling .enable/disable_streams() in ISP subdev
      media: rkisp1: Call .enable_streams() / .disable_streams()
      media: rkisp1: Switch resizer subdevice to .enable/disable_streams()
      media: rkisp1: Switch ISP subdevice to .enable/disable_streams()
      media: rkisp1: Control ISP streams from resizer ops
      media: rkisp1: Disable resizer stream before capture device
      media: rkisp1: Expose startup and shutdown functions
      media: rkisp1: Allow a live stream to suspend and resume

 drivers/media/common/videobuf2/videobuf2-core.c    |   5 +-
 .../platform/rockchip/rkisp1/rkisp1-capture.c      | 134 +++++++++------------
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |  26 +++-
 .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |  24 ++--
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |  51 ++++++--
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |  88 +++++++-------
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 111 +++++++++--------
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      |  78 +++++++-----
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |  33 +++--
 drivers/media/v4l2-core/v4l2-async.c               | 107 ++++++++++++++++
 include/media/v4l2-device.h                        |   7 ++
 11 files changed, 421 insertions(+), 243 deletions(-)
---
base-commit: 00178eda305a332f302882849ff7374d4169be8b
change-id: 20261028-rkisp1-suspend-and-resume-7d4f388a9a61

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>

