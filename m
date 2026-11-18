Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008538;
	b=gYbvbTtHwR4rlNzzREoHA5mD0L55o1XIEctdA0UiV2w+GkHnkBENasAfK0SoTJHl99U1
	 7xt2V0pqRsZMsFE6yxxR7KITgP+cnX2qDJtW+1stuu57xuHFrQUIx1pW6XufgnpRf0cXs
	 JJve8m92SJJ34b6q5/gSiG1vua6ilM9XMcGHPxy6kffSv019sgZt21uthwbNv1eM4qlx1
	 zFaFZ8t/wXXhSnjVkeLrp4Fc88N9E7n9zxGmdniVc2OZzw3NF3jozmeARQbKNpTf4Gc73
	 w7u/N5/FE5nqzPv6ljnhb8U9LS2s4cpIr2yjM+yV19lB2oRJEbFOhc5gNpozU/4hNLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008538;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=GxhUVhvWrY0SEQr1/tbOVwgUa1hq4YK6q8c9A/sGD+c=;
	b=Z+SukCq51dU1i2gAPH1eisN2Gxb/mFNl5A0mDWu/JgqRhIhEsGQYd0ardyMRr/9AJa+a
	 4KinHBIKb+iAec8hr5thPeJrq56jA8AFsTrXChGAH6CvypcJRW/W++BREBJPPLCCTVlOZ
	 JOLP2SFwwhcosEQMVISlFKSV5o/3xsTn2DfIVrDhOuy1xYZTNuhVYAXi16VUM1Y88OEf1
	 yjdegPBCZkHW0gIAo99RjixYWEw5HHfCAu4lXEUgQGyNxARJNGGHhVrk5c/wsGLOCqSBg
	 1o63hYR+JSemwaaND5xmQwyQWKEmJJXycVRvZuqr0yMRLybk249qaO2mrv+Tyo2GbFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j68ndv3c;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA83D606A33A
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA83D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j68ndv3c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008538; x=1826544538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i06NiyShC3zgZBSz9IUNHx8s4aZCvALD5n16HgUGepI=;
  b=j68ndv3cGGfNptPGjTQmO+i6+qBGVFw3+EkczylU84I13P0kfOgrlBBn
   mz+98tW1r4buE73g5T269pSjONJIwtkn8YdIO4lYjLQiy8OanhS4Pgdrp
   TslfpSVFDUFyZC5Z7l9scrmhWAupk86xG3qiHU5uYHOWSzgQU5xVi1gBa
   HH3HsA4FcXeE4YWg78tDtsSVta39sgwXkBHDOynF/lU+NfqcV83+LlbfO
   eV4VmNoV2n4fvzvKGCfPZvHt37jeRs3gOkSwypNwgnsBc2NmxJPEanr3q
   KRyf5M2TzsHgnFzjf5/OjZKeSyHyVuwlzVxWV4Au+8rsI5J5qhYQ+PDQ+
   w==;
X-CSE-ConnectionGUID: 5RFslD5ASG6ykq5GcW1N7Q==
X-CSE-MsgGUID: BktxC595Sq+6P2te2DFZ3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808616"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808616"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:56 -0800
X-CSE-ConnectionGUID: 2vr+/fmdRVusyrykNfaUcg==
X-CSE-MsgGUID: K/wa+qKEQRG0EAdZkwlj3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376692"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:49 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 41EC7122E2D;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfhz-00000000taT-3dOb;
	Wed, 18 Nov 2026 15:28:19 +0200
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
Subject: [PATCH v13 13/73] media: uapi: Add V4L2_CID_METADATA_LAYOUT control
Date: Wed, 18 Nov 2026 15:27:19 +0200
Message-ID: <20261118132819.213473-14-sakari.ailus@linux.intel.com>
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

The metadata layout control defines the layout of the metadata on the bus.
It is used on sub-devices that use generic metadata mbus codes on at least
one of the pads.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-source.rst     | 6 ++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                  | 7 +++++++
 include/uapi/linux/v4l2-controls.h                         | 1 +
 3 files changed, 14 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 74d4f182222d..bdb5ddc257d5 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -155,3 +155,9 @@ Image Source Control IDs
     is provided as well.
 
     This is a read-only control.
+
+``V4L2_CID_METADATA_LAYOUT (integer)``
+    The metadata layout control defines the metadata layout on the device's data
+    interface for metadata streams. The control is used in conjunction with
+    :ref:`generic metadata formats <media-bus-format-generic-meta>` formats to
+    specify the layout of the data.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 8656fe3144c1..950fb714dd5d 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1160,6 +1160,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
 	case V4L2_CID_CFA_PATTERN:		return "Color Filter Array Pattern";
 	case V4L2_CID_CFA_PATTERN_FLIP:		return "CFA Pattern Flip";
+	case V4L2_CID_METADATA_LAYOUT:		return "Metadata Layout";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1324,6 +1325,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*min = 0;
 		*max = *step = 1;
 		break;
+	case V4L2_CID_METADATA_LAYOUT:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		*min = 0;
+		*step = 1;
+		break;
 	case V4L2_CID_ROTATE:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		*flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index b45a42d9442e..87b6286abb51 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1271,6 +1271,7 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CFA_PATTERN_FLIP_BOTH \
 	(V4L2_CFA_PATTERN_FLIP_HORIZONTAL | V4L2_CFA_PATTERN_FLIP_VERTICAL)
 
+#define V4L2_CID_METADATA_LAYOUT		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
 
 /* Image processing controls */
 
-- 
2.47.3

