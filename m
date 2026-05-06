Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975E630F927
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 13:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074562; cv=none; b=uKXoeBmSlCWLbJimKFAKkqlFFLJxRSALy2rLPoVB4ZTBbG/cF71WBKqlEwdlCvQ3LNykParkm9jnfznbmM2hhvEGdKgHyHxIh5vHwQkvtTcLDNr/cPohirI1g7MastrcaK6dLV86CBzQ9L+88oVPt5srRBz7zczPpcPmZ0geqUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074562; c=relaxed/simple;
	bh=TcHsG3NC8mOTWxO5bwu3ay0ag01DsMTRP2FrnpJ7nsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJWOyevO0rogjM8bWw9LQMbYk445bAtRPgzrCz/g+XO5CVWmLul83QDCucu+iy5t4qr0CVkLlCylFFTILJrsdgt9Jhj8DVr1O4YrTky4rnZuStjFw5uxxtjfHahemz02IvZmlIRgEQxSx8WGBJCZ3jk2CEN4S8vkMREc+Ei6K2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+iS+QzI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+iS+QzI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64134C2BCB8;
	Wed,  6 May 2026 13:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074562;
	bh=TcHsG3NC8mOTWxO5bwu3ay0ag01DsMTRP2FrnpJ7nsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e+iS+QzInNL1PRnyroWHCFG5l8hwjabRrMW8hbdO5jiU4U8sdqvY6q74Wy8tj+5k2
	 e4yTFlsNKuDfQU2qvy82+4lT4MFHQnwqQvT+WQYK0sMWzMKNVcDZ3x3lo/wdTVByXj
	 xkAz9xoQt9FLwS5Dyim8xg6WoRQ289e769/9l+urfT7D21PZDWOOuaGQvptdLXyLO2
	 cQH0HzvtQL2TpxkR6gMEhhfcxpcNv3RpkluyVedsWPvH2lzlWxzB51Z/kagG7KIP7y
	 rc/rwoIH9NcHnmkFYyO1Y7UYYiZ2E9q3w7h8Wly+wiY6+lK7ElQ/vfBfxlCXpDFibI
	 tWeRLJaDvJZoA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 2/4] Documentation: media: add CEC opcodes
Date: Wed,  6 May 2026 15:34:06 +0200
Message-ID: <5555f5cad990aa53b821fcdcb2c943383f3716b2.1778074448.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778074448.git.hverkuil+cisco@kernel.org>
References: <cover.1778074448.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the new opcodes to cec.h.rst.exceptions to avoid
documentation build failures.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../media/cec/cec.h.rst.exceptions            | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/userspace-api/media/cec/cec.h.rst.exceptions b/Documentation/userspace-api/media/cec/cec.h.rst.exceptions
index 65e8be062bdb..5d6f7747c023 100644
--- a/Documentation/userspace-api/media/cec/cec.h.rst.exceptions
+++ b/Documentation/userspace-api/media/cec/cec.h.rst.exceptions
@@ -524,6 +524,29 @@ ignore define CEC_OP_AUD_OUT_COMPENSATED_DELAY
 ignore define CEC_OP_AUD_OUT_COMPENSATED_NO_DELAY
 ignore define CEC_OP_AUD_OUT_COMPENSATED_PARTIAL_DELAY
 
+ignore define CEC_MSG_REQUEST_LIP_SUPPORT
+ignore define CEC_MSG_REPORT_LIP_SUPPORT
+ignore define CEC_MSG_REQUEST_AUDIO_AND_VIDEO_LATENCY
+
+ignore define CEC_OP_HDR_FORMAT_GAMMA_SDR
+ignore define CEC_OP_HDR_FORMAT_GAMMA_HDR
+ignore define CEC_OP_HDR_FORMAT_PQ
+ignore define CEC_OP_HDR_FORMAT_HLG
+ignore define CEC_OP_HDR_FORMAT_DYNAMIC_HDR_TYPE_1
+ignore define CEC_OP_HDR_FORMAT_DYNAMIC_HDR_TYPE_2
+ignore define CEC_OP_HDR_FORMAT_DYNAMIC_HDR_TYPE_4
+ignore define CEC_OP_HDR_FORMAT_DV_SINK_LED
+ignore define CEC_OP_HDR_FORMAT_DV_SOURCE_LED
+ignore define CEC_OP_HDR_FORMAT_HDR10PLUS
+ignore define CEC_OP_HDR_FORMAT_ETSI_TS_103_433
+
+ignore define CEC_MSG_REPORT_AUDIO_AND_VIDEO_LATENCY
+ignore define CEC_MSG_REQUEST_AUDIO_LATENCY
+ignore define CEC_MSG_REPORT_AUDIO_LATENCY
+ignore define CEC_MSG_REQUEST_VIDEO_LATENCY
+ignore define CEC_MSG_REPORT_VIDEO_LATENCY
+ignore define CEC_MSG_UPDATE_SQID
+
 ignore define CEC_MSG_CDC_MESSAGE
 
 ignore define CEC_MSG_CDC_HEC_INQUIRE_STATE
-- 
2.53.0

