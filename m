Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021862;
	b=MHGUK6kw53juDy6YdVHYfoEs4XvgiyFfEnh3yNH6j0hhQu5Qrfaby1QHyOrEvwolkjMN
	 5k2k873JjbITdpyEKjUPZKoamr63qgyyCcVeEz1GerVINOEcLHMgNXIttrAiWVmHsfN+R
	 ugJCVtXlFpcjOlWpOjTKARgeJ4AIZ5r6yzuirO7PXCCDbRYhmeuy7JwJ7Mt57AHV1t5z4
	 ZCCMsLiFU1JqAj42YXT0Mgisg0Z/ajZqTzHrArr+KYLRn2YE9NjzJlXxm3TVLms1pmHG7
	 qn7EZXMtja9/nyGzFZ5SbDT9d5HVU8pnhnRaot9hOOL25uWAryYxxL/zRRs7+4QNubw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lqqwgC5/0KhExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=;
	b=1hax2LPi4z/UCUnFrd6GAO991T36oc9FXztXT1fzbwSo1yNvqPK0RErmQFPFbxqG7TYk
	 QR4cobYYDsO5HMhQpn6v1EhC8nqxiLQFHycpB5aIgfHs7Bd+Mvri2wOzHpIFzv2I1aFVt
	 PlgbtyNiLK68vFnPlPyrYGGTtouPw0hvuoqPxNLGtxRfPdjqLPKiTMRyXzlMOa8ny/zaG
	 090jFCJUPA+Byx0kDiriNKWz4rEtMTc2Li4VbIReZPxX2DoQr8Z/L/R4VqLxZji4XkTQp
	 rYQRwR51AsQERPruY2ZMkwf7q+ObuPaIKgEc+/NYp2sDlyFQErUdrklvM2lkVpu/VzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Td0jXBRR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=By5Qbp60;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8805B60A6F71
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8805B60A6F71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Td0jXBRR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=By5Qbp60
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt9883049859
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lqqwgC5/0Kh
	ExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=; b=Td0jXBRRjKe7S/xNOMQUUgsQaGl
	D8UgnqBwonpHZoea/NgZqIdrx8U3oZrHgpXaGklk/AIGcYbsCXC6c+px0R9FtVaU
	L0oeNdVdqLTZCGRxApMMfS9q02vYGOsLzQzZlQARkv1MwWsv0SxB7jGiDbOEf3M0
	RvMZfI318wRPWPWTcdEmMd/zA09lxPF5+MYM0MgfqHkQ3IHr7WKckrq0q0Jj5nlq
	fX9VKQzV54bkXYiraPTcXp0iORfBTvzYB1HaV7BBFTpvoy1dPLIummA1ANsyAnIv
	RI7WfakZ/ef1Hawn4q4/QeMHxrgEbR6aF/1zGooiCkDcPGThSsAs6zeFZjA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvddacbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so606957285a.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793021860; x=1793626660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqqwgC5/0KhExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=;
        b=By5Qbp60j1ELgcHC8UnlOOAAZgMi/xpiw8AukN+4OrDdntPftHEzOpxuUVWE+bl8Nh
         otgFbAngZvE11ElXcNomkuTPVhe0OrIhLd8pWZLzARB+IzqZyXmxYZ1QgOmZEYtTnTbg
         9P+JofF95BtaEpO4Jc4C8Tlw9JRFaY6Tsn/O56xRxco+Qb/ltVlTLtqgYfOvMj/DqqnL
         ekRMsZrZooQ/CHB8IcKFxFteXwdsM01VyJWaZIEOlIGpBp3Im42UpZb3FDpgQqE+MqOZ
         3wKjeF3rY0OyLh2KhWQCsfZiPAAP+tnVN3mlzhzBWbojvneVy5SoEZgZdIxS6w7YMnt6
         qpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021860; x=1793626660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqqwgC5/0KhExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=;
        b=Wf8baeHUem8VGPdqp7lgjWdmBfRIYinga0eAbWkwinneEy23dufOQGEefmkCGycDNW
         Xgd/5cB1c5TN8J5WqnbmZiR/s/zgw4RaVKHZYa4HYTln4nEqDBAyjxYbXKrBHTHai+fU
         pD7iUMD4W23rQvNhRESlR3Sf7qBKFmWU0+502WqD/gCr3pOExyyLZLtB9n9VG0TXOVi2
         bPb3sQNZEy5nRsVRnFwdIzFHeRBeZOtkVPv8J1jXT+X8H2EeqaKRmtUIDwxxVXsuVQCn
         gHN+JUtB39XARLDfaS9E03384WcythKHqMgaoYePapBgDhSoLW6FclRDAQ+SaC4q/0Dh
         UaHw==
X-Forwarded-Encrypted: i=1; AKwUvBzyBE2cwsWKtPbeq5vT8paAEHDPjEHzIzEuihfGPQdkOmsyASiC/8OLHdtbOOjxmNbMs3cDMoHB+TXiuQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIPJScOWdSEnrDZugSTMc8auUkHO0j6hsHLCgIe42d+fjQp/xbZ
	r9fzgiKRbffH9tXzVbRSnxaGUZsaPz95HZ653pbddGHLWJQPKo4C2Il7qljTsP2/T1ah8iR66vp
	3/cjx73Ecc+3gfTdAI/sguIobRYWIG3Dhjm5wlV3BAvqdyDhwpWvgQaJRzXalADco5A==
X-Gm-Gg: AYBFou0TXSHOU9TXBQ+MT1iRBLAjZASnbdOGKw7mYGzdIWrw2KLfJK2y5P0VLwD7rxu
	8aG6xUHU00hD3irLpfePlYd8h1CcU6UBvamAMcmABKQmImIPJlFAtL196ZTxv0WU/3+BlOPCxeq
	/wTQzJyRqh0uDpQ+Tp4E8vhJGI+nGVAGSfiZgoHAI1G4eIxuLHK1rIwSDQmoP+QellSTRElYmj6
	blt/JuwOz7BzDaJC3QaAx883PM7eYfr/q0VnSrgH1yZm+DAKvvHzM2Xav7cwda7IIJcj4oNTMVJ
	96TkqgPO0ydXyqtSjwdnmYV+NYR1HILHs2yUmVxy0kGWKRl6Sp/3YSK9ZTb7v7z9S3Tv1bLNv2X
	WqZhOEx5Wl4Y2ef9f4AIGmy17
X-Received: by 2002:a05:620a:4725:b0:93f:31f0:6a77 with SMTP id af79cd13be357-940ef91b688mr907174485a.11.1793021859836;
        Mon, 26 Oct 2026 06:37:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:93f:31f0:6a77 with SMTP id af79cd13be357-940ef91b688mr907145585a.11.1793021856525;
        Mon, 26 Oct 2026 06:37:36 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm15376512f8f.3.2026.10.26.06.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:37:35 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
Date: Mon, 26 Oct 2026 15:37:23 +0200
Message-Id: <20261026133726.3249235-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: NbdgunhVJORPXUHRGUue0yfzIAqU1zUI
X-Proofpoint-GUID: NbdgunhVJORPXUHRGUue0yfzIAqU1zUI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfXx3Wcbu0x4bdZ
 9VcJ7uqyieoI/9xNUAHW31SifJO3szhojmmphbdACxc9KQck5T+G05S5igNijm5UbBK026QKb+X
 jVwe5BDzeN6otQI7BsD1lYebo5zEztWChvLkDzXXeE1UwlZyAhM978jt2W44c3QMNgMkoTzThqM
 Vgf5TeXbwtpS54zhiXlKybuDzMYfSTrE13tZFfvBUJidp5EelysOK7NxMRpssWiFAd8LuU4vfiI
 ItWTHrGelAehKGtms8ZPCks6cUL5fFuvkx2GdKHv4LIPa6FG/tt85JRjLDjMoaZB9mH4v68vWb/
 4nRDwTVTeAITAo726oR7UIZ8bABEukOX5L39IHYuRTnBxyPS/9Qcy7l2Xg+AGj7uUSs0ONAVNi+
 p5DqhzLbeZXrttsV5JgzlMi4++F2KtFhEMiSkHx7/pXWL2YsmKckSrWUbyKUacDtgao5Gj/n7c8
 TWTASRbxOdP9Da4IgNA==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf57a4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=rPRfP_fVeLzQRQyiyREA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX4qv/nSdLJZ39
 AZYwOFTKW+yzzmlVg0WOZixcxfRlgUgaMu8SWz8RUUTBao6zgxjWXbfJXZZ6HwkQ3s6VkCjVeiG
 5NxGUy7k8tAkBzMloyOQoOOrg05p/YI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260054

The SM8250 CSID resources list clock levels for the VFE core clocks and
for the shared VFE Lite core clock. CSID power on runs after the VFE is
powered on and sets these clocks to their lowest level, overriding the
rate selected by the VFE from the pixel rate and lowering the shared
VFE Lite clock under a running VFE Lite.

The VFE core clocks are set by the VFE. Drop their levels from the CSID
resources so that CSID only enables them.

Fixes: b4436a18eedb ("media: camss: add support for SM8250 camss")
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..7fe12049b78a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2052,7 +2052,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 0 } },
 		.reg = { "csid0" },
@@ -2069,7 +2069,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_areg", "vfe1_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 0 } },
 		.reg = { "csid1" },
@@ -2086,7 +2086,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 400000000, 480000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
@@ -2103,7 +2103,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 400000000, 480000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid3" },
 		.interrupt = { "csid3" },
-- 
2.34.1

