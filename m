Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795811196;
	b=G0OxhBJ34821YxO3Qe6LW9+IZTGcC2gxWk2ewLr4+8Y/84mRswPED0cfXh/pNz5Ub6CR
	 D2CU2v+OvuFQrMgmHH0IaHVPFvHMaMgdbE1WwvLvgUbUQbg462ik49di+yy/pPNnGGxXf
	 imowKZIl8eM6Ci+eRKdj0KnW04L7eNyO8B7Hd+0anqwxUxdyMXO6ODVEo9PkVSCKDE/GB
	 BEKG2YRM/gSuHuMsA6gaDWC+8hOSyvBvlMWw2LmdJhlRGK6u33fff4SL6SU+YmowZ4ZB6
	 5JQKmcgVrHen/zxKmAmfbd1/1SECBnw9HucjIaHkFR5xGqVi4EiGmyJmnOEnKk/Zwbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811196;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZCZWqQ0lMucwJhS0m4gbpolmUfSCKEbqX9zkZqGK+Jc=;
	b=a2jPuUyGhTB6uUZtVNJ8Prm4n0O0bMrYBHzG9WBVg40OVZsQBj89mlJS1HT1kxSslKAt
	 24mlo30vOVpBCq8iSdGMWriLxe24G1HfrDuusRu6o6z8G4fy/2oQ+utNKPS4/2Xv2iyU2
	 ndzFTN37x8tdrL0biLP4d8NFf6zuIo819JqOuAqKAYRznXMCENd6EkoGv1kcdgk24ICNa
	 11Hyx9Gq5ZWmkfmxlFeytuBHd4WBMiMh3HdsWcPJDJX0MRgMbokqZWz5fC4uyZsI9oT5D
	 aJf3BmlDw64fZQpGi/R4Cbsqn+/0MObs4VdCwcBsNUlkdK02uYSzhwoIxsEEDs3jmzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XkcRGPVE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1D7606A321;
	Fri, 27 Nov 2026 20:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XkcRGPVE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795811196;
	b=qOfjnYItppYCun3laWtuSXoXrHrbEKOkMR/C9CqT5lrREPIGFc3qDhXbpZAWDwgkk357
	 IHhs+tYtAw3bmEKs3RyavfpYRFvpnXvp4FU8iG6WeoGc+e7NcufjwxmSKLvkhSuIEA9TB
	 E0CmcKyCF/3/+oQ/19fa91pUmFCwLYTCJQDbHoffBjhccqaB6w6oc5V6kipfCaDeOsdb+
	 Y6UfP//JRS1V3v8ek58vZUSJJblCW6lsQ2wpA38v15qg+sHpe2zI1dq34OeVSHIaKGg2E
	 ATxUVw8OgcNCWSzYPyLS5im+PuUa6VJ/BRbbsTfVsbmSmeWFxA86IVGSMZXG7CQiMVg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795811196;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZCZWqQ0lMucwJhS0m4gbpolmUfSCKEbqX9zkZqGK+Jc=;
	b=try/UCSagwdDNNevlookGSDdS4b/r719MhvYk/hao2dauvsREzUZmCIdS6c88SLdYf/m
	 DWLH5Rzhl6K3I1hApRzObAhJLZPVoobydbQQL4+Xuzr3eIWPPwyRVKCpKBtffhsB66iGg
	 TaFu6HNJ6oKjqNqZOQzbWBDh5tKuFPTMYTfQEjjty9jkZXR/zcGlPK4fEiGASjs/1aCeX
	 1UJJW1cbApOfNQebqB01K/z3UDxTWQ7AXTMved3uJZKaamU4hU88zIbcDfWS2DhBhUbxZ
	 soed73j8w4u7CXdNXtaq1FRVi229xg7G9+Q/iJQqQP4ZtMEzzAj635x1e12QkibX6sQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7735A1F00925;
	Fri, 27 Nov 2026 20:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795811196;
	bh=ZCZWqQ0lMucwJhS0m4gbpolmUfSCKEbqX9zkZqGK+Jc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XkcRGPVEO7G9VYtpReCrvAsSfuvMg2Q6AlpbQZPB2yZYzAGgglJqYJuUoB5U++MYx
	 cJGK+8NnwM2Wsy5rvN9cwCztht/CvmNivWrS5fCRcnSwtXd7+PWfbRJ91WFQbJQxqv
	 /3wWAee0YjrAcQNrb8sODHQ0V8qwFUzcYH/hveXMMyTXPq2cQLfu7dkBfylY825e2G
	 eCO59sLgwzZuI4MvGw2CQqN3AMhsJ0lV60UztxzGnmj2sAM0VsEnA8Rfs5D1ARZ9bq
	 spL0efWFg+x8NaNdv/ZzeEYmTcQntThpqO0gEN7/1Dd9YS2Tp9YGi6IbRTBxh8TM3I
	 fkqfJAMG0JAHA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C8E2E4DDB5;
	Fri, 27 Nov 2026 20:26:24 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 21:26:28 +0100
Subject: [PATCH 5/5] media: qcom: camss: csid-gen2: support plain 16-bit
 LSB RAW10 formats
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-camss-titan17x-fixes-v1-5-541ab39e5889@gmail.com>
References: <20261127-camss-titan17x-fixes-v1-0-541ab39e5889@gmail.com>
In-Reply-To: <20261127-camss-titan17x-fixes-v1-0-541ab39e5889@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Andrey Konovalov <andrey.konovalov@linaro.org>, 
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, 
 Milen Mitkov <quic_mmitkov@quicinc.com>, 
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795811183; l=2857;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=OWlbMqX8jFwDrOqApkzGhlVoUAPe5r3DiPbb52QR850=;
 b=hBozxEXAM7jf3vqt18NhHBdNwpzBWbqrHNSqcNsEdz+Zj443e+itwIY77vkCP21gWeHygp5Qm
 lBNSbo/njsODp8xkh0d0pjBkMlfEnRULe2CEPBHmAnZ88i8Z4rX3ik1
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

csid_src_pad_code() and vfe_formats_rdi_845 already expose
MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE and MEDIA_BUS_FMT_Y10_2X8_PADHI_LE
for unpacked 16-bit RAW10 capture, but formats_gen2[] omitted both
codes and __csid_configure_rdi_stream() unconditionally configured
DECODE_FORMAT_PAYLOAD_ONLY.

Add both PADHI_LE formats to formats_gen2[] and configure
DECODE_FORMAT_UNCOMPRESSED_10_BIT with PLAIN_FORMAT_PLAIN16 and
PLAIN_ALIGNMENT_LSB in __csid_configure_rdi_stream() when selected.

Fixes: 729fc005c8e2 ("media: qcom: camss: Split testgen, RDI and RX for CSID 170")
Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 11 +++++++++--
 drivers/media/platform/qcom/camss/camss-csid.c      | 14 ++++++++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 44c6c214f50be13dfbb8ba5d9e2e16964ded9ef6..de9e2a3191448c617a4c732edbba346bf9eb5673 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -282,8 +282,15 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, bool enable,
 	val = 1 << RDI_CFG0_BYTE_CNTR_EN;
 	val |= 1 << RDI_CFG0_FORMAT_MEASURE_EN;
 	val |= 1 << RDI_CFG0_TIMESTAMP_EN;
-	/* note: for non-RDI path, this should be format->decode_format */
-	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
+	if (input_format->code == MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE ||
+	    input_format->code == MEDIA_BUS_FMT_Y10_2X8_PADHI_LE) {
+		val |= format->decode_format << RDI_CFG0_DECODE_FORMAT;
+		val |= PLAIN_FORMAT_PLAIN16 << RDI_CFG0_PLAIN_FORMAT;
+		val |= PLAIN_ALIGNMENT_LSB << RDI_CFG0_PLAIN_ALIGNMENT;
+	} else {
+		/* note: for non-RDI path, this should be format->decode_format */
+		val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
+	}
 	val |= format->data_type << RDI_CFG0_DATA_TYPE;
 	val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
 	val |= dt_id << RDI_CFG0_DT_ID;
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 123c097ee54bfdcafbba02a6c01f51c545bf472e..12ffa438284806bc37fd150ca0e4c74d0706d2d1 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -424,6 +424,20 @@ static const struct csid_format_info formats_gen2[] = {
 		10,
 		1,
 	},
+	{
+		MEDIA_BUS_FMT_Y10_2X8_PADHI_LE,
+		MIPI_CSI2_DT_RAW10,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		16,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE,
+		MIPI_CSI2_DT_RAW10,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		16,
+		1,
+	},
 	{
 		MEDIA_BUS_FMT_SBGGR12_1X12,
 		MIPI_CSI2_DT_RAW12,

-- 
2.47.3


