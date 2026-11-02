Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616149;
	b=hXyXbxQa75GVFxTjp/7KYwtqEuG4Zcn8C3EKqJiovcaNeLj0YWVJymLM7qxnxsiET41P
	 +o6CJ6umMbGYKzNHF8FLGJWU41cvKTOiw1vShlMNq1sk5jwhEjAM8oIAmYhWFlIv6/E4A
	 ISKkhK+MYcL49G5tU0MnWxksB3gZn639dYi/35ic+7CILmn5N3HjIqyc+/9PjV4dEdhGB
	 5Sv8gznTCvgN/iLySqzvD3+zaBRUak0bCst41XGqGPIKSJIfP/wGrMm2RQfS0xVtzNFgc
	 g9TN0TE9L+8wthFxS+0vEju5O9WP0x1ZRh2N5jvDZEfY3AkBCsOFSYJWRgb1adnEtNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616149;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Um07vBM3gsqnJtvymP7VQb4GOHOjEPUnXIoHN/ARP/c=;
	b=kjNgnNuadLEKhtCVRCVPhuiXS3aPCXxOzF212A/nRUyY6WNbWF6i1ykaNXAta/Ht0a+7
	 UIHUl1781RUp4WcsmbSiI8nZIXasW0M7bh4gxagLlXDc0aBpielACk4tv1IPkRnIUCMO5
	 LrfThAbLFUDIXvo8IDS68PIPqeRGT6waeoxNOEuHY1J2qZl67atpNG78vydVdSUWjaoBs
	 +NkBWO+wj3fHwZKIuU5Czx1qG42e847jHxLwCUA1PwbEQp9lE1oROum+stniJa0NI78wU
	 boWwsInLVBGueRYhTao8vz+SHuPpbaouc6XP1LCsQgRg59CHy7YUmbPQ2Nmk382+PKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jGc2JBXc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFGNo4B+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1D760A261E
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F1D760A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jGc2JBXc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KFGNo4B+
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ANGs1821268
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 10:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Um07vBM3gsqnJtvymP7VQb4GOHOjEPUnXIoHN/ARP/c=; b=jGc2JBXcHRzAaY2j
	M2zTSW1A8OQVIx7MOuSKUVYMzqUJfLubyC6g8QYIJ/sh3rfWfu8OU/MDQe0kIBrm
	2racFMZj/gcYDUov75XYNb9VLNfyYg/J7ESr3Lwk4eVQanGlnDCfhMrUalFP0ago
	sfGaKtvOmBHyE4NuYld4uzPkh6vHfL9sVIg+ns7HQbnV9DvjVgu2eTrzyB3UnpKf
	Qi0mnyiatnym4t2/yuxzMUHQjU3P3KyngNiOqxlMwKgFVsk8L4XzAKqaTmOvR2QR
	X0x5mOhKmPYxeRjN7ZbjhqNdWY18S0Zej3A4L6+xaVdYnCFRkhQ8a33vvkv/NARZ
	DY2Q7A==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4h8v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 10:42:28 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-44899f99756so5258928fac.2
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 02:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616148; x=1794220948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Um07vBM3gsqnJtvymP7VQb4GOHOjEPUnXIoHN/ARP/c=;
        b=KFGNo4B+DP4btSo7/2YReGJhFsHk073linvZ/GqiY41NhZpJCDt71j7KEiBhd8BTWW
         xK0E88ndYiCW1zN3t30sp5Os+qBPve771yJrvKVHyaRZG+0bb6sfe/xTGqei9pFrCsR6
         MAOy4qXZjyS/NZIX217vKNB/+vIHjINn5BAhoPXo6eu+GstpPGvZusZP1rm/RlAbH76F
         3nZ0EAVYBxO5TZFRaBx4d9Ffizac2lhlhrDY0djZnFgRkQaUUuSYKY9Ha/+oY9CaOvhs
         CTViqXZpRDR+ah0J/2jpCFUhL8QOUONz84oNu/NZqbAsRDlyV2jHlD+hF8A72y1MeOgf
         Pijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616148; x=1794220948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Um07vBM3gsqnJtvymP7VQb4GOHOjEPUnXIoHN/ARP/c=;
        b=0e5yzJc0n2EOzm9KCiJEjkGz8ktF97PTNYvou34R02+78SQawntyTkFbFEvHk6eaLr
         SQ5HWiXCkRSs4hw7WGpkk90RplhS2pQBtBeZgHOVNJm83SJHyND13R6pA/xs44EGyeju
         33dOvb/m3d9p2vDuM/KndZvHKrIk9e8VB6FfzQ3TLDaMNxBlB9sQwLujZbifLoIkt26o
         SiCSutfw4YyRKYvw/s+O5hvPGigfJ0xx/Ft2Otv9FFv848CF1QtyBVUsoptpxGvTDRXA
         wajV6tv/iPwbFtJzBhEZz3x5/QVq0aCC+gOnjWWhhlln/Lm0+QmHQLcEuAl8M2LwyrbJ
         hjHg==
X-Forwarded-Encrypted: i=1; AKwUvByRpZqYywSaLagKOfD4ueQNn9qyOFf3MAS0unEbomSkv4AZEJFTphPiqWteeaWPGmlh0LddETDCdT3Iow==@vger.kernel.org
X-Gm-Message-State: AFq9FYK/amt6qufJNKTdkh89OoH237jo7d3OHTE7rb5mJXPzUuJW/75q
	AdFsb+hevEfTvudn3yxp5+1gHRq9Zyu2IbVcjjCpeD1O3s+3nlMEQ0ldJ8Ot96G8EVOGQwf/5rY
	mzdHsHivW++fM1cHlTOrhQcOvz++YI3vSnhZHYGkRpChYFqLGQYS+Wz9yQ9Pc9gNEeQ==
X-Gm-Gg: AYBFou0N8ga+zGefus6KmvCUYhYvgtp2g95AZCbHnqhZgW48orcGDSEQgJf6JbTfRTm
	o4dxS2nx3Gz5UilKopl6iekhoKNc+V5A40fo3I6U7Hvc+hV6ikrlxZ37CCzJBPf99HWTGXmqpin
	tKmbXs0VuTQmoLeJsJV6Wd3bED8RqUs710EaUO2piqHnwQFAte2Kizyg1hkEyVLCvpxifPUNNVH
	B60zBMcUq/ON6HKwrUU/y50R8q9yF5ld0dNT5LcmDdOMM/pr7kztGWr8moHc//nGVlwVe5e2kSv
	ovTwlLj7/C8syEI+GrE1YB/Wq2EDqcHimOdsPlNzN0c8TWBQpDP7nD/rjMtIJIABbwA5DdwhCSh
	V1EEnX/0+HXtXir1mdArnwFB8FSnyMf7/jbL+0NMaQMNsnSNDYSPpkn3GeWmtAycljmrDG5ZLCl
	pbQ7HQ3nX5iGBcFM/9ORGto8SOuVTK2SL3yxzw8E1hrPpnN/rjAWe4ei1s1V8=
X-Received: by 2002:a05:6808:4e0b:b0:564:3fe1:2f95 with SMTP id 5614622812f47-5643fe14f4amr2068874b6e.56.1793616147952;
        Mon, 02 Nov 2026 02:42:27 -0800 (PST)
X-Received: by 2002:a05:6808:4e0b:b0:564:3fe1:2f95 with SMTP id 5614622812f47-5643fe14f4amr2068846b6e.56.1793616147534;
        Mon, 02 Nov 2026 02:42:27 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:27 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:14 -0800
Subject: [PATCH v24 06/15] media: qcom: camss: Add Kaanapali compatible
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
Message-Id: <20261102-kaanapali-camss-v24-6-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: QVrQKCpvgf4SCIF1w2BPEcyBDi3NB7uI
X-Proofpoint-GUID: QVrQKCpvgf4SCIF1w2BPEcyBDi3NB7uI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX/jtdAn3j+xdt
 KniN6CRdUlcr3hqsEASuJImzCJQHNEM5o9DDpjLXJ5n/F/tmCQyUayf9mJE4IETv5CTZCkch5fs
 bigy5i2wvMUi2mDkNmL237S5GLaxxKU=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae86914 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX9Dzbh3qj3+V6
 JGXr0Mj6g8abZODKuKyKAhNLgelEg7xhKcKzP2eeA1lVijsdgiZE6/6gaNOQHjxxOgTmFFrYiQC
 HPlFdOZpy1bIpIJJh1bVJXnsJIa3ABjoiDhvK9i9hJQmaE5mIotipdhElroK3pIeEwIUbsBnDp6
 N0K77rTnFZwW5oju44r6Vs6dVuZKs8NZM+Lng0OSX+lUzWYF6nig9vio5yN2bR5+qFzFgC8Yfbs
 IH0YEBFMv5ECcq1jo35Yoy+tM1lcb7eAfAqvQ0RPTCq2QHe4EBGTv3am3sRX7aR/70wgXeZqV3A
 5nKSa86TFUjri8CW7VFzpVncaUmoxzcD1SwPudtuG/ijWPBZJCmJ5V47pSDUj8eaUz3lW6zlPdS
 ZLRyDWRj30Ri2tb6FAHGOKq5HFWw7ekgb+AGOBLyt0ZIhi7nRIu+AW6K30SjujCrbKML2PHkfFd
 1sAnfK+F5gSzIvsWloQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data includes the ICC paths and TPG resources
and sets the CSIPHY count. CSIPHY resources are not listed because the
PHY is probed standalone. CSID and VFE resources are added by later
changes.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 25 +++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index be58a39f4a8b..385be682e8b9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	}
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5589,6 +5603,16 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.tpg_res = tpg_res_8775p,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = 6,
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5823,6 +5847,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 431afeb381aa..97fec24e6804 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1

