Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634803;
	b=oWxcvlEOwRwBEb3aQOfpFw5i9DWEH5Z4Fhe4cp+xHPX6/yZov983YQlecVDj7dA3nXiP
	 1dJM0EIOhhUIE6f75DJNaDDCbfF+JHNsbHI1nioiFirGhZV0kr5/o7BDlZWonCw9seJiJ
	 l36W36NnlMdyMz7xE/U1/SI01zJxFnxsN0NksZNnfm6n2y2cHApXmRGXImYB/kZQda6am
	 9/6iI9SGd3aHMI/Ze/GSVz9lraEV6jgjuQbZWNG41c4+4xlJiMT8GWtUaxU2CzASBYd7F
	 itU8PLDd0cOY60NMLY1aQePqWrfJUAM6ymRipeQFlN+OAGN0T8UisUPyESCaWmWXvQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634803;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
	b=iFHmzhDngsEOITE1mFLmEvJJ8NVcx2L2HpjW1qNZfGHHiTeXXN6/2eP88OXENj0PyDBM
	 uqEoCiCK3ACZWi73ORXrGh0UqlU2tujsOBGfDX8pU2pqJt6JIk70Q2t6PnmUxEcIDxOHc
	 TapiMPV1xbtOrXIKu2sQf05b3qITTkh2rWmoFeL8Vy/242S6q8swyOhbs3ZO9zKoNG6BB
	 VjsCeC7xslFk7nkDEZSu9nEp7Cy9+wLOB2Zqx8IsJZ4oJdO3p1MGtKtz9Luk3f75NXFCK
	 IiwTiwua4ky5nGx3YvHcqzSQu3ulhKHL4xhXoKo+a5AJXKJJV+XdapizYVAQy7xARYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kM374WtA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bb6GR6/1";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB91607A8B2
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 15:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACB91607A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kM374WtA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bb6GR6/1
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Dp9fG894134
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 15:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=; b=kM374WtAawYrgcPU
	3m0FBrc4GZOrBLrImookpjbxtv6IW/CVCZfSvubGAeEEx5c0RvbQj6/Ch6zBkfmm
	1+/iJawSkOr9GkebN9c7u4o5mibgNUmQvKEjxzg0y7SyK14FPlaTYcP4bH8pOutL
	nKq6bIPKP66gtmF5g/5lnfRZu4tODup2wQNYVsnefLaG6KA7N4o3Xk941EuJNnc1
	RAxdBCGzc2G0op+wLlHVva1bXpS5VEm4mOQyIFsVhYPYU/aDxl9z/GtKNmhcDMBZ
	9ElhGvpqOeGKkRgck0xZGMtYHqHWtdNlyg9a48yFPlzBIwtUvg018qpxpJuluTgl
	SYqSIw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvsn6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 15:53:21 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988b86c66e5so3491082241.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 07:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634801; x=1794239601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=bb6GR6/1vt9QyyYzVNEwvjLJ/w25kNwfdChTLC/JVA/VawBfUXoK+oTbly7UscdgSJ
         7RAp0uKZZkz/cJjF+wjELVWu8AxnRZ0nyaIAzc7U+FFtDc1ka17z17ot5fcwa+42Kq4Z
         dJ0uGJrHZUq/lepbdCUnfuTgeNfzaXUw8VLmNK4decaVVqh3xj+nIzogUwRmFup04YzX
         lGz4nqIi+rVYZ1hYrqqYDBookm5yIQEhGoEjPdtAbwRqCn94J5mvK3dmV0xCp9g2zS5I
         L/+kBSnBuA+2oW+MXoKXxS4/Md+r2YHb0hrqN+01PgZStpV7edV2oqjRxHxw8tR/jAZN
         0s1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634801; x=1794239601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=HKCFXHfYcO06h+0kPfm3nqE2yPSEpsvFOOoP3T4RL8EPuOc0DcvmTJC1cLpHmSicIV
         b2f6d8abiHo1KClSNwurC4dr8wxk8KEn+atHtNO/XA78QhLWj8Jk7WGm8pPBWfeLILw2
         nLEHNBcVsbaE+LRV7sK0c2HLWL1p6T6fSVaDg9iwJmbC/7Ec9mDDQJrhdAJ2i7UeGR7b
         F85at45JPsui96MhB9Pi1K3RJ/zgEY3+oDdzuSNO4EieGjREUpJmTSd8aiwIgPQ29Dsy
         nIv9pTHIBEPxUnTV0BN7QC3F2aW/WHwnrIcBkYJyqsASHqdXYf3WsJyqTyCeS7n8wcuM
         iUBw==
X-Gm-Message-State: APuU4Z+Nd03PY3cne963WjhlcNLOYP2MZCb2nU7STJwuxqLpTHa5r/Q5
	zxdhUCbphAjGA/G6LLmdhzjvKYwPOSgBSnzNXz5hfw2HRgQh95H6O9U6/L6MOObniiy7sKBq6y1
	xfSm7JincNAgDYKSirQagnjQ7nMDKq87Uu/+z8NBfLnE1HXtfqS8UUvEcWNx4ffd+hA==
X-Gm-Gg: AYBFou3G3tO/A7BWw9jIl48Tf228lCidcA2AreK5PWh1pNvazgW/K2bCKNZaaHYPlVD
	lEsK31gdZwKyUGe6H3IeiQCcg9oFepdTjEqZeUy1KxX5L5Awstk2cKdgT+7SP0cKSkKtAISeMUT
	t03sK76pGJ/vnoxDX+qfaFez5El+i2E1nIWgBT4MNqvRbzDlY5iLpqsH5CP0pa8azlid6MfR1rW
	Y55GQGZPk/Dxs/r78C8dxYmeMOyV/Ax+lW4OqNS6imW0ihRxB78IA/BH4EJQ6Hng2DPeGUCj/IU
	Afx9I3NxRrBOp/pfTNI/LLYdif/4bW+zy+g7FydV6sfcqGOXKzSA8AJ+cxQw5Eov8Ly3mj/TQgb
	cyU5WWbv2O5DR76jNIB6RqoGihpLQqZPoJw9JOQBVGoEI5lkYXSSgO3/1CBcz3ROvtOPXiqwdZu
	WbCgeBaBW64iKgutXAnw2Um7rH9yPU25GT2CMNpBnVu4Ld64YBHEic1rXw1qYJsvMWW/PwyoAob
	i3qI6X44uvDxHMzVfT6LTm/IxiY
X-Received: by 2002:a05:6102:4490:b0:7b3:5b2f:7030 with SMTP id ada2fe7eead31-7d053f25b2dmr4101188137.4.1793634800734;
        Mon, 02 Nov 2026 07:53:20 -0800 (PST)
X-Received: by 2002:a05:6102:4490:b0:7b3:5b2f:7030 with SMTP id ada2fe7eead31-7d053f25b2dmr4101170137.4.1793634800239;
        Mon, 02 Nov 2026 07:53:20 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:19 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:47:32 +0100
Subject: [PATCH v12 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
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
Message-Id: <20261102-camss-isp-ope-v12-1-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
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
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae8b1f1 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: vAHEFfc4e6agzKIOegg3vV0bRlm__1Pu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfXzyAqxmIRBviH
 Vn/b7eCipB11ep7HYws8jLEInCpkufw6Axy9AJLmuUDX1fR5DUv3Vz9zzvWpWbfJDXPvqt6snuS
 ZGf+OptMY2CAWjObC6k/yFr+4rs0h/U=
X-Proofpoint-ORIG-GUID: vAHEFfc4e6agzKIOegg3vV0bRlm__1Pu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX3NpiHHHWtgj7
 C0ESFB2o+bSSGvG2bWYYY+k1k2udKggiBCpUryuI2aLzeU3lo5KB1+yy563z6NIos+ebRXKSbZk
 +yn7KQo6/0TlcnLX8qSkdvJxoOHRKulU+rMblzdJ8l6UVIX1II40xbgnRiwn9zpa+TujQ7BXGRd
 8+sL51rkpitVd/7UBr917OQ5xeG0cBZSEzGNJEmA1gbh2XkQBmoBhoHlE3GB+d606Ju1hpi8NKv
 wOzxCge8ZCgNtKg8I34nDCizL6IPzf0AW+PSn/BxECAJQ/ItqsVsHC3liGgW1hF4UUS3EztpEBl
 XHIlWVsDi/MxvgFRIL/tpNmC6tfhx5MD6JwNheMpP4pKihYzxMnQveCHQhimWoeIo5C8pAItHGb
 dN2z/Wg8jfBpg7qq4hm1UdDfw6c1e8VbD96+94UxRRFVpBSkkJkGOeW7YJ8zOLkNnuAmyugUUFg
 uinauZLo+vKYfCgteLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
Qualcomm CAMSS ISP parameter buffer. This format is used by the params
video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
ISP tuning data such as white balance, color correction and chroma
enhancement settings.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
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

