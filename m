Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF33C3016E0
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779115330; cv=none; b=UZEqT1Rr+4XyzMdGqI1l6Zvmfk7An0UgkVDKYL+fOBm0IRI9zTqIySwOFTjyWaDUyKs3z2Fk/wzBLoRh//zf0afyTEM14rk9Cwc/Uqv3KCjGnSm00Dauw/rDYdWj9bb/Fpdl3sg/IIcrdQbOL4H7k0dcPSq+BqFvkaUd1n2RyhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779115330; c=relaxed/simple;
	bh=Cy1kJ4rFopfeY8WoIvwuo1icLY/akZbENU7TB1mXsD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hudIzem4rsgBFshFmpBNnUplui5iwJ87l40+ADuQ107bBZHesrZZDFD1wKmU1K0GMWJn22r1scb8Ou60CRxOSm4/B/n3dhmoI//eNVebLWQEvkTWwfPNzqGx0w5VoeLQNNBRU6SV/3zHCNusA7hoo1LWC48rPYio6/q6iFVWUeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VtOuIhiE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VtOuIhiE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF57C2BCB7;
	Mon, 18 May 2026 14:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779115329;
	bh=Cy1kJ4rFopfeY8WoIvwuo1icLY/akZbENU7TB1mXsD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VtOuIhiEcItRryalv5xmv6hIuCaRSPMCV7n0ePsJ6kPPbYEWYvEtdBfpFAc20E5d3
	 sfs2f3ETyoEF01WCObW1L1kcgc7u/xmn/YcwslEveIHL74KOVQo/MlxWlXje6xlKq/
	 zTSBTanucd3f/iPcStAPCMNw9i9niZrR7+Qf62Z/4bq5H2PickEKZQg5Xi2/reVWkE
	 21s7VJU3nMmXJB8QwKjCDy9hcmyFlnofL08ZUPMT3U1s8F3IkeEi3Gk6MkeVLwvV5V
	 r9KcHgYASFL1ngeT6JLNOml1sIZVtzpnaUTPhs5urRvqEbl/9156mwwDJwZ1Fyt/u+
	 kca1aNrMadFXw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv2 3/4] media: cec: core: add LIP support
Date: Mon, 18 May 2026 16:40:34 +0200
Message-ID: <9fb27f4a2133cf46b8e0fc126c2d1ef8b1bc30e1.1779115235.git.hverkuil+cisco@kernel.org>
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

Add support for the new CEC LIP opcodes.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/cec/core/cec-adap.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 8f7244ac1d43..a90cb84a4b4d 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1098,6 +1098,15 @@ static const u8 cec_msg_size[256] = {
 	[CEC_MSG_REQUEST_CURRENT_LATENCY] = 4 | BCAST,
 	[CEC_MSG_REPORT_CURRENT_LATENCY] = 6 | BCAST,
 	[CEC_MSG_CDC_MESSAGE] = 2 | BCAST,
+	[CEC_MSG_REQUEST_LIP_SUPPORT] = 4 | DIRECTED,
+	[CEC_MSG_REPORT_LIP_SUPPORT] = 6 | DIRECTED,
+	[CEC_MSG_REQUEST_AUDIO_AND_VIDEO_LATENCY] = 6 | DIRECTED,
+	[CEC_MSG_REPORT_AUDIO_AND_VIDEO_LATENCY] = 6 | DIRECTED,
+	[CEC_MSG_REQUEST_AUDIO_LATENCY] = 3 | DIRECTED,
+	[CEC_MSG_REPORT_AUDIO_LATENCY] = 4 | DIRECTED,
+	[CEC_MSG_REQUEST_VIDEO_LATENCY] = 5 | DIRECTED,
+	[CEC_MSG_REPORT_VIDEO_LATENCY] = 4 | DIRECTED,
+	[CEC_MSG_UPDATE_SQID] = 6 | DIRECTED,
 };
 
 /* Called by the CEC adapter if a message is received */
-- 
2.53.0

