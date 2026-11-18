Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008548;
	b=4Jg+BKEkgsQwzN2Tw6kfsQr1366mBwvG+xgwyYRBvih/cqbKcnMdKE9q9hP2Xwiks46w
	 gIsiaIBLTl9CjZzBZ0zszNN+QJigsTjVtrgpp/MOOHou1jSp35EzyeFiExYWiE5w9yoJ5
	 TgyytCVpFTmugq2nvS+IAzTCvnrwetX+hYCQ44Py2EeTFCR3JN0V3CmJBeGUi4mOLe1Hk
	 m83p3DeimsFvP/Z0q1Dg/pVnWD8FsUc637dGo4XI03ykDiVecdPMrKb7IJzgLX/cTIPuT
	 YYFeIHAK9R7BNjSrrNQFQdkpBbamerntyxCkmv8fcDeOO+EwX3xnZAbR12qK8zMCaxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008548;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Organization:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=heTsC2YrOlnVYmdYe+zlwJedD/oqssdoEtaEFGUR5u0=;
	b=XOrpYmN2lbclvXXpOOW7UXIeR++3vHGZhSODiBJ1y1dorNnWA4XKTXoe0kUNgqC05NjY
	 vLuHTq990824WLUdD6/KRtDVVq8aTOREWypTU9S6FO8tyHe07m70eRGckC6IUpQp66QpE
	 f4gyjYRl6BbRou9UgcuC3r/nPtu7dH1JSjTdzQTL8UMZWZdQv0V5eJNkGRiaMx0ydGTt6
	 yQTzJfriI0CH9Vo7jPQqyf1TSFHbTDF2KlnQJuxNmwJ/hl4kihi7phE60iROn8Wi49I++
	 dm0iZhKh4KEyQNUd2vimAFwuMHRnIiGFmMPf2Qy8mh7OfE7XhwG/tfsiRq60eO5hgOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZDAFyrYP;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B1260A2608
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 13:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6B1260A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZDAFyrYP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795008548; x=1826544548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KAWlF1NyGchoapTxeMQmEvUyzzziE3qWouDbCnZkwZ4=;
  b=ZDAFyrYPHQPcHO+/ci+OgWqhqrE+sDdmIjZaJAX4sEUfRs4WR4vgatbL
   +EdSkPQPurO0ml52wLNnD7I6Zi+m/YNSWQzRJdBVtwpZOyAcSke56ISpW
   vvxJjskoDbKbNDOVQMfkPFNkj+65cFuAv0C1lDDJmFy5bYM1Jc9PCiv6n
   G6PqCw4Wo7aGrA0s274crgvVWUcfHMJLsAq8P/UgFiv3kD4HT/75qu1Ff
   4K+3zBrhue2vLPLsPd65JgvgX66L5OhKMOYZoPJ5QfVXRTaQaujglKJnm
   2vb6RffEstUxv4o263XbY4qcroHkRYKQhbzzR0iFt9QjNxetsztGLFBAE
   w==;
X-CSE-ConnectionGUID: HNdBSHk4TSy8hNTxYvMvAQ==
X-CSE-MsgGUID: is8BLUGJT92dizyflwncSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3808919"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3808919"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:29:04 -0800
X-CSE-ConnectionGUID: QAmSUGMcQvifUNXjmANNqA==
X-CSE-MsgGUID: zzH9IPrxQVqiC4AH3+4w7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10376782"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.183])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 05:28:58 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9E7701230BF;
	Wed, 18 Nov 2026 15:28:31 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1xTfi0-00000000tc5-15V0;
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
Subject: [PATCH v13 38/73] media: v4l2-ctrl: Improve v4l2_ctrl_g_ctrl{,int64} documentation
Date: Wed, 18 Nov 2026 15:27:44 +0200
Message-ID: <20261118132819.213473-39-sakari.ailus@linux.intel.com>
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

Improve documentation of v4l2_ctrl_g_ctrl() and v4l2_ctrl_g_ctrl_int64()
by documenting what the function returns on error (i.e. 0).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-ctrls.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index cec9217d97ac..ac94bca52a3d 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -1111,6 +1111,8 @@ const s64 *v4l2_ctrl_get_int_menu(u32 id, u32 *len);
  * used from within the &v4l2_ctrl_ops functions.
  *
  * This function is for integer type controls only.
+ *
+ * Returns: the value of the control or 0 on error.
  */
 s32 v4l2_ctrl_g_ctrl(struct v4l2_ctrl *ctrl);
 
@@ -1162,6 +1164,8 @@ static inline int v4l2_ctrl_s_ctrl(struct v4l2_ctrl *ctrl, s32 val)
  * used from within the &v4l2_ctrl_ops functions.
  *
  * This function is for 64-bit integer type controls only.
+ *
+ * Returns: the value of the control or 0 on error.
  */
 s64 v4l2_ctrl_g_ctrl_int64(struct v4l2_ctrl *ctrl);
 
-- 
2.47.3

