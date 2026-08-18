Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8C740E8D3
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 15:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068491; cv=none; b=RSRT3edmDo3G1GKAXp4IVaa5/4XF4qY+geJpYXbyoVUd+nIxUeNI+d9LtSfUOqZgvIvqtEl6hf2VpnAj9g8scQ0mIjtndaqj5p20Mrkjr0ynB9Ck4NUtHCZsOYi52jqKvZ45fRKMuE54gX0Z7KileGGJ8KIo6LTZP51LhKbTwVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068491; c=relaxed/simple;
	bh=NM+SVCwRjrTn0Ct0OojvIaz+v6i9CmljcmsXUs7015E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tw0lBR2lPyJlmCYqNU/Z5scIIgAKktU0soy195/nyn5KM8vEkOUIw4wlkbgIfnOlE0sKr0enjdPjaaFc1BKmEFI77E6zE5JZnDJ31QcYGn5sCBCkbCRkn20qw1+KMQM9R0AAOFZb2ap/1fGbC1iU8RUVyt43wKw6NHFBsDKUVNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSGGlsNv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ag5y1FGJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSGGlsNv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ag5y1FGJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IE0ggZ1528024
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 15:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VplzGt0KGttO7fI6MDL4GLu3+FXO0PZKPRbhx5iOWvk=; b=XSGGlsNvbQzho9Kg
	Zb0hgWZx7H4uyNxlO/Xoa9vBIfiK0biFwqVFD/szYLP2kYhEvOhVbhLszYBLYepo
	dPGFvD9wo1+cI4G13XgVRj3A4dAp1BuPAYMwGP8uMEQlU9Kn/TTdl+b5PLiJFwAw
	M9ws4XWmpum4s+v0Zp4L1VKCVumRhQvXY3rHcgRIzgqwB56/oNan7x2w698Hdll0
	GJw5kJ+f7L1ho429uyI/A8PDarirg4xox4MDr2YHg8BAAhmuVabqOvr/+FpI16ZW
	qB1IHw0vYIFYVzqhX/qzH2zHI9kmEhcvdB9+bC8zBRV+3c7hbjy7jgmOg4DVAnBA
	nB4g4w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4qyx0ste-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 15:54:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cea6a46766so130565ad.0
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 08:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787068487; x=1787673287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VplzGt0KGttO7fI6MDL4GLu3+FXO0PZKPRbhx5iOWvk=;
        b=Ag5y1FGJZn9eVXXcnwC0o9XNroXrrEUOsD1qRniX5MkhV4R2R2p0AXHmJr4d2/rS2r
         ntxqqaU3QEKpyTGApSzFHt0hqhLXC3qZQL3OQGBQ1t44U5xL01VLETrERjFALjs2BAHu
         N8prRc9U6f4VWccUjxM1/KfojfAqvO7qk45EhqIti9/O4LKZGR3T77EUrocFsW5GCoDd
         A5YZ10Xkl9HfyLe59atEqQ/+fL9HTwTUA58Abk+59gdcs85Z/ob1ttzTuVgCuPIZ2N8x
         R9AA64bSBY9+SkUL6ik9lMPeg30WMo+8UciYvvrC43iOrD3DKynYCDf1QWxnkMDc8Re0
         YdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787068487; x=1787673287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VplzGt0KGttO7fI6MDL4GLu3+FXO0PZKPRbhx5iOWvk=;
        b=ejXJ1G7LV3/YwnsfgonLRuyWw08l8p1lZz9XRnFwCD6rXbc+gOILz3UmKzYbMCqknA
         hRqxkxnE1kFeYHToJvMoGZSvYbOOfu+24ZJ1nG1FD/56yAex2TvVXJD2+4GNkgi+JSez
         Ujry2/E2MvSmnYr27SUGrU6HTUIF9I+KPRJXPY+gcjV6aLWpUdZhEM1pj+q+PQHunXEY
         Cf7Z0LJLCpQwQ+ck0++1uDttfteyFk/q9h1DMNBtB2FVTilADWCHY521bodSipqmxWhv
         hH+eCC5rByrme8sTw4di3GH78WpnNe6+pTjEOqt5JFEosoOrhYURIKZDTmYobDD98Fcs
         yBoA==
X-Gm-Message-State: AOJu0YwcTQkV0C5WcVvzy93GuLAIcaZvSrx/c7f055b1bxYMOY0aILmf
	xY1gWPqxnB04hyyS1osrawSqA0Ac0j+ng40RqVvy5aCtHIi9rYL7V7mklmXDX1OoYs8e5Zl2TjH
	WDnQ2TQG+H9xRt86TnEgOveqQyaB0Rx+zTxriggmdbHQ48WgRKIFf0wwnI12fS8J2dw==
X-Gm-Gg: AR+sD11DDPxs9YeFelFWypnd8bj2AzUb4HPYhr7Zf0BwjBYJlbJgZyv8CGb3VGus6F5
	UiNnHFe2SqWiWDl2ZwEh9p9HJRK9fkctw78EY7k93G1FW/S/XNCikDx4AMZtuDJpET9P8l1I+VP
	SwHbD9iAkKH7IuImnkiEKvROweX+Cs9X+bsz5CaPLZB5FtlgPsSUEsvxdp7dtHdbjC+xyu+i7Pe
	RpOr4t2s6Q9umAB0PtKegos8K53RlWwiz8aBhVDaXECBGiK/iPJ7IvXiXavzZj+/VInzy8TDDg5
	Po3ATLy+eHbyqR2L4pI7e0zYMNf7RPGd1VV5yWku4e866tKSNoqyrVYpdEbSVVF95L36Y6SSjVt
	BxUCCglgCS4hFTim77UrWcVM72ycIEZzwLA==
X-Received: by 2002:a17:90b:278f:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-3955a7c464bmr13640469a91.13.1787068487476;
        Tue, 18 Aug 2026 08:54:47 -0700 (PDT)
X-Received: by 2002:a17:90b:278f:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-3955a7c464bmr13640382a91.13.1787068486871;
        Tue, 18 Aug 2026 08:54:46 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fbb41esm8877721a91.10.2026.08.18.08.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:54:46 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 21:24:16 +0530
Subject: [PATCH v2 3/5] arm64: dts: qcom: sc7280: Add dma-coherent property
 into venus node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-iris-fixes-dma-pseq-fint-v2-3-8dc8c4b3880e@oss.qualcomm.com>
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
In-Reply-To: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787068461; l=1397;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=NM+SVCwRjrTn0Ct0OojvIaz+v6i9CmljcmsXUs7015E=;
 b=OgtH7SwjOfbutdA32u3izUhOzp9rsimX/RNBwDxYSTZyfJZF6qsTp34Ukh3wBNtwbmdVkbW8x
 pREOpr5kWa2Cy9CrYn6o4DEOLYYR6iOKeG2/4Svn1rvsvPHAHKlkR1Y
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfX2IMDtBqXQ1jf
 z6XF4sJEkhoEG3UMC1jVHj80luy1Wyc9bPKZ9d5SQ5SGCSUZA4FBhQt6sd2XSyowTCCCvhdb5TG
 BxPo7AJ1UlpnftiJ1YivvyTJb9ZEyyg=
X-Proofpoint-GUID: j2Y_TJbPEyjiyGS2HwF-O_82BrAkUt_m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfX3Efw3y3VUtku
 HfdthWbkuLoGQVlJP8JPXJ8bjn4v9Y6jaTpP6WcT/ZuQDSZNefyZy+RzmR4p6Y6Y9VRRidOD15U
 1qGhhnFhC25L8DIFdrIhWfibcSnIAJE19h8JSyf1x/rhxXPLhra1KUJVxpr5zmXyjMXPuL9ko25
 OzauaOfTqta9Pb1dqNSOCbo0RoSg9ixhEMWgtT6U7Dqg886r8CEyd9p5dwF66hbCOmgKvA5c7bZ
 LkI6eIfE3b3SQUPB8GXNY7TyfFlmKtO8l3dMhMKUoI0DRIVHxq+7+y08nhyYbgRnItzhoz15F41
 iN5ymOFZuMNlso7VOCr0IlmdEIT/Q9rcDBx20ekOlYVlquo+TogPhFTwm6Vyg26/fHYpYBprKcp
 ITyRdICVX7dcGbV+t1vp/PokNVJEGVCpC3KQG0U3V9b7KqPIcAcTrIKDi2h5cktmg4F2PC47psL
 JvzyajGzr5VOUvFAjkw==
X-Authority-Analysis: v=2.4 cv=Ad+B2XXG c=1 sm=1 tr=0 ts=6a848048 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=wmxX9RSyIuGEu2EnybwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: j2Y_TJbPEyjiyGS2HwF-O_82BrAkUt_m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180117

The venus video hardware on SC7280 is IO-coherent hardware: even though
the driver does dma_sync*() calls for the input and output buffers, the
venus node still needs to declare dma-coherent so that the DMA mapping
layer relies on this hardware level snooping to keep the CPU cache and
the DMA buffers in sync. This avoids the unnecessary cache clean or
invalidate operations performed by the dma_sync*() calls, which are not
required once hardware level snooping is enabled via dma-coherent.

Add the dma-coherent property to the venus node to describe this
hardware capability.

Fixes: 37613aee2179 ("arm64: dts: qcom: sc7280: Add venus DT node")
Cc: stable@vger.kernel.org
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f2da3706d5c8..b8f5705ebfc8 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5025,6 +5025,8 @@ venus: video-codec@aa00000 {
 					<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
 			interconnect-names = "cpu-cfg", "video-mem";
 
+			dma-coherent;
+
 			iommus = <&apps_smmu 0x2180 0x20>;
 			memory-region = <&video_mem>;
 

-- 
2.34.1

