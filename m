Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A52C36F429
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 14:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779115329; cv=none; b=RNdSIPhMnJ5NGrRAO6cCGrrAjf6Bjwf2OqLP+nl2lB9zEdb77YaVg/cehzFqy0PBYuKPF0SCdUg8dTXykWd3PChjMh3xtJRU5UM1rSnm7fgAZJzkaZxB1D/rNIbofAtzApMDtmzlB8rrSGUmVOX13Ko23rgN2L4+AqoCJd0LPC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779115329; c=relaxed/simple;
	bh=TcHsG3NC8mOTWxO5bwu3ay0ag01DsMTRP2FrnpJ7nsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sa22E9JHpW25jWnu4GCWm73M5TCh56VohHZrqwDFsWh9IYHOsnVcIaOmLUtumIap3Wm8nNybxr9gC1J1J+D3JI7e5HKmxTgZVs/K7KSxyRGZJcVMDvk1WzegE+N7Eae3kVSGfekzxZM1HzzXoxWTHtT5M3fxFfaE2HeoS0kl6AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdHvaZz7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdHvaZz7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC72DC2BCB8;
	Mon, 18 May 2026 14:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779115328;
	bh=TcHsG3NC8mOTWxO5bwu3ay0ag01DsMTRP2FrnpJ7nsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hdHvaZz77nlFtJ4GK00IJ69aJdNa7hCxe8HPwZfBxqhaLpE/xgCsof049ZogpGz4J
	 0EHfvI7x/qZIfc7JWS+0pUYdLAa/ZvDbiq8TndP4UuQpxzI03ubQ2xi/4IldSmiSoh
	 WvPUTbdT7Jg3xSpVrx9AHsaOwL5GSu80X31s1JJaZjsPOOXvaR9LrUsXtZxn+g/23s
	 6D27KxPpWTUOdAzIYaB7TglGReo6/PNUfud8w0iNPUjqqcb/WZtvuHKt4xdN0bnEA8
	 hhkKAs2Jhr4Xti/HibPprmHJA8UbCxkP0b+BcOWAwJOPZtst6wGlIPBV/mLcRJ4S/a
	 DNIxjJ4kiJRpQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 2/4] Documentation: media: add CEC opcodes
Date: Mon, 18 May 2026 16:40:33 +0200
Message-ID: <afe5d8f6cdf2dc030011eaf9acd8f68847d1b8cf.1779115235.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779115235.git.hverkuil+cisco@kernel.org>
References: <cover.1779115235.git.hverkuil+cisco@kernel.org>
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

