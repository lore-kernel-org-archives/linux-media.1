Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008530;
	b=Dq0X1bWdiVgEFZH/TXSxrN8yV9ymv/i0AcXa2BAkBqK758QoP/J+A3Tf4y/T6Zh9/XLR
	 GuJh8apJhJqz0ZyqS/Gl4jdhvS0Qq0p5PC01/O6ZLPLGGutLx5V0OcX6bYKs2ZJlOtv8u
	 RZLynEvp9VsnR+gpeEXHdB8fJEkQAhL8jbZJ+NaS7XW1RE13JI4hDcFOiu7XPCZdGJWbm
	 K4zLCzhg3BBfWPSUqgBwpe0pDWdca+l9qBopWN0BmFq/7exrr2qbAl2iDRwO1X8KgrpaN
	 yuYbb1s1jekDCoWLxeS/MYkK5r3ukuD/CMvteiue53+NTByQBQthCQrE2O9rMg7iM2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008530;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=w4mo1b7yIcwUtKnYcVeM1iqeS9VEeaY23+5rYFD+pWA=;
	b=vKZah5II4rOJL46pymCvJQvvNCdTdZMcrdXH7CyZsmu6e6STO3Gred8DF620sVP14ORT
	 pKzr4FTmWNlHsi/X71llVWDMuotntw6Nuqbx3I7pZSxPlJ3O762yD+3jv97U097bArEgo
	 a0gnQN63olpuTgUr8ehubOQUtqZ+lxyS7qpCRC24+Fh/pbEOv8o6KLXnUXhTk7AA7cVCU
	 8JJlI1PaAO5PF+5MrRWQRjTSzGY/+2Tjxa9NtskCAv1DX0S+gMkAqDFstCXhe1ZvOf2y2
	 sVCrGt9yvUWLIQXm/NiuWxPFEs29Y+Ryuh5ud3yUkkYQDO+4XxfHGWYV+Ec0vVponVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U5tCYa3F;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D114260A2601
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D114260A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U5tCYa3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008530; x=1826544530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=spBN9ESZM4zpf3Md0mIrHscimlRMtnVLbmsxFR9oYR4=;
  b=U5tCYa3FB01Zu7FmtsbeyxPjZmvPlA0UbCkljq5st9DIBcKxXUuyXF0Z
   TmdIWNCMwzP/v885nn/wlqjjWP+jHHpEJUvwE01SBrXHfr3RJnSyLxkfl
   bXAjB51cpBnWMtcxCCW9rSIbT1HI5858iAtDnGTcPIup+qeId/utxlesE
   /xVFF8CsYpRQn2HFD5vqZdaVKxChoW3weQlsxZDyB/YU+e8ZSpcFUe2yY
   LtD9M0AS3kiwU18I0e/yW5zwBKCzN89E5iVhXFpXt7aPGuB4AvpyNP68Z
   MFsnk2994TyQynLjaMtyURaVZRY0utKM5D0+4zL8ue/KId9Cme9ka8Ef5
   Q==;
X-CSE-ConnectionGUID: WmZONg4qTY6lFaWebsJsSw==
X-CSE-MsgGUID: uxvYjmZ0SommhIE+AqUikA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3738827"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3738827"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:47 -0800
X-CSE-ConnectionGUID: tvZnl3neRL6YId+z8CH3Yw==
X-CSE-MsgGUID: MpGAfOqtQIanzmfg0tuxSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="12076063"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:40 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 12435121C9E;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfhz-00000000tZl-2of6;
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
Subject: [PATCH v13 02/73] Revert "media: mc: Keep INTERNAL pad flags just for the kernel, for now"
Date: Wed, 18 Nov 2026 15:27:08 +0200
Message-ID: <20261118132819.213473-3-sakari.ailus@linux.intel.com>
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

This reverts commit 77a10651b2f23b6a56d27570fa9a870f8e977125.

The INTERNAL pads can now be made visible to the userspace so revert the
patch that made them kernel-only.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/uapi/linux/media.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
index 2da6ae4da003..80cfd12a43fc 100644
--- a/include/uapi/linux/media.h
+++ b/include/uapi/linux/media.h
@@ -208,13 +208,7 @@ struct media_entity_desc {
 #define MEDIA_PAD_FL_SINK			(1U << 0)
 #define MEDIA_PAD_FL_SOURCE			(1U << 1)
 #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
-#if defined(__KERNEL__)
-/*
- * Forgo INTERNAL pads until proper documentation and v4l2-compliance testing
- * are merged.
- */
 #define MEDIA_PAD_FL_INTERNAL			(1U << 3)
-#endif /* __KERNEL__ */
 
 struct media_pad_desc {
 	__u32 entity;		/* entity ID */
-- 
2.47.3

