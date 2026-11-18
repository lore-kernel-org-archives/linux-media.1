Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008540;
	b=n4KnYGgTs1LOmVYZB8faTd9bPxs5b7NLite/w+CSxHuzAxAlMB+nQtqY/XbYA0pt72pO
	 ihJpDmjuxnHGDDMNUGjANQOeXAper63kz7AaVIuwagMBnj/hZ1mAOgUxyX6CRqSdeWV42
	 cxfU8q2M4PyMQF7de0V026oQtfUCZcqmfyqch/FV3WVH1CfwsxK8+CiiTAW0Z0Wyilu3i
	 ORAuXLpS6MkirYmqk+E5XOgqj2k5ocU+c66iFCOedNpxfkuruE8J70PJ7hEbsjH7k+Jf5
	 /3yHTLYghgDWjL/Bu51PQSCCY3gjojn1ML8n9grt8CeZh7Ge/Ie2iVJMBon1WBIiL1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008540;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=EBz4ixlGr3UGtDPgm9eyOATjnDJjUu9hEYHYUJlUj1g=;
	b=W8KukmQk0fGgp/LQ8cuSOjCFwY/BaGk8c0o1WL69qnR3jmCT7OE503grLBZ2hvvfUTJe
	 3MMtwfhETRUaJGcLTkvQtWyq9rNvj1whWhVjf/EAw+w9RMxwH91NZ/F3NYLXgxFu6i18K
	 WqhVvRsRI9KN76DdGiY7nBz+cAIZpzHnC3daWEi8Ay3okLMTmHyA68/tvpowo6h/fYU6j
	 2Lwrbn1bqmKc41T1jqYxduHor6wV1njOvuhwOIPSKteX4wXkQGzQx0DxL1J39bKn28unp
	 AKMERS585PTMWeRWRUItBwU89U6EhLkSzI1VhhhpiR0lIEFE2MphH6gieA2mnbTgR+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h4Cmx0sd;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5646B606A337
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5646B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h4Cmx0sd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008540; x=1826544540;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fl7ATS9cTgtzpKV7T8DN/J2GSQ7UxVReMH4L7yW6g30=;
  b=h4Cmx0sdGfoV67/oj6QzHLKRM4DOKmtyPBx2RWEbENX0pYYsh5NWCypb
   1kHh3VbbINa4iZU2YMNmnuJFs7AZnM+O9HZ6YUKUQW5YqDq3oyYsKBACD
   jGKYLreLBpGTonw60YNtDDFCat7BMoHJ5aN5RHXrvXVU9+c1xh6esMruP
   nainAzEkK6WR97f5/NE98SZg34OdRls31EupstVWDjYG2Web2TT+buwjS
   nIoSVReYPeTBlxej6vfK9cypBHn6AUXix0jOx78LXJg6V9cGGuFUyMBXR
   KnWXRelVGG57oykJw6VavcJTSEG9JC4572yHJCWYC+LR1rMXQGsv/DMwT
   w==;
X-CSE-ConnectionGUID: CxJFcShkQYqLX4nRaPOWfA==
X-CSE-MsgGUID: 0voN73fqSU+2hLglTD2ThQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808756"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808756"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:57 -0800
X-CSE-ConnectionGUID: XxGWOUALR22t571x4RcH0A==
X-CSE-MsgGUID: ZnX31DETS1OZz90yDj8m9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376715"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:49 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6CAD7122F6B;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tbB-0Cl5;
	Wed, 18 Nov 2026 15:28:20 +0200
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
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: [PATCH v13 24/73] media: v4l2-subdev: Prevent accessing internal pads without STREAMS cap
Date: Wed, 18 Nov 2026 15:27:30 +0200
Message-ID: <20261118132819.213473-25-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118132819.213473-1-sakari.ailus@linux.intel.com>
References: <20261118132819.213473-1-sakari.ailus@linux.intel.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The internal pads are expected to be accessed by users that are aware of
streams. Require the V4L2_SUBDEV_CLIENT_CAP_STREAMS client capability to
be set before allowing accessing internal pads from the user space.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 39 ++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index a07d77e584c3..92664f859369 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -233,6 +233,18 @@ static int check_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 	return 0;
 }
 
+static inline int check_caps(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     const struct v4l2_subdev_client_info *ci,
+			     u32 pad)
+{
+	if (ci && sd->entity.pads[pad].flags & MEDIA_PAD_FL_INTERNAL)
+		return ci->caps & V4L2_SUBDEV_CLIENT_CAP_STREAMS ?
+			0 : -EINVAL;
+
+	return 0;
+}
+
 static inline int check_format(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *state,
 			       struct v4l2_subdev_format *format)
@@ -244,6 +256,15 @@ static inline int check_format(struct v4l2_subdev *sd,
 	       check_state(sd, state, format->which, format->pad, format->stream);
 }
 
+static inline int check_format_caps(struct v4l2_subdev *sd,
+				    const struct v4l2_subdev_client_info *ci,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_format *format)
+{
+	return check_format(sd, state, format) ?:
+		check_caps(sd, state, ci, format->pad);
+}
+
 #define do_subdev_call(sd, check, o, f, args...)	\
 	(!(sd)->ops->o->f ? -ENOIOCTLCMD : (check) ? :	\
 	 (sd)->ops->o->f(sd, ##args))
@@ -266,7 +287,7 @@ static int call_set_fmt(struct v4l2_subdev *sd,
 	if (!sd->ops->pad->set_fmt && !sd->ops->pad->get_fmt)
 		return -ENOIOCTLCMD;
 
-	ret = check_format(sd, state, format);
+	ret = check_format_caps(sd, ci, state, format);
 	if (ret)
 		return ret;
 
@@ -331,12 +352,24 @@ static inline int check_selection(struct v4l2_subdev *sd,
 	       check_state(sd, state, sel->which, sel->pad, sel->stream);
 }
 
+static inline int check_selection_caps(struct v4l2_subdev *sd,
+				       const struct v4l2_subdev_client_info *ci,
+				       struct v4l2_subdev_state *state,
+				       struct v4l2_subdev_selection *sel)
+{
+	if (!sel)
+		return -EINVAL;
+
+	return check_selection(sd, state, sel) ? :
+		check_caps(sd, state, ci, sel->pad);
+}
+
 static int call_get_selection(struct v4l2_subdev *sd,
 			      const struct v4l2_subdev_client_info *ci,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_selection *sel)
 {
-	return do_subdev_call(sd, check_selection(sd, state, sel),
+	return do_subdev_call(sd, check_selection_caps(sd, ci, state, sel),
 			      pad, get_selection, ci, state, sel);
 }
 
@@ -345,7 +378,7 @@ static int call_set_selection(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state,
 			      struct v4l2_subdev_selection *sel)
 {
-	return do_subdev_call(sd, check_selection(sd, state, sel),
+	return do_subdev_call(sd, check_selection_caps(sd, ci, state, sel),
 			      pad, set_selection, ci, state, sel);
 }
 
-- 
2.47.3

