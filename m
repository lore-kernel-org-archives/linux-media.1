Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9253D7D7E
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 15:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662819; cv=none; b=G/O6V3+C/yx0U0TvoyJmWWzxcaa0nBGrTOSQ4htNaKbHOgLFDg/TUCblQ9kS0zUl3ZzrO0qQmu2rh0XdXHCAsVJIgNwLKBInHHlxcAZoZPcR+SUWv2f8XIEtHqMY8TxWCdxxUSBmtVAKkOyYIqDoXG9wWBq+S+ovqKGAwaXw/Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662819; c=relaxed/simple;
	bh=Iq1mEQyxzSqCLXx8AY8Ru/zsO0CeGKBh1qUZzKD/Xxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MB2AeMZ+TJlRA+W1oy1vqgonJahe79AoqCrqz7XvvwY3M2XBQgL3UpUNEVul5njuWkPKoqLaSlrs/Ad8VWSsH/xq2Vu6yAG6AZLL7zMmmtMhWRfi2w0YUQ48d7aaHL40PLJXU6l3KOoMEIRgwdQtkTBjd/YTuuE5/b9zpG4Y3ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dho69S03; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dho69S03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775662816; x=1807198816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Iq1mEQyxzSqCLXx8AY8Ru/zsO0CeGKBh1qUZzKD/Xxk=;
  b=Dho69S03ARmkcBzUh6oX+c9zrVp1+JQHxKBdJqiBjaWoUgJlIHxmhxIg
   mXTP2hAk8a6zpRMM9albAvlww7O0wgjwg/xp1FbzMfPMIUZ+i2PAFGmoa
   mxLXZ34FlRtLQV2KntF4VuqO1wuXDUkirW7rXVX/kzDWzGWk6UBmj0Wnl
   MARM6qt9n6haAMzXTfmtvUwXaf/yvW9ZGDzDwLoNai/w1FxM7HXNC6taC
   StgtaQvOL57krmEIJSKnuGvr5KnoOYoNSXwOBKTPLEwDiHbQ4/F4/kW0f
   S/Sa7tWLHOxTjVuP70mILOvgYK5r2v6hMCh6bJwyLyTHC3B/JZ7rQfpQ2
   g==;
X-CSE-ConnectionGUID: NnmebdZbQTSiFz1ELTzu2w==
X-CSE-MsgGUID: VGSJKVTPQSer0Qv2qu22JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94038449"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94038449"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:40:00 -0700
X-CSE-ConnectionGUID: Z31mttUaQJuXEp5HTjAPvw==
X-CSE-MsgGUID: Zf0ksZSUQ0WNNNigIDCGMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="223740381"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 08:39:53 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2E53A12203A;
	Wed, 08 Apr 2026 18:39:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAV0F-000000044DX-2UKD;
	Wed, 08 Apr 2026 18:39:39 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v4 19/29] media: mc: Separate single link validation into a new function
Date: Wed,  8 Apr 2026 18:39:28 +0300
Message-ID: <20260408153939.969381-20-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new function __media_pipeline_validate_one() to validate a single
link in a pipeline. This will soon be used for performing validation in
multiple phases.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
---
 drivers/media/mc/mc-entity.c | 74 ++++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 32 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 6bf4730b89d2..717569bd1a8c 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -768,6 +768,45 @@ static int media_pipeline_populate(struct media_pipeline *pipe,
 	return ret;
 }
 
+static int
+__media_pipeline_validate_one(struct media_pad *origin,
+			      struct media_pad *pad, struct media_link *link,
+			      bool *has_enabled_link)
+{
+	struct media_device *mdev = origin->graph_obj.mdev;
+	struct media_entity *entity = pad->entity;
+	int ret;
+
+	/* Return here if the link is disabled. */
+	if (!(link->flags & MEDIA_LNK_FL_ENABLED))
+		return 0;
+
+	if (has_enabled_link)
+		*has_enabled_link = true;
+
+	/* Skip validation if the current pad isn't the sink pad of the link. */
+	if (link->sink != pad)
+		return 0;
+
+	if (!entity->ops || !entity->ops->link_validate)
+		return 0;
+
+	ret = entity->ops->link_validate(link);
+	if (ret) {
+		dev_dbg(mdev->dev,
+			"Link '%s':%u -> '%s':%u failed validation: %d\n",
+			link->source->entity->name, link->source->index,
+			link->sink->entity->name, link->sink->index, ret);
+		return ret;
+	}
+
+	dev_dbg(mdev->dev, "Link '%s':%u -> '%s':%u is valid\n",
+		link->source->entity->name, link->source->index,
+		link->sink->entity->name, link->sink->index);
+
+	return 0;
+}
+
 __must_check int __media_pipeline_start(struct media_pad *origin,
 					struct media_pipeline *pipe)
 {
@@ -838,39 +877,10 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
 			if (link->sink != pad && link->source != pad)
 				continue;
 
-			/*
-			 * Ensure the link is enabled and if so, record
-			 * it. Proceed to the next link if the current pad isn't
-			 * the sink pad of the link.
-			 */
-			if (!(link->flags & MEDIA_LNK_FL_ENABLED))
-				continue;
-
-			has_enabled_link = true;
-
-			if (link->sink != pad)
-				continue;
-
-			if (!entity->ops || !entity->ops->link_validate)
-				continue;
-
-			ret = entity->ops->link_validate(link);
-			if (ret) {
-				dev_dbg(mdev->dev,
-					"Link '%s':%u -> '%s':%u failed validation: %d\n",
-					link->source->entity->name,
-					link->source->index,
-					link->sink->entity->name,
-					link->sink->index, ret);
+			ret = __media_pipeline_validate_one(origin, pad, link,
+							    &has_enabled_link);
+			if (ret)
 				goto error;
-			}
-
-			dev_dbg(mdev->dev,
-				"Link '%s':%u -> '%s':%u is valid\n",
-				link->source->entity->name,
-				link->source->index,
-				link->sink->entity->name,
-				link->sink->index);
 		}
 
 		/*
-- 
2.47.3

