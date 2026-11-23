Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795435372;
	b=Yn1T7fdLFYKO3MXl7WGvu9AgsA+H5BeW0pG/eTXcwOwNF2d+I7Z59mujXYm0R4GP2cay
	 /McZ53RkBL29G2TidkIx+wjhPJbjTU5ZetC/iFdoLzUij5qhlmK3S18mp8e5PjC0A6lXg
	 6I/l6/YLx8ITbOyPwHuc/rO4FyrKdtGYQM1uuPLGXOVvgNB1IGYU+IcHnS/gfweHXb/j0
	 mQqfNXFvG5TiqNWH5gfcpitrWuVrBYM7GBnAdC/hw5WkZAZiLo833uWzm7dH6eQSSzZtm
	 qVSuC857B9eUUnMRMXwFYBVBolg3Do8TooqbVge/d1MtfA1J4/0gYWyHNejVMvdqFkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435372;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=YcLNY7J4JnGgFmyfGh59/EXYMEXxWZN2bT+XaQ1n4R0=;
	b=Kx0gJN5Z0cZjVsUGO6+bUSCDilw04662qRVvD3k4OEa+spfbdf2i24YUUiB8wvew4oGL
	 C/t/YxjYv27/vYsSADc8+ylHaqPpJJhIolBptYx7ZeCq9B5pRWrpNUPqEG31VwpQJV/da
	 xg7iUFadb6cPXP76OXDcrTFf25wGzF3Kv/WeJm339lT5Czww13qSvEKFwGxnh1POP37iz
	 sWBDQGFg7D6sCoolbO5AcCjBTjX+hX3fA4cBPseLrdHXNofQYFXmVTe+uuTWTfZU6IKkZ
	 JFbXDkEMtjCqYpRBMJH0Y8VIunNtV3AZ+HpSm63CA6hNCTVHOpG2rgJMJWTR3Fv5Nqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFp0H+Be;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386F5606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 12:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFp0H+Be
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795435371;
	b=xg9s5dTd4Kf8lq5X4ATZjjd+jazHRGxMoUp9+jN/kJKyyeomMEkWCQLaAnA+jRAI2nE9
	 BwbgiiFX8vZ4JbiWGANIZL0UsQfMydNC35OgVm9X7oVXa/hcGTp6qnMAHEHgpuGfJhue4
	 wxWdCg8i7OqDHgGS6WMplb+dIl39PRo4Ep2bD5zW1cOECAznYbEsPMXK+zYUYVxamxopA
	 H6NV4ylamINCclXQ7jNmiFR1hB3iV1CcAooln9qK3a07JKNZqkN3ofuSqQqT6ZpmdwLLY
	 zJBItTNn4nXeK/EjpLXnOQ5lU84QHeGVOo6rQHUHjjxKmVopAi4C0B4AWBW347rkifg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795435371;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=YcLNY7J4JnGgFmyfGh59/EXYMEXxWZN2bT+XaQ1n4R0=;
	b=xAb/GKHwELiuIByfyuRgLfcSYIFnn9XT6IXe6h2dDVSgt4Auc8/dvxq7K0ZFXP6OWHHc
	 wy1nqCBIEurk0nel8I6q8sL/g5TczdgpJelFM3k7jC9jb0OnO4m5LsfDLvEr2OF+hqGDS
	 SL00Op8eO6i61IkMb7CvxCXyU/hFrImMtUxQvTNaPpBmskOsOIcqw6ZZBzp7OXX1ls/4+
	 B7RtPbpJA5R2NjEdBbzRzC1b9ZXrnsQPXoYUy04+bVcxEGCyUcnWZjdmSXrGbLmye6+yQ
	 bbxE3hWVs2i1C/b2nFvC5KoJvqLlbxzcvTi3zJm+HNn3J7ve/NFyZWWvT6mezAyQHUQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78D281F000C0;
	Mon, 23 Nov 2026 12:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795435371;
	bh=YcLNY7J4JnGgFmyfGh59/EXYMEXxWZN2bT+XaQ1n4R0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=FFp0H+BelVDfLaAoXZSkpZUIF+9q3ss45OWGbrgnUwRuxbsx33NIaFDsuJoJN0vBK
	 nynesIvH4hkncRl48HmnK4A8airqNZkNW8ngbdkdE1Nm47uHgAg/JSD2fligXrQfbT
	 ZbdsgVgSWaPKo8JUbZFHO/ZX1HosbIaWU04KqkgqluHoEiKmHlfB1cf4UdrJUDjKwx
	 eemO2ULXTDhzalY9EP/FaHX3H5JvQ7QM0dUp/nVmXeSQhpcNN1W8yl1tqaYGXOpNrs
	 Fdt+c9mC6cV1HoBpe/QJUF2BDlbqbl3xtfCaH/RL9GJnkUw2t4VHZlOJLmCwp7JdZD
	 7PwoLF040Idzw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CCC1D4C459;
	Mon, 23 Nov 2026 12:02:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/4] Various CCS fixes
Date: Mon, 23 Nov 2026 13:02:38 +0100
Message-Id: <20261123-ccs-clanked-fixes-v1-0-fb2bcc87a517@ixit.cz>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBCF4auQWTtJWxDRqxAWdBhw0FTSAUJCu
 DtVl19e/reDchRWeGQ7RF5F5RMS7CUDerZhYJQuGZxxpbUuRyJFerfhxR32srFiae7em9u1MK6
 C1E2Rf0PK6uZvXfzINH+P4DhOO72qOXUAAAA=
X-Change-ID: 20261123-ccs-clanked-fixes-609bb0754028
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=710; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=4jS0zlegs14tBmkkYCWRgSBLMv0d0gpAy+CK0t+l2YY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrBCtfByf8u82W7vlbkVnFhTNe/cXBz1IUYhXn2
 yz+6AEZUB2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawQrXwAKCRBgAj/E00kg
 ctwOEACv/n/56lzpRaDfQ02SNgDw42EkAfeayv8QApQ3JtYtLDI0uSkPpdsVmHOpy1qwEqUkwyJ
 Ej5jib+hHeVNu06xElYdDb0OhEts93Mj9PnlygaLYXwrdncjpJh0JMrGUhKesnnbzPcK/f33YPL
 NjCYn2PAQfassOsT0j6mo1A3bOwrtoG6bOCYKQe8m2I/OSnIsP0GchJ1vQSrf2mcTTJZCdWSMeJ
 DqfzQhvyoHQDc2V8HPgQoMdLCAW+4OtwQXu99U0vCTWt8B9CGK3XALVjkwMCZk3ndyerUjrxI+y
 s7Lq4jZdCX3LBf0dIewH6pUHmAOO69hINjgI1HhqHP9FX9IQx6/Pk78C/axpwV2ZtcDRd2TLT/k
 Cd3fXDWggbetSF+l8piRRF09ZIgTcOnc4AgM6xs4HPGszQsK0ALiF7uco8SA5L0sPMDiGgAp9/e
 mkb9NJb0bEp1zi3NBzwjGCJTWJVznLIThegXZejHZmGE+MGlQIKOFkOAiozmwKwQmQBDRBORHra
 g2hu0OMObB7dOb1Aw8mHhRTiFFYGFVFenzJbUPnGpLeM4FQJol8HwZxLwW1sfl55wveTbkEUtt2
 YfEitwyyce8HoWdIqjnfo6UTZXomjrYfJ/bEijWi6McHitGO2/L2YdO38U63dDtb1luIpGS5ycv
 UlB496SNCdcmZ8A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

First two seems to be no-brainers. Next two seems to be correct too.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (4):
      media: ccs: Use dev_dbg() instead of dev_err() in ccs_enum_mbus_code()
      media: ccs: Fix sub-device index in ccs_cleanup()
      media: ccs: Update PLL and blanking limits when pixel_array crop changes
      media: ccs: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flip controls

 drivers/media/i2c/ccs/ccs-core.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261123-ccs-clanked-fixes-609bb0754028

Best regards,
--  
David Heidelberg <david@ixit.cz>


