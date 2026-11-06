Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973329;
	b=vwvnlifZLuaiatO/aikFbwhki881aKKp/2kf6e4T8c7qZUt1zFaUsWE1hztygCAkyZLn
	 u7bBP47NtWG0WtFLTdj7RdYHi+IrS+js5sPiEBYYY/RqOlFxVqjKnNPooTZfc0/i2NfQv
	 H1at+mZaPX2FfT3rxkiKW1f1D/eINnLnNXF1tG/uYpmyc4eNcO8qyg4QxymamVxlICDfz
	 hOO71g/UsRmW6nm0EP2h6eblibF6kyud3IwvW1J/7JWAnBgmkUED7SWWM971a5GVYZch8
	 b5FOUg4dMXjFsGP5AfFewCQm+/ReqzRYic5PwPkobD7Xv8KOP83kisqUCfHmUGs5xuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973329;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
	b=ZD+9PqcXawVmPCGxL+hIYx5Bz8H54sDfKq1SXoQI7qPuZvdfhA+gPw5U/wtSUQdJKuS9
	 NRMim4mT9auYcQTuwKtqTdC+07XnkZ5THTc0gBzGus+fvCPiQ1J5vRKZECJCnFvMRRlil
	 6ItkTGDnMXFyJU7vRc3dMUAP4E+Iwc/wRezyvXG54diPFxcSpf1vbM14S4kxa6U6hCJK+
	 2LEJ9t9cxPBYO0jGRTcZhqw5ThOvRx5LdNtg+b8RybSJMM7qBCfCUaEI4Gh/UypkWdsEg
	 lZhsLJ2tuQxXzXY+ijHJsjplTunAwlysUAfpMGHBRl20LttDlkwyyaPo253bjsHaaWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bm5Znuev;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=de+Ll0Td;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E28606D83C
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 13:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73E28606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bm5Znuev;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=de+Ll0Td
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DoTkI4128426
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 13:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=; b=bm5Znuevrh4SmsgD
	vb6RvI7iPS2Fr56sekLTNlHWe1dwdGAcyEAwWtZRcQMaUMpi2827p8iz5X0w73C6
	gM8gsIdM3YDa6mN1YUYOTNTf0su8wIjuylpKeXBx7lfQ+zVSiB3eEJTtkkMyZde+
	sCMr+9DiT5MeeBEJdblEkKQVe6cUswnuspjc6QZlyLtAnN6rdTqB5TUibrakXBbC
	nKc/9yTZwxiJtJvoPJvxH7Aj6r/NsITdvweOxIE1xXU01WAITbBQLM1QufkfYvzV
	DqfKEGR5ae2YOhA52leR+Zinzd5TjCrFVUhVQ9icA8GFKfzPGVEJZcHad7JvBbs2
	p0HwyQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa316u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 13:55:27 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99081ea787eso409163241.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 05:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973327; x=1794578127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=de+Ll0TdO6I3gn28LBdVHqdTL21TYIs3UW/Itx4mJT4H1C70WWUx2q7hh3OWlywq6s
         6AlwHNnzCt81CPbaVb8YHTfiwtEmp5CvLbjajapScwB1/0sMpjtzs59iTMK/Mov55Lli
         6BcGRKxhS2BmX2mOoXkwD/rMRya2x88hBuSb7F/zJ6omKAMWEsK/TNM2KqRPYLgP0Y+t
         gDgrR8g3nvQKwA4AMDY1a+NrYNBG4+mQMz4Dy3IyGWOxgXjhiYM2BrMwA86ylf4mi9ln
         KvHs7Lb7WgBZnoGNLCQ+3e+qTWXnvqiFOeLNn11jFgo1byLE47ZF9lzmaRqp9PwwpchR
         lO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973327; x=1794578127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgR5F+iBiHqDbSrZbID4DhVkgUbDwbnclx1Ow0233B4=;
        b=sq5EmuTMEh5bvm1gpuKvLHTHkcNMIzdJbDOuH79H4y8/b0bGnZmg1wwBNw5AtkEv4o
         L2Yzo1iwP4T3m4sr3o3naIgw0vgJ6715ro5hzt2gtyrD9ozciaZ0oceNJVYbDYkN3InG
         ybqgyt8dlS5+VfN4EcFUhK39fe6SMy/2YAjcITh4XFzf06WRjA9TkHiR0XHyuVhVN01b
         Hs7JhOkS8vGiJScAtkj5VJSDPn6ZlJSP7m+8hiWvE4vHDSy3Z+wmC+If5F5VR86y+hqE
         Lrj5ASAnupF3gf/yfZlW3I9vOw9v/Ykf8zLndYVnR2ER4lJh5qWOl55vtl2MGHl/pKKt
         VWGw==
X-Gm-Message-State: APuU4Z8yhyo29eAApeXFCflHH9u8X3BQkN5xgwdKQi5+TeHfmsM9Ni8X
	W8mGZY/L1HzpR7M7K+ap+K1KI4+hofq8SV/WrcUfwApqH2X3oxxx4izL/KnQBbWcZLN71bihyF+
	zJf3IPjGFGZBbRTsqLLeaLfVraIic6nGdUhroxAiauZLUuX5vnpLbJQJLSPpukgqV8w==
X-Gm-Gg: AYBFou3WOoqjvToGLJ077oyCRvxtqD3U1lBbnm3zqoJRxZ/xfHrEHanmrW4kVUVXco9
	ASxr2JxaWnO6vK7Y2+NyYLz1w9ApsSUgo7opqrYstseOI/ZZPGW8EzcTwr6gsUlj4ohlvEbsW2F
	+G+IiXQbzfWh6sRev9Q9AMrNPme1IWP6oz0BNND8IRHSkNaEe14XyzA3byJOJkMMIHFeRz8Mnyt
	m68wIPt7qF0uc55mriyzsck/HVZhszzDDeBRTxp6zohHzHaqFNJgh3yiwY8p/NbaEP6VCzO8Iq1
	ETVPKnisLIztnCzPZJWCs52oef1mR1adRK7sz1hO+tb+b/HxvVgA0dSPxOqpK3bYTdXjdPXT9EL
	ypiFHKf6NGF7/rSH4edJ57Kbs5ZCqcJxSheDU02aZX+mtI75NicEbL2/QbSRXx8OERG+iiPuPzX
	GgYf+1FmXUIjHpYqpDZGyoPWAOkc6olo4cVarjg+6pX+djpxF4EsknKaDzcNDTycyIOAw9BjcP7
	dq3I2g2gTLFqeXGouj2cKtOPcmZ
X-Received: by 2002:a67:e70c:0:b0:7cc:828b:421b with SMTP id ada2fe7eead31-7d2a15097e6mr1816177137.6.1793973326687;
        Fri, 06 Nov 2026 05:55:26 -0800 (PST)
X-Received: by 2002:a67:e70c:0:b0:7cc:828b:421b with SMTP id ada2fe7eead31-7d2a15097e6mr1816146137.6.1793973326222;
        Fri, 06 Nov 2026 05:55:26 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:24 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:17 +0100
Subject: [PATCH v14 1/9] media: qcom: camss: Add V4L2 meta format for CAMSS
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
Message-Id: <20261106-camss-isp-ope-v14-1-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
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
X-Proofpoint-GUID: HMRl98fhk7HV5TtvrkTee9b9tMsYadgn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfXwSHqyCVhTFaO
 Tzz3LDGhKVE6jSrqfGwl/4pLPBUPeIR/Jq7Fx4JejmTB96gH6JoRoj/4XUbk3F4omqke4t84O0n
 Ru6X+WTbU9vzDCZZhtHM6vtvCow84Vg=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aeddc4f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mDm0RygAtmZY0osY0NEA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfXyArH5v301KIR
 1JIQVaq4tMMB9gXs2oFXIuAUkuNb2+uJ8lNwJvtYUFvgptWx9lMVkwv/u+0bfFhm+J8SRSJIrjx
 OtffDEKJt2Jrhu788bed4u1lyPAELxyxYpXFkmLqhpeLD66X4ZeufHhS2zqIAlf0P5Pp/KD7pjT
 Xl2klKH7D//MqKs++ta2mMt4Grf7T6wJ1JHxcI46mu5dSFw4uctMDJtYZSsYC6RdTHIdE97jwR2
 JVWtFFZ+obVTZUBNh9ZAorT3D72A+zS6LQ3g+LALgrl6xVKaIZech4ztcVUocWbwYqttIf7kv3m
 EETzgGI12ToeG5NmrCK/JSouof5TLSg/DRx2bZ4WsWL6llUTkWyxiziPlEvAWg1WGTUhE/ngZij
 bvagQgXO83O/OaNANlLmRvPOwyYNdvmIu+TaG4/puSIsMnh5NpXWmctFRnJkPMLEeI99L+NJbQZ
 cBk+Ql9BNxyuUqGNtkg==
X-Proofpoint-ORIG-GUID: HMRl98fhk7HV5TtvrkTee9b9tMsYadgn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

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

