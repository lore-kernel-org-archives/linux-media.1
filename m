Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3904D4399D5
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 11:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804998; cv=none; b=CGHZGelGuCgO8b3016UrHaOD7X5sCdYx50BeCvEzYp5Bb5iCmvAX2osEBuHqak/gD20PyUvEvT2W4YNl3aX5KHowV2BVygBjH/TJxD3kzd8xdBAXMCQLNDYO/oQk+W5XEbnU5KQPjZpsQNbsxXV8irAeaQcEq0VbN/p6e0fktLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804998; c=relaxed/simple;
	bh=SKWhPK9r/CD2ee55hEiraz82UixFWuEJolMCsudUorI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GDVxd2mrfVCPDDhNxSuDPEX1N4ntC2yVmvnIUS6nZJf/6Ogw+slUOpv54zZyVIJevTVASKvJvE9VmXnkHsw7KhJIEyI9wzlSpRhX5STU9SjSDkuuESFXWlQyOr8oO3TRYvmvBMrsgRrnJ7Zexo/MOycHPVxyBVAhB2EQ8d5I6A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lc0onpeF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Onnklhw8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lc0onpeF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Onnklhw8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qYAT3390475
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 11:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CHoRBXMfdQXDX9QzatQyMVjO8U/itkAz0C0
	aNlKdJAc=; b=Lc0onpeFNzuvujB/ZpSyTlb1FCZPn6ECdlBXgCgIS9pzotGKgCo
	jHAo+QfMFL1sDwfZi265kTlydW9+BcnagLYZUS6GmFtA6pvbitbG2+oVkDmy6bsk
	GzCBfneHky9vuO2wMmVQnAIeJekCz0OTO783zh+1zXXtXnXhlMCECpZ67o7fnj10
	iEs0xfTdCxVZEXQraq9vCDkHjgE4pvvaOfATs1QRc5uMzTxQHG3FPWIw7PvzbFoZ
	Ux0gUJKr4gsOwjeuUWNWSFzqCI5N/T3Z8d2sGa6Ul+iLj0A4O1PA2KrdTegSImEr
	0Oyc8igR4bU/QDfEBn1p/Hwm3MVMEDayh3w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke0ks0gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 11:09:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07f25de2so7436691cf.3
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 04:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804995; x=1785409795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CHoRBXMfdQXDX9QzatQyMVjO8U/itkAz0C0aNlKdJAc=;
        b=Onnklhw8dXsvtszNQ4nLtgsudqrEvcFScod4XchZuX8dDopJN0C+yhuV0BB+SHublM
         zB8Zs0ezjNSyMsipC1a4ivcRDH63cCQeHeFR1NoY2jnzjwM7romStF4WMHgLwl2Jlhj+
         781E/ULlBB1BagA++Prz9Op7yYp/6En3TN0N12qNgL5e2TQhWDZt/L2fvGzxdCfzLGeh
         Jbjmno6pXLMxIo5GNG4ViSzmDYjDqL2ySznrcHl4YalbeR5FlfKWWc6A/cnrnsmHfchC
         hsePebORmDhXq9SuiF8S1ZczX+ThgebXVUmfSdv3bGCh5oOgsOdWPdarqT7qbCDb9BIR
         whVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804995; x=1785409795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CHoRBXMfdQXDX9QzatQyMVjO8U/itkAz0C0aNlKdJAc=;
        b=Oy7XfRpno2rKgu3ez6Nb8NdB2Cl4dktHNCdfnLHZ/u3SnrDYgmij++WVdmA5EGAWRI
         7NtVNaQqe+kzCe+h4aX08SeUx2/UI9n7E6YrDhUjtezCawPevbd5k6BZNwoPk7ZLXtBO
         84N7NRRo5V7RH6SHKuYYQLfAA7qbOCK/sHoOs0fz1nefKkWvZpKfZYCQwXE6r0joR1A5
         Rd24InBdqpjShrxVw/uSAz5jq6efK68miGpVn4X89eS3A6e73K6sl5qbGWg6SSEO0xiE
         cU+UuXh/EFlFOOhEV9MRY48J3/fltdqadKr6+Rqj7hYG+NFsJP5+Wmxak5g646Gz3MGQ
         YD+g==
X-Forwarded-Encrypted: i=1; AHgh+RpdoUaymifIAZ8jxHpGOSLKuBu32IdDE52o9XKBjUe/nczJmBwOtR70BPSnHyyt8TDXW4DvnwKgzeqW4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE02p5SxN49xbf6qtManEeFqF8ZH1zka2pZo5VVCvE683DXzuN
	sun6iS8/3Q/LyvZN5ERqSbKjlk734f80NWgeM+QOftHn/GUszQ2gddJH1tgQQxhgXgqZ6GF226k
	s+tIO7fD7ElOTSjkQj2bCzJZObR7LCFhRatl8WJQkMzim5RdsqOxlZeqjlz8SGsQWQg==
X-Gm-Gg: AR+sD13si8RLuuAR2zEk/nSVjL5M9BLPGTgQMKcNiVpm60Xtzi4yc5BhzIWkioXJiUy
	+Io82txuBRv1vzTRB0M9xY6lrv0uvC/KGuZwroWa7VljzMaTLAgrb2rOcR6fjlXUv3ICM97U7H9
	JSjv6QiGD7L1M+lRtlnxdyxawmbwJoXS+lP+n1+p/4lIGYOZ1LkN4q79zVztmxb9d9w85giSE4q
	XRorOT3mIewqTtn2/vHRDq3z37UXUkZrE6sjTltx35lbaf5toh+taA/btl0whn+3tNi9DkMFmlf
	yify77uCFgHdwHJa1i3d/NpJOJCaeBIudNSPQ65sfZfuMphiJsrxex9Jr1ESi8E8XqD69Zmwy6D
	grpVU+5jRxtDtVT/xbNT8TMr5ZfxL5w2266/9KMoHSLLqg03b8zto6TNwqbhwn/Fdxub3YNlfvp
	chsVx4bOKwRmnX8sk=
X-Received: by 2002:a05:622a:2307:b0:528:1dd:628 with SMTP id d75a77b69052e-5283dfbfe5fmr21224361cf.72.1784804995034;
        Thu, 23 Jul 2026 04:09:55 -0700 (PDT)
X-Received: by 2002:a05:622a:2307:b0:528:1dd:628 with SMTP id d75a77b69052e-5283dfbfe5fmr21224021cf.72.1784804994522;
        Thu, 23 Jul 2026 04:09:54 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f11af2sm214176466b.57.2026.07.23.04.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 04:09:53 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH v2 1/3] media: qcom: camss: Add "gcc_axi_hf" to 8775p VFE lite clock lists
Date: Thu, 23 Jul 2026 13:09:50 +0200
Message-ID: <20260723110952.55597-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: javh82GPVWm87DYFsUUpEALqd1mb6JCd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwOSBTYWx0ZWRfXwD4fL7MT8QTV
 KTB6OI63HwmgHghbNB6ZywdSpz6YjWJBPXmDa6DCm95HZcWnqHd8sy8qNDtGPz7S4/LDKEL/564
 6WyH1s+EnJcBiGIySa/TjEopKod8a7I=
X-Authority-Analysis: v=2.4 cv=S7DpBosP c=1 sm=1 tr=0 ts=6a61f683 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=qncfPZRv0pdA0gtCnvQA:9 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: javh82GPVWm87DYFsUUpEALqd1mb6JCd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwOSBTYWx0ZWRfX6YIdoOHO2BWE
 tc33mqfm/ch/SM9pDj4gNkMSHFkVRIt1k4KTzlQCus6bP2OnhrXPKqxXOufHjbr/i+rJt/ImKXk
 6ZOrjS+QhparxaoMisks+OmtB8fZlmLWi8SsOLKw8Oj5BlGGSOm7SorUmP90LuW9TUJm/PBdbh2
 mxn2AWjHlJTv8NOS//O7XNnbzIFdNx8fK1lgq6JzbqiBT4Z3h8mLU+8/Oc/5g4405/COR4wPiNV
 mjKvNxOz4npW7UpO4G93adAA0JU/hA0ySos9eZD1NI74/9QnNsb6tD9AbvJoZnE8GpZdtjkONtJ
 FWQTAkSmdOF3Qh5QT6AU1ly3KPi8XE+G3/Bw9UbL9l8FTNgq2c7PU3ca6AgcK9TkLP0AbHN/hEz
 AQeAfMK1RtErVbW1jR13vLMLRrvL6wZpWqwUR1YqkxkKufhAbp+DjTz2UdCT7yYfQEpf/n6y8LX
 wC1sLMWfmZYTg+Lqvyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230109

The "gcc_axi_hf" clock is correctly listed in the clock list of the
8775p 2 main VFE-s, but it is missing from all the VFE-lite clock lists,
causing these to not work on platforms where the firmware allows turning
off "gcc_axi_hf".

Add the missing "gcc_axi_hf" to fix the VFE-lite blocks not working on
these platforms.

Fixes: 924f45e58b1fe ("media: qcom: camss: Add missing clocks for VFE lite on sa8775p")
Cc: stable@vger.kernel.org
Suggested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v2:
- Also update clock_rate lists
- Add missing Fixes: tag
---
 drivers/media/platform/qcom/camss/camss.c | 25 ++++++++++++++---------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d..68491b16d647 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4037,10 +4037,11 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE2 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+		.clock = { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
+			   "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
 			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
+			{ 0 },
 			{ 0 },
 			{ 0 },
 			{ 300000000, 400000000, 400000000, 400000000 },
@@ -4062,10 +4063,11 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE3 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+		.clock = { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
+			   "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
 			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
+			{ 0 },
 			{ 0 },
 			{ 0 },
 			{ 300000000, 400000000, 400000000, 400000000 },
@@ -4087,10 +4089,11 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE4 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+		.clock = { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
+			   "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
 			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
+			{ 0 },
 			{ 0 },
 			{ 0 },
 			{ 300000000, 400000000, 400000000, 400000000 },
@@ -4112,10 +4115,11 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE5 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+		.clock = { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
+			   "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
 			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
+			{ 0 },
 			{ 0 },
 			{ 0 },
 			{ 300000000, 400000000, 400000000, 400000000 },
@@ -4137,10 +4141,11 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	/* VFE6 (lite) */
 	{
 		.regulators = {},
-		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
-			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+		.clock = { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
+			   "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
 			   "vfe_lite", "camnoc_axi"},
 		.clock_rate = {
+			{ 0 },
 			{ 0 },
 			{ 0 },
 			{ 300000000, 400000000, 400000000, 400000000 },
-- 
2.55.0

