Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972692;
	b=HXAvXEeWONaKGz7qoefimeKIWdBDNlUKLZS2FDxDeQjlyEd/JvjwjaXtUfpHVgKYT8Kl
	 urcQcR5g0tiUS6ld0HEuzqewEA06BJfGOKoKI2JGaRBT3AJHL3FHACtIRStYkoNyU4vT2
	 5HoKWfEFCI0T6uBb21ysn5AVbgtPqOjPRbJ7QQgYzWqBGfCU7mNI78OYkvhU7Nqe0BBK3
	 HullUcNSrxqjylwRxsZvL/jXPI+DSM1zeJY1oHPLO+bZfXWdK6ekqlSARsb4BuvJps1je
	 7GqnRfyl1YPxAm8Rm96oEzn9FA9GKTfGC7SQtc1fSoRTwOh2ZJjwXQQvIkC6bv8ga8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972692;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Xz+HmzsfjxSeunL16Oc/hUW/Ypuwf1Y3ocKpalAiCdQ=;
	b=hxosKzeCgh98FBdQmFz1Eggzv1DfyXEb6wvvf7P4Ea/AkQWh2ZM5s1dlNRObHFDNQvkI
	 dmRf4tgYAP7QAp+OAFZYBrYlOJ4Eza/RL+vAmWVEeY7QF/pNQePYsrBIkSWKj0sG4sNo/
	 Z3SGINtdeh2Ubi/H+ToN4JmuJLqQtzgBLDM7Vb9rp1+pM3J70oxUpxV4z6c3VZFR9eG/x
	 +8r72AU0w+5oaxTGxtt3yijftmzudt1YwncxDb7F26+LSTtePS8KtGmTcG+KIk5fgBL7y
	 1Cvs+Wz9wkieBceJG1xKOKV6LYjtOWavqdy9tv1xTcaKpA8npMH1EBC1KWD+eERtFwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HCtlIrWk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8dxfjJK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A286082BDD
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 13:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A286082BDD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HCtlIrWk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8dxfjJK
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APCwH2076172
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 13:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xz+HmzsfjxSeunL16Oc/hUW/Ypuwf1Y3ocKpalAiCdQ=; b=HCtlIrWkCwx7OWhM
	nrYCUiRxZaCAK6pjTBsdZwRjOiSvJliD6PnepH6C1lpYDTVgDIbWUGmZWg0bJew6
	wm5qVxLwUbK184Jx+6jm8QOpBoOeGDROD5k3W4E6x9KNdEaUE36nSsgsyRyMBklU
	ejygzOCvkH2Z917JRex4QUWGZHs5LnfE6ebSIni6JH7Mcr4jtzNWA8f6rq3IrxG5
	f4NJ03KtUhM9Nfd0BwW5S4wyXneEVPm2ebTbImrU4SSstTCHeceTmfJeOyNQEFrN
	rdmD+DzLHe+FPpoI2s8RPhBVbvF3HDwu9ZAe8GjM8H7Mn+ogi9LUjkEoGZYaSLEx
	BVQizw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pcayd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 13:44:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9440b27c1feso119830485a.2
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 05:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793972690; x=1794577490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xz+HmzsfjxSeunL16Oc/hUW/Ypuwf1Y3ocKpalAiCdQ=;
        b=i8dxfjJKwoXzFabyzQbMlpwDZOSe2/9371fu1qDeVM8Nuaba+n5ErGBGQZWMxVYZ/G
         av5qLA5KfFwbyabCJ/Yp4E4DFNF6w/LTV7JfeNg2HT1YALSQHoErj9ZsCD2l4gW/9bDZ
         rH7YUCEvPNAeWUtMUx+BcORhwYi+wG49fyPgCf/aRx3EqfJ84L55whytvB5uSKOkrgET
         jPnqTCIciHoq70BLilbYFIoIsCMyOmwJmQtQM8k9YqaAmyhKqri9dIhriWAaLWpitYuG
         swba32H+WVD3eWyYZIyjUdhUx49ran3qMykVonSPQY/8+7UEuIHhS6yQKw9e3/DoOXJv
         0W9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972690; x=1794577490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xz+HmzsfjxSeunL16Oc/hUW/Ypuwf1Y3ocKpalAiCdQ=;
        b=IWhm8l22xWyxSVPYWMh6EYXjKyJfKp6HRcQp6uFEMUyB0muCW2EUEL2dG65Q87uWWR
         PUhtxmEEpIRyaUQrWeUkZ81CTW1WPhsB32qOsaLpX5xwWWshW22tL/at19XjbzPOll/J
         fZZ7+7QL3ggPsHr2vj2/AwBg+DI3PK+G4nuQEoJ0lVCfbLhhYYiCnU4ZjRGZLirZaC/z
         +B90C62goqdy1kkxDjWwhpo5AFnGQJkpx9gxl7XFXTNupx+2a9QvM0FAl/7VcydBaDKS
         ZFtHaNOOca7KqdaTXq4PORBH9/G7IasK646i2GHljGeKQ4tyWDUXoP9dPnYV2LfMZbwO
         YOCA==
X-Forwarded-Encrypted: i=1; AKwUvBwqwW0kQG68p3Ja0X9lxBItRH9HpV1OFWdPO8DFuM6ZBUBudKvgtAY2RrOKdEWoPGmeFDuyvfAC5u4Phg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9OJXbirna9o58P2ltJcQmfWtdmT2D672MYKSmZmY9yd26CV7CV
	4cMQj0c42wMmLF9dBw7RI6TM23DP4S1J+8Z8mbtQKnF4paD6dLr2lP1IUCZgrMBSxGNZiyMYnJc
	Cp0LDDTQNueW55E05esDVmwIwHQKStbSS1SZJ7Yktpdf7io72K+3bvhmLL1Ht0w+/XQ==
X-Gm-Gg: AYBFou3HaSgSQJaqszD4EB0QU3n6pNtxUKuMKA5H56ykyRrzFXMVqVdzjISmAUPgN7q
	YmsG7bhnsdbLC5RnKx+mUDHkg8FVutElCaFe7VKS4k4tppL3zwXjlNP/M8loN68yR/7mPUmvuq9
	+DytuLYU79L/0XrTXvYLRN9N+jXqq9TAJucUdnew0WbAPbDQVfojyPNinbrdZ1dLiKHZU0dJCoG
	SgawotYvwTVM6929QGrGCN7ZbFmIj/mAokYwNXuO0FQt6vtKxPlEx+lnCfMOp4657eJC8ug0dkd
	B3hJrleWXsVSflMLUvAKdXa5etd5YNlbfR9lzkdivjf4ENzi8pGDUiUq3XYx24XGpaZ98YfAQfQ
	xsqJPdy3FJ/+MAt8v8Vx/3DtaZ6CbJk64k78suxFIwyVAFKw8RJEFAeuHVLvX5IZKwRw+uu0ZUj
	h0P3n5yQJ/IejXFc4oiVM+SheoXWPyjOXazxB2LjSoI0Q2ebOJydaxs2heQH3mrw==
X-Received: by 2002:a05:620a:4804:b0:93a:11a4:223c with SMTP id af79cd13be357-945f338ccddmr335873585a.9.1793972690015;
        Fri, 06 Nov 2026 05:44:50 -0800 (PST)
X-Received: by 2002:a05:620a:4804:b0:93a:11a4:223c with SMTP id af79cd13be357-945f338ccddmr335867985a.9.1793972689409;
        Fri, 06 Nov 2026 05:44:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c003055a5csm382747e87.13.2026.11.06.05.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:44:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 15:44:13 +0200
Subject: [PATCH v2 7/8] media: venus: report the QC10C data stride
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
Message-Id: <20261106-ubwc-format-docs-v2-7-82949f88f030@oss.qualcomm.com>
References: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
In-Reply-To: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1667;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ut1xc1q+G9TMsg5s2WqSp3Sx8sHVKqPmNJ33tZpkuAQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq7dm8KmXANae5Tj5iETqw10bNgCF735iCp58sY
 gxJ/9xUgnCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCau3ZvAAKCRCLPIo+Aiko
 1VFICACKMLr2bozdG6xmGkQOVhrx3vYFq4ngn4q8vUWW1ZxoofkgGAikEKIPPuPSkb525LryrlC
 0XAenVx9i7WZcQtxwFHueXJUwPwuxXEhcIJfJMiPxfzNrmDZC/o3IzQleukID8s8sCwStuVsmbl
 kln32bNC8arP15mSXQ4bjB0Lf2zWr/thF9Hh5DHCJTlYXwAGTaYtA/PPxwzjxHBMsNEWI6CLsE1
 IKZDeh3LZPSlTxSxJdeqdLQG+CESLNB+fjo36WN3j2ndFNqfksBqNIC4GxLw8aLchs06icl9kCQ
 NUZTXEu4RKD/OW4uxQR9qSZcZYbK+DsozSi4aS79slcX/uiY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 5vvqtGEx21CGpjUs2nbyiMOvQJzZKhQ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfXwyB1JgLUrikT
 BGfH0J26eR75sSqBcpDqvWsw3GUXGw2MOWLVlWBaaoq392EeJ+dBHRBdypBsMRePoIwGk1tDxqc
 lzolR/OWaZCCSRYVISYoJEtaYv50Xfjg0eWLhBibvK8n9mHXrB7MeidiRPVmjCoNuhdJj37ZG0v
 23DD+u6GVL9I/qvCdSmeIO6elhm9n0MaSv2fA9F66kte4OdrW8Fk98iVKxXfmlf4FEymSqI0M0T
 vjPKOyuCrHyRrvV9ZQnK8oDNGPb8cbB3NqxvzHVXdcAjZs7Zfg1Zysx7walq91is1ADcfAHi1KS
 z9ItXC8vjiCQZWUb3yF4cWo8gJKdz/RGnew7MzNdxDLJxHxOO4irCnvZv1krfKfKMnmXRXzdTI8
 9RNijAGYUe5wNfY5O+H34JslnQ6qv/2ufKekT71O43dbuaZ5xFTMQONMrP7+YdGgSIKRIW+JOZM
 LjUyrLx3mXY0TUAvJKw==
X-Proofpoint-GUID: 5vvqtGEx21CGpjUs2nbyiMOvQJzZKhQ9
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aedd9d3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=lvl4w2d8MLr2OEpUskUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX0PuUkYbLAeUf
 MrmpLkJNHh5qRczbFEW3Z4hFd66tRtGoR/R8LPdesbjtWNSwVzXjUpo2hY8PYcGLTypuQpubjIe
 RGDDpOp/WfvF56UxDUs+OyB029Wgz6Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060054

For QC10C capture buffers the decoder reports bytesperline as the width
aligned to 128, as for 8-bit formats. QC10C packs three 10-bit samples
in 32 bits and pads each line to 256 bytes per 192 pixels, so the
reported value does not describe the buffer: a 1920 pixel line takes
2560 bytes, not 1920. Userspace passing the frame on to other devices
has to take the stride from bytesperline and gets it wrong.

Report the stride the buffer actually has, as computed for the
buffer size and as Iris already does. The downstream msm_vidc driver
reports VENUS_Y_STRIDE(), which for NV12_BPP10_UBWC is the same
ALIGN(ALIGN(width, 192) * 4 / 3, 256).

Fixes: cef92b14e653 ("media: venus: Add a handling of QC10C compressed format")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 6a43ea191da1..9de0c9bc2919 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -227,7 +227,10 @@ vdec_try_fmt_common(struct venus_inst *inst, struct v4l2_format *f)
 			stride *= 2;
 
 		pfmt[0].sizeimage = szimage;
-		pfmt[0].bytesperline = ALIGN(stride, 128);
+		if (pixmp->pixelformat == V4L2_PIX_FMT_QC10C)
+			pfmt[0].bytesperline = DIV_ROUND_UP(pixmp->width, 192) * 256;
+		else
+			pfmt[0].bytesperline = ALIGN(stride, 128);
 	} else {
 		pfmt[0].sizeimage = clamp_t(u32, pfmt[0].sizeimage, 0, SZ_8M);
 		pfmt[0].sizeimage = max(pfmt[0].sizeimage, szimage);

-- 
2.47.3

