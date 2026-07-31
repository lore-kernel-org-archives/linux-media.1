Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184192566F7
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785457011; cv=none; b=jC+bH1Z9v5zW4/U5FCdKQocFGyGJRMfK0vgG76YjrkZlzIqRUIXf04A0nim9hh8Ib7p40WfqDKoTEgZh8MZ2nea4oz/9m2H1n7Kk4ycoHcVcujywd115xC8u+VU8zdmGg/kM0OXnQ+kH+CIb9nob3JwXw8KUr5kHjLbJrulEL40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785457011; c=relaxed/simple;
	bh=bGdVMudn41pNtQUA1XGiG30u1lb59n7C9p8qGCMIatU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TUuENBYB25QQCV3dZwkJpx8whmdSkyYZNt7nshufrdjY9Oir2MD40K8/VZ3CJQAOKZOjO1VGq686ko9ihK+J1c3WQ16pN7xiyYuGfB6DYwg/m/BDd/b+fM+Av9GKDUH+pGnmza2RJbYFp3KejavgbruQN2N4fw87JTlOs6A8m8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W/eODkPF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W/eODkPF"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4A372E9;
	Fri, 31 Jul 2026 02:15:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785456938;
	bh=bGdVMudn41pNtQUA1XGiG30u1lb59n7C9p8qGCMIatU=;
	h=Date:From:To:Cc:Subject:From;
	b=W/eODkPFQTLsqrwiSuEqm5X4E5B5McO1CnFyVpnceeTPvaIk1dCX1myzuzl7/JLk8
	 Jm+1dXj3cNJmgxJXAAtniOve7desKyPQbS3V3bk3Ab2gkz7P236i1s7yoBesyjhyve
	 +9XcEoGVGKxtj7S7D7nIFDK+BYtAIUut0MSlK6y8=
Date: Fri, 31 Jul 2026 03:16:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	=?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
Subject: [GIT PULL FOR v7.3] media: nxp: imx8-isi driver changes
Message-ID: <20260731001643.GA1759773@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Mauro,

The following changes since commit 465425926ff36b9f5fb1f069e4277918e6109f5a:

  media: rppx1: lin: Add support for gamma sensor linearization (2026-07-30 20:51:35 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-nxp-20260731

for you to fetch changes up to c4c23b711cb536fe13f0ddb50572f6a431401567:

  media: nxp: imx8-isi: Add additional 32-bit RGB format support (2026-07-31 02:52:37 +0300)

----------------------------------------------------------------
imx8-isi driver changes:

- Add new reviewer
- Fix routing validation
- Support virtual channels routing
- Add missing pixel formats

----------------------------------------------------------------
Frank Li (1):
      MAINTAINERS: media: nxp: imx8-isi: Add Frank Li as reviewer and i.MX mailing list

Guoniu Zhou (8):
      media: dt-bindings: nxp,imx8-isi: Drop fsl,blk-ctrl requirement for i.MX8ULP
      media: nxp: imx8-isi: Add virtual channel support
      media: nxp: imx8-isi: Fix stream ID validation bypass in crossbar routing
      media: nxp: imx8-isi: Add stream ID validation for crossbar routing
      media: nxp: imx8-isi: Correct color map between V4L2 and ISI
      media: nxp: imx8-isi: Use BIT_ULL() for 64-bit stream masks
      media: nxp: imx8-isi: Implement per-stream reference counting for multiplexed streams
      media: nxp: imx8-isi: Add additional 32-bit RGB format support

Guoniu.zhou (1):
      media: nxp: imx8-isi: crossbar: Add get_frame_desc operation

Laurent Pinchart (1):
      media: nxp: imx8-isi: Drop unneeded downscaling factor clamping

Laurentiu Palcu (1):
      media: nxp: imx8-isi: Add 16-bit raw Bayer format support

 .../devicetree/bindings/media/nxp,imx8-isi.yaml    |   4 +-
 MAINTAINERS                                        |   2 +
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |   3 +
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  12 ++-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 113 ++++++++++++++++-----
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |  22 ++--
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |   2 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  79 +++++++++++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  12 ++-
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   |  98 +++++++++++++++++-
 10 files changed, 306 insertions(+), 41 deletions(-)

-- 
Regards,

Laurent Pinchart
