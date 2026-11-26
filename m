Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691848;
	b=lT5tVsaBtNb2oAuWmrUOhuUXNGw1+RMwFPjEsv8Yrmi1Y3nUhF//H4ObSN6z+HbJXIUX
	 EJTcG7/DUp6r9wo6B6hfajhZTaUOkfyBncFdMFf7Osdp4MZ4IeiY+pm2RFlb3TCA+oG9H
	 lkFsifFjjEbenTD9dPHfzANTk0Gr0K7k1liCO4KsBuJkyHaZ1IWr1Ot+8RrmjwgDDomLG
	 Qv/sNywEKtnj+YcUM8xg8DY0/Kqt4vlTKeY2we1ubveNFDJ28ZPqpKJwcLFg59nDsosfp
	 /IWD3VGvkG2wa7pImy3xaoLT2q3nWw3wlE0EfyYhrVNcxw+bDllH6hFplED0eMqguTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691848;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LczL5BiLVZ8edJ8mzcgVaZOm0K+ce2l6+1MIkOsoudg=;
	b=n3kPV+FNRII6ZRoYsiAsRXTCnLBUW1cVhhkwZ9olbqYMRzKpZFaTlECbpUVx2Z6NzP3H
	 ubxvM3oDHFVO4JSsrk4UNFPlex8WgibRW4HPTEidF7OtxWeW4IzxSsNDFCZ7oI7evPiET
	 DzR3ca0cY2mgTfa56hDPJAWbq46hOSVqaE9QfgtInkDI0YVrihhdpJhaAJATGAF35b45d
	 DV/z/8RalcqqUVB/xWpxFXAUqVO0L0QHMZxRJFtUx7wuGJ/me+kGFzmHZ6mqlfpQ+ht1f
	 Ch1PfplbrO6PXh4vkaxb0K3JmfuYMUfzWG3Gcg0sHxM6pOpE+fTP298M5SunS1c6onA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3hmVTVb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iTAjEPJf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D249A606A33F
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 11:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D249A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3hmVTVb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iTAjEPJf
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBHRgS1243711
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 11:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LczL5BiLVZ8edJ8mzcgVaZOm0K+ce2l6+1MIkOsoudg=; b=G3hmVTVburM98xk7
	B7qB5mcpHxodDCYqnHJCtcmoNaorZvEjLvLFM+IxukVmknInBtwBrdxsxE2y4KcY
	XU6NBj+QAgT4wAxJYYXULrqZjWQCeLmo8iUe+tJ8JrGS2G+2BUj1IDpNyC8jVl34
	YxncGYEC6Fn3VECvm/7CwH0Gq6TJySiAB2PtS3w7iM6ybTlROnE33HFtJ7028LfB
	cITc3hfSenCn685LThBuARjH31qAS8DUTehWtOFaLMpZYzNbrC0zTwasXQi/nVNn
	2/egM0HymlEuZrvBO4pg/SrjArxrt4siLxi5J/1vlY2Uz9JfrDwpR4BCc1zN9i89
	9NT3Xg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7s0pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 11:17:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5364f562140so129556261cf.0
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 03:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795691846; x=1796296646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LczL5BiLVZ8edJ8mzcgVaZOm0K+ce2l6+1MIkOsoudg=;
        b=iTAjEPJfYlPJyXjh+xl1BBZXA8r7A9XLu4Azq5jEhUEFUtPglBVdpxkKbudz4ZcstE
         lrTp60U5JoDMA3uGXCIfKKdeY/2QUj3vXog2jXxtOkGesF8p4SXUUAbX2CWrXBe08HK4
         4/iyIOijVXQUssEY/9Zc4HJj2XU5XIFKIoom0aAUJqR465j9bhYQEd75K9hp8I1O9XCd
         /qZCwE87pdoMlLMlARfgo/7SL7lT/YvUN5xeskD9nRKdIUvW7asj9iNX53NdmkNAe4n+
         D1+wvz2W+s58BNxsX57PKg8d/EZQUklU/VFszRGuHeYh+1gQE1dvQAlDolfHSD8kVenK
         DSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691846; x=1796296646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LczL5BiLVZ8edJ8mzcgVaZOm0K+ce2l6+1MIkOsoudg=;
        b=N9f6mEW2j88A5GIuYJGWseAZUptE//Xjd036XyCFHHxn38FK+kEZ7cX8IKGZmUyzCX
         NasxjXMlKpSB/Wvsltjs+zAu7/rjvimuisbXPaZJvMHG/BnrCsoPj3cWxDdsgAQbxJP2
         3gCO/WxWU9K274DYPnILkCzdIBqL8dm15nsiZuXt61Hb/8Cp82q2mJ8bhMUsJy0rZQ9k
         JnmU+AiI3Xr1bNIyibUQ2ud52Xv6VpEb+W+GYinA5TP2PCMT30KRpi9wPspmHujFmzH1
         5bkzDkLpVBngZEOj9HNu3bwYpKhzCuaG3NQ+gOoXvWijzkyzskO0cvpPVI2q83tnz32z
         Wmbg==
X-Gm-Message-State: APuU4Z86mwADoDlZDGSZGu8P6XNmBRrl+sN++ealsL4WL2WDPoIkA0lT
	gBR44gztxBEmSAuJhrKbV1bcGkXaE5K7WfHP2xaCjmAMO8utImfuMMHIuCQweUj912mXM0Rb95h
	ENhyT+rwosZj9cVeoPLoK5OiyFbn+HaiNYMw3iLO1MsJZXGRS3fyWPag3hCxj4c044g==
X-Gm-Gg: AZFdTZfw1z0mRnPaPs1ZKC+Bn0XgLtGAeiuzTfCxRH12xBb5QCeCMPjQCHlryYji78k
	idjLKsAOu475awEA3RJg+QSd7rY+iSSCbzi8slmosD47mjHFKfC84bvehc39rbxRTDIl4HFvi3k
	lsb1W/91QjAHvMc9u0CEQkCmyAbxL4Tzmng34qZc4DcdlkZg1PVbq4fjyirv8ciJTHpiG0aqXIE
	kHokkSVRHgcpVjQAyy/EZqNg7kpuNkenxEWkvORmVYY9QmiRYjy3U5kDxReSwl/V5FiCGZ0zk5S
	1lB6QfhRVP6btg48JouSbC9nQYUAjdlY5uXAUVCEFnKQrmkaEJwQkq6jE77g422l0BKq44psDSn
	lbQTBMn/2Znv+8Yc8VxdfOZI5dMIscHRTYtCdlMdRmdAoXkTai9wZLo1VUdGjOeuT4fAUDW/WAK
	B+qNPSFnPomIDf7q2EhI1jwVPaih4X3gPVNU8shkS0Vw==
X-Received: by 2002:ac8:59cc:0:b0:533:81cf:5c9b with SMTP id d75a77b69052e-55d6fcf949fmr396091591cf.24.1795691846251;
        Thu, 26 Nov 2026 03:17:26 -0800 (PST)
X-Received: by 2002:ac8:59cc:0:b0:533:81cf:5c9b with SMTP id d75a77b69052e-55d6fcf949fmr396091071cf.24.1795691845606;
        Thu, 26 Nov 2026 03:17:25 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm177653661cf.17.2026.11.26.03.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:17:24 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 19:15:57 +0800
Subject: [PATCH v6 1/3] media: qcom: camss: x1e80100: Use the lite clocks
 for the lite CSIDs
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
Message-Id: <20261126-purwa_camss-v6-1-5ab97aea3832@oss.qualcomm.com>
References: <20261126-purwa_camss-v6-0-5ab97aea3832@oss.qualcomm.com>
In-Reply-To: <20261126-purwa_camss-v6-0-5ab97aea3832@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jesse Casco <jesse.casco@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795691835; l=2518;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=6Ey5y3ww8capTsBQgpxjXNOXFZAA+h5B/q8ghiZjkAk=;
 b=Q+PXM5oHGjjms4+wSi1VNOH8AS3KRM5GO5ftqcc8Dy0NN8kXh7GS7F/VCIqvskEOJ4Pz0Cwj5
 JmYdCdNht9XB4CVYujybPE8jvsdkOn9/CuuPz+AuvIw6oOm6FxSsdrA
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfX2K8MsRRadn2J
 0YHPSoqTSIXHPQNEcc7ZSnd8/R1nJ/OkIIC9MkHfWb5GazJScvXHkDUvZNZbcyCFBTArMQveoHa
 OZAMo5SrPio425R+gOJPF+pgiKaPx/c=
X-Proofpoint-GUID: 3Jc21ol8CBTVZu1ScD3B_uhb6kfh49AM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MyBTYWx0ZWRfX2Tb0EnbuDxka
 u4ylUdI8/0bxCbmPMfYbpZ0sWvT/kuzmT7gjr89fSndFzjxn3SW/CQ2n9KV4HDAMsDXr7VhF5Gb
 lZR2D/H4MCdcnGXn1L1VIAsP7WTSH5IW0D4mjF1o6t9V/U+/thjROZGI7kawqriDpA+EB74kNzx
 ZNjNsxjmn2eiMdD/TyFw9dyQcUdrLKdahyyhkzEqVVKUZP+X4rOXwr/xjlFjsywwkBDDz/zQqKj
 yEo3RwBJQ+jIzt3YpX3YlJfW+PP6XaxZDkqvnOgxsuBH7oiN5nn+sdwCvfYlNJ4HeMrJpXOlIUJ
 Gn3DSkqxLUIHKMTGKzrwGpybsWUaiKuy04JmPHq8vLRvuuLsJrFlsyjiyukVx+LVDMF2MItIsEk
 PlODssWjZvis/1pCNSIPgPoQTpO+15ybkboocMr073yM/7I0gG/TNeu06JJEWkn+7/IL4GHo4Vl
 qfWfDJvB0oU640rsZow==
X-Proofpoint-ORIG-GUID: 3Jc21ol8CBTVZu1ScD3B_uhb6kfh49AM
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b081546 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lvRKaed-JQPLFg1lVikA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260043

From: Jesse Casco <jesse.casco@gmail.com>

The X1E80100 CSID_LITE0 and CSID_LITE1 resources list the full CSID
clocks, "csid" and "csid_csiphy_rx", instead of "vfe_lite_csid" and
"vfe_lite_cphy_rx", which the binding provides for them. The lite CSIDs
then run with their own CSI-2 receiver unclocked: their registers can be
read and they raise the reset interrupt, but they never report RX, RDI
or buffer-done interrupts, so no frame arrives.

Use the lite clocks, with the vfe_lite_csid rates the IFE_LITE entries
already use.

Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 5469664dbc4ac2d6722d0555dbcbb1a10dd439c0..d3d27205af0dd49599fe0717dc8dde68a9afa638 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4567,13 +4567,13 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 	{
 		.regulators = {},
 		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
-			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+			   "cpas_fast_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = { { 0 },
 				{ 0 },
 				{ 64000000, 80000000 },
 				{ 80000000,  100000000, 200000000,
 				  300000000, 400000000 },
-				{ 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 },
 				{ 300000000, 400000000, 480000000 }, },
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
@@ -4589,13 +4589,13 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 	{
 		.regulators = {},
 		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
-			   "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
+			   "cpas_fast_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx" },
 		.clock_rate = { { 0 },
 				{ 0 },
 				{ 64000000, 80000000 },
 				{ 80000000,  100000000, 200000000,
 				  300000000, 400000000 },
-				{ 300000000, 400000000, 480000000 },
+				{ 266666667, 400000000, 480000000 },
 				{ 300000000, 400000000, 480000000 }, },
 
 		.reg = { "csid_lite1" },

-- 
2.34.1

