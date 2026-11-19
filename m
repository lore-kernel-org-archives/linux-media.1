Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065934;
	b=gbjtp43620Msdf3nUEpQygoMatFI396fvboAEbOt4kQm8nNk8rIyIr5ql+hZczHHxdO2
	 /WPfs4sBc7wtLYVDgLGEtapZu5ubVfXvpvHcepWKZMf3Je3d4lVbNA0NKl6GmaJoHLVLm
	 xplVqpm/LgqSaXAwl2r6wtghYIAsVQq5hnL9iYy0m3Mss0CpIY0/fQUJFt4WQfhI2E/Yo
	 3JWpPLTgD7VDdHuJ+C8TWGE4D7R0E45yTFR+mtgMfzV4MBJlHj0wQfXY4Fqh/MU4CvL3o
	 ae2rHVRnwCy98vcN35qKTBXAo80HHUefUMFv7HmXgi3OENCGIBfUUIxd6In5kN/jamQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065934;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=2ZaVYpzXGEAbQBe65qfuBxqykXJXYkQUiOrkUllhe14=;
	b=zRY5WdKyxgFeNi6tw9XGw3JoELIozscFTLRbGjrRcB42xKaxZPytu9LwdVlHcQjlf+cT
	 vqIhPp+jWMTrac3VrqOKiqLLg+YbAnGBCYg7ljVmMg8oTQJQ11IFXoh6oydQbJL73eiPQ
	 2bc7Ju+jdaQSQT66T8s64Hc7WJkA6O8IAXJIIKKraijdN5CloJpKn30i4byyHKM0oHKdd
	 bdIHvXNJ/iwwGfKcBf1rBAV2ADdi7tp28IKJEWPqC/3rkb+WtvF6Xt9aWYVdxtClp4f07
	 ElPysi8KxyRuN7NWTYl5Xp8vpdFRhvGIw83pCJT4VX2YRogcTs19dHZJNwoloBI1dPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="ak/U6oz3";
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BFF606A320;
	Thu, 19 Nov 2026 05:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78BFF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ak/U6oz3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=2ZaVYpzXGEAbQBe65qfuBxqykXJXYkQUiOrkUllhe14=;
	b=ak/U6oz3rKq8FvUkwWQ9yw/xShc+GisTn0FSj2IlVkJZe1h2z6rY70pqyuz7wV
	1utaShpq3tJJ4X7m2Jz5+O+1ICULpDsz5B0WEOsPP2cYMFUnLEhSXsR9UCXUj1Mf
	QQ+YhjnMB2WghbYokV+LwqD9w/oYE8r9TGGrbW29Tb4wY=
Received: from WIN-TOG0NDEIICD.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDnb5w0iP5q8NxfGw--.11886S3;
	Thu, 19 Nov 2026 13:25:10 +0800 (CST)
From: Shirong Zhao <shxzhaosr@163.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: reject descriptor walks that cannot advance
Date: Thu, 19 Nov 2026 13:06:18 +0800
Message-ID: <20261119130618.904558-1-shxzhaosr@163.com>
In-Reply-To: <CANiDSCuFgmeFyLt5Bjy-WZAWXVBWwsZxmTZuBcf_1hmVGDjkfg@mail.gmail.com>
References: <20261118134629.463042-1-shxzhaosr@163.com> <CANiDSCuFgmeFyLt5Bjy-WZAWXVBWwsZxmTZuBcf_1hmVGDjkfg@mail.gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.53.0
X-CM-TRANSID:PygvCgDnb5w0iP5q8NxfGw--.11886S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7SfOUUUUU
X-CM-SenderInfo: hvk06xhdrv2qqrwthudrp/xtbC7RaJx2r+iDY3zgAA3m

Hi Ricardo,

Thanks for the review, and for pointing me at
usb_parse_configuration().  I had missed that the USB core already
validates bLength for every descriptor before the UVC parser ever sees
them, so the extra checks really are redundant.  Dropping this one.

I agree that bounding uvc_parse_format()/uvc_parse_streaming()/
uvc_parse_frame() by the field size would be the more meaningful
change, but also that the result would not be as clean as
uvc_parse_control().  I'll leave that decision to you.

Regards,
Shirong

