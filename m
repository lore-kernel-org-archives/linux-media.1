Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F7535F19D;
	Tue, 21 Jul 2026 13:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640356; cv=none; b=H7dIgKpJJ7ijZmKcC2D9j7MiUB5RjwXzkwWNNGTctIeNUfNtR7lAP6cgTELPC+yP9qIr9KC2tx6YTNnprfG3aFggvcW8OQV83HY5mEzClUxKXPCNu4uVGrS/df4fWuLG1/IpCgLftzxxc4yPJwc6KxbQYELpjDsqsncHuVVJF/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640356; c=relaxed/simple;
	bh=svfrBm6qwvhos1KNM9Uxz3Q6w2/2dm0H31wva9nLA1w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n8YSqFKfUUKe/V2ZxvsnB0WNK6FXe9dFjV7XtmkEWELahGd7ao+zIPuYWt2RhVbZ7fmEtXsDanrJjAk0tcd4h/4F0X4Unipb2kil9V6eHjXMVxRwz7bWaB+WTBlBzTT+XVNhnyEFg4tfOAn8isAPiczDVAnsAggliJzpHKWzeiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=2H2xGWKU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="2H2xGWKU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D0BFC2BCB8;
	Tue, 21 Jul 2026 13:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1784640355; bh=svfrBm6qwvhos1KNM9Uxz3Q6w2/2dm0H31wva9nLA1w=;
	h=From:Subject:Date:To:Cc:From;
	b=2H2xGWKUUi/e+EV8/+9Urc3gmHINYeQRFVvTaVd00kMTQeWiAz9A9xJIP7pZlKfxc
	 AD/HGMhzVdYmEN5p+p2gJ5BZAS3T+2N6Vg7Rm094n6mAaBtUmvTHkt2shPUdTvQjUD
	 NL6l+N0ehxQtZ3YBhFRALCYIThSA6+4zID8/W3Sw=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F0CC44529;
	Tue, 21 Jul 2026 13:25:55 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Subject: [PATCH 0/2] media: v4l2-cci/ov9282: support single-read I2C
 transactions
Date: Tue, 21 Jul 2026 15:25:27 +0200
Message-Id: <20260721-cci-single-v1-0-8485171e1393@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEdzX2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Nz3eTkTN3izLz0nFRdI8ukpCQLS3Nz02QTJaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaABmCERFuAAAA
X-Change-ID: 20260717-cci-single-29bbb89775c4
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784640354; l=1245;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=svfrBm6qwvhos1KNM9Uxz3Q6w2/2dm0H31wva9nLA1w=;
 b=NRtTFiCF1wZG54Y77U3YMwEQO/1B2WKUYTRI06q8AtZ7FWIaYV2jD3bp3LkM5KuZDL13T6WEi
 oRQx9mq0My1AN0tobyFmMLiMFeW/VTApii9J4R2JfNfgKIBbetlci4L
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

This series adds support for configuring transport-specific CCI regmap
behavior for I2C sensors, which is then used in the OV9282 driver to
force single-register read transactions.

The motivation for this change is that some OV9282 camera modules require
single-read I2C transactions to operate correctly. In particular, OV9282
modules from Vision Components return invalid data on multi-byte reads,
while switching the regmap to single-read transactions fixes the problem.

This series does not change the default behavior of existing CCI users.
Only ov9282 opts into single-read transactions.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
Richard Leitner (2):
      media: v4l2-cci: Add support for custom regmap configuration
      media: ov9282: enable single-read I2C transactions

 drivers/media/i2c/ov9282.c         |  7 ++++++-
 drivers/media/v4l2-core/v4l2-cci.c | 23 +++++++++++++++++++----
 include/media/v4l2-cci.h           | 37 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 61 insertions(+), 6 deletions(-)
---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260717-cci-single-29bbb89775c4

Best regards,
--  
Richard Leitner <richard.leitner@linux.dev>


