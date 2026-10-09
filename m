Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B4F3EFD21
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 08:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534990; cv=none; b=J5jpuk3iS+3gSuc/kAP/lv1I5QM9c/bbvd02Q/hUgwrY1zwGxiGJBJxhfIgN7UD8czhxpgmvvzXUgG34xCcegGrGQNf+MtNR22cMjELgR+QlPHbkGp6eDAunMkQOEQuP6c06FB2ahEtTWYvPxUrbvxmG9Jaep2i2tIYTCFiY5gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534990; c=relaxed/simple;
	bh=duqIFnOyn8W/MS5z2lcisVp1filjeuxzvcUu3D9pYDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q3799Qk+qXfojHc3UBKbjiF3UicyHmPKe8YuAQRxt8C7PsEQ9sHVrmHhzkzWYWvhRfNRaS3gkl5L2DoXq2Lhtfd5UjZ3ahzRpMHFohOHy3LWN72etWfYigzd/NaXImMuJdCGuTg+MqL16MX+PFpIRGdeSzK+1t6FW7ImS9ltHQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsF2fc78; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsF2fc78"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791534989; x=1823070989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=duqIFnOyn8W/MS5z2lcisVp1filjeuxzvcUu3D9pYDU=;
  b=HsF2fc78ZBUZPUmsUKjRV1TKnHyTAK7hMoMalJx01AuZGbdMV4axik/g
   24BtuMDO/cMsBc7szAr3uba2BpyyUxzZbapQAeK0JhP0M5zJz4vW4si0W
   nYiQzLdUcHTR0PrcIwoW0UAVZocdRFy6nq0xch0nKiNj+7whD0f2Tsi0K
   kJ5fe9Cg477nFwz9/DRRxw5vkqfWKnydUmL6ZjynAqYaG1IV4Z8PP+s1M
   ve3kN4GLK+Xb+1GgPPGSxePy7r7ekum/RMCVALaiFDdX0RCr38H1cc31o
   4AFSLoHSWsFHNjdnP3AxwOy/15AD5YiWMNiIKjUtyyzXWON+MM0XmP7r9
   A==;
X-CSE-ConnectionGUID: L+3epkEpRUWb01kjcnCkhQ==
X-CSE-MsgGUID: O1rl3ULvRO6W43AyuEujaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="232343"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="232343"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:36:26 -0700
X-CSE-ConnectionGUID: v1Dg1U2UTlqOCL4dfL39NA==
X-CSE-MsgGUID: VKI9Reb1T3+9RdE3zGZQ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="379998"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:36:17 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 77C6A121BC0;
	Fri, 09 Oct 2026 11:36:20 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xF62n-00000009FYN-3lwg;
	Fri, 09 Oct 2026 11:33:33 +0300
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
Subject: [PATCH v2 1/2] media: mc: Keep INTERNAL pad flags just for the kernel, for now
Date: Fri,  9 Oct 2026 11:33:32 +0300
Message-ID: <20261009083333.2204725-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009083333.2204725-1-sakari.ailus@linux.intel.com>
References: <20261009083333.2204725-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not expose INTERNAL pads on UAPI as neither the documentation nor
v4l2-compliance changes to support MEDIA_PAD_FL_INTERNAL pads have been
merged yet.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 include/uapi/linux/media.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 80cfd12a43fc..2da6ae4da003 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -208,7 +208,13 @@ struct media_entity_desc {
 #define MEDIA_PAD_FL_SINK			(1U << 0)
 #define MEDIA_PAD_FL_SOURCE			(1U << 1)
 #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
+#if defined(__KERNEL__)
+/*
+ * Forgo INTERNAL pads until proper documentation and v4l2-compliance testing
+ * are merged.
+ */
 #define MEDIA_PAD_FL_INTERNAL			(1U << 3)
+#endif /* __KERNEL__ */
 
 struct media_pad_desc {
 	__u32 entity;		/* entity ID */
-- 
2.47.3

