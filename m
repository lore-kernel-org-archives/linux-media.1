Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953546;
	b=0wbjpeEcGne5JDdS8MQ6ZX4IQdvqCmwuLjeI0F9pI+dUUf59Zb5s225rWM02eaxO1ben
	 gdkFTR1gaV/yEfrjzFK51NvsDj6asZUnZXtRmQIktK2+qKvkDO4k/NmHBYgATcgCDCxKV
	 8syB9sKfCZK1CHQdYfL/3MFZ/TL5Yvh1x9WV6g8J+HhMspBfY7LQLcak9cxeMEmdNVRJA
	 Iuii1zlFoalgHN/pcXYgho68agZKCoPvQQo1OcopjmAOMiDJyURQKAKq/jWfut7xJmsOW
	 2NpYDbpCPLUQeFRtMBF2OSQhqIR2zMwBe+xPNZa507UONyCUQOAiqvIGW0x9JBcW10g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pPUcN8Y0DEBYTymsQLP2R9H776VthPiOJucEBEeA9nY=;
	b=QrcAMeJ22unyAhvlsr3X0a532m2utzTGe7lTjJvnD4vB3fEa+0n15kdfeT07ZpxAUKMs
	 wFN0siR+ycoyla5IXAdUjViC7VnG82AiTxJ2wFWfX8d1z6yA3pkEGkzgpsxq9Ddh0Unv9
	 iNyKZ66Z4TqtggrdfXO1IJoladYin5S9gouDpqYwDDObKhA+wbh9DjZblLllG+z6iWWM8
	 Ik7KzvKWdK9OzgKANOkBB7UpTEYDYBiw/UiEc3eSAXav4dS6bOTsQevJh4/Xgo8NAgnQ8
	 V+mDo0EQAr39i/70PT9647JIO6YDvi5plSMQxnn+oSDu+Dbbqxghnh4m58CutMiwXNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O0ghQTGI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IUI0Vq+5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E785606A33E
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 08:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E785606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O0ghQTGI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IUI0Vq+5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RNvJ2933607
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 08:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pPUcN8Y0DEB
	YTymsQLP2R9H776VthPiOJucEBEeA9nY=; b=O0ghQTGIF+xmuXJFYJkvzw5CkkY
	ctGxbUf6UskXn78fVlNSkVPQ4dw1EUhoR2Fv32Ovk7oRln0oMkrcLE9HK4AOc+gs
	GvFiQHPRlmazi8SGgkFNEFYrsrbUYyE0s2XwvDhULyjb89j13gm73TjK4n6nruUK
	9qBz3E4CL13mouE47/5GuNf2dZI+OFBUAGnc9WM/3APbwQiZZnBDf9cXaJkibV9j
	yDcbLQMbdESXXzweslK9Du1bZjjGry2O/h9Hh8OrPLu+fd+o/b9WBuA681sAlaD8
	6mZdcq7U/vIt8+mOjdkqMeoy8ro+kne0rzwcRwwGkzSFF3gKgilh+CFBblQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1uta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 08:25:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so55004485a.3
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 00:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953531; x=1794558331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPUcN8Y0DEBYTymsQLP2R9H776VthPiOJucEBEeA9nY=;
        b=IUI0Vq+5p30Arv7JhU8uyEHLOm4AivxH9a1zx1csAQVC2ANowCrlmiepwO/8D7lReV
         rUcgv5nl3EMhZmteU6lCU3zbCGD9BkmY+xH9aMHzG38VKzAWnpP5FQceVLbkrQUcp02R
         df/fM20miP8fdKJ1fxXcOeyyzstXmF0WQSyjs9AwHy0nDGLfnjKRKDR0tRAfltYMywKh
         ARMTTcNf1jB0nDrvCOOqARPwliSGCvUoxBLSU9fp/nkN864FCJ3vaqoKqmu37YCAn8Qd
         VlPDf6iDdmvMn4qOZ1th8eI3j9zybAgRe4Ba8TY8kBzqq0ir1qWf/XFh6iP2eL+rB2+K
         UaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953531; x=1794558331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPUcN8Y0DEBYTymsQLP2R9H776VthPiOJucEBEeA9nY=;
        b=XIlG1pblLFzEl+zdQZFECmmHqh/RsFAhxj2lzxu24dI5AUYSZQWq0OPuW2ftcmNnFP
         y98aBonPoWVmRLBih/mEjMLf5gmkA7gHzYJCktphXre4CBKnwpQBNBFU2zQg1obOwlSm
         X4M3bX0kbQ+kEruCcEK7NTH+nviOeChSPUCO9Tjoaan6KhCoGyL8i/tuGSROjIMGFngO
         wxsVoV7tlcATPrsSibXX54fTtKiYguJOh1NLfCOU4J0R651TalftazjVvsnNkMcEfYk8
         uNB3Ba0IMuLxtLAR2PBazSnWrBD9TNlCVavLdeyBSQ7IsOK4MJUn4YglyXwsDFzUbbXw
         1xJg==
X-Gm-Message-State: APuU4Z+/zRY5oEgvYoqgM03+k+RClCkbjgBr2JsC0Hag67iIYHJQluPL
	w0crzgr0kp+2cmVG8FjYpFiZAleog3ZiqyX5HzfOnWfvhQKBrItY4As5xUPyBzfZOg+LE9EXRyy
	KiQdIAqEvjaAZo3c/Qmdbmy7iZ6rifx3OzFUM1VwCHYMDDjzJBnRu7K5ntEnU/u5oBNl21B28BF
	Js
X-Gm-Gg: AYBFou0QQ/d/RpFMxqUysOTP4EuMt8YsRMAr+Qebxmlu+kL8Pru/8G3dUq/RHdxIKlf
	LK+vrCWfLNb3rvp39Hp/FnnjyCvAC1Yi5/zGue09Zt6BybXHClidACTLeUiZh9grgrT837xSX3G
	Pbh0JsiTmDF7VbbVbpLpZ+zlamBD3WtlnoSi24xlXhXDQzTtrLLoGEZhTNHnufKIhLg+LHPeJiY
	jtLkAzFYiYWfqR6QkMW35hB6TtnQy0nyIHdY7kTZ+M7yXcD1cA87VVSdT7Mr29YJ9nydxNlcv7Z
	8iml/n6tYIb7id/HgCKBXdHlh7aIV88NmaAVnaRPGeOjh4fSPElhK/iQ5y61dW6Y5kQFFWyC8vJ
	ewnVW9xbhyH41UwYJCVgBF8PBrpfzYPZAEV0I6rm/vY5uAxkg6bkhKiJ7nv86AJABpjGGVJNKlQ
	==
X-Received: by 2002:a05:620a:4690:b0:93f:ca9:3ee7 with SMTP id af79cd13be357-945f355bf60mr260829385a.57.1793953530751;
        Fri, 06 Nov 2026 00:25:30 -0800 (PST)
X-Received: by 2002:a05:620a:4690:b0:93f:ca9:3ee7 with SMTP id af79cd13be357-945f355bf60mr260825785a.57.1793953530191;
        Fri, 06 Nov 2026 00:25:30 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:29 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 2/8] media: jpeg: Add JPEG baseline and JFIF APP0 constants
Date: Fri,  6 Nov 2026 10:25:16 +0200
Message-Id: <20261106082522.1448390-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oMik0biuRIz8tNK1yKtbixekUxRX7MtQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX9IEFhUt+CSxh
 tR9Ykz2yer2P6GLaunhNLEN9+pwryuGcEfJZbAJ1bJ1UczeKAy5eqxlVX19te7AbR0YGrFx9Ec5
 iWoP779OLHwacbqggl7k/d5wBwzHu9/hz1wmOGwL/4fDSFblOGN2AkMYzzPA4BxrDSf1UFbW0bs
 NmQRObJn1kKnMeXD2obek+kAF8ISF/6a6AZxv9rDY1ae0XSEVTTQCVNCJbrGa2SYF29X3Wm+aDu
 Nbawk5zyVBjTlqN43zRvag7fdX7hT/GCAiZNSB1uhlPApZqEOu2Uk4l6ilDPxpIUk+8Q8GlkdFn
 /FRajmvVeZVlDvXRb7zfVCk12qSPFCOgn/wwUdMm0bZim5LzTXbzePfvAS9S9YDU35/ze5Qthjc
 KrqTujyoge7lWOlsuppLGJm73cpYj/hPwdvXQlD/SdNXmjcbR8mXDZp+T8BblKb546HhjYOJY5S
 qD60u6UnHLDlo7bZHMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX+wpSYkMt/KRu
 NK9lBhA8FbGK7uzSfYoeiHxrmO2lgBWs9Vf7AmCVTBJ/eRWW4FxWX7kRDfo6uO8RebQpdf7LNhj
 C7hkOxOPtMx4KBbr6Ok0sdIDoM9jgFU=
X-Proofpoint-ORIG-GUID: oMik0biuRIz8tNK1yKtbixekUxRX7MtQ
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aed8efb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=SSmOFEACAAAA:8
 a=EUspDBNiAAAA:8 a=Rl42jcqtOcFU5aT7_7AA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

Add the standard field values of a baseline (ITU-T T.81) JFIF header
to the shared JPEG marker header: sample precision, component counts,
sampling factors, quantization table identifiers, SOS table selectors,
spectral selection and successive approximation and the JFIF APP0
payload values. Describe the marker segment header and the SOF0 and
SOS headers and component specifications as packed structs, so their
sizes and field offsets can be taken with sizeof() and offsetof().

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 include/media/jpeg.h | 79 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/include/media/jpeg.h b/include/media/jpeg.h
index a01e142e99a7d..a93d0a580bbe3 100644
--- a/include/media/jpeg.h
+++ b/include/media/jpeg.h
@@ -3,6 +3,8 @@
 #ifndef _MEDIA_JPEG_H_
 #define _MEDIA_JPEG_H_
 
+#include <linux/types.h>
+
 /* JPEG markers */
 #define JPEG_MARKER_TEM		0x01
 #define JPEG_MARKER_SOF0	0xc0
@@ -17,4 +19,81 @@
 #define JPEG_MARKER_APP0	0xe0
 #define JPEG_MARKER_COM		0xfe
 
+/* JPEG baseline sample precision (bits per sample) */
+#define JPEG_SAMPLE_PRECISION_BITS	8
+
+/* Number of components: greyscale (1) and colour YCbCr (3) */
+#define JPEG_COMP_MONO			1
+#define JPEG_COMP_COLOR			3
+
+/* Chroma subsampling factors encoded in SOF0 sampling byte */
+#define JPEG_SAMPLING_H1V1		0x11
+#define JPEG_SAMPLING_H2V2		0x22
+
+/* Quantization table destination identifiers */
+#define JPEG_QTABLE_LUMA		0
+#define JPEG_QTABLE_CHROMA		1
+
+/* SOS spectral selection and approximation fields (baseline JPEG) */
+#define JPEG_SPECTRAL_START		0x00
+#define JPEG_SPECTRAL_END		0x3f
+#define JPEG_APPROX_HIGH_LOW		0x00
+
+/* SOS table selector bytes (luma: DC=0/AC=0, chroma: DC=1/AC=1) */
+#define JPEG_TABLE_SEL_LUMA		0x00
+#define JPEG_TABLE_SEL_CHROMA		0x11
+
+/*
+ * JFIF APP0 payload fields, as specified by the JFIF spec referenced from
+ * ITU-T T.81 Annex B. See: https://www.w3.org/Graphics/JPEG/itu-t81.pdf
+ */
+#define JFIF_IDENT_TERM			0x00
+#define JFIF_VERSION_MAJOR		0x01
+#define JFIF_VERSION_MINOR		0x01
+#define JFIF_UNITS_NONE			0x00
+#define JFIF_DENSITY_HI			0x00
+#define JFIF_DENSITY_LO			0x01
+#define JFIF_THUMBNAIL_SIZE		0x00
+
+/* Marker segment header: marker and length (ITU-T T.81 B.1.1.4) */
+struct jpeg_seg_hdr {
+	__be16 marker;
+	__be16 length;	/* bytes from the length field to the end of the segment */
+} __packed;
+
+/* SOF0 frame header up to the component specifications (ITU-T T.81 B.2.2) */
+struct jpeg_sof_hdr {
+	struct jpeg_seg_hdr seg;
+	u8 precision;
+	__be16 height;
+	__be16 width;
+	u8 num_components;
+} __packed;
+
+/* SOF0 frame component specification, one per component */
+struct jpeg_sof_comp {
+	u8 id;
+	u8 sampling;
+	u8 qtable;
+} __packed;
+
+/* SOS scan header up to the component specifications (ITU-T T.81 B.2.3) */
+struct jpeg_sos_hdr {
+	struct jpeg_seg_hdr seg;
+	u8 num_components;
+} __packed;
+
+/* SOS scan component specification, one per component */
+struct jpeg_sos_comp {
+	u8 id;
+	u8 tables;	/* DC and AC entropy table selectors */
+} __packed;
+
+/* SOS fields after the component specifications */
+struct jpeg_sos_tail {
+	u8 spectral_start;
+	u8 spectral_end;
+	u8 approx;
+} __packed;
+
 #endif /* _MEDIA_JPEG_H_ */
-- 
2.34.1

