Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631045;
	b=an2L63KB2IZUMH8mhdjrbswEvPl6rEHiUcjEkcQ1Xk9dbKB+ZFkctdo1K2EfcPlq38t5
	 pewQYtmoKH0QCcD91P65Fv/lhtZakHKUnRBarPvKWDztkqtu5U47+Jdz5r39mwyk+Ur0Z
	 FmqfWdXwQSJ/YsbuxaL+/qjsFjUMlu96/rljRw9hHepJENd3nwS6ejiQvrBUyIxJGuM4M
	 SuP5PPeUiqcnbhR0UPY8XMYKIEoyTCMXY7ebBy7ahnuyZGd5PsiA1VrJ9HdHDQ/ds3pI6
	 2NJoimgyFKH/B+zKQBxzZZvwAEG40jBYU+i36/yjREgqpCpTKrVSBAK8C65ckkkADuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631045;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=roKxUa4JIcTuifH94iqMJAT/BBOaH7ODw0ht5sDegWg=;
	b=bJOcKEwR22B7WWEtMvjs8dlhS4Y8nU44EsLi8tAvBJG6hoM47KZCCFxwB8H3CT12QYKA
	 mHHiFE6whDQ5KEQVyhgS/lKRqbP5tZeX+VbbLIxXmUcMh4vnomEyC9Sulf00kuR4/ppis
	 fsAERW6dVsLDtBE/6RZao+CoYIX9bUrCx2kTV2WbzRD9So+2w/rfNmROLO40lpX706WpW
	 iG3RIDpAV6RhJLubY0cxVHcus+k9dcWQcslQE9bIh/2G8d9hX+Ymi8rTsgSngJcEHcTa2
	 osId7j4yzXCIpTUGwQlLo4KwiRP23ywdPrQi39YMqY5ciH6fHRf8c49QuiOddOcZhiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dzuvhS3S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jkZTB8ot;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4806660A2605
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4806660A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dzuvhS3S;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jkZTB8ot
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQ9kM817610
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=roKxUa4JIcT
	uifH94iqMJAT/BBOaH7ODw0ht5sDegWg=; b=dzuvhS3S0ZQYZ2U09KCuw9Xmz6z
	KEDtAAZFnKkbIKD+uGSfTf6HnXxgCEaSQwOIX3YYqFchVbHpsjxe2AfNaI01uVDJ
	5s4rvuXESaE9/3oNNklvcS69fQWjB63T+EFdnszuhDwt0zSzoof/bKOhfVeGuObw
	Y4F4oTFuEPdILp6mOV4YdfkMjd21SldUqKYbyzhl1yYYdsX5ExVlNPpo+Yx6hxNB
	E5j49xYiXqmb590wL/x93mWSrAwh1WzBv8ItrgM4nTbKrwoEV4/GiglwOU96zk4f
	Morp3QreEpq2e2Pq7eTLElR1+BTFoZUKiPSBdomWFQ8SOieuZDq+ddY1U4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuht9gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:24:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso1155071185a.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631042; x=1796235842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=roKxUa4JIcTuifH94iqMJAT/BBOaH7ODw0ht5sDegWg=;
        b=jkZTB8otdseLfWIO0bh6WONvvIHYC+czsKjcQqKTmQ1dlWzThtyMbjymQH6FNP1TVi
         mVqfQPWnAk9NqnDJfl5kRLr0AuAyLfmxnZwFLJJxaZH4g5KP5QXagqr7rTIujiYqt67k
         pqFjg1nRmsgg4+appyuEY33TRHP3SidrO4Ng4fzcfUKaeOQHpyeB7MeVm8HRMVwivCpB
         c1Q9N+/NWghgfe+xynfCX6kKEBsgjDlF6A3EAFNIdxXUIWSwuG3ieMqvdob8YL9pi8fH
         LwV6aQRQsrBgeOm0xIXs41nexAg2OxYRJbVwZJHkJWRjUyt6NSGNmqQFt6nxY3i1Eo7o
         pyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631042; x=1796235842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=roKxUa4JIcTuifH94iqMJAT/BBOaH7ODw0ht5sDegWg=;
        b=T0z7cu8tYWp6Tq73BsCLVfUQDhqpkgUfICOM9IdctFnrc0pFg+1tEeE4mz5WVSgbhq
         oDPBON8q2/HvLBcdKY5grr0pkqlxd++MdHZFnxL+V5zuDSxKm0cuuaynt5T9EMGg+TAF
         Z899alib+DLPw0rRwe0RK+7YCNl5gGdPIPuZT/XawUgfoQvAVdg2Wt+aCotwYUkwvEbs
         tXZfruIqYvwNtbEEE2tfnV7pwwVT7dou4tw/egf8+1wbYmohRiJwItQDHJx9wRigoH33
         1MMWwsmTgkTRDPHPnReQ64bXWWC6Mw85J9uWF+L8oBjhwBDlugy1FTV5Mo5KbwFWeSbj
         ovYw==
X-Forwarded-Encrypted: i=1; AL+hErHHtHeTjRZPkV1KQ72aYjeR+XL/wjRyjlwaqB2VUlfdL5ZRpafwAfQc0OVpNHE5TbFhi8s6+VywTCrfJA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/B+P91ARSfuJ2oIq07SAOvLzqqcZGfe7C1yPhKBZrDiiPyrQzM
	R0NQMAteUYuBESsybyq/++K6UhB8EJVTYIuglDygmsTEkjctuFYk7FapdjgcwsabT2O/A71pw5J
	2ChjT4EplhkmiHI81x1HqyUtX5BySR3wzXLgJFwwCXJ76lCWAtj8grY+MPD9aPbJ5gQ==
X-Gm-Gg: AZFdTZc0P6phnrskU6aaQ9/sGBJx6k7zZUs4/sWM5ds5WzbSzJONJ8yskeJVVfAqk/8
	3zux5w+XaKo+tGXStZPEo/IrvdMcVtME1qeCJIWaLI0IfTvYACZiSkJiZRGQhyTCWLZMWRsTgXd
	33JR7v0LWa3Wmz50Es6kTqoG6zCLsLB/T5eOBNjaSvtuMEi2HxQc23IeZu4TnV6g8rhX1LgYQFe
	jTBCMILImnpPdy1fK4nsAEv/Grzo/+N4ZOjSxLVvRZkOT/2sLIrxrajrHUhubZxX6mehErvmThJ
	lBsCmLO2DhwOKFsOnJE39dW4i4g8lYPaqKhsMdbWqce8ud5qpiPzmYLH686GrwDFB52UOyOYmyT
	rOvIDn4Qw0638lEuA1U6qlWZyKGPFqZ4BGLPCztKXmuGI3VpTkD9kvQuP88nyjkXXDyXihtYeWG
	Dp6N9c
X-Received: by 2002:a05:620a:4385:b0:93e:618f:8127 with SMTP id af79cd13be357-949b35726femr3167823485a.8.1795631042500;
        Wed, 25 Nov 2026 10:24:02 -0800 (PST)
X-Received: by 2002:a05:620a:4385:b0:93e:618f:8127 with SMTP id af79cd13be357-949b35726femr3167818085a.8.1795631042025;
        Wed, 25 Nov 2026 10:24:02 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:24:01 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 12/12] media: qcom: camss: Enable streams API on SC7280
Date: Wed, 25 Nov 2026 20:23:26 +0200
Message-Id: <20261125182326.2767771-13-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b0727c3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=ZovgdgjKAAAA:8
 a=EUspDBNiAAAA:8 a=nrc8VjnkgqnvnCm6B8AA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-GUID: 7Q0YVEezynwGPcGSIAd22BluOINRVRIB
X-Proofpoint-ORIG-GUID: 7Q0YVEezynwGPcGSIAd22BluOINRVRIB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX59X/0wpLbt+q
 skJAHx7GKBs1gowTFJPadE0VAy4eSIFsqOWiHLYXa+OKymvUZHlMlcr0YYG6wOo6JMwnteL8mNK
 SJI8Vawnu9CVCXI+m79DUCQ5r1ddPBQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX8BIiXQ9QG8ZP
 MGa/xF+hVAQyvWsgLJkxrwARnboHIoB/IKKUc7QlRE2COJ0DcBePRBNCKtw+jN2aCWC6k61foeR
 5Tt6Yq7BTlUoaTP6sQ+AAu1PEKpkF6+7LJm/XZJ1jAVW+KL6MUkeJ9KkAvD/EwVLMZz7vaGVSZ8
 ZzlBHVXRDawcTRaWKbUqSCrR4zd25x15B/7bMM7PDHyxuJJwGwJ5uqyRZGefOhbpMWKG2XkN0rI
 j5nRTwmrM2s72OMF5Hh39RBUJ8hUowPCZBCwlSVwdpkECB4qj4xBJVR/G4xw7zZRGKKKuW9G6u3
 +xa9Yg8peP98Oz9ODiTGHpO7wZCPDcSbRaWRdJSNKbMpaEbx+AjkbCJ57CHrtnBflLhD/3Ezt5P
 2RO3zx+tibwLsUhr6Tmdu3wViWX9lK1X8mVX3iYxL8sJXNm6pdDmR7lVGGskpu2GfUxaVDZtWFp
 W4yP8+LKElPGAcuD6Pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

From: Hitesh Patel <hitesh@ebytelogic.com>

Tested on RB3 Gen2 (QCS6490) with two GMSL cameras behind a MAX9296A
deserializer, one camera per CSI-2 port, so two independent pipelines
share the deserializer subdev: both cameras stream concurrently, and
each can be started and stopped repeatedly while the other keeps
streaming, without the WARN in call_s_stream() and without the second
pipeline tearing the first one down that the legacy s_stream path
produces. The CSID test pattern generator keeps working.

SC7280 has no camss child node named "phy", so camss_detect_legacy_phy()
puts it in legacy PHY mode; the streams path dispatches the lane
enable/disable accordingly.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e444c29fe847..60d3d21f6548 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5819,6 +5819,7 @@ static const struct camss_resources sc7280_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_7280),
 	.csid_num = ARRAY_SIZE(csid_res_7280),
 	.vfe_num = ARRAY_SIZE(vfe_res_7280),
+	.streams_enable = true,
 };
 
 static const struct camss_resources sm8550_resources = {
-- 
2.34.1

