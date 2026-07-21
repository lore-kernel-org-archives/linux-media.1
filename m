Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ABD39A7E7;
	Tue, 21 Jul 2026 14:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643501; cv=none; b=U8w6MRARvDbgDzm7Zb2g1JOmzG8eqOwkYJIqSSjKFboATQ4SMtMfdfs1q58KQpR+2a3LOew5ShAWiS+QNz/gSXEQ1rNFf4KLDe/qlj0PDmQ1zDOGgOc1fFvTEzD7eFajRDfwt/Si0Hd9TQZ41a32acCpeblBZVMGJ13GJ0EV7dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643501; c=relaxed/simple;
	bh=AToogC6RVLxV70MihRC5gg3IRjEI41ihu2vBrNQ407c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UKAOQPDodpYnZrrX3HmnUQPtMuPnzhTTZZYvGImYogcLVqCBZ7Yyb+TtQMT9rf+wBlthgBNXbsws3Qm0A7v1wCy8+88AQK7peQZyagnOnBrljITW0LarAXm5WwVmL1FHFX6qQreyoYi4vS7Okt1qeaewpKtugEol0j1hzgq2Bto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UvSPstau; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UvSPstau"
Received: from [192.168.1.106] (mob-5-90-63-152.net.vodafone.it [5.90.63.152])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72372C1;
	Tue, 21 Jul 2026 16:17:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784643436;
	bh=AToogC6RVLxV70MihRC5gg3IRjEI41ihu2vBrNQ407c=;
	h=From:Subject:Date:To:Cc:From;
	b=UvSPstau3NEhvcL7k5KTXGEEJq+XRHaNNO9o8P4Fo7y6EvLYoQcpR8Dxl+SefY5h7
	 H5vKnA6KNvmhtC9fouYCX3nbGsQEj6exwmIUvKe4BnfHTQNENL0fIgj7fwwaYCveD4
	 lWluYK60y6X8PO7Uvc856h1vkagxwELpfOvANzJM=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v5 0/2] media: i2c: Add driver for Mira220
Date: Tue, 21 Jul 2026 16:18:00 +0200
Message-Id: <20260721-mira220-v5-0-533b0ad1065e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJh/X2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyND3dzMokQjIwNdA2MDc4NEQ3PjNPNkJaDqgqLUtMwKsEnRsbW1AGC
 hZYpZAAAA
X-Change-ID: 20260721-mira220-03070a173f7c
To: Philippe Baetens <philippebaetens@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4275;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=AToogC6RVLxV70MihRC5gg3IRjEI41ihu2vBrNQ407c=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBqX3+lSMjXu5ZnLG0bd6IS+mchRISWvHqlc+W4g
 egLZkVTqSOJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCal9/pQAKCRByNAaPFqFW
 PCNMD/wJ/s89gSu24mAh8jzDnvCRNXd4b/nTYVs3sbjeJFiNI9clsg4iCPnCMEF8thu2sxGg5Dm
 FsRtWABbAqwaZWinoG/pu9gPK4Vhh+OGrJNctPbvuQbzieJe1/BmVT36ACBgio/DrY3x75rT+Ce
 QVfDFkkFrChMCj7BzfPD4lOkfo2SzPxi9Gr3kylSzIcLrO4EXuDUeFFlWSi6sPAftJYpYKrC1MV
 dUUK3PcYbxbjb+/bMq05MkIiEzujHXaDn2z2VFaaPqj0WsVVa94S2lTjDVA1pcQxp4nm9Uaybz9
 sXUUn9WQWC+bjWJtSkOqre6tWeHjp1neMV7iz3VNvxNIcAlliXy2j3kKXsnB1FIhEDYjyMDg2VC
 iEI6KcDsyiu7WFUY1471uCl9ElGp64SOYmUli736Ks7fyo3WVxHHZ02Z7hbg6khYodqT/vRVN7W
 tJx+tZjAh5lCeit+zxikcDYYDtaGC80M/QKp3h1iCsdcmwxaxN3yP7xd/tMLZxIaX9wx6NWc7Uw
 noACo3tkiYkvNuglK5yGe2nZfl43G+JTQyC1QrUapKivsPyfVoeeUYXg0QGyy9rWuuRzYWIFiN0
 h8Uw0fELLlZPSnygdyGOAMupURCT2dPW5hAlHWcmIpoqc79VKCiVEixj1p4nrnbmRODhjNfKsMd
 1UOEoxq3qtpvDqw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Resume the work done by Philippe on Mira 220, available at
https://patchwork.linuxtv.org/project/linux-media/list/?series=18460

The detailed changelog is available on the single patches.

On the current set of supported features: mira220 doesn't support
binning/skipping but only cropping the full sensor array. It also
supports embedded data. It would be an ideal candidate for the new
RAW sensor model.

As the model is not available yet in mainline, this first version
doesn't support set_selection() and doesn't support embedded data.

These features will be implemented on top of the new RAW sensor model
once available.

Thanks
   j

-------------------------------------------------------------------------------
v4l2-compliance 1.33.0-5491, 64 bits, 64-bit time_t
v4l2-compliance SHA: b32589c51481 2026-07-16 08:51:38

Compliance test for device /dev/v4l-subdev6:

Driver Info:
	Driver version   : 6.18.37
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which
Required ioctls:
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev6 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 14 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK (Not Supported)

Total for device /dev/v4l-subdev6: 46, Succeeded: 46, Failed: 0, Warnings: 0
-------------------------------------------------------------------------------

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Philippe Baetens (2):
      dt-bindings: media: i2c: Add mira220 image sensor
      media: i2c: Add driver for AMSOSRMA Mira220

 .../devicetree/bindings/media/i2c/ams,mira220.yaml |  101 +
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   14 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/mira220.c                        | 2048 ++++++++++++++++++++
 5 files changed, 2172 insertions(+)
---
base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
change-id: 20260721-mira220-03070a173f7c

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>

