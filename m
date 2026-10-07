Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B32340E8D7
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 20:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405873; cv=none; b=W1S+x9+H691LHJbTjqJmg3Id6z63J0umG1eRj+q4vibw10Rf0g9G2qsFcix8I5y7qqSd8TqaW93nQ+WMQo6DQDvVRsAbNkZ0aIDZssGGLn358tH1byeEHGjJNulX0SvZYJRuF8WcwhDtqNl2yue4c5lcmaYuXHCRqfrqeHsp+k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405873; c=relaxed/simple;
	bh=zPWpKkYlYxiVrkHu5WAAsE/JWNRrnkqI0mszD6/1eM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e31ZPqyNB2wfvmsD/sqWz9/3VCycF363mKjuryOAAMujL3yxMDcjhID+t1fvjtKY39zt6tt4b7j6zUP3s144WbiYW6L/+AqE6o/oeTGtPpjoEpcuWDgKNx8EKTbzt3c1sR/HKjwmFE+xZo6gEstZXN73Zjo7oIgm55yuX1m8FSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5V7W3cj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5V7W3cj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791405872; x=1822941872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zPWpKkYlYxiVrkHu5WAAsE/JWNRrnkqI0mszD6/1eM4=;
  b=k5V7W3cj7GvryHjo1jbHcB10EaT1TEHOeRZEonaRlW2HuqQFp+wP/rq0
   wzSpGkAdo37p6PCJD8N+YHMxfh7gRLsEFm5RFr63T5AyOje5acU5LEwbY
   5cnM811BWxyPJTud65LdXT++6HSpX8s/M83a2a0mLslZhWfv/qi0Ht2fH
   kMpqs33MkggduRus8dwvvkOCyfxK7NDt/p3zaYuRysgsSqEMXuRVGrHXE
   miM1Upyt9/Sxn1FIHu2f1BR6H5kJl+ejZZvNj+efnzOLmAwHOwsyNZAuO
   fKJ2657VNx3oCD+M3aqpImMveFqH5FPFaaM7MHDIkRiW3b8ei0tlG91En
   Q==;
X-CSE-ConnectionGUID: krmiGb5URGqUtPV3WUGraw==
X-CSE-MsgGUID: tP/vZ6Q2Tcy49Vj0BUqPIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="81572"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="81572"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 13:44:30 -0700
X-CSE-ConnectionGUID: vHAToyUNSjGZxgAQTRIPmQ==
X-CSE-MsgGUID: bEE6/FyhTQyWYh1be78eYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="1642448"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 13:44:22 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6799D121BCD;
	Wed, 07 Oct 2026 23:44:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xEYSF-00000003HXt-3SNI;
	Wed, 07 Oct 2026 23:41:35 +0300
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
	Dumitru Ceclan <dumitru.ceclan@analog.com>,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Andrian Suciu <Adrian.Suciu@analog.com>,
	Martin Hecht <mhecht73@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Vivekananda Dayananda <vivekana@amd.com>,
	Quentin Freimanis <quentin@q-lab.dev>,
	Cory Keitz <ckeitz@amazon.com>
Subject: [PATCH 1/2] media: mc: Keep INTERNAL pad flags just for the kernel, for now
Date: Wed,  7 Oct 2026 23:41:34 +0300
Message-ID: <20261007204135.782415-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261007204135.782415-1-sakari.ailus@linux.intel.com>
References: <20261007204135.782415-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not expose INTERNAL pads on UAPI as the documentation nor
v4l2-compliance changes to support MEDIA_PAD_FL_INTERNAL pads has not yet
been merged.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/uapi/linux/media.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 80cfd12a43fc..63e69a517987 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -208,7 +208,13 @@ struct media_entity_desc {
 #define MEDIA_PAD_FL_SINK			(1U << 0)
 #define MEDIA_PAD_FL_SOURCE			(1U << 1)
 #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
+#if defined(__KERNEL__)
+/*
+ * Forgo INTERNAL pads until proper documentation and v4l2-compliance testing is
+ * merged.
+ */
 #define MEDIA_PAD_FL_INTERNAL			(1U << 3)
+#endif /* __KERNEL__ */
 
 struct media_pad_desc {
 	__u32 entity;		/* entity ID */
-- 
2.47.3

