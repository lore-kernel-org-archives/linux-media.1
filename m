Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5549929D281
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 00:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785459128; cv=none; b=ieCYQ6U3IxvRZrKR1aaE+yR8XjGM2zOxMwKIdNld7geE1+87kvf4x/tI8FaUSfROk/Lcqfo1I2aesK8jpLjsZoyK0WY+wjkFrH8JpL9SyYcfaHNQfxjzN6SrBOy2FMsa4psgH4x9BlWisx1QzUab8dyGBRji8f1U6BNXw8+fwW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785459128; c=relaxed/simple;
	bh=uIKkUD0jm/hH7p26Pj85NPfH1S9TwRpyJz1pTudeTg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nfe4jL9vXsiz8eItT7h1OosiutUAoWvIQisACO7spjm1Hri35fL+LzIq0Tr9WqzGCh5jvKZplcRnrapaFMjr5yLnNlcGU505Kaf0OKQUGgfa+YNKBIP+2y+JLymY7lxY11mkcrMppUcFcV2vBaEGoMmpvo3BGelr5kQXTDJolfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vaeCIe7W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vaeCIe7W"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB5992E9;
	Fri, 31 Jul 2026 02:50:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785459057;
	bh=uIKkUD0jm/hH7p26Pj85NPfH1S9TwRpyJz1pTudeTg4=;
	h=Date:From:To:Cc:Subject:From;
	b=vaeCIe7WEWZ3g4lkfi4e5abqY/iHjRrAyHYX+2QZzaYAhrygLenZBaitcKJ3T/5wm
	 iekMNakLVNT2FfDmQa8XvMgj0ISPXdxbnctTwY0sD5xrvfsbam3+JBkCcOPoYrtDaJ
	 gsmTgNrEduqkLjBR1/fYjH/plwdBl1OQOqNDrZ38=
Date: Fri, 31 Jul 2026 03:52:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	=?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
Subject: [GIT PULL FOR v7.3] vsp1 driver changes
Message-ID: <20260731005202.GA1783774@killaraus.ideasonboard.com>
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

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-renesas-20260731

for you to fetch changes up to bcd5448bca74c9295dfe7df8bcc63e6c099b6972:

  media: renesas: vsp1: Declare index variables in for loop statement (2026-07-31 03:14:15 +0300)

----------------------------------------------------------------
vsp1 driver changes:

- RZ/T2H and RZ/N2H support
- Misc modernization

----------------------------------------------------------------
Lad Prabhakar (3):
      media: dt-bindings: media: renesas,fcp: Document RZ/T2H and RZ/N2H SoCs
      media: dt-bindings: media: renesas,vsp1: Document RZ/T2H and RZ/N2H SoCs
      media: renesas: vsp1: Make reset control optional to support platforms without a reset line

Laurent Pinchart (1):
      media: renesas: vsp1: Declare index variables in for loop statement

 .../devicetree/bindings/media/renesas,fcp.yaml     | 18 ++++++++-
 .../devicetree/bindings/media/renesas,vsp1.yaml    | 17 ++++++++-
 drivers/media/platform/renesas/vsp1/vsp1_brx.c     |  7 +---
 drivers/media/platform/renesas/vsp1/vsp1_clu.c     |  3 +-
 drivers/media/platform/renesas/vsp1/vsp1_dl.c      | 12 ++----
 drivers/media/platform/renesas/vsp1/vsp1_drm.c     | 14 +++----
 drivers/media/platform/renesas/vsp1/vsp1_drv.c     | 44 +++++++++-------------
 drivers/media/platform/renesas/vsp1/vsp1_entity.c  |  4 +-
 drivers/media/platform/renesas/vsp1/vsp1_hgo.c     |  7 ++--
 drivers/media/platform/renesas/vsp1/vsp1_hgt.c     | 13 +++----
 drivers/media/platform/renesas/vsp1/vsp1_lut.c     |  3 +-
 drivers/media/platform/renesas/vsp1/vsp1_pipe.c    |  5 +--
 drivers/media/platform/renesas/vsp1/vsp1_video.c   | 34 ++++++-----------
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c     |  8 ++--
 14 files changed, 90 insertions(+), 99 deletions(-)

-- 
Regards,

Laurent Pinchart
