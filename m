Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898254;
	b=XgXZsA703mL8U0KiiEqC7Lu45GAah9jrR/Mi8X0Slmma76UvmNbb9CMQgXAJ9apIY/Sc
	 QWCpGP+ioet2YXIoSv4RF/62u0vUlmcEdVKqsLdzy9SOVNySCRMz7MvxSzOw7jKMV/yK4
	 NQIIpeWiezMNmLIQxB1PUzez4vIOpw8AoBGgFzygqgSMXDJTpYxv//4au1byCbRzS7qEi
	 2HEBVVtAl90EZwQvzyIXpTarvZEIXmEtnTydix/qO1AF0SfTeeT6pJXESA5dHYqCQJuoR
	 7ktuhvgpBVXxOoNGad9TyTd4oazRqvV9du4duMzKZ/ozS/eWXQxyaKt8aaDNGlEH6eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898254;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vFokErhM9Q2nJQ0re6oLwwnWeG49znjKbOg1X8oBNrw=;
	b=3UL6hNP9Lv8Dx/O+5ay7iOONr5EkYgvXsjx6aEmruOuFvS0aoYMmI+Bzn6M1sEaTwU9p
	 bUtmIV9lkvB6imj2tez6WnO4avs6zFyzRk2rmgR4HvZsN/0I2ZrX4rghLrPFeYX96lwYu
	 MbnRewn8zj/izFrr+AB0PTkYArKgBkvr58sL5bTlsEwFGwVji7MV27VR7riPCbD2Huk4a
	 ODf58zJ8zpzNBvAD5ITTXu8hohMNt9k0Fe8aO21tNbE+yj9HtobsXPD7QImgPz89hbVQv
	 ritsdKi2aS51Bwpvx46HpYd5k52TlOPiCS0W84x8XhmjnSa+10L4y4/Bb4L2bKxBI/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hrC9ZTPc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DxoRpq24;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD2560A3839
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FD2560A3839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hrC9ZTPc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DxoRpq24
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P16jjm4167800
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vFokErhM9Q2nJQ0re6oLwwnWeG49znjKbOg1X8oBNrw=; b=hrC9ZTPcSZxqR+y/
	4egwq1okUI0CHBzrb847IFersUjlMVzc1DISsIkVwC7W+5XRNnTRAbtGBAstQWph
	AWgFgMvdIC6FkU4gQnGJTFU3I/64bId9CfwFcuiq+rkPxEnmILavMhsUL9hlntwV
	+wqg8MNYwGCM7FX0qBLGnlhNKSWc0JZXgRN+STp8Sp/RJ5Ss1o1LvOl0RpgnWVlI
	5a2yWTbRDVjeb8ejK/KzkRqZW+gsyNlhG7vhJqsoBLX3Z7T5CV5qllobI7ejJMP4
	X4roh+FYMJ/RzJ1l3RztXKjFSPQhRveVHztGwFEtVPpV6KTlntSGOiqL4gRWGEUk
	Iim45w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkmsae8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso4118564eec.1
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 20:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898253; x=1793503053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFokErhM9Q2nJQ0re6oLwwnWeG49znjKbOg1X8oBNrw=;
        b=DxoRpq24VmtVI/8yBMiKHgMHq1dIg3+ueWcByz15O/fkp7QQhL/0vODNAXG2KV4Bm8
         78OfE8ktO+mVKaeSajJG5gBd6Tv1i8RS3JdPvEFYcXEScrGqUoOsqFsR8dxycafc7Oyu
         Aduz5od8v4v5+xiCMy2cKb9Uq6Le2YYwHIzr6iwmD9kIJqkcrBH4kbCVsasdyk4fEySC
         EGJHaQIBMKBeGs7+iC1dkwV8fqY5Af6CLnllOhCrGgAKghzDdJ3RNWCmfnBEUdvnsPah
         35e4F7pwMIdoDBItN8r0CfS2nv+XRfnLbjyviyAo3qu/2NE+1YMRCKYXID+ABoGk44YK
         gFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898253; x=1793503053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vFokErhM9Q2nJQ0re6oLwwnWeG49znjKbOg1X8oBNrw=;
        b=bdDCNLvRQjhLEGCo14uG95NT11QOHdgrTT1umDf8ug6PKjydOaSEHnVPL3oQfrhTdy
         PTM5lgrIT/F1KPxxIgv6UnHDLS0XxEvhRrNC+E4lotZ/cElJPiUiRkoj9gdMk1cTYD1s
         tpgv4IWhGgcptXhllj28uU+ZEARhVlZupqpmIC/YU8IdPcoKsORv6BFxZOKHL2zWpHH5
         gOD/KQ+jxC+PubLN+Qn8qWxvXR7WqP+8C1D5CwRUhyL5bUfRDFuHOF+l6/6zswQbOFz9
         1MLvCMQB+A6WxffdJPFC9P7qMXHfL8YJtGNmWqTOGEYLBokb76FFWuz0Q2iD32jBb0o9
         bacQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/iZRkqT2WUo6xw9FnLAvtYXCXOqjFzf0gOK4FRQcTepUpPmLNt7exibaJnkeCDEQCsm7kSwZGef6X6g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKliPt0CmvhQF3+jStk1zZShGbQM5pXW4G0Nczo2DCmrW4/YVzP
	+GiA7FqfFfbOTLh6KxQukXX8QWVelEzhw7u59cMwc1pEZvfacVwdBFiiLc1mLVxOtXNPp2vkgA2
	J9+NoS89+Ax+Qgz8HE+fE3qAz6LnavCm+e5+43DVQfN9J5nE6Q+BX3uLKi52wlrS5iA==
X-Gm-Gg: AYBFou2uou+I+eTXeF1Pi4anZhUk0W8TOqmZuZlMmLAN7WxLBGH/mtCEu8XonwqhEmO
	CQ3rbj4KC/TebvujaJHG9C3/I4pe+HOt2rExFa4jDIMIw8ugYDELis4aUAp1/tShCev5LrlBsDq
	PFRv09NkrbUodD+OQWwlZzUtGAREoYCuymQDwqh2yMzMpNraJ+FoGS8MgKLk+WlvJOj7OX1N/Tq
	ar25fP02esoQ1EfuWLSTCzDD5eJHw1jo8K9r4hAwtsSpxhcu0ZdHAx9F/uBRuMAkZdn2+ngr/9A
	41X/t1Bbhl5C3Ku3vX1k3esuErpa+7+ddV8tE9TL5Belmn3Ahc49/cMUcoE0Zn/pRwpctH+ptQl
	Dc0MG5f2ZfhYEYDTlTPAr/8929+NCwQ4okZwG/a57movVC8vQVqIWfrHR9iYQ/ZfE7SM4T5+O6k
	UwX07dK74zaw==
X-Received: by 2002:a05:693c:2804:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-369e8362dcbmr5169619eec.2.1792898252807;
        Sat, 24 Oct 2026 20:17:32 -0700 (PDT)
X-Received: by 2002:a05:693c:2804:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-369e8362dcbmr5169583eec.2.1792898252247;
        Sat, 24 Oct 2026 20:17:32 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:31 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:26 -0700
Subject: [PATCH v22 07/14] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-kaanapali-camss-v22-7-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: WUpPo2BQuyVDOtIL5Oa1Yy6ajQTwCGoZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfXx2zTVXESTzHj
 hfv1CDr62871pmCTQjy7RyRuHjYYXfp2EjobAvyn1VebDaRAL3OSn7N7DHO2oe2dptH3A/4CzOC
 HPuaMK/Zb1FnQKl2waAQ5b+JH9huV1odcehetw0Cvcfch01V8ZqFHDGnwMb77adBpLhO01yJIlf
 vco/KXXduTzLD+3OJIj2rSroVZbFR9TQ9C6twroTOq8V2lJ/dmiMVEJMeKGf10zD0TNv0Yqw8fO
 xlckF+XaCYkm/uxA8nh9GO4Nt71+VTKdXXtY3wiT1L8qqhh0ZSknwGvaIaeTf4ckj36mzi9217S
 JYH99YJy0m5EfyDea4bHRzWWAtFPYg1fa6td39341v5p4dDfzMTWulNTcVZi9c3pU/YkwUO4/lJ
 FOSNRP8iNBQftzDQIDtJ4yYh4GYWABDfPsf04qLJcqvz8hfUZjh18NijFsxGc1YgIarLCubHM19
 FD4OEWSpqiE9tr/x18w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX68wwlSzyZo1q
 rc4aGhVYV+GRc4LqyZBd7Gwln0t57CIsz3BAzJcRaKJmW0V7A26W0Pp0YDFd3LI8MAsI777qnbM
 +Ba0UMl7PMHMSyaQIpiybvpQPgTuccE=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6add74cd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=JczS9Y7s0yypmJa40voA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WUpPo2BQuyVDOtIL5Oa1Yy6ajQTwCGoZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610250012

Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
which reuses the x1e80100 lane sequence, clocks and supplies but selects
the v2.4.0 common status offset, adds Kaanapali power domain and register
the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 47 +++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 98ec23c39fda..0358ee384012 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,51 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
+	/* CSIPHY0 */
+	{
+		.csiphy = {
+			.id = 0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.csiphy = {
+			.id = 1,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY2 */
+	{
+		.csiphy = {
+			.id = 2,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY3 */
+	{
+		.csiphy = {
+			.id = 3,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY5 */
+	{
+		.csiphy = {
+			.id = 5,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -5606,8 +5651,10 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {

-- 
2.34.1

