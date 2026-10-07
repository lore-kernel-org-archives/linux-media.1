Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A090B48422F
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363745; cv=none; b=kvqKKLxK48GcGWMyJGMVe5QvFcNOZlKa/TdFKmgPYtfiLbCOrP5K2GpMgHkvtfoBN6odphg4Q1s6DkVo9nJDbgAqTwNsdojmSY04qWq/Zh6e373Np+A5LlHX+2hZkuPC2gioDy0urC+guw++H0BAGpqUvcGgwCkPUMS9kORRgy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363745; c=relaxed/simple;
	bh=VOMacKAim2NeRKzYRGCKCM59giQCmbzASTn2t1LQzPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AwlMFo6Sznm0LIzgrob8FfkS/iHnXzyZpZeouscoE87LVkn2dQLf7t6Mgyf5jKXzdHHhe3X+CrhE9D9sRWqkvVaqrspmm+2lRxXnXejVPOzcUpEgbc9E+Xx1LAvyg32b+iVLe0VPvcjKFKnlJZlKWKLCGVPa5dAeaL7APiHBn5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HH7Wmike reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HH7Wmike"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jgZC2969757
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 09:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zwweVgbuw4Q
	eHx19ruMA4VKdQmD4Y6znPZooowo2HgQ=; b=HH7Wmike1lXUF8mARPRXqCIO8+t
	1rgK5rDHsaeBo/TBKj8+bXQioYfHE8Xfq41tAckbE7N7iIu4lt1TD/tS1mWVxKYA
	eu8+NOJpPzvsPa+WwG//pq81Jovs9HxdUlJy3uWHWoR5M48M+MpAdGSe1Drj/2sT
	lv32CLUL2zIMTGYZ29UrIOd6fLWEMNv0bUsSUh2Jwhvez6bk5NWGB3Ts6VSSWuI3
	Yx2tA9ZQof6kSsmQblUslBpTB5WMYBA7pfGnDWxWW3jKU6xsHAHO4EiCkb381ZxX
	9pWuzxLDS8A0RtLZ/acsE87OwHBW5irb7cOWd/556iXUrlXue14GC8XAZ7Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c679but-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 09:01:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e46b4b700so635876785a.1
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363715; x=1791968515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zwweVgbuw4QeHx19ruMA4VKdQmD4Y6znPZooowo2HgQ=;
        b=vHLLS7M5x/AsS+pXQ1ZCGaM4up/2VEqtyQU2knueRXzj+sSN72lgBTPAoyvc41GE4N
         blIBdeKt60nTReCUTKIeHhfCgOCpFTC2pDtd7BUQpbn70PWsh4HnACQlgvjZOk9pZDIZ
         lPdVWjBOxVjaalgVrtvZvq64IyVwNn5+5iAeNmu/CDSnQY8XEi3k1suOFlwASUgy/8SM
         YPepKwitEIncn34wK6oWzOctwUpwA62HkmoC1Qvu66HczOXfToFDqxIxqaaTc6HOBFjy
         0Jro3c7coAcLC2+iR8wd/DWyhZtcp7Z0qTTDJ+pTzAgoMFVk7AyaBVuNMPxTl4znGO9b
         RNMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLFF4yWTyuX1UVzk6FCAFrRh5VyqisbuzOdRzlaHxOtmYfGQN87jFtvWsnJG5cmrmt/XoVPC//GUmonA==@vger.kernel.org
X-Gm-Message-State: AFuF++kvBSOOazQB7YHHiXLScpZkLAthHJy5J4yoYeJ34UkzfkyKukAB
	xKUJIrxPruGMEMxdQB2jbm5PpoWu5YBVRaaJEnD9vp8bChU7cvFwJsXZOeIRcSvJsOzHfF/qjLn
	tXwHSXcGY+fl96pzm4kPTVi6J2uZUngGsHa71esIaZ+Zc3GlHWA5qPX/V4lgo6ZFclw==
X-Gm-Gg: AYBFou2J+oao+Fs34btFcP2Gt/zKE5FuE5OIMImstE0kZ6l8k3lIA30bLzSiFQIIJr0
	DoGd1Rs5bcLoc0+kL5cdgdjHcm0gASzqL3Rsr2Mg6empbtMkzsQFuOS4HpSnfGXGDIKxxB8yyGZ
	8NoIp56zIDvVVuurGvAcgl22s03zVTUtugczmnK5K3koB/UNzdNb53vcSpGDf1OU1/crdt+zozn
	1UCswCOgC6LyRuvMuZeoeyfSOasdy4ZQvgxSUonPEMpN2e4FJHvjniKej25rw3dlTpVFnhB9Zfq
	FQ+srbHMQbpEUbjGk0pzXlgsKmpObdegPyFYOu7Tf10lKySG9IokrTao2pE=
X-Received: by 2002:a05:620a:890b:b0:93e:9809:838a with SMTP id af79cd13be357-93e9b8a1cfcmr290931585a.74.1791363714831;
        Wed, 07 Oct 2026 02:01:54 -0700 (PDT)
X-Received: by 2002:a05:620a:890b:b0:93e:9809:838a with SMTP id af79cd13be357-93e9b8a1cfcmr290923785a.74.1791363714297;
        Wed, 07 Oct 2026 02:01:54 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:53 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 19/45] media: v4l2: add Qualcomm IFE statistics format
Date: Wed,  7 Oct 2026 12:00:15 +0300
Message-Id: <20261007090041.3732717-20-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX6hREXtDmaFA7
 1sOa9ibE9dQkvVZ+IQ79d5UPhOdQ9nsaMXIz7OdTZHt+QkyY8XVSRTbbqfQul9SKGAPPX6Im13x
 w5HqdZtpmwGzm5XhQNYjy9TjV/bc8xk=
X-Proofpoint-ORIG-GUID: w4cxUdRfyTwGWVkhQicdFGgApzcwAXBY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX+PCSDZZp8SMP
 8CHT2TjTwQRounNbcxXukJKOQcpTgLi6z0JHzLKusk5JJ5eO+eG86wsGOYtAEFuks5/tVRs8REW
 jjRzY5I3lmXcKyhDsJPrzTbjMSmH87T4gwbllE463eq1D1MyEarOuK0ymOPOwxr8nk1ZG/KUAsX
 BPjnTnPwCmYtb6bYERuLUfix4zpU8a+L2vY9XwTu/3KId8Mot7LLdnaKzO5fNsneOD31aAjPnT+
 /hCZakVM+UuOHC9vxC87smOMYXWaOs3e4PDxbXNOlEsua4yiAg1aAdEUnagFjBtPfsRrJWdDRbJ
 Mlh/JJwl7tbngAd+1CE6gCPOLR9f+cFU9KcSBAyhrVoqJXMJvspHf4OrpnGjhubm+cgZ9c9cKnN
 rN7XFBDCqyHylHcExaxGFDq8TIxIAdsekLPqy3UW8T9yJ4iPyrxLVMjIo/pSgKFZZdT6C119VTj
 7UUyMvkooNovcxEnlOQ==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac60a83 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=ayFhjqOtJfiHK51EeDoA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: w4cxUdRfyTwGWVkhQicdFGgApzcwAXBY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Describe Qualcomm IFE 3A statistics buffers with the QCF1 metadata
format.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 3 +++
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index cef1593c1835..b7173a258225 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1467,6 +1467,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
 	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
+	case V4L2_META_FMT_QC_IFE_STAT_3A:
+		descr = "Qualcomm IFE 3A Statistics";
+		break;
 	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 70208a9443d8..4a0748b60a15 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -876,6 +876,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 #define V4L2_META_FMT_RK_ISP1_EXT_PARAMS	v4l2_fourcc('R', 'K', '1', 'E') /* Rockchip ISP1 3a Extensible Parameters */
 
+/* Vendor specific - used for Qualcomm IFE camera sub-system */
+#define V4L2_META_FMT_QC_IFE_STAT_3A	v4l2_fourcc('Q', 'C', 'F', '1') /* IFE 3A Statistics */
+
 /* Vendor specific - used for C3_ISP */
 #define V4L2_META_FMT_C3ISP_PARAMS	v4l2_fourcc('C', '3', 'P', 'M') /* Amlogic C3 ISP Parameters */
 #define V4L2_META_FMT_C3ISP_STATS	v4l2_fourcc('C', '3', 'S', 'T') /* Amlogic C3 ISP Statistics */
-- 
2.34.1

