Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B41843B6DE
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 08:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768868; cv=none; b=HSmDMD1Nxe+J7jMdt0Oqa4ineEq+94/exZOxmWLG4czh15LGkHy2lMaErJRRsZtVjJjzKKPzLvqtv9vUYZUuIDHQz7NOI5rOmj+9JOuhe/vEj/SbLeWOtTRFyqo/CUdxmHwuBgYSfiY1+z5fpIk071kWWNyY/xb0f/ESOk0SwLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768868; c=relaxed/simple;
	bh=dRIORkLtErUy8tQv0r5xQE2yHwcn16W9lhrS1ITHzeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LbDNU+NFcwm27DZQdfjz5DPoXP9WnHloG8eAgT4N17B8qvYTMEYzgSrf3/Pe7ml7VNl2hM4fBAV1pd3wooqN20W4SQ8VKpW1FSGQvOjdzCvsScmexCIf+pXafSw9TPI7PDR2RH+EglveZ5Mfw+N3aHs/9NKP2kQjPVaiS6oL+Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=px5URFKS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BbSKij/b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="px5URFKS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BbSKij/b"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687785kn3687791
	for <linux-media@vger.kernel.org>; Mon, 7 Sep 2026 08:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=; b=px5URFKSWcpFG6By
	FmckY/GfcrBuDS1zDFI651u8zA7Tnoz/3uSRNgMyhqvk0GBsmxXbHVR7XcGGQQLK
	MQIr53YuDCbGaki8olRqLIb+M4fJ6H5ZEKqSApoDAgL1VkT97lB54z+wyuTrCk7V
	U7n/qeH9SNgEGlwz1M3VG8MAygO/eZ7cB56QZ99KZ3fWSv10G9T/WiYsUAOdhIxI
	LT90wKqspZ8kpcVhJEsUtsC8UXNFBC4/wISyffFH80Pqy9EYLc1eJt2TotH9CUV8
	Ty9rz6Po6hYLQYj0O2xWFStAWuzkfz9RuRbXQlv3EgaqDY7OB707oOhA4XYmZoYZ
	jkdAxg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gga376184-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 08:14:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so4212924a12.3
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 01:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788768864; x=1789373664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=;
        b=BbSKij/bS9eobUSFryzRO/Nt42K9OcaVHU6r1hRV85yrUc49SB5etGMpuKrcSIND05
         0IQ1KwrmAI/RqqYe+S7QdwSpRCd/x8abMtnOLFEoaGp0IkxaDh9CfdSGUjECuZqKnp22
         TdgpEp7QtEsrdgoNsonGEWfmT1/3ccUp5nvmiosinkwfVyGhA8oQlHcK3dwH61pVB9FG
         FsflshnVuqhghENs17le7rCYVr1IZ0U3brJZ+7RUSQ+z+Qq86Afi75u8ADYtNVimgGNZ
         MLjzMDHaX5STcxlRELUem8iJCsGV/YW9WivP3NYOOpkN1ZzrbehRdw8YsDK23z9D63Wn
         e2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768864; x=1789373664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nP3wcx2p80nx+Tohacyx3IYJwpEKwRThxmKFCg9vGIo=;
        b=T1UnOVMCpDldmaw1YmJabmDfEZEtwyQjLdR3oXw2nmBDU7Ue7Wt0yzaOgaY8/9TQxt
         zP7+9dPvKLZvZdwZsz7x/m+OpTZ5nSqCNADH2b5w80AXkQBYeYElGwwLvZnDvCUkpupr
         gMQd3PoIIK6/bps7YCNbcpxo9kL1o4MSabe2faUoy5ZfbfO9UDc2vjN5KUZZpVLRDddV
         WVnVkveC41NkJH6TPl4lZCwbpPeZyXCQMkojAU+AVwpMIC0UIpKY2nvZ5tDdcaY5JWOl
         x9DMUVsTPNWDAQH5+Hxt/lJRrbMjyMFmDnCyLoA8IA56zkuvj++OMLq/Ilzc+yNRfIs0
         /h7g==
X-Forwarded-Encrypted: i=1; AKwUvBz1pEKZZUxm/wYep2DQ5WOOILpbK9vPJlhyGGWLzH6xlX8P+tfIGt5kGGepkFrfAGSNFQHSVZ1hwQyg2w==@vger.kernel.org
X-Gm-Message-State: AFuF++kOpZXV1jVftl2tn/U+59W++g650DNJs2Z6XBeSZpS7O7ugNazv
	M4BamI1GqdLrvTuztOAB6f/XD6uaBC3M2MKyvhEpm6/bVYTDZVo0Hy2oyoFp8HSjHsgRCw9XjcV
	FQRcgszmYApRrbgwvLUsUw3tgrOobayvAET1CX/fkijqkFn5IDpDizWxaaYxAYdKpQw==
X-Gm-Gg: AYBFou3Mb0+oykd+7/KV9haEShOlmgg/UvagA00rpoS0RiZNdYc0m05v5vfNuAAbzat
	f8O2/jMEoClcjcceAr5c8+FimQO8vMhdzFH0BRpFaLGrnSb7oS0lXyVjtx4Oaw4XrVYK4wTQh+U
	ArChWc/8ng7cgM0oK2d8Cg+ossrZjByjWIc5o6mcBiWzNvvaH5JASs2MyzNq+JoljEqhOe+fE79
	72PWMk3fL+pI+uU6n7OGS4yXOxTgA5f6ZmO7KpLBTbI2fZ/WfiZsd+otyYiBmaNMM/ameWSqMhi
	F6Tjy4ngi70Q+yxw3PMMlKqbFF02RGU3/5Ea0hefIycCNwc4suhKR2VpHbDPR+CqY5JwN7LOBGa
	WyyLiviCQL6CA7GWhfrHIa5Sy4AP5+Z8=
X-Received: by 2002:a05:6a21:6e8d:b0:3d1:2f88:913f with SMTP id adf61e73a8af0-3da39fd290fmr33155501637.14.1788768864529;
        Mon, 07 Sep 2026 01:14:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e8d:b0:3d1:2f88:913f with SMTP id adf61e73a8af0-3da39fd290fmr33155432637.14.1788768864089;
        Mon, 07 Sep 2026 01:14:24 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm21724220c88.6.2026.09.07.01.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:14:23 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 13:43:40 +0530
Subject: [PATCH v2 4/6] media: qcom: camss: Add Glymur compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss-v2-4-75f7982dc983@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788768826; l=1214;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=dRIORkLtErUy8tQv0r5xQE2yHwcn16W9lhrS1ITHzeE=;
 b=YMrJpmRfjIqlMxMZFYjxewBlzaJz0yE8Svh+SnXsf50kXLlDnEh1boHaeMbt208cyIv0G7d47
 ca7rrOzp2d0DLI2LGy81N+OA4QSnH5JSZ7yqaSwj0NSx8tSH60m0tuC
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: ikQdDrIPadBj5weO9WFSW34ncfv9X8v1
X-Proofpoint-ORIG-GUID: ikQdDrIPadBj5weO9WFSW34ncfv9X8v1
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a9e7261 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=xYyVevvQUQiUFKtwU9sA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX0LWxwDyh+4Wi
 XEQMehChlVGCQ2JXYzD+oHS/H0DKSAtKGD7IOX3eACNYizym4Xm4GaPPq5O39koYQPweLUVASuM
 FoxocCySCLNV57E60aWibz0B4zJbkvA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4OCBTYWx0ZWRfX+5Ai8UkBImTn
 6kIDo1kQzR2pYj0OeQ3uZ6CVns/NAoXtWQj3JVp/2pMNy7i+CD5VkjaFtLy698/JrF+pAvhI+DA
 jWG9C8Wedf5Anhixr5eF3i3zi6dk6Ac7jnb5hkFwm479XSv9GYQhGWNU5YKTfodemXGk7mhLK2z
 UvAp4b0TyFgPH1sVRXGBqPA77buBEF7UYO/OXPsd+4NkhNemJ6ytyae6JgIytHSk3vRhZgTrvD8
 UBE8FQib2EpNTSu0LjiSAlCnhjb2lpH+XPWGtFO4ef/N9mWnqQcIL8gWgcqda/t+NXKsQ3T+ggS
 o2SXpKbtQrTlJJ1THAXlO/OdvBAewocv3bTHw63unxSTXgcW4N2UJgdcOwEKPMp0/ykia+bZEsc
 0f+06D5i4IGKTZyb67jGnGEOLtKZ+G0fIJVIssHA7/IMRIShjcb0IklHYDBoMvki2aSrDTVyIvm
 n/powcbbwWTb9Uf27QA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070088

Glymur's camera subsystem hardware is a functional subset of X1E80100.
TPG, CSID, VFE, CSID wrapper and ICC resources are shared; Glymur has
three CSIPHY instances versus X1E80100's four.

qcom,x1e80100-camss is not used as a fallback compatible since it is
already claimed by its own binding schema, causing a duplicate
compatible warning in the DT schema checker.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..3585c63c45848793696fbdc3004ddc867a5f115c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5758,6 +5758,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
+	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
 

-- 
2.34.1

