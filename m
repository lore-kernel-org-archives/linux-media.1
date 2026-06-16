Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B452D6E64
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 13:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615773; cv=none; b=B47MAbDr8Nv2nY6DLnyfTmC1h+mdvYUWqtAR1GAoxExLCIEaCJSy9sGs9Y+mrDPao0BuI2d0ERW8s9VN3hRBPY+UOXuoo0T2m8zTemrX8j8OAGkpnmnllOl5ALTVZ4Pde9fjHe4H7YOeGtMhFhpD7ysd0FDbDZco8H6p638MBiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615773; c=relaxed/simple;
	bh=L4ZIaSgSn18Dc0IV+/DWIwUIfNDMqPHM8QEcLI7XBRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ho1Rds5hWMgvz7Ks+ruTZa+b+KDvTmMhq88kPJnJ87BKmm5oKMylYC+PTVgpf/8OEmOg2i1ajCZ9f4KfIXnCcnBG5aomUfcIOucsm7ZUYSIHrzI5U04VN/pZNSMj5jGhnJoKExzbID+bsdYwO0iDf1tHGuhEd7kuuG6uVRGEJb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKEy8u3/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKEy8u3/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67331F00A3A;
	Tue, 16 Jun 2026 13:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781615772;
	bh=1cJMhEtD9ziEuGYdgVypiXucfXHVoCTjbE+HJ3YnPJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iKEy8u3/3tEMrEDx/y8pzXsNfVKJRMrPAj7s2tGU82ftnzpe+g/DBvkUrtyuRf3TX
	 D8ypEjjyrapvk38LHd/Xnc57hwf3wwCqtaFporR5/LBTXmx3o3lKbNv00YxNjqcguC
	 KO7ZJUq6tCyQTIVo8LDwqNI9WB4zEv5OUfxEvGOCH2amthZ36Eytxp+RD8CMIiKUUp
	 RA6vlyTQuxmoEw9/Jk1l2yoJvbvzoKVlxXTd2953qsmrgCOfpmuOH0oKpXV+L7Bvsr
	 7uVg91Kq7oqQDArn5B4qIBdyKX6A/m+9QW+D1K1aY1xfhzPNKxf1bVSJV0VPMhj6ZE
	 lXrFSpn0uBcQg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 5/6] media: em28xx: dev_info->pr_info since dev has been freed
Date: Tue, 16 Jun 2026 15:10:31 +0200
Message-ID: <4f25383b64139feb0a64a07c20b1776d13301f9c.1781615432.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781615432.git.hverkuil+cisco@kernel.org>
References: <cover.1781615432.git.hverkuil+cisco@kernel.org>
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

