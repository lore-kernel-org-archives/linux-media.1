Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E831E3B14CC
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 06:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716244; cv=none; b=gklV4C88fkYxwKkrUDSdXLOX3Nf53zOpwHSHgaYHvbGRiBgZ3q9rPbFOZWq0ZEbK+oLmc9at+/AuDcU5fksxCB+s5eMKut1npBY0UiffAWyksrYZ/vFwUTwzX3lPZJv9oCWAQb7Eu7q0MS6X90+MMp/6XoyyMunEaJngJUUVRnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716244; c=relaxed/simple;
	bh=L4ZIaSgSn18Dc0IV+/DWIwUIfNDMqPHM8QEcLI7XBRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQ+onrfr8OTBqWQGqxoTSWCgVfaZdCXqY/i532kYTNSyzMOI2qIkFv9xSsG7Dq2iq0rynT3kzQ4pIBTZEHEwDcjqxuxc6oCjoV5I+K2ruPHbPteDgc8WMY1gK4B4od29gJDb4yYkL91exzqMTHJViGpFi3OzBVR0EnGOoyzJd9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mCpiZhwL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mCpiZhwL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC4B1F00A3A;
	Mon, 29 Jun 2026 06:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782716243;
	bh=1cJMhEtD9ziEuGYdgVypiXucfXHVoCTjbE+HJ3YnPJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mCpiZhwLpacN/p0Dc375Y+eij4iIiiamBiWK/GeNbeXgGLxW8E4M7FlYQkVpYJ/bh
	 W5Mt5I2xcbHtCvvgEHj15WgrCCcQJQyutn1dKFKsrBG4gE+i/zQPdEFKOs6vsNLlCt
	 6H0y86JI7dVfUKQ6Mebjr81YLFIm5JvJtsTkqMB+lDDmr2/xKo6TMCOqcYbELr4hQP
	 GDsa1NsmcfAirKTB1QYXK168Ug+3W1IlspXtJjM8yqroofOBu/iUi3Y+xOEpjHiEaT
	 cyvj/l7+HF19fjfu51fvTSdGa1y4YxNGQ57k09E3zop+lFyBg6lmP8lTkcVL0Rl2Sk
	 Gx1kIfEm10MKA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 5/6] media: em28xx: dev_info->pr_info since dev has been freed
Date: Mon, 29 Jun 2026 08:55:53 +0200
Message-ID: <6a8b16c4ba53cf18f2f175313ccbcb2c3aad786f.1782716154.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1782716154.git.hverkuil+cisco@kernel.org>
References: <cover.1782716154.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In em28xx_free_device() dev_info passed &dev->intf->dev,
but that device can be freed already.

Just use pr_info instead.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index fbfb74eab475..4d1e48c86ce8 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3758,7 +3758,7 @@ void em28xx_free_device(struct kref *ref)
 {
 	struct em28xx *dev = kref_to_dev(ref);
 
-	dev_info(&dev->intf->dev, "Freeing device\n");
+	pr_info("%s: Freeing device\n", dev->name);
 
 	if (!dev->disconnected)
 		em28xx_release_resources(dev);
-- 
2.53.0

