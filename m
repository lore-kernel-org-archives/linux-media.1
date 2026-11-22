Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795324409;
	b=T9Hw3VrJ5hfnBJb620Ksa65mwXgjMtoGFF4o9ET65DjfWzhcsWU9haExH42rumuvIjkU
	 yuCIHMLsKFByO9j/Z8qfLwD5jOnN8JOsYQHgt1wjdqXeKpK6GcciUd7wO7nV0kLBu3A0d
	 fUAzQC/NwVo4+eGQgd4nbEwtxv7WPPSKGNcRh0A00TQ+8lAm0Jk/wSmgQTUGvydJYGktc
	 7t/mOk0P/SfAK2uJj410ReLzZlS2IIzApBKbpAtPNfPnyvOIJYHAGd1g5Si4DCoLRfOhG
	 i1rP3a/ayjT+/Il7fyt4C1PBpExIzv31C0cn3Y2sFtIRaOkdmFVT6gvPomWUEhwMl3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795324409;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zLnW8Sv4fuv8/fmfruOed5E1Xmdd2oj1KmKOAqoa5dA=;
	b=3HNIl7koNvMETW/HGG2m8QB+f3s3FiY09v30JVAuPeJv364uvlNrnieZojNCsx4dzUnv
	 gmXrUPEW2/PlOvsm3huC3b6xTrAj+5od56wArQCpDSZt9eHqJrUcUp/qhGdlyW0PoqIwi
	 9YCoA3yp/00NY68H2Yn5ZC42Cxz8Sf1P8ekN/UvneGARo4QTX1zQxRvSSk3FqMmgDy8+b
	 v/0mbulnKSw0j/k9dEPidNni7exO1c7AlIct8OetUY3TimlUR3Eh8mRyXebjNgfu5X6o8
	 EPTToq0xQTEC3rf0PKGegkxb5n/7afNILXetiC91UiRYyDQ6EFSlEvdfIQbcxD5ys/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BabuUO63;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B622606A33C;
	Sun, 22 Nov 2026 05:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BabuUO63
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795324409;
	b=GLP9TQewXNMbI9PU8sGAjJRlkga1/y8SnRLWmrumrNXd/JicNYIP05xG73LKFmSNapKW
	 4HpoqF/r/uNN95XHkZ7U7ADiA3hlS/cF/fvIBrj3mWgn0OrHUtxXIcYQGb9Wo62Z+Gl4R
	 VogayZKmftjMwpazt3Y0tt/4OTEV5mDcG0DwOG7broxkEf0XAZCI+glfYWb8LHhvO7ocl
	 1WCOETAdvi2RKJ0UiqzKXSGyJYftdaDEznRj4cw9PSQ82giYOAIFeDMS5rjR+a8CUBuRw
	 j5hbDzQ972PaQYe3cUeKNjSZbyB8ioP0IirpTqSo/dB856zlx+LSElP7SnGlqbO2C8g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795324409;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zLnW8Sv4fuv8/fmfruOed5E1Xmdd2oj1KmKOAqoa5dA=;
	b=VXL//ZSmXGtsscxXpjffLxQ0ck9p5hLNO1YfhomYUzz4nsFWvyrOmKnUVCjroUTJQtOj
	 k0mYQinckshL5Hc8uKGw6n9I/NGEXAPy71laKMqmxQlf4mQHobtkpeMjVp93ywf5al/kH
	 G3lSTCc5XW6RLpSPM4JA3/oeGkK1UsiR9bz5sVyihhskVK4LHyeHvb74zca/n30qQQ2lC
	 cvjVbcnuFLFWZGzoKo4HtjVDYr4sy7UK1oI+8BSrpehTcqi1ViP5oXf7DD55alnXCLvMc
	 tytt9q5rXaHnF3U9lxnBIGlBpRMNWQFIzhPH4RLQaaEL3AoM8IFC4TQRwLB83e/r6Hg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 379DF1F000D3;
	Sun, 22 Nov 2026 05:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795324409;
	bh=zLnW8Sv4fuv8/fmfruOed5E1Xmdd2oj1KmKOAqoa5dA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BabuUO63wnixyLEYmkZN178LkiF695H1O0MxrpzUh7NqEZgLJIEc7dP/ymBQiqNX4
	 kGleRtyF6PdMwiHleMxfPAUPetHRYcXKusbDXaGKvdrRKkr2imbDw1H1+XCctEK1w0
	 P/iqvO56k7YRouLWxFgUojTVJ7+3hF5nS+YtiWbFdzCr9gvWN9k5LyJm1Siyi8Vz8J
	 LyC4fU5B49M/MBNf3Zig49noZHUmVWnepf9EwpWkUgdnhYlbtGCjxeAHCX+4n6Eqw0
	 6+opdZMTGxQtbL0CI+roxThmGrOnSm4Xe0YfyrfM5piJM3e20nXpxRrM16zeGcuijp
	 auDyKaiQ+878Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BCC2D4BF47;
	Sun, 22 Nov 2026 05:13:27 +0000 (UTC)
From: EMCP333 via B4 Relay <devnull+emcp.enser.io@kernel.org>
Date: Sun, 22 Nov 2026 05:13:25 +0000
Subject: [PATCH 2/3] media: qcom: camss: Vote interconnect bandwidth on
 SDM845
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
Message-Id: <20261122-b4-camss-sdm845-icc-v1-2-0671ef770fd0@enser.io>
References: <20261122-b4-camss-sdm845-icc-v1-0-0671ef770fd0@enser.io>
In-Reply-To: <20261122-b4-camss-sdm845-icc-v1-0-0671ef770fd0@enser.io>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 EMCP333 <emcp@enser.io>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795324405; l=2685;
 i=emcp@enser.io; s=ultron; h=from:subject:message-id;
 bh=OGRKEtq1Lkj7N/ZDmYMtE6pVd6l+uYydxBq4WiI271o=;
 b=p+n2DY76jLDaVZyJPwPtm0f/fxI+Q8073fq8RLCO8U6oOuB1lTuWNsAkBXSibxjg5SSATESrM
 at7RsKh8GjICCJoLdNsaXwssozuSZakY2E4SfTBQeXByFW7UfvgUiRQ
X-Developer-Key: i=emcp@enser.io; a=ed25519;
 pk=5sG48Lul+Vn7OzXu3VZrCWk5uvEFPYMXYnAV0TZR/tY=
X-Endpoint-Received: by B4 Relay for emcp@enser.io/ultron with auth_id=1598
X-Original-From: EMCP333 <emcp@enser.io>
Reply-To: emcp@enser.io
Content-Transfer-Encoding: 7bit

From: EMCP333 <emcp@enser.io>

sdm845_resources has no icc_res, so on SDM845 CAMSS never votes for
memory bandwidth: while streaming, the camnoc HF and SF masters show no
votes in interconnect_summary. They get whatever another client holds
on the same mmss_noc to mem_noc path, in practice the display, and with
the display off capture stalls.

On a OnePlus 6T (imx519, 1920x1080 RAW10 into the simple pipeline), ten
100-frame captures each:

  display on:   10 of 10 runs complete
  display off:   2 of 10 complete, 8 stall at 0-1 frames

Add a table with the sm8250 values for the AHB, HF and SF paths, plus
the second HF port that SDM845 splits its two full VFEs across. As on
the other SoCs, the votes are applied at runtime resume and dropped at
runtime suspend. A device tree without the interconnects gets no votes,
as before.

Tested on a OnePlus 6T with this change on the postmarketOS sdm845
kernel (6.18): with the display off, 10 of 10 1080p captures of 100
frames complete, and the camnoc HF ports vote 2 GB/s while streaming
and nothing when idle.

The code and this changelog were prepared with the help of an AI coding
assistant. The submitter has reviewed both and takes responsibility for
them.

Signed-off-by: EMCP333 <emcp@enser.io>
---
 drivers/media/platform/qcom/camss/camss.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f8e5cf9f3f..0ed497b7b6 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2219,6 +2219,30 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	},
 };
 
+static const struct resources_icc icc_res_845[] = {
+	/* Same values as sm8250, plus the second HF port SDM845 splits its VFEs across */
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 38400,
+		.icc_bw_tbl.peak = 76800,
+	},
+	{
+		.name = "hf_0",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "hf_1",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "sf_mnoc",
+		.icc_bw_tbl.avg = 0,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 static const struct resources_icc icc_res_sm8250[] = {
 	{
 		.name = "cam_ahb",
@@ -5690,6 +5714,8 @@ static const struct camss_resources sdm845_resources = {
 	.csiphy_res = csiphy_res_845,
 	.csid_res = csid_res_845,
 	.vfe_res = vfe_res_845,
+	.icc_res = icc_res_845,
+	.icc_path_num = ARRAY_SIZE(icc_res_845),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_845),
 	.csid_num = ARRAY_SIZE(csid_res_845),
 	.vfe_num = ARRAY_SIZE(vfe_res_845),

-- 
2.47.3


