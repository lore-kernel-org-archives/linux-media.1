Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417319;
	b=NRVq52MSk5k1vpXyiv4EFL/hntzAc2wVUAG0YWs4krTthE+R4IcWPfuzIQczVLT0Up3r
	 0GdmutzX/0bYT4/kKaCU1838WIJ1dZExCHdASR2k6rPNHXS/ZjXVZRZIbBBJkznC0wmMb
	 RCuieJd30JaOrt0SS2JG/p4FVgCocgJUsJ4l+6qzWgqeNJFaCPo4Cjlps89fOQzDdRvIy
	 K63quskfYLwLVviyMsJxMwV9J+5KM0q4TCwhxThLJQwIYs0NswEwgrWmqFZyNtjKWXRv0
	 vwWGa9t1A8w9NxbdzJJvEhOl3c/3qzOvtQk+o34Z/OMAFsBuW3G5D4mqcdH+M1bYCOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417319;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=rzJ5VWYtxWWvpXBjrhR+R4mEG2KhJgdQhdpnrMW6mCU=;
	b=Fc+EXWdxUpEo7EGE7AsQjQUH+vT+fEKvjpqZ2sUkQOAggmhaz49i1P+kQzUyHzw77Adu
	 TPA9RRUVIvSU/6QzVpCZKnv4dzZRWqQHb/SgnHEaksq1X2xdextLKC0QYcP/dNy3JOu0L
	 Z+C/PfTvqNnbkJPrEzpcHCQGRwGTK/LETuQnt9McZ+T30lno0Nedv3/LMnuzMDnAHgG/j
	 A2N4oTto45HWyJvs/xoJxyE3FAk49TyMZ9fDzURlGnYB8+Cp2XDHERxsilJAfGbHfH43U
	 Vddcx5V9ablaSmI/efhe4H+y4IOxd12PhMmZzGVd8vLpRjnhX8yZTRqdjnWr8FAQ09Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=UxMWZMjd;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E46606A327
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 17:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30E46606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=UxMWZMjd
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 104A9219;
	Wed, 11 Nov 2026 18:12:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794417173;
	bh=01DsqAL0tKCbbR+vQFvAB2ZVsGLYAJVXFFjH2Jgc9S0=;
	h=Date:From:To:Cc:Subject:From;
	b=UxMWZMjdheF93T+x0gi7T4GKSUmx4gQKa2Hw213g/3ShNM63ZhUD8cfO79zqdwqMN
	 6wrHNfbFeTwmHMAyvXvpAdx+xmbusqVRyWsb7sAozk/YwK9xIDko/jF9Ykx45Vc4mb
	 vCHivQ5YkZ2UJCRW66UD2f+Xks0a61y6tDA5zpzg=
Date: Wed, 11 Nov 2026 18:15:13 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: hans@jjverkuil.nl, Sakari Ailus <sakari.ailus@iki.fi>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Philippe Baetens <philippebaetens@gmail.com>, 
	linux-media@vger.kernel.org
Subject: [GIT PULL FOR 7.5] AMS-OSRAM Mira220 and Mira016 drivers
Message-ID: <avSh-mkOAZpq6swU@zed>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Sakari, Mauro

The following changes since commit a083812f66fa52c59fb0ee25377180a645e5970d:

  staging: media: av7110: remove commented-out code in av7110_hw.c (2026-11-11 15:21:53 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/jmondi.git tags/pr-mira-for-7.5

for you to fetch changes up to 62b600ba608740f3acf56b201387d210bd7d150b:

  media: i2c: mira016: Add driver for Mira016 (2026-11-11 17:52:49 +0100)
----------------------------------------------------------------
CI pipeline:
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1790534

libcamera support for Mira016 (Mira220 has been merged already)
https://patchwork.libcamera.org/project/libcamera/list/?series=6344
----------------------------------------------------------------
Jacopo Mondi (2):
      dt-bindings: media: i2c: Add Mira016 image sensor
      media: i2c: mira016: Add driver for Mira016

Philippe Baetens (2):
      dt-bindings: media: i2c: Add mira220 image sensor
      media: i2c: Add driver for AMS-OSRAM Mira220

 .../devicetree/bindings/media/i2c/ams,mira016.yaml |   97 +
 .../devicetree/bindings/media/i2c/ams,mira220.yaml |  103 +
 MAINTAINERS                                        |   16 +
 drivers/media/i2c/Kconfig                          |   24 +
 drivers/media/i2c/Makefile                         |    2 +
 drivers/media/i2c/mira016.c                        | 2361 ++++++++++++++++++++
 drivers/media/i2c/mira220.c                        | 2058 +++++++++++++++++
 7 files changed, 4661 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ams,mira016.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
 create mode 100644 drivers/media/i2c/mira016.c
 create mode 100644 drivers/media/i2c/mira220.c
