Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148B2469824
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 10:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778283; cv=none; b=Oeg+umCXm0F4nHHukFYsGUtZgKJizyU+jMktlC1DIqpjDSEGCiu0suGsU11r5i77Pdy7TfMfNCFXNYA3tKniDlPfNvRs4LWX0bpiyX37rOFxsoDQX0ovuhwdtkwizKh2c4OjF8qBWW6wra5UazwdLylicx5k+kwZFWitJLmoB7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778283; c=relaxed/simple;
	bh=TwbZMWaf5zHMMD2gf8LfNRX+QQ9gQjR1lauqLVDpOig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IwLVFJgGTxeJo+ihczMQMtYSk4pSF8i+h4fzJZlAwLgHphIQQ417hea7D9qLGu4bgdBUQ56SoYlAlflX9GahZS4x4A/HFb8R7rYb8LyoxpRkkngvKb1KSTVUEABBF956txamcQIM7hiDSd3UQCoUOHafGg972Th4JTEyDjmY8vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PYMywZUj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e5yFI0cH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PYMywZUj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e5yFI0cH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnUsU4064632
	for <linux-media@vger.kernel.org>; Mon, 7 Sep 2026 10:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Mtr60xJ+ZTH3/m9/beJGo90PbSa/FEKMJzCUWRk9Mo=; b=PYMywZUjHZOZ+ucH
	uIPoYtEMgKVdton3e+zSZUdbwWz5+nZTgeIUVlv3sgiWN+o6QX2TCdUMZrnlXDUZ
	jxXq6nH/yTjuLAw9bGlZ9jodiBUW165Zk+qFeuLZBGAqIFtsijWt5gDm8LKc4RWc
	rZnGs8m85D2GrWpdr5F/WPxtqxkZTCotOiD5rIKBhLwf+MhC9kF98OL1ie9Um7w+
	BjeT/pVR0TPy2td5CtjmyX3NQI4X59293u+KMy38330tu4hNixcnv4e4khTzcv2z
	tR+pc7oRTFDhgIuF65d0Zvt/wZiXihHM2HJbzc2EX7FcRWN2IoPp4PEk2nhPDu+C
	1Uqveg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86rteh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 10:51:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936708f129aso417035085a.0
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 03:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778277; x=1789383077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Mtr60xJ+ZTH3/m9/beJGo90PbSa/FEKMJzCUWRk9Mo=;
        b=e5yFI0cHS62PIdBk8luSXTxxhgN5lood98Yg1hPXxXBeZhUFu9luk4TwPSj5R6D6SK
         k6h1EI5yJ1paM5bzi4sUJa3XHFho3tMtT3SvFzDvKU+1LxvQIFQM/N62HiLgjsDOsDiJ
         Eki0ypReYP2SHsQIsXAhfP+l9w5ZOa2k5xHfRFfYAc1F3WH0P7cLnM2LFPS9NyonnFJO
         LCam39Y08Jh5jUB0WcDrweaiK3VEFCxEYZpe5bKjFemMSLkqMS78lRHfY3qFQiqa2CPV
         ksSthG+BwHjAHZ8qNH7BFDJa230k9gKDSORLqCKf+eW6k9WcYw9x8aXUC+2/nnKcfaog
         27Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778277; x=1789383077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Mtr60xJ+ZTH3/m9/beJGo90PbSa/FEKMJzCUWRk9Mo=;
        b=ENzDU8nbK7cl6PbIgtwlTjekvTaDzzSYABbxZ3DKzkLqDvkzoQwB4rVhRQJ6jXmpHo
         CBlEFMMbpcc3uYhlPl6i3Yyv17I6CgSDfcO9RP3fTI+5EL+4bUhyfAp7i9QAm1SyRX9/
         Ps8Dorll9KCy7oln8gqj+xKSkyLmnev3Q2P4JaE0ztLboLAV6bm141oWYSYxJVhoMj7H
         WDh+io1wvl1a5fa4/ZjCvfWSlpWw3ch9CVC7n+z35jIf+oDvLuT8VToDStpNPAxBUonO
         MCQVPUtwiXcprOqRK8Y90X8GrRTxoCALy2Ndkg496Q4C0CX26pnuVrOqHxemi0m2j+jY
         m54A==
X-Gm-Message-State: AFuF++kXEp4LtfHOAB4NCN6mEw8ADzz7K9IHQK0K2HsiWejEusXf+EXe
	dHhjkQiFFa7GnCZ8PcNdo2rJvQJiM0p7kQEFwCZng8LpReEgIuuxAFAoLdSXrE4ROHj2h0ghtMX
	5qSMT8RWt4qOzMYgU8NuaJwX2K6X7lF2U0Lx2htPwCicUh+lQcWT/a7Yp758FJXB8eA==
X-Gm-Gg: AYBFou06FUPXm3Q/jyRCWr2MXKCosjco6YtXftETpH1ytJ6Ovzqffics59XBPaq8orQ
	/AT/PoOfW4b6oiO5pOYEhF4kKCODY1x6e+imM0j77Ki1ZPWjKKK1PwjimIvhQvywo4fLSvibyL/
	+BK8EFZdJ6km1Y4odubgoJjiQTExKDr8BPRQNqvo/2KC/Q6cUClncbgEoLclX6DUXy+u4HJ4aKK
	8ZSNjFFtSxe8dXknDiz613k1oGliRljZPkxr/cJfUp/1wEXPO9l8GIlxJrTP059BnwvPVukP6Tz
	tdMEsBayupK+LKQwCW7iOdYVOATud2EvsyJj7hCU9bbF93/s/b5341LXHBJaYyb80zsYSS3y8XC
	C/SEi75/xhGpAqp7EvqjcWvP01tq4D+60KGWLGv1Zdz6AaBg7gj4pcvTP9a9i/5trNioCfDgpms
	DID5aljp7abODCl+bKTyzBNxGofJr87N/Tix3xaeeD7roXOVxl7uQ=
X-Received: by 2002:a05:620a:4490:b0:930:9585:e08e with SMTP id af79cd13be357-93980328d99mr2054534485a.10.1788778276641;
        Mon, 07 Sep 2026 03:51:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4490:b0:930:9585:e08e with SMTP id af79cd13be357-93980328d99mr2054531185a.10.1788778276164;
        Mon, 07 Sep 2026 03:51:16 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm410263775e9.5.2026.09.07.03.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:51:15 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:51:11 +0200
Subject: [PATCH v6 1/8] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-camss-isp-ope-v6-1-6b915b9c5131@oss.qualcomm.com>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
In-Reply-To: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: b7tEvqwp1FcNBJl0ZI-YeLrxRszU2A2k
X-Proofpoint-ORIG-GUID: b7tEvqwp1FcNBJl0ZI-YeLrxRszU2A2k
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX1HoN5IZIqe3Q
 CgNVnXRRnGu+CgkDjGyi5FOD9NmqwjpQC3BkCDeEk+y3cR6MbLO+0U0tFWNem/ddl5JCfpg6wsz
 asKzxSjffvGIyC5ch/y4q+vzarjL8E4=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9e9725 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX0XTunvFAuflQ
 otZ9DAZmGsBN0JxQ8MNRLnRjKZv2GM3KKVEue5EMvwbjBOUDOw+2PouxS+QWUiqMf7Zrxs1TDmg
 qBmhdobTcjFwTRwpRnirzrDelW1zth6xp1IvfmYZMarIOWLy7QIJW0rbliPnSkmPF+2IkZAg6Kc
 CiXyjXJld91Yh5nO6tn4QnK2yM9MtOmUGPsB5HgMvSN3rDcs3VyAjCU1MNufg90NGGIDxx89brx
 Dgnq5zlodC/hiARLc3DKireNJs0sQfFPqq6CPvD2NEd4eDJpYXc2PqKBhXDjFcKJ7YV1w8wrHcV
 qx2lqLAvXx3cjfDcliC7kEu8J6ybxL/qqepMouKcV0HG7oZ+o3DquQORgF62PErgc/wO4IjowiS
 bwP9UZOhSNi3MvlFTaJeNYjT7EOiER2A25Xt57qGkPq1JOIPvFcq7w0nQ49js8Nrk43pVEr/7OZ
 ek1sI+oktUwqGFvbHgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070118

Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
Qualcomm CAMSS ISP parameter buffer. This format is used by the params
video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
ISP tuning data such as white balance, color correction and chroma
enhancement settings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 17ba1ae707355a134047de646f61fcc2d1512d4c..cef1593c1835070f7b34a8b8c860738fb77f533a 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
 	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..fce574d9268a019aa7829e8dbc06a6187cbc5c62 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -893,6 +893,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPPX1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
 #define V4L2_META_FMT_RPPX1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS offline ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1

