Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0294746A5
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 12:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786105539; cv=none; b=IX60FCqC7aJnp5lgrAS5oeX/2N7EUrGb+/a+6vYOZbrrS9qCQBLLYXwC9AJlELDHuxiasJEVHWC8JYNPOEh/PuMNjnZhkvPYrPE8Mf4SWBXcV8eFBMYOqak8DYQQOI+ZS1/QfmDw3KUZPrqZPNQ72HvkPv71bJb05RE3+7AAif0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786105539; c=relaxed/simple;
	bh=5FLzsSswMIuEuyRlzgLNMAZv2dhBtm56DJOqVRiM9xI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gqTWsws/qzlKCUTLO5OC+8sAhXjptnGezfE3Qr+yOm1m8irqdBF77CcGt0FwAbrzS5+k7EPvtaHLwU5D8T5qHqQYxpo79slIrwKJlhTaimPR1aA4A4Jx3GDRoYoLep18uVco31U38Y+jrBxeTFZYphG2F3UeVlFQzgVKggkPDaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4LEi/4v; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4LEi/4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786105534; x=1817641534;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5FLzsSswMIuEuyRlzgLNMAZv2dhBtm56DJOqVRiM9xI=;
  b=I4LEi/4vKH/YClU0ogN3T9bVgTl86SPFBYSuwF0TPeE/EMVy6YhaW3JP
   /e/oFyW8MCQ1E7GPjugXUBtxlgXEv30Cfn/oAqqfRvB1S13Day/7zaDDc
   44VosC3e/rlck6Rs+oFYyRZHyu9FNfws8VGlNmn2kxyHCAJ18YpyFLtyi
   V5t3xqQA0BEaEK/UzYknh3oPkFssNl15f5x1s+hnxfxKqlFb1ZIYaFmLn
   HFRqZ792QtybnPzXc9PXehkOh+B/z/KWXyqEYQtLf4vPWaAzJO+oM7TmM
   JD3GH4jNNb4DfGmCPhooSqOkxD3o3yfUhiBL2QOeJ9XEtByxN/Xg9FkQC
   A==;
X-CSE-ConnectionGUID: /ULFThMuRReoTxI+Kc/wog==
X-CSE-MsgGUID: F/trfdpORn66KC8pQ1Ewwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90592036"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90592036"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:37 -0700
X-CSE-ConnectionGUID: y1dLrt++Txy+il5F5Qw6NQ==
X-CSE-MsgGUID: m1KYovFgT86WFr5HGK4j2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259779684"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.179])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:24:31 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B1128121CEC;
	Fri, 07 Aug 2026 15:24:20 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wsJcP-00000000BwG-3XG8;
	Fri, 07 Aug 2026 15:24:09 +0300
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
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v7 11/14] media: v4l2-subdev: Add v4l2_subdev_call_ci_state_{active,try}
Date: Fri,  7 Aug 2026 15:24:06 +0300
Message-ID: <20260807122409.45807-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add v4l2_subdev_call_ci_state_active(), and
v4l2_subdev_call_ci_state_try() to call sub-device pad ops that
take struct v4l2_subdev_client_info pointer as an argument. These ops
cannot be called using v4l2_subdev_call_state_active() or
v4l2_subdev_call_state_try() as the client_info argument precedes the
state argument.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-subdev.h | 95 +++++++++++++++++++++++++++++--------
 1 file changed, 74 insertions(+), 21 deletions(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index b8874eeec2e5..307655ee25e0 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1964,6 +1964,22 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
 		__result;						\
 	})
 
+#define __v4l2_subdev_call_drop_fourth(first, second, third, fourth, rest...) \
+	v4l2_subdev_call(first, second, third, ##rest)
+
+#define __v4l2_subdev_call_state_active(call, sd, o, f, args...) \
+	({								\
+		int __result;						\
+		struct v4l2_subdev_state *state;			\
+		state = v4l2_subdev_get_unlocked_active_state(sd);	\
+		if (state)						\
+			v4l2_subdev_lock_state(state);			\
+		__result = call(sd, o, f, NULL, state, ##args);		\
+		if (state)						\
+			v4l2_subdev_unlock_state(state);		\
+		__result;						\
+	})
+
 /**
  * v4l2_subdev_call_state_active - call an operation of a v4l2_subdev which
  *				   takes state as a parameter, passing the
@@ -1982,22 +1998,13 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
  * active state, lock it before calling the op and unlock it after the call.
  */
 #define v4l2_subdev_call_state_active(sd, o, f, args...)		\
-	({								\
-		int __result;						\
-		struct v4l2_subdev_state *state;			\
-		state = v4l2_subdev_get_unlocked_active_state(sd);	\
-		if (state)						\
-			v4l2_subdev_lock_state(state);			\
-		__result = v4l2_subdev_call(sd, o, f, state, ##args);	\
-		if (state)						\
-			v4l2_subdev_unlock_state(state);		\
-		__result;						\
-	})
+	__v4l2_subdev_call_state_active(__v4l2_subdev_call_drop_fourth,	\
+					sd, o, f, ##args)
 
 /**
- * v4l2_subdev_call_state_try - call an operation of a v4l2_subdev which
- *				takes state as a parameter, passing the
- *				subdev a newly allocated try state.
+ * v4l2_subdev_call_ci_state_active - call an operation of a v4l2_subdev which
+ *				      takes state as a parameter, passing the
+ *				      subdev its active state.
  *
  * @sd: pointer to the &struct v4l2_subdev
  * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
@@ -2007,13 +2014,14 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
  *     each element at &struct v4l2_subdev_ops.
  * @args: arguments for @f.
  *
- * This is similar to v4l2_subdev_call_state_active(), except that as this
- * version allocates a new state, this is only usable for
- * V4L2_SUBDEV_FORMAT_TRY use cases.
- *
- * Note: only legacy non-MC drivers may need this macro.
+ * This macro is just as v4l2_subdev_call_state_active(), with the exception
+ * that it passes NULL as the client info to sub-device ops that need it
+ * (currently pad ops set_fmt, get_selection and set_selection).
  */
-#define v4l2_subdev_call_state_try(sd, o, f, args...)                         \
+#define v4l2_subdev_call_ci_state_active(sd, o, f, args...)		\
+	__v4l2_subdev_call_state_active(v4l2_subdev_call, sd, o, f, ##args)
+
+#define __v4l2_subdev_call_state_try(call, sd, o, f, args...)		      \
 	({                                                                    \
 		int __result;                                                 \
 		static struct lock_class_key __key;                           \
@@ -2025,13 +2033,58 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
 			__result = PTR_ERR(state);                            \
 		} else {                                                      \
 			v4l2_subdev_lock_state(state);                        \
-			__result = v4l2_subdev_call(sd, o, f, state, ##args); \
+			__result = call(sd, o, f, NULL, state, ##args);	      \
 			v4l2_subdev_unlock_state(state);                      \
 			__v4l2_subdev_state_free(state);                      \
 		}                                                             \
 		__result;                                                     \
 	})
 
+/**
+ * v4l2_subdev_call_state_try - call an operation of a v4l2_subdev which
+ *				takes state as a parameter, passing the
+ *				subdev a newly allocated try state.
+ *
+ * @sd: pointer to the &struct v4l2_subdev
+ * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
+ *     Each element there groups a set of callbacks functions.
+ * @f: callback function to be called.
+ *     The callback functions are defined in groups, according to
+ *     each element at &struct v4l2_subdev_ops.
+ * @args: arguments for @f.
+ *
+ * This is similar to v4l2_subdev_call_state_active(), except that as this
+ * version allocates a new state, this is only usable for
+ * V4L2_SUBDEV_FORMAT_TRY use cases.
+ *
+ * Note: only legacy non-MC drivers may need this macro.
+ */
+#define v4l2_subdev_call_state_try(sd, o, f, args...)			      \
+	__v4l2_subdev_call_state_try(__v4l2_subdev_call_drop_fourth, sd, o, f, \
+				     ##args);
+
+/**
+ * v4l2_subdev_call_ci_state_try - call an operation of a v4l2_subdev which
+ *				   takes state as a parameter, passing the
+ *				   subdev a newly allocated try state.
+ *
+ * @sd: pointer to the &struct v4l2_subdev
+ * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
+ *     Each element there groups a set of callbacks functions.
+ * @f: callback function to be called.
+ *     The callback functions are defined in groups, according to
+ *     each element at &struct v4l2_subdev_ops.
+ * @args: arguments for @f.
+ *
+ * This is similar to v4l2_subdev_call_state_try(), with the exception
+ * that it passes NULL as the client info to sub-device ops that need it
+ * (currently pad ops set_fmt, get_selection and set_selection).
+ *
+ * Note: only legacy non-MC drivers may need this macro.
+ */
+#define v4l2_subdev_call_ci_state_try(sd, o, f, args...)		     \
+	__v4l2_subdev_call_state_try(v4l2_subdev_call, sd, o, f, ##args);
+
 /**
  * v4l2_subdev_has_op - Checks if a subdev defines a certain operation.
  *
-- 
2.47.3

