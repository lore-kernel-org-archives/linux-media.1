Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6998E48640B
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363755; cv=none; b=oYMcxN5L7B9A4Vm+Oq746/V1W9tA1YSFi0/dp76xkMxqQYpfC7a6cfra9oF1wU0zboT2KGyYx1+WnmfvytDK80FaHaZ0P/1sXXWOZxNPSDLKbZqoqKVJQSQVenN3bJPOl9fvKwpLERKiBFpvUINMrVn330uvlFaRdYqpApYUcWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363755; c=relaxed/simple;
	bh=6Y6z1JDeisJ2Nl0/RT2ILCUl8kE590RGswDtsPSxnfQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=frysS6659rBHDRhFdZwYdFgFzhDEhkn1xjEzEL9VhCo4th7aMJFdFxSTawNxFab3OciSyEG1Y2S7VL/Sl39PZ6jbukp35IH9b56FXo6u/cv0ODiAf95+PwgBt8wxqWSLzDZDtaxfSUKwvBZ/dAKmMbSzjszaLjZHRzA6z15zhrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sn0+CLcJ reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sn0+CLcJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977k38l2711704
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 09:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1Wprkf4GoAH
	etdPZnQoqyiufpWRYQl51t90Ivzv6Nlo=; b=Sn0+CLcJ12M7Ims03pjAQzMxsY/
	7Xe4uhqTKxDUmYnz6Zu5h8xzk+aSRFbCLeCEFEgEqeuNZiuMy53HiEFmA80ZmOOy
	UuDL5O3+xElLrTU6CP68TV2cwybIJoHNGCztKMXPhFoSOXVUxbTRN+oiGbcYursI
	hZWifqjsflYi0RxzzTvFcP9rRBng8VIpemZUlVYodKGHCXCr6mq1/96gj4t7qzUm
	8rS7z/eZBfIQdXxxw2VG/uTVwfgyv1hn8UeOdDNAw3nrDDl7ZatSzR6UqAnRO23K
	SJDKj2l0iVF2rRhIF3yLZonEz2I8YoymhRiWzY7VI7/OMI9Jj2zCJEThs2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s1d5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 09:02:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ae8e7e546so726638285a.1
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363725; x=1791968525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Wprkf4GoAHetdPZnQoqyiufpWRYQl51t90Ivzv6Nlo=;
        b=xUo/i5Ycj//HyyN2p+oQcQLYVFfYWU0hSA02n5iJYgRGQk5s2QZdGU/N/MrNiwo0Fi
         fiTQnFIeUyO61wDXsVoVfh1z5OyOotBsbq3IrKG3bydCEpIH1u0c/j3t/7jbhNaNbtC6
         1qbdrDfP7gjBPQhE40HDb1X7ZoQDU0iPP+Z3exZlaMbAjnGSw3OAMbzpnLaRARNDGHdM
         +w9tLW8U5PuSNBUikGZRu1L57RUPwTqC742N842ZCf2+vZ1JPDFn+DDNeBWCNmclO5LL
         vpEFx5IjRGvqxmb03hjUEKG2qDTCJupe/tW/TWRUVxLmZUwFrFGyVwK6U5Z6+v9tN4F0
         6kyw==
X-Forwarded-Encrypted: i=1; AKwUvBzckj6tPptf42jHt5Q02QPT4vQrFu8xWliils+n//u0Q3x5Lup56EA7ptIZT8aeNxv+fhhDqeQhVra0HA==@vger.kernel.org
X-Gm-Message-State: AFuF++lyt45Mg7CoxcXjY7jQVMFkkrvoulZHYjoQyR+0s3N8gPLFFqEC
	V092AJsM+fMkJnx/IHCwxvbA2V7mRU0JYezvc8ScVHnAt1eGeHHxyMxue2y4RXwVxEYqMTBZLOw
	EGDm1HlibGjJ2FCytBPikyGiMmUcilJxt2XenU1WtzHebKiS7JO2ICJFhw0CZQ0vjlw==
X-Gm-Gg: AYBFou31YQoobyUDzcRVMn6BsyTjv85ALnT/h+vsCsiDbt0BzbY7cxiD1aN2c+U7cfB
	K9gleQf+bxNFJpXPWl33rMA1l0j2NEFJ3knJqKCpeGM2kpEkrzBFzUCbRrvhVZ/76ft6AfNHthP
	VJABUeBqAcru466NCNGJsBWyAjHgXIWX6rwFAD2IlShoktX2096jBXAjXwm/XWx+k7aNyO00yIM
	AST/jB3kUysN6sUFEC5itxeny32fvo4YD4fqWsZ4ZcDchD31duZNOVgUeh0Ne4N5/MqThVkptnA
	ZoTlVnDmBpVD2j6EQ2Zsf7oqQge8gQz+YYswA7/jssBblNZRKblJ/DJm0M4=
X-Received: by 2002:a05:620a:8807:b0:93e:458b:6f2b with SMTP id af79cd13be357-93e9b6ff7bfmr284555085a.29.1791363725259;
        Wed, 07 Oct 2026 02:02:05 -0700 (PDT)
X-Received: by 2002:a05:620a:8807:b0:93e:458b:6f2b with SMTP id af79cd13be357-93e9b6ff7bfmr284548885a.29.1791363724650;
        Wed, 07 Oct 2026 02:02:04 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:03 -0700 (PDT)
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
Subject: [PATCH RESEND 22/45] media: v4l2: add Qualcomm IFE parameters format
Date: Wed,  7 Oct 2026 12:00:18 +0300
Message-Id: <20261007090041.3732717-23-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 5YPsw3YZ6Aa6hoipIGI80BQf-DEwxEIk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX1kweS0NnB6tU
 zIEcEzuZhbeOljV3CDWm6G13bpb035sRCayBkw+RWSbGVMhqEwziScmyGA0Q0p7kkP2M4haVWsU
 1biCmCht0wUZtZr/4CN5WlL+ZdfB0v7vIKrAvje4YUttHXCBQF98x9QRJr+CNVS7wSObPkA0Sk8
 WUnxYymKRlo2KOEFEZHpuNNcgYMDj/NbKnfYytd1lSbiurLEZSjX4Roj0K5gWNS5DIi72Kje5Wq
 bMY6Pf/A7mNJR2SgOa7VHFPw8degd7r/3xDSfkcHxE0HjIMnmlmqJ377MHD+APyueQO8uscS3eN
 bwWAEiXJi3tbuuyBSG4mVE7q2I6dnThBDV/UM1OzL9lUtBvaDLRqegWE6JzkHVHUGY6BDFAvAc0
 xdEk9hwInLfspz5BQfctMrGuMiFvxV48XreHCcH9AWVt4lynkPNtoImsRGFzwj03YpegyJoFo+0
 eax1/xMflJcaCkUZ9qQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXxfHw49FPzqYO
 K4O22rxQIxiBiH7j9JrBWOWJ5fhtWLI+mr8xrV8bNi21aMfybfvmyRpxfdAaMKrv/2t3HgjGT10
 xY3aoKUi/T+3OpwoKJb8XAQOt1n+iEA=
X-Proofpoint-GUID: 5YPsw3YZ6Aa6hoipIGI80BQf-DEwxEIk
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac60a8e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=1ys7_V7Nn-5Y8TJEc3AA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Describe Qualcomm IFE parameter buffers with the QCF0 metadata format.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 3 +++
 include/uapi/linux/videodev2.h       | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index b7173a258225..581ed9d74b82 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1470,6 +1470,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_QC_IFE_STAT_3A:
 		descr = "Qualcomm IFE 3A Statistics";
 		break;
+	case V4L2_META_FMT_QC_IFE_PARAMS:
+		descr = "Qualcomm IFE Parameters";
+		break;
 	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4a0748b60a15..52ad260e65c8 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -878,6 +878,7 @@ struct v4l2_pix_format {
 
 /* Vendor specific - used for Qualcomm IFE camera sub-system */
 #define V4L2_META_FMT_QC_IFE_STAT_3A	v4l2_fourcc('Q', 'C', 'F', '1') /* IFE 3A Statistics */
+#define V4L2_META_FMT_QC_IFE_PARAMS	v4l2_fourcc('Q', 'C', 'F', '0') /* IFE 3A Parameters */
 
 /* Vendor specific - used for C3_ISP */
 #define V4L2_META_FMT_C3ISP_PARAMS	v4l2_fourcc('C', '3', 'P', 'M') /* Amlogic C3 ISP Parameters */
-- 
2.34.1

