Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200881;
	b=M+aMCiRqZno9LbUweoe0QPxAG3Ob5ISeWj8a+eqXR7WfoOJZ9s8i9GF50+gI0Th9X+6F
	 4GhO+Hb+v38nGXY7aG3wzjTlHRXyC+bkHV68Y3zwdLWzM7iikNYJcMrFSpcxNfaaLehD4
	 QYNVO9H7PD3EQLUM1y2+xAZpBbfqylr9pEWh3xha4c1uO00jZE+xYOYbkmox9YE8KHIue
	 244j2wEEw+819nb6Huz26JBZLfAJVhA5CZvRsqYl6DB9IDlC5wy6V/vCRcxTiBgaXA3Oi
	 DChcS0K6KBXoYFGjWTDFjDdtn2uuaWNLcqr839IjFA/I3TpG+iwuiOqxrE9nLRN5/dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+GbF0SHSxnQUeknZ/fZb5yRBXRMQ+BnBpWKpFMjS6XU=;
	b=oT0hHsF72c0IKFgGr+R+g9mljMIFwABkA1eLaMCFDfFN9n4fofKc1eYoKjnD+dCnFqKy
	 xtPKZV+auPf8mD7aClpgTEyBAHQE4Eb4lGqJPmDm5lnPcfabiZerzsCU2ljsKoHMV2sTz
	 e5553dvo9TreuwjpsHOOgGn3mKGOMh1Drhu3i1bZy7Oiiv82kG0hBiOKnO7sQr8DJ2VAh
	 jtWVSm6YOJSQR2/OHBvLvvDuElqU0IoL+ATWVjeYY55sawEu/c8AxI7Cw0SMHyu8RkeBu
	 SghQ6PyG8lSQ3QC5kg9ioNIyzrc17wnFygm7snDSSULZRXTaqtxVG4drTS1XpH3FuwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KRYNh0yF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cxHkwG2l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E439760A380D
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E439760A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KRYNh0yF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cxHkwG2l
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAZk51458807
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+GbF0SHSxnQUeknZ/fZb5yRBXRMQ+BnBpWKpFMjS6XU=; b=KRYNh0yFFoU0mT4v
	4JaShUVeJibTvkNfb1NC3dTHo86I8hUZD6Cl+hl9C+3prZiaQzptS3YxxtjFSGU9
	DesKvPo4MXAN2DPWY1zPzjfYu8LYhpuHFnRf9WiXUV7zbhjY0VZCbX2PL+6cs2GK
	yLKD5xo2KFMmMIncqfpgazcS5N7jnpHoo3Y6KupZQl/n2axKtF6icblpRdBib6Cw
	WSkPFJkUTB1LaLIPOQ24U5vzZQYNm7MidcJd4WWA6G6LF3/N5PU4ppR5EucnEFGV
	J/yIAmT6NSPbUbJOm/kIToX5bWujlEAVLq+gmFhGuFxVmkY+MWNX/IErOg1JqQK0
	ly7Rsw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82ttrpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:19 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-677d93efa20so2024585d50.1
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200879; x=1793805679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GbF0SHSxnQUeknZ/fZb5yRBXRMQ+BnBpWKpFMjS6XU=;
        b=cxHkwG2lZicuu4/8H5A4beML2GaDcNHU59vcYlrMeslz/Ys8xdhYh1l+tBIedY2PmJ
         aq5zBwGI7/YQByt718MJIAKGDWuqaxYXBbQUgc+0L2H6u5sAwTZiDIuyWZkHFwB/9JsQ
         7xVyHo0MxYAiXSg0EIOAo0F8dYcW4nz18BaT9EV8O77+hJSkKfkvWVMzRPqBcSkN95FV
         cw8GYSqYH9pr4HU89VUun3ZKbfQeacto1WO3k2jNxpDhXzmVl3NxshaHWGyz476j3kb3
         V1VJF0RI2rxSMnD/Dt2ToULs0MYe0W4kH5kGIZdY9TD2QAUaw+/Q2YFNoawilyxFpF70
         PVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200879; x=1793805679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GbF0SHSxnQUeknZ/fZb5yRBXRMQ+BnBpWKpFMjS6XU=;
        b=z59iPF0e/w777wY7Uy7T2ABz5/q+VU8zoNQFC9S98EM7zyjDV5SoO085Hn3sN+DqEf
         AHOlOtVKDpBEMB9loRxIE4CfI0PnbaIC2gfR3XImaF5PIFCAiz0fKPd6w8yhoM01xW3z
         6Tuv13+jZmfBI8C9nMVkWWI1zBa9aJs8zNAgyh6VwuLLCOmcry2ANvT3EKH0i5uG3fce
         DvBp2iRZXcoQGfye6yDPIUBTvge0HnCngaJXRlJH+v9G3LgiiKcXUhG6wccKRKujrLgF
         8IYcfWqziABblh6VJ/8b4aGDRLMDTd54h5tMCZOcvgMAdfsuH4FhKbVlM0ea5i/+ZrtT
         alIA==
X-Forwarded-Encrypted: i=1; AKwUvByKQHDv0O+/Ul99ZRrzhFzq8XTEuPkGJoM5Bc7hwZyOMyJXidP2zxmhTXahd6r6pUPDn8qg+1pFBh9lEA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJq35MV475rZ1+8ccceBnszgnkvH/jEBTOo5gXbp+lrTBPAiNxf
	XY530ExzHsA5/Tk50PR9it2QSLKfcMYSkV0uOhx1MyUEIkIZ4GfobLSj76J9ihHTe2ogV75F6wp
	nPU3kEsNhH1NoGld9sUr9e960201XNUuTltht6K0uuajycr+KtaHr3uc4UZYIPEcPQw==
X-Gm-Gg: AYBFou0YNjAqK3tcivtN0DXlrKWBIFGxywRHnBb+jeN8sqHLJcO1fRPqMVZ6hLoPbPY
	hNzdrIl2htl6XgfNgyP8jtSh7GT4Z3UBGQAa2qReMr0uImYFk1VQ9/WKYI/e86yAfxzRB23xH85
	zGYl/VXpwiXdX1gkjAv08ZzUxTilpm8yXGtGU0XVq3PfyqYzvkOu7/BJX1uj5Znz+Up5H65nbpv
	iLvyXuuttqF5nZukQbm8SCjKlZ/zPI4ntQlCg/zmZRGUBLASCIRwo9ejMdRk8dmdFmKpJopxUXQ
	gyGf/vKbo1mru4S4Lq3fnaWQFwxwkcWd50ZPnOEdHRDZhcGU/0P8/qpzHhpprwT1eZo0K1+dNrJ
	DEN3iEFGq8HCL3lVIONNoEEt+DM5ZdOqRVUdkJ57pGUlnTz8YDXPzhugmU77zcCOk7UeN7qzQ8X
	ciJK3arXWJfwyMgxF0+QqDRn5l+XW5Sm1ACpO3gdi/mhGM3Fj5Hi4PQeCktY07
X-Received: by 2002:a53:d20e:0:b0:679:cc49:55c4 with SMTP id 956f58d0204a3-67a7bcf7ca5mr1298202d50.78.1793200878669;
        Wed, 28 Oct 2026 08:21:18 -0700 (PDT)
X-Received: by 2002:a53:d20e:0:b0:679:cc49:55c4 with SMTP id 956f58d0204a3-67a7bcf7ca5mr1298159d50.78.1793200878048;
        Wed, 28 Oct 2026 08:21:18 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:17 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:41 -0700
Subject: [PATCH v23 07/15] media: qcom: camss: Add PM clock definitions for
 Kaanapali
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
Message-Id: <20261028-kaanapali-camss-v23-7-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
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
X-Proofpoint-GUID: AAXxrWdfSm1iDZkshKHsFXMk9OUc7xx9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX9wFN1+L3Uqxn
 4k7XTr+RXyU77AL3XazUVqK7P9MGAEbpgXGHKfsO5zit7uP18B3oljULC21cRins/xk5vdGtBrA
 VmPfePEJX4xrLBfg6/j6ZED8DffRIpU=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae212ef cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jNWLojqFtH_lE__qK8UA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: AAXxrWdfSm1iDZkshKHsFXMk9OUc7xx9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX1aMEhwhFVUEd
 umBg8vlqkqAQ0Z0+vJZYGTun6lQP67jb588nseoQ86PpU/BWOIEHIwV9q/lw797RMVh+h3WWfSr
 GKD6jn1Q4ruepQNZGbr4RDP1cYyk66XMk2Jhu6VJbM+zBc22XKfoo9+o2Jde4D/KnZ3a3QDUHEh
 7hKDsL/IGiaBzWQ7VEcdcqVersTetBpeZV4UWruWnY6Twwh2wF0onbgXwnlSCElxCBl1iy4+V5U
 ly1PhTZU9WH+L4tvK3kvyQ6R438Q+fQheB8r2UJjdhgqhIzZNm3fRUEDarLQI17Rob0QfG/3SOF
 HWZVMQvMYb/oL45VD2AWt0dCpe+5hWBLTrN8gNKRqUqphsndxILNVOXO+eyF9z0Lw1DuIdZRTyV
 q5I0qhyUTl4Or2IvpzV6nMwNOXxgMCM/tJbCc0J37aBQgP8l1o3Ovzfh+YW0MSMQ5r3F+hl+h6W
 YYzzQt+vMRIQ6Quj5jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

The CPAS AHB and AXI clocks are shared by every Kaanapali TFE and IFE
sub-block. Register them as PM clocks so the PM clock framework enables
them once when CAMSS resumes, instead of each sub-block listing them and
taking its own reference.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 98ec23c39fda..a64242c66cf0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5606,6 +5606,7 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 };

-- 
2.34.1

