Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1044E0B66
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 16:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790786181; cv=none; b=Ui48YdScihcn38wGF1FVewFyu2JkHyVSddhLPPYjm0A5IDM+ESkEwEZKToy2os8vlitPOqe+1xzk4Yc7TZzBx1aH9nJfBQ7oBufqnlO2xpTow1ycdKX/bD2cDhMYT8986ItYzM+Dq9InA3xu6nmBELbd2FEKxoXCmMvYGbdHxGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790786181; c=relaxed/simple;
	bh=AQjfkD9vOMFreK84X4QsbAT+XHQI3YIHmMpYYhaj27w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MX26e3xnUvxYa++RIG0Qdt0X8Mtwztu2690c7Qm+W3ZrRj4vYKqe9UOTvpIl5AFHN1u1mCHC6nuy8DOHZB0oE0IWxYzalAJUrG/mPKGVdqRZLqgCHqUrcjXOSyVN/LClpmUeWnlYiNkb6vYID4yPcSZ+5hkY/1P0XaEvZNhgCqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qwQUYBg2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qwQUYBg2"
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F0D30493;
	Wed, 30 Sep 2026 18:34:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790786066;
	bh=AQjfkD9vOMFreK84X4QsbAT+XHQI3YIHmMpYYhaj27w=;
	h=Date:From:To:Cc:Subject:From;
	b=qwQUYBg2XAAdlJljF+fyUp7U65kic4dglmIrVNgby1SZxf5SGixXaYRvRCoEhI0SY
	 c5j7aFfU91WZuTvawOqfPln+P/aYNi5dqL08dTPymIAhgFy2AQ91EU/if9FDQ+hwV7
	 4nD+gYsqm6hhH99l+hjkkygGBzPrRWVKtjMTS0Ls=
Date: Wed, 30 Sep 2026 18:36:14 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: [GIT PULL FOR v7.4] Changes for ARM Mali-C55 and Renesas IVC
Message-ID: <ar02bn3Z-qaIQONO@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello Hans, Mauro,

Please pull the following changes since commit 58348f64125e9a3e44d3abb275ca7f4e6c9641e5:

  media: ipu6: Support upstream sub-devices without get_frame_desc() (2026-09-26 21:21:21 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/jmondi.git tags/mali-ivc-for-v7.4

for you to fetch changes up to 5ad76a0b74dfc65ae0cf824dc13eefb8f86e2f7b:

  media: mali-c55: Ignore disconnected queues when checking readiness (2026-09-30 17:56:29 +0200)

CI pipeline: https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1756993

----------------------------------------------------------------
Arnd Bergmann (1):
      media: mali-c55: add padding to mali_c55_params_ccm structure

David Carlier (4):
      media: v4l2-isp: reject zero-sized parameter blocks
      media: mali-c55: Free the ISP control handler on unregister
      media: mali-c55: Check the parameters buffer address before copying
      media: mali-c55: Check the statistics buffer address before filling

Linus Walleij (1):
      media: mali-c55: Ignore disconnected queues when checking readiness

Mukesh Ojha (1):
      media: arm: mali-c55: Use devm_of_reserved_mem_device_init()

Myeonghun Pak (1):
      media: renesas: rzv2h-ivc: manage runtime PM with devres

Pengpeng Hou (1):
      media: mali-c55: fail power-on when safe stop times out

 .../media/platform/arm/mali-c55/mali-c55-core.c    | 32 ++++++++++++----------
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c |  1 +
 .../media/platform/arm/mali-c55/mali-c55-params.c  |  3 ++
 .../media/platform/arm/mali-c55/mali-c55-stats.c   | 18 ++++++++----
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     | 11 +++-----
 drivers/media/v4l2-core/v4l2-isp.c                 | 15 +++++++++-
 include/uapi/linux/media/arm/mali-c55-config.h     |  2 ++
 7 files changed, 55 insertions(+), 27 deletions(-)
