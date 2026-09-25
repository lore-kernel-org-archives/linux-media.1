Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D636477E53
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327399; cv=none; b=BzZnky8maDFGHt2dWIgrEZQiULF+5DK/yunof7qk/QnltLHKb8SlsCTurk1oUGra3/YkMZebgIViwmIcb9fSgcqW33gGozvWe+EFyhRcKRmQJiOjHm7su2oeMhr2QSWC7lz4hDiK4ZleQIAp88xvBraLzY4fpr55CKQxUBKf84U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327399; c=relaxed/simple;
	bh=t9VRl1nMX4c51HXGRlVcUrJ2vYPgoDYjYMTLiyXwefU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jLjjprwdNo2RbL3Aj+TZ9dZnt9BQ+MRhgmFKln1UuqdKoAVQVCYZ2LLzIhTYB+ev1CiZuLAMUsKrEUfnc/1v3Lp+3lHV3D79xTmwGNuhG6gJE+n1FlKhgP+RaNFFdoDtsVi+miWopuItyXg56xpimjTmfV5hsqM7mQTPeO6EB18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/QXYNGB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gjPv/i3Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/QXYNGB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gjPv/i3Q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5J4xI756782
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 09:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=; b=O/QXYNGBS0gU2Wwj
	BSACMd2AutM8Wriv9s3EDD/t0SeQ3tHAxUJCPc5yhB9muONFusmu+Jjt36mWXMtZ
	t+Rukl2AF9W/Asz26zxAB/wEvf44UQL57ydgo+ggP0bFMSyCVJdW3YbuerqVOtXg
	wEMK7PfZeq1HgBMmnBj+ueByLT1p4ZPdd8kZEWxNIYc9UxYLQto/IpPtFX8efeQN
	0c1W63ycPoeuBp6YoXZeB8+pYDJPyPBIdXzyn5O8Xm5FLMHe1dVghbAZRFKZ3MSg
	Xw1EVOYHHsr7Apwf3sjreOFobu+8QRIqL+hlO3zS1jw1YQmNs85WVCFQRYsRJVpk
	IFGSbg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq08pde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 09:09:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0c7126e7so123385085a.2
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 02:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790327394; x=1790932194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=;
        b=gjPv/i3QM7yR6P7n1zqh9tT5okYYsu7GteMflD4j0ouMYrFaLAIv1BRGX9/liZl+sR
         O1M1MZBlBvwYn5CEsxjSWdQl17jWeHyYYqZ5l/Jzse0+aBPm6489ZeF5m7CLtbRL5Aay
         9Y/bZaEHQ3Prfxl5pYxUO3Ge36isz6KUcHNCV6UHvvCRGe+R7rx6K5ypK9SM/92/cHEI
         wBLkvH/3s4nW7gFrSti2SGtix8JwEgWNbvbbp5/q91sLAHe6LtQQ1bGo7HeuucqY2Fko
         6FqCh4k2MswEQRv6sjuJPTc/KwG1tdpZdupSH7h4zUB8bDRVABuZXS96lOn846R4+bkU
         w1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327394; x=1790932194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owC/0Uitd+RPnqSaxCQ8n2UoAK7Gqnd+PP1VG0zdCcc=;
        b=2HKbfBDKmqDZyX9h2nR80XlTHzfAeyZJCcHvfoJCehzP5wi57l0M0loyRIadzhkwmY
         VrLBQX9O5rxa3OQm8kFbOPIRkSnYJ19wjtnSyhcd1wC4tk+RmO9M4/DpD+x5iceKHzuo
         jsts0k52OF2izRaFJnpR9MvyEL6mNJXS6nvzTOwGePMCS8OXRyq9aDDpac3H8R2CfJrs
         5U+AGVaWWWrJ5N41tenwMoGp7NJ63czWqQfXYcIBwBwKqKSDsQmYT+pP5l9eQJp9+M96
         O6x28wcqZ42+p6adcwNOAvq/XC2rl5ptFCkrU9SGMv5RX5TR/7wrbrJ07iN03OEI/n+G
         5v+g==
X-Gm-Message-State: AFuF++krtqgZoYQB6LhFmXNnzNGB0omLQl6R50HqgGHVD1cSBbpbXmUJ
	fr0NXp1H2fAtPFhy4dBpjE4ZI3EZ/kNG3EOhxOA+mFHeBKoIP3BPK6wUvN/4Gw3fX4UcwcH8Vtd
	rn0sm8FxKxEnsVGmH7lNCXPuDBSyTjl8iTXX+9+sWrPs6EHc6CuCdxHpZg2qi8VGaOQ==
X-Gm-Gg: AYBFou2KSXRLkYy38Nbk9Aij1NV3Y/Wfbj0nk+u4GNRC7N40KjjnFrpt9Rfp/cbkBDg
	cR+XlisN9qKELwaTJPY0dLWEgvZhnveVp9eenUfylW9fH24HTWNsDFHmdYwKOAtqSB1ka1TW3bo
	QGu4BSBBlR0Ftd50cj9IHJiVSc/dsIS466jRgpNKYYdQbKPPZA/8wUcCAuzuY0NTffTkvvnhBe9
	+pLzjgSFAneivlz/U8ovDfmbrHtm8qNNMk24c1Os8hiMRuUdD33JjMwLVHjz+Lm4mSzYNO3zd3j
	x+OcqUBRDEAFGI6FkQcUopnA9rtaxsik7ehGX4KLBMV0eNfOpDj+UfH3aNFwvNmqFJex5s+WIx0
	k9vsnpVJs5QH6MtySh1OLSyeENhC6Agz/2Hhs1tCmyLKesrtUfNKHlCZD/LjXkKSve+u5o2qa3U
	7uD+qM42KOCw7GK0Tt0ELFkdnC4TrfOVrCb9vnklZckzT46WzXMlM=
X-Received: by 2002:a05:620a:4451:b0:937:19d3:3fda with SMTP id af79cd13be357-93c43c1247fmr298751585a.28.1790327394312;
        Fri, 25 Sep 2026 02:09:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4451:b0:937:19d3:3fda with SMTP id af79cd13be357-93c43c1247fmr298749485a.28.1790327393853;
        Fri, 25 Sep 2026 02:09:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm5269890f8f.9.2026.09.25.02.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:09:53 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:09:48 +0200
Subject: [PATCH v10 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-camss-isp-ope-v10-1-2622411034cb@oss.qualcomm.com>
References: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
In-Reply-To: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfX0dP6Jrs3y4Oy
 DRNih/0DYOyAvODQeWfOdv0B8QKQDslfIoMLb7Xzt9XrRnXs4CT0KECQf+Dgx4BmY0lg+3dV/gA
 tW17NbpVwBbo0wv2CV05CEGY4yYV3hs=
X-Proofpoint-GUID: JEtHcC9ugLWv3jx1SyzzKTC3W1QXZdu5
X-Proofpoint-ORIG-GUID: JEtHcC9ugLWv3jx1SyzzKTC3W1QXZdu5
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab63a63 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfXwUF41g3UZtTz
 gi2hZo8Yr0N8qVmRxMtJVlns5a55B1YkIGV3Zr75yd9p3VCvOBVVhCgBOY5PeyhptizQvZ5Lo8g
 jGdu7CpgyRPzJ71OkY2IgJEKIvQJQNnT0beqHtohJPBbCer7DoJ4L5Oa8FzS1ivBoJipWGV2N1N
 lQPcr+KBOUdQXDpVQM1zb7Qe6Qs34UhYbvvA/+7AX9InaSQutUeYDSu+SWZGE7T78RWZpvBS9bE
 5BxSql4Jd7m0aeLPsjosUJhgFxDCsNZ2vs5U494iSQ6CZ/wLfgKcvDDwtI7U6bjzfCCrgXTmmtu
 1qF/qhBjFIzG7yD/MTKFmc2cuHEq7UNZKNAOO5YWuioKAH/mUgxvrZS++S40IVPPf0RnlTy2UOQ
 kal9ztoHvRwOqVqXXwnuG7Jd/S83n01JkMur3JmDC0pcWwrEarXZZqholWItbWEyZAWbCDwge63
 B+k+w+yZFroQAI+E4+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250036

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
index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..70208a9443d8ade569f130e2fc3d6beebab6b636 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -893,6 +893,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RPPX1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
 #define V4L2_META_FMT_RPPX1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
 
+/* Vendor specific - used for Qualcomm CAMSS ISP */
+#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP Parameters */
+
 #ifdef __KERNEL__
 /*
  * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when

-- 
2.34.1

