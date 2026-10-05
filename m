Received: from outbound.ci.icloud.com (ci-2003h-snip4-1.eps.apple.com [57.103.91.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B95327C09
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 06:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.91.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183359; cv=none; b=XyfsF1IdNFqw46yc/OeZW9fFP0KxsGNbGUXgwXTpPJ5+2ORen4BT2SeSR1nV1nFedsEz0sJzANK0p3kbvdEinQYQdHVXd9iI5gpFNRq4+SH4qU1uT1O1Jvr5WVCEkGzNHeOLkDuSvsZsVb5nYHgTJMcmXfYv+xuJeMp+vviH8ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183359; c=relaxed/simple;
	bh=Pxj/V4ni3Q/M5jJkSyX/YAN5m1XvqcBOIHVIjjUnQBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CsNIT7lukqM4rwl9zRryCugGrLqkzB12/V6I6h6v6PVJFJTqGr/ilrpiRZ1MOU7uo5KO7WTgFip3b5J3EkoEyNS94rGu/6ZYuzIJGkeSPfW71W2wPFMcfy4roPtBR/isIDfUH0rbNLK4UJ25sKv1CoozMiNQGVYiwXKjE9Iic/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pinon1.fr; spf=pass smtp.mailfrom=pinon1.fr; dkim=pass (2048-bit key) header.d=pinon1.fr header.i=@pinon1.fr header.b=T4FfSPZk; arc=none smtp.client-ip=57.103.91.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pinon1.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinon1.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinon1.fr header.i=@pinon1.fr header.b="T4FfSPZk"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-1 (Postfix) with ESMTPS id 43B1E18000BA;
	Mon, 05 Oct 2026 06:55:52 +0000 (UTC)
X-ICL-RepId: 01a10ad8-f4c6-7881-975a-14625d5b6abd
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQBKHVwPXxxBDUwdXAZdEhVdRUMEUhlAFXkIWgNYBQNeXwoTC1NWQhlXF11cGQ1AUEsbDlgXA1ccVkVcGEMJXQVXHB0OXkVbE1UXRgkZCF0dGQhHHwowA0IOVgNDB0UALRkcV1BHAlwfV0kdC0VLXxldRQ9fB1kEQQlIBl0BXgdDDFYCWwZYBV0IVUMEUhlAFXkIWgNYBQNeXwoNTUMSQhUEG0YeQwRfL10XXgxeBQ==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pinon1.fr; s=sig1; t=1791183354; x=1793775354; bh=MfM1eZ9CNmghV1BDWoFw01LZ1/BzzVRW5NNfDwJcO1M=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=T4FfSPZkoLrbpozQX2IpJZWTPcM596xWk9Z7Kq9t98LowkpA+saKnYfCjilqw1z3L/zaVs5suOHPfyPzEt+2PZibF17la4pxLEfWMZE6hTfyIJo++y4NjLZo1bHcX10Fy559Jft/ARR3ft77vEAWvplUng2nRGi8e4wI9wkbEC93YRkQSj4hiOVdjWOsxLn1Boidu3cLbEJuxgi2GfvtjvH0GZqVN5AP48IG3VW2eH10xDxY0Y21s4kVXLlTAEP3IPZNznKj5Ni39LpMErrM4pUrDm+OzxiBFKVXbGphaMmG2uirp1N46dXDwYQ7E9Rel/pRW/Gxp+wNusp8eAlusw==
mail-alias-created-date: 1575045973000
Received: from toolbx (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-1 (Postfix) with ESMTPSA id 96843180017A;
	Mon, 05 Oct 2026 06:55:49 +0000 (UTC)
From: Pierre Pinon <pierre@pinon1.fr>
To: linux-media@vger.kernel.org
Cc: Jimmy Su <jimmy.su@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Oleg Keri <okerixx@gmail.com>,
	Pierre Pinon <pierre@pinon1.fr>
Subject: [PATCH] media: i2c: ov08x40: Default to a mode matching the lane count
Date: Mon,  5 Oct 2026 08:55:35 +0200
Message-ID: <20261005065535.16137-1-pierre@pinon1.fr>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pNnW8L76kRioaEC1K2k2fWaWoeyP0hpq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfX1MXH4NK29e0z
 pOy91QKrh0Qih3NbK2qyJ0UZFdktDtyfJXOIWXnEeX1bjzWDRanjHtfGuWxU6LFLuWMHVF6FthJ
 LFgRU+ZwB2Iw9GG3NEqD+jxiiwBuhftm1O+IgEef2nvU7ZrFwf5QUN3qWRg9Uq8w2VESYfnjlNj
 ZZChxO8WFRp/ag2v6rnkAt5XVto140qXWOzzvFnxW0AwaIfwzbSYeJj4CoDN5Wng4YorGSOF4Nf
 gofvFZd9ct/J5Hev0gUOlIcvFGwy+HpLZQ2p5dk1rAoj5PiEwRBhid0M6gzvnrvTB0adfCpVf2p
 xGhM0hUy7ttIRjo6ceXs2r4zEpi21m7YZ51vMju8VVxHswQB4de7uW3Hr64me4=
X-Authority-Info-Out: v=2.4 cv=W8A1lBWk c=1 sm=1 tr=0 ts=6ac349f9
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=A7cOQzBelK9jzjY8NncA:9
X-Proofpoint-GUID: pNnW8L76kRioaEC1K2k2fWaWoeyP0hpq
X-JNJ: AAAAAAABTihzwFHYnNXnRCQzqZIV8XSEHAOUDYByqyU7VkOs7dr+6W+2V+pvbjz5ZYwtjWgGDJ0cxXHjhUdeD9AE3bL9e7+UpIzFtyXboKe6Tts0q7g/KTltsRcZ161Fu9b3CgsYOo7RJjSjAIEbH6z2CLWaejmD+/4lhXftW9HC2ZIYjMCbq2pbKDjsV9Xuc03JT6o9tWvS24rTArgzQt2HrgZU9UotUDDYux8VAMWXItcmqkg2KzNLipeb+TkBMnarE/+CXO4LhpIndTDmhiff9JzG3FrzMuWjWcdJd5eij4k+eYBuatvSLQOjcuEvisYDg2CwAL6/WfLlPepT9cRWpXL3Npw1ZCESdwmEr+r8sPSNzl6W64CKRJPJ5fS4kZzpTwJ9YF1LUqVAXJn8Q1HLQAwzEroCfOce8sJ3CUi3QzqguuEf3561HwPh/aAMzx9OT0NWalkGooWirHxPxRjmeVWNvsoEjV84oWUGTmZmp2ugv/wmu3bxGeLeZQpbokwu+elBuTmAjp93cMeT4QE0X6yENRnXmTpzqwbvuEBzSjwoXgcAoUSbEihz/l1ULPfp9GezYUB7DCw1819eozV4KCl6pMA+7RBeA1acwM2TN/wYzVp8OrvTEKl+Q3s1Lx8/jyVIPVHVvBDXuwf3RJxepKSpuBOVlP8da2Dmio4yeRSigWLsR9Pm8eJdOguzYYcRoBVZpfkeIIiISq7Ufw7v4QrLdy6D002Vv7kO2MC8Ey5N1ooXt3lXkQFjiTbtU2YqjjE7OCNfiK55T/YAroK4vLy9LutApRhbFD4KakT6GzliSopcelpXR+uBeX7vVaGgx99T7nPgOKyMj3BvHssugCvatSy2kUSxX8/SbAna4G0aXkv6mVmAlDxRvwQjRZtNtHG5gNqXHVif/TPNr3Wr2g4Oo6k4PUrC2RQHq/a2kknWNBJuIalFy+0Bp6Z5XAvbmOJzQtqBoETLZiOtBWK7OpXDcmP
 FGam6BKIgTBkOEyiTFMn/hkAd8k4L8T/hM8c/u+229o5X8s4/oCQvarq7I1EPV7QIGZXTZtWEvCoyTmwsXwq9CQaLBhgZE1YL6+Et8NRiuRdnD5Dt76mZxtb20kYyb07rVGGme/f/O53Z+oB8G7GoVwBlAvi5Jege6W2CZEqnxiZgQJFzRS8N6KHLXJpBkHA0x9OW2YBQNG4tb1h1rzWDVucVN+H+cT4LxKKdXIDFKWS2xe0LozHU9QXP7UZckyvnm9+PayxGH5PKb0yMnqUxhg==

On 2-lane boards, probe and open() default to 3856x2416, a 4-lane only
mode. Use the largest mode supported by the configured number of lanes.

Signed-off-by: Pierre Pinon <pierre@pinon1.fr>
---
  This follows up on the review of the get_selection v2:
  https://lore.kernel.org/linux-media/20261002094913.28722-1-pierre@pinon1.fr/

 drivers/media/i2c/ov08x40.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 6de0c17e6..af15fe67f 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1541,10 +1541,24 @@ static int ov08x40_write_reg_list(struct ov08x40 *ov08x,
 	return ov08x40_write_regs(ov08x, r_list->regs, r_list->num_of_regs);
 }
 
+/* Largest mode supported by the configured number of CSI-2 data lanes */
+static const struct ov08x40_mode *
+ov08x40_default_mode(const struct ov08x40 *ov08x)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(supported_modes); i++) {
+		if (supported_modes[i].lanes == ov08x->mipi_lanes)
+			return &supported_modes[i];
+	}
+
+	return &supported_modes[0];
+}
+
 static int ov08x40_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	const struct ov08x40_mode *default_mode = &supported_modes[0];
 	struct ov08x40 *ov08x = to_ov08x40(sd);
+	const struct ov08x40_mode *default_mode = ov08x40_default_mode(ov08x);
 	struct v4l2_mbus_framefmt *try_fmt =
 		v4l2_subdev_state_get_format(fh->state, 0);
 
@@ -2309,7 +2323,7 @@ static int ov08x40_probe(struct i2c_client *client)
 	}
 
 	/* Set default mode to max resolution */
-	ov08x->cur_mode = &supported_modes[0];
+	ov08x->cur_mode = ov08x40_default_mode(ov08x);
 
 	ret = ov08x40_init_controls(ov08x);
 	if (ret)
-- 
2.55.0

